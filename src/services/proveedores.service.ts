import { Proveedor } from "../models/proveedor.model";

export async function getProveedoresFromDB(conn: any, idProveedor: string | null, offset: number, pageSize: number): Promise<any> {

    const [rows, fields] = await conn.query(`SELECT * FROM proveedores WHERE ? IS NULL OR idProveedor = ? ORDER BY nombreProveedor ASC LIMIT ?, ?`, [idProveedor, idProveedor, offset, pageSize]);
    const respDB = JSON.parse(JSON.stringify(rows));
    return respDB;

}

export async function insertProveedorOnDB(conn: any, proveedor: Proveedor) {

    const columnas = Object.keys(proveedor).join(', ');
    const valores = Object.values(proveedor);
    const marcadores = valores.map(() => '?').join(', ');
    const sql = `INSERT INTO proveedores (${columnas}) VALUES (${marcadores})`;

    const [rows, fields] = await conn.query(sql, valores);
    const respDB = JSON.parse(JSON.stringify(rows));
    if (respDB && respDB.insertId) return respDB.insertId
    else return 0

}

export async function updateProveedorOnDB(conn:any, prov: Proveedor) {
        const provCopy = { ...prov } /* Tu objeto con las actualizaciones */;
        delete provCopy.idProveedor;
        const condiciones = `idProveedor = ?` /* Tu condición de actualización */;
    
        // Construir la parte SET de la consulta
        const actualizaciones = Object.keys(provCopy).map((columna) => `${columna} = ?`).join(', ');
    
        // Construir la consulta UPDATE completa
        const sql = `UPDATE proveedores SET ${actualizaciones} WHERE ${condiciones}`;
    
        // Obtener los valores de las actualizaciones
        const valores = Object.values(provCopy);
    
        // Ejecutar la consulta
        await conn.query(sql, [...valores, prov.idProveedor]);
}