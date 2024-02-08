export async function getMarcasVehiculosDB(conn: any, idMarca: number | null, marcaVehiculo: string): Promise<any> {
    const query = `SELECT * FROM marcas_vehiculos WHERE (? IS NULL OR idMarcaVehiculo = ?) AND (marcaVehiculo LIKE CONCAT("%", ?, "%"))`;
    const [rows, fields] = await conn.query(query, [idMarca, idMarca, marcaVehiculo]);
    const respDB = JSON.parse(JSON.stringify(rows));
    return respDB;
}

export async function insertarMarcaVehiculoEnDB(conn: any, idMarcaVehiculo: number, marcaVehiculo: string): Promise<any> {


    const sql = `INSERT INTO marcas_vehiculos (marcaVehiculo) VALUES (?)
    `;
    const query = ``;
    const [rows, fields] = await conn.query(sql, [marcaVehiculo]);
    const respDB = JSON.parse(JSON.stringify(rows));

    if (respDB && respDB.insertId) return respDB.insertId
    else return 0
}