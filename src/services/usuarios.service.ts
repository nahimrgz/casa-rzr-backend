import { hash } from "bcrypt";
import { Sucursal } from "../models/sucursales.model";
import { Usuario } from "../models/usuarios.model";

export async function getUsersFromDB(conn: any, idUsuario: string | null, offset: number, pageSize: number): Promise<any> {
    // fechaIngreso datetime 
    // nss varchar(45) 
    // activo tinyint
   const query = `
   SELECT 
    JSON_ARRAYAGG(JSON_OBJECT('idUsuario',
                    idUsuario,
                    'nombre',
                    nombreUsuario,
                    'nss',
                    nss,
                    'fechaIngreso',
                    fechaIngreso,
                    'email',
                    email,
                    'celular',
                    celular,
                    'perfilUsuario',
                    perfilUsuario,
                    'idPerfilUsuario',
                    idPerfilUsuario,
                    'activo',
                    activo,
                    'sucursales',
                    IFNULL((SELECT 
                                    JSON_ARRAYAGG(JSON_OBJECT('idSucursal',
                                                        idSucursal,
                                                        'nombreSucursal',
                                                        nombreSucursal))
                                FROM
                                    (SELECT 
                                        s.idSucursal, s.nombreSucursal
                                    FROM
                                        sucursales s
                                    INNER JOIN usuarios_has_sucursales uhs ON s.idSucursal = uhs.idSucursal
                                    WHERE
                                        uhs.idUsuario = derived_table.idUsuario) AS sucursal),
                            JSON_ARRAY()))) AS data
    FROM
    (SELECT 
        u.idUsuario,
            u.nombre AS nombreUsuario,
            u.email AS email,
            u.celular,
            pu.perfilUsuario,
            u.idPerfilUsuario,
            u.nss,
            u.fechaIngreso,
            u.activo
    FROM
        usuarios u
    INNER JOIN perfiles_usuario pu ON pu.idPerfilUsuario = u.idPerfilUsuario
    WHERE
        u.idUsuario = ? OR ? IS NULL ORDER BY u.nombre ASC
    LIMIT ? , ?) AS derived_table
   `;

   const [rows, fields] = await conn.query(query, [idUsuario, idUsuario, offset, pageSize]);
   const respDB = JSON.parse(JSON.stringify(rows));
   if (respDB && respDB[0].data) return respDB[0].data
   else return [];

}

export async function insertUsuarioOnDB(conn: any, usuario: Usuario, hash: string) {
    const usuarioCopy = { ...usuario}; // Crea una copia del objeto y asi no modificar el objeto original
    delete usuarioCopy.sucursales;
    delete usuarioCopy.contrasena;
    delete usuarioCopy.perfilUsuario;
    delete usuarioCopy.fechaCreacion;
    delete usuarioCopy.fechaActualizacion;

    const columnas = Object.keys(usuarioCopy).join(', ');
    const valores = Object.values(usuarioCopy);
    const marcadores = valores.map(() => '?').join(', ');
    const sql = `INSERT INTO usuarios (contrasena, ${columnas}) VALUES (?, ${marcadores})`;

    const [rows, fields] = await conn.query(sql, [hash, ...valores]);
    const respDB = JSON.parse(JSON.stringify(rows));
    console.log("🚀 ~ insertUsuarioOnDB ~ respDB.insertId:", respDB.insertId)
    console.log("🚀 ~ insertUsuarioOnDB ~ respDB:", respDB)
    if (respDB && respDB.insertId) return respDB.insertId
    else return 0 
}

export async function insertSucursales(conn: any, idUsuario: number, sucursales: number[] | undefined | Sucursal[]): Promise<void> {
    if (idUsuario && sucursales) {
        
        let query = `INSERT INTO usuarios_has_sucursales(idSucursal, idUsuario) VALUES `
        sucursales.forEach((sucursal, index, array) => {
            query = query.concat(`(${sucursal}, ${idUsuario})`)
            if (index !== array.length - 1) {
                query = query.concat(',')
            }
        });
        
       const [rows, fields] = await conn.query(query);
       const respDB = JSON.parse(JSON.stringify(rows));
       
    }
}