import { createPool } from "mysql2/promise";

export async function Connect() {
    const conection = await createPool({
        host: process.env.HOST,
        user: process.env.USER_DB,
        password: process.env.PASSWORD,
        database: process.env.DATABASE,
        timezone:'-06:00',
        dateStrings: true,
    });
    
    return conection; 
}
