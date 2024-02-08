export async function getTiposVehiculosDB(conn: any, idTipoVehiculo: number | null, tipoVehiculo: string):Promise<any> {
    const query = `SELECT * FROM tipos_vehiculos WHERE (? IS NULL OR idTipoVehiculo = ?) AND (tipoVehiculo LIKE CONCAT("%", ?, "%"))`; 
    const [rows, fields] = await conn.query(query, [idTipoVehiculo, idTipoVehiculo, tipoVehiculo]);
    const respDB = JSON.parse(JSON.stringify(rows));
    return respDB;
}


export async function insertarTipoVehiculoEnDB(conn: any, tipoVehiculo: string):Promise<any> {
     const sql = `INSERT INTO tipos_vehiculos (tipoVehiculo) VALUES (?); `;
     const [rows, fields] = await conn.query(sql, tipoVehiculo);
     const respDB = JSON.parse(JSON.stringify(rows));

     if (respDB && respDB.insertId) return respDB.insertId
     else return 0
}