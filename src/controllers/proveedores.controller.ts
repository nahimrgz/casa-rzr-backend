import { Response } from "express";
import { Request } from "../models/type";
import { Connect } from "../database/dataBaseConnection";
import { getOffsetOfPagination } from "../helpers/getOffsetPagination";
import { ERROR_TYPE } from "../constants/constants";
import { errorResponse } from "../helpers/errorsResponse";
import { getSucursalesFromDB, insertSucursalOnDB, insertUsuariosSucursal, updateSucursal } from "../services/sucursales.service";
import { Sucursal } from "../models/sucursales.model";
import { getProveedoresFromDB, insertProveedorOnDB, updateProveedorOnDB } from "../services/proveedores.service";
import { Proveedor } from "../models/proveedor.model";

export async function getProveedres(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    try {

        const idProveedor = typeof (req.query.idProveedor) === 'string' ? parseInt(req.query.idProveedor as string, 10) : null;
        const nombreProveedor = typeof (req.query.nombreProveedor) === 'string' ? req.query.nombreProveedor : '';
        const pageIndex = parseInt(req.query.pageIndex as string, 10) || 1;
        const pageSize = parseInt(req.query.pageSize as string, 10) || 15;

        const offset = getOffsetOfPagination(pageIndex, pageSize);

        // const idUsuario = typeof (req.query.idUsuario) === 'string' ? parseInt(req.query.idUsuario) : null;
        const data = await getProveedoresFromDB(conn, idProveedor, nombreProveedor, offset, pageSize);
        if (data && data.length === 0) {
            data.push({idProveedor: -1, nombreProveedor})
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
                    data: [{ idProveedor: -1, descripcion: 'Sin resultados' }],
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

export async function createProveedorController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    try {
        const prov: Proveedor = req.body;
        await conn.query('START TRANSACTION;');
        const idProveedor = await insertProveedorOnDB(conn, prov);
        await conn.query('COMMIT;');

        return resp.json({
            error: false,
            data: [{
                idProveedor,
                nombreProveedor: prov.nombreProveedor
            }]
        });
    } catch (error) {
        console.log(error);
        await conn.query('ROLLBACK;')
        switch (error) {
            case '1':
                return resp.status(200).json({
                    data: [{ idProveedor: -1, descripcion: 'Sin resultados' }],
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

export async function putProveedorController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    try {
        const prov: Proveedor = req.body;
        if (!prov.idProveedor) throw '1'; // Necesario idSucursal
        await conn.query('START TRANSACTION');
        await updateProveedorOnDB(conn, prov);
        await conn.query('COMMIT');

        return resp.json({
            error: false,
            data: 'Proveedor actualizado correctamente'
        });
    } catch (error) {
        console.log(error);
        await conn.query('ROLLBACK');
        switch (error) {
            case '1':
                return resp.status(400).json({
                    data: [{ idProveedor: -1, descripcion: 'Sin resultados' }],
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