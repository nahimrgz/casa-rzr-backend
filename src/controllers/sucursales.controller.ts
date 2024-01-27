import { Response } from "express";
import { Request } from "../models/type";
import { Connect } from "../database/dataBaseConnection";
import { getOffsetOfPagination } from "../helpers/getOffsetPagination";
import { ERROR_TYPE } from "../constants/constants";
import { errorResponse } from "../helpers/errorsResponse";
import { getSucursalesFromDB, insertSucursalOnDB, insertUsuariosSucursal, updateSucursal } from "../services/sucursales.service";
import { Sucursal } from "../models/sucursales.model";

export async function getSucursales(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    try {

        // const idUsuario = typeof (req.query.idUsuario) === 'string' ? parseInt(req.query.idUsuario) : null;
        const data = await getSucursalesFromDB(conn);

        return resp.json({
            error: false,
            data: data
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

export async function createSucursalController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    try {
        const suc: Sucursal = req.body;
        await conn.query('START TRANSACTION;');
        // const data = await insertSucursalOnDB(conn, suc.idCiudad, suc.nombreSucursal, suc.direccion, suc.codigoPostal, suc.telefono);
        const idSucursal = await insertSucursalOnDB(conn, suc);
        console.log("🚀 ~ file: sucursales.controller.ts:52 ~ createSucursalController ~ suc:", suc)
        await insertUsuariosSucursal(conn, idSucursal, suc.usuarios);

        await conn.query('COMMIT;');

        return resp.json({
            error: false,
            data: 'Sucursal creada correctamente'
        });
    } catch (error) {
        console.log(error);
        await conn.query('ROLLBACK;')
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

export async function putSucarsalController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    try {
        const suc: Sucursal = req.body;
        if (!suc.idSucursal) throw '1'; // Necesario idSucursal
        await conn.query('START TRANSACTION');
        await updateSucursal(conn, suc);
        await conn.query('DELETE FROM usuarios_has_sucursales WHERE idSucursal = ?', suc.idSucursal);
        await insertUsuariosSucursal(conn, suc.idSucursal, suc.usuarios);
        await conn.query('COMMIT');

        return resp.json({
            error: false,
            data: 'Sucursal actualizada correctamente'
        });
    } catch (error) {
        console.log(error);
        await conn.query('ROLLBACK');
        switch (error) {
            case '1':
                return resp.status(400).json({
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