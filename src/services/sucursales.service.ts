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
    const sucursalCopy = { ...sucursal }; // Crea una copia del objeto y asi no modificar el objeto original
    delete sucursalCopy.usuarios;
    delete sucursalCopy.idSucursal;
    delete sucursalCopy.ciudad;
    delete sucursalCopy.estado;

    const columnas = Object.keys(sucursalCopy).join(', ');
    const valores = Object.values(sucursalCopy);
    const marcadores = valores.map(() => '?').join(', ');
    const sql = `INSERT INTO sucursales (${columnas}) VALUES (${marcadores})`;

    const [rows, fields] = await conn.query(sql, valores);
    const respDB = JSON.parse(JSON.stringify(rows));
    if (respDB && respDB.insertId) return respDB.insertId
    else return 0
}

export async function insertUsuariosSucursal(conn: any, idSucursal: number, usuarios: number[] | undefined | Usuario[]): Promise<void> {
    if (idSucursal && usuarios) {

        await conn.query('DELETE FROM usuarios_has_sucursales  WHERE idSucursal = ?', [idSucursal]);
        // sql = INSERT INTO usuarios_has_sucursales (idUsuario, idSucursal) VALUES ('5', '15'), ('3', '15')
        let sql = `INSERT INTO usuarios_has_sucursales (idUsuario, idSucursal) VALUES `;
        usuarios.forEach(element => {
            sql += ` (${element}, ${idSucursal}),`;

        });
        // Elimina la última coma y añade un punto y coma al final
        sql = sql.slice(0, -1) + ';';
        await conn.query(sql);
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
                        'idCiudad',
                        idCiudad,
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
                cu.nombre AS nombreCiudad,
                cu.idCiudad
        FROM
            sucursales s
        INNER JOIN ciudades cu ON s.idCiudad = cu.idCiudad
        INNER JOIN estados_republica e ON cu.idEstadoRep = e.idEstadoRep) AS json_result;
    `
}

export async function updateSucursal(conn: any, suc: Sucursal): Promise<void> {
    const sucursalCopy = { ...suc } /* Tu objeto con las actualizaciones */;
    delete sucursalCopy.usuarios;
    delete sucursalCopy.idSucursal;
    delete sucursalCopy.ciudad;
    delete sucursalCopy.estado;
    const condiciones = `idSucursal = ?` /* Tu condición de actualización */;

    // Construir la parte SET de la consulta
    const actualizaciones = Object.keys(sucursalCopy).map((columna) => `${columna} = ?`).join(', ');

    // Construir la consulta UPDATE completa
    const sql = `UPDATE sucursales SET ${actualizaciones} WHERE ${condiciones}`;

    // Obtener los valores de las actualizaciones
    const valores = Object.values(sucursalCopy);

    // Ejecutar la consulta
    await conn.query(sql, [...valores, suc.idSucursal]);
}