import { Cliente } from "../models/cliente.model";


export async function crearNuevoClienteEnDB(conn: any, cliente: Cliente): Promise<number> {
    const clienteCopy = { ...cliente }
    console.log("🚀 ~ crearNuevoClienteEnDB ~ clienteCopy:", clienteCopy)

    if (clienteCopy.idCliente && clienteCopy.idCliente === -1) {
        const query = 'INSERT INTO clientes(nombreCliente) VALUES (?)';
        const [rows, fields] = await conn.query(query, [clienteCopy.nombreCliente]);
        const respDB = JSON.parse(JSON.stringify(rows));
        if (respDB && respDB.insertId) return respDB.insertId
        else return 0;
    } else {

        // delete clienteCopy.idCliente;

        const columnas = Object.keys(clienteCopy).join(', ');
        const valores = Object.values(clienteCopy);
        const marcadores = valores.map(() => '?').join(', ');
    
        const sql = `INSERT INTO clientes (${columnas}) VALUES (${marcadores})`;
        const [rows, fields] = await conn.query(sql, valores);
        const respDB = JSON.parse(JSON.stringify(rows));
        if (respDB && respDB.insertId) return respDB.insertId
        else return 0
    }

}

export async function buscarClientesEnBD(conn: any, idCliente: number | null, strParaBuscar: string): Promise<any> {
    const query = `SELECT 
                        idCliente,
                        nombreCliente,
                        IFNULL(descripcionCliente,  'Sin descripción') AS descripcionCliente,
                        telefonoCliente,
                        emailCliente
                    FROM clientes
                    WHERE
                        (? IS NULL OR idCliente = ?)
                        AND (nombreCliente LIKE CONCAT("%", ?, "%") OR descripcionCliente LIKE CONCAT("%", ?, "%"));
    `
    const [rows, fields] = await conn.query(query, [idCliente, idCliente, strParaBuscar, strParaBuscar]);

    const respDB = JSON.parse(JSON.stringify(rows));
    if (respDB && respDB.length === 0 ) return [{
        idCliente: -1,
        nombreCliente: strParaBuscar,
        descripcionCliente: "Agregar nuevo cliente"
    }]
    return respDB;

}

export async function actualizarClienteEnDB(conn:any, cliente: Cliente) {
    const clienteCopy = { ...cliente } /* Tu objeto con las actualizaciones */;
    delete clienteCopy.idCliente;

    const condiciones = `idCliente = ?` /* Tu condición de actualización */;

    // Construir la parte SET de la consulta
    const actualizaciones = Object.keys(clienteCopy).map((columna) => `${columna} = ?`).join(', ');

    // Construir la consulta UPDATE completa
    const sql = `UPDATE clientes SET ${actualizaciones} WHERE ${condiciones}`;

    // Obtener los valores de las actualizaciones
    const valores = Object.values(clienteCopy);

    // Ejecutar la consulta
    await conn.query(sql, [...valores, cliente.idCliente]);
}