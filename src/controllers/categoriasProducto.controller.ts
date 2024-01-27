import { Response } from "express";
import { Request } from "../models/type";
import { Connect } from "../database/dataBaseConnection";
import { getOffsetOfPagination } from "../helpers/getOffsetPagination";
import { getCategoriasFromDB } from "../services/categoriasProducto.service";
  
export async function getCategoriasProductoController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();
    
    try {
        const categoria = typeof (req.query.categoria) === 'string' ? req.query.categoria : '';
        const data: any[] = await getCategoriasFromDB(conn, categoria);
        if (data && data.length === 0) {
            data.push({idCategoria: -1, categoria})
        }

        return resp.json({
            error: false,
            data: data
        });
    } catch (error) {
        console.log(error);
        switch (error) {
            case '1':
                return resp.status(200).json({
                    data: [{ idCategoria: -1, descripcion: 'Sin resultados' }],
                    error: false,
                    mensaje: 'Sin información'
                });
            default:
                console.log(error);
                return resp.status(500).json({
                    error: true,
                    mensaje: 'Ocurrió un error',
                    data: null
                })
        }
    } finally {
        conn.end();
    }
}