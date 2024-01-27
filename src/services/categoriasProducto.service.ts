export async function getCategoriasFromDB(conn:any, categoria: string) {
    
    const query = `SELECT * FROM categorias WHERE categoria LIKE CONCAT("%", ?, "%")`
    const [rows, fields] = await conn.query(query, categoria);
    const respDB = JSON.parse(JSON.stringify(rows));
    return respDB;
    
}