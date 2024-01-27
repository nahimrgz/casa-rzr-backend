import { Response } from "express";
import { Request } from "../models/type";
import { Connect } from "../database/dataBaseConnection";
import { getOffsetOfPagination } from "../helpers/getOffsetPagination";
import { getProductosPorIdSucursalDB } from "../services/productos.service";

export async function getInfoNuevoProducto(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();
    
    try {
        
        
        return resp.json({
            error: false,
            data: 'ok'
        });
    } catch (error) {
        console.log(error);
        switch (error) {
            case '1':
                return resp.status(200).json({
                    data: [{ idEmpresa: -1, descripcion: 'Sin resultados' }],
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

export async function getProductosPorIdSucursalController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();
    
    try {
        const idSucursal = typeof (req.query.idSucursal) === 'string' ? req.query.idSucursal : null;
        const pageIndex = parseInt(req.query.pageIndex as string, 10) || 1;
        const pageSize = parseInt(req.query.pageSize as string, 10) || 15;
    
        const offset = getOffsetOfPagination(pageIndex, pageSize);
    
        const productos = getProductosPorIdSucursalDB(conn, idSucursal, offset, pageSize)
        
        return resp.json({
            error: false,
            data: 'ok'
        });
    } catch (error) {
        console.log(error);
        switch (error) {
            case '1':
                return resp.status(200).json({
                    data: [{ idEmpresa: -1, descripcion: 'Sin resultados' }],
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