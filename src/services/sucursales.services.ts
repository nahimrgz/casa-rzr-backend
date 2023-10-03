import { getOffsetOfPagination } from "../helpers/getOffsetPagination";
import { ERROR_TYPE } from "../constants/constants";
import { errorResponse } from "../helpers/errorsResponse";
import { Sucursal } from "../models/sucursales.model";
import { Usuario } from "../models/usuarios.model";

export async function getSucursalesFromDB(conn: any): Promise<any> {
    
    const [rows, fields] = await conn.query(getQueryForSucursales());
    const respDB = JSON.parse(JSON.stringify(rows));
    if (respDB && respDB[0].data) return respDB[0].data
    else return []
    
}

export async function insertSucursalOnDB(conn: any, sucursal: Sucursal) {
    const sucursalCopy =  { ...sucursal }; // Crea una copia del objeto y asi no modificar el objeto original
    delete sucursalCopy.usuarios;

    const columnas = Object.keys(sucursalCopy).join(', ');
    const valores = Object.values(sucursalCopy);
    const marcadores = valores.map(() => '?').join(', ');
    const sql = `INSERT INTO sucursales (${columnas}) VALUES (${marcadores})`;
  
    const [rows, fields] = await conn.query(sql, valores);
    const respDB = JSON.parse(JSON.stringify(rows));
    if (respDB && respDB.insertId) return respDB.insertId
    else return 0 
}

export async function insertUsuariosSucursal(conn: any, idSucursal: number, usuarios: Usuario[] | undefined): Promise<void> {
    if (idSucursal && usuarios) {
        
        let query = `INSERT INTO usuarios_has_sucursales(idUsuario, idSucursal) VALUES `
        usuarios.forEach((usuario, index, array) => {
            query = query.concat(`(${usuario.idUsuario}, ${idSucursal})`)
            if (index !== array.length - 1) {
                query = query.concat(',')
            }
        });
        
       const [rows, fields] = await conn.query(query);
       const respDB = JSON.parse(JSON.stringify(rows));
       
    }
}

 function getQueryForSucursales() {
    return `
    SELECT 
        JSON_ARRAYAGG(JSON_OBJECT('idSucursal',
                        idSucursal,
                        'nombreSucursal',
                        nombreSucursal,
                        'estado',
                        nombreEstado,
                        'ciudad',
                        nombreCiudad,
                        'telefono',
                        telefono,
                        'direccion',
                        direccion,
                        'codigoPostal',
                        codigoPostal,
                        'usuarios',
                        IFNULL((SELECT 
                                        JSON_ARRAYAGG(JSON_OBJECT('idUsuario',
                                                            idUsuario,
                                                            'nombreUsuario',
                                                            nombreUsuario))
                                    FROM
                                        (SELECT 
                                            u.idUsuario, u.nombre AS nombreUsuario
                                        FROM
                                            usuarios u
                                        INNER JOIN usuarios_has_sucursales uhs ON u.idUsuario = uhs.idUsuario
                                        WHERE
                                            uhs.idSucursal = json_result.idSucursal
                                                AND u.activo = 1) AS usuarios),
                                JSON_ARRAY()))) AS data
    FROM
        (SELECT 
            s.idSucursal,
                s.nombreSucursal,
                s.telefono,
                s.direccion,
                s.codigoPostal,
                e.nombre AS nombreEstado,
                cu.nombre AS nombreCiudad
        FROM
            sucursales s
        INNER JOIN ciudades cu ON s.idCiudad = cu.idCiudad
        INNER JOIN estados_republica e ON cu.idEstadoRep = e.idEstadoRep) AS json_result;
    `
}