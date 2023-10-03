const mysql = require('mysql2/promise');

export async function Connect() {
    const conection = await mysql.createConnection({
        host: process.env.HOST,
        user: process.env.USER_DB,
        password: process.env.PASSWORD,
        database: process.env.DATABASE,
        timezone:'-06:00',
        dateStrings: true,
        connectTimeout: 60 * 60 * 1000,
    });
    
    return conection; 
}
