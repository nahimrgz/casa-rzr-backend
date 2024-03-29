import { Response } from "express";
import { Request } from "../models/type";
import { Connect } from "../database/dataBaseConnection";
import { getOffsetOfPagination } from "../helpers/getOffsetPagination";
import { getUsersFromDB, insertSucursales, insertUsuarioOnDB } from "../services/usuarios.service";
import { Usuario } from "../models/usuarios.model";
import { encryptPassword } from "../helpers/verifyToken";

export async function getUsersController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    try {

        const idUsuario = typeof (req.query.idUsuario) === 'string' ? req.query.idUsuario : null;
        const pageIndex = parseInt(req.query.pageIndex as string, 10) || 1;
        const pageSize = parseInt(req.query.pageSize as string, 10) || 15;

        const offset = getOffsetOfPagination(pageIndex, pageSize);
        const data = await getUsersFromDB(conn, idUsuario, offset, pageSize);


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

export async function crearNuevoUsuarioController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();
    
    try {
        const usuario: Usuario = req.body;
        const hash = await encryptPassword(usuario.contrasena);
        await conn.query("START TRANSACTION");
        const idUsuario = await insertUsuarioOnDB(conn, usuario, hash);
        await insertSucursales(conn, idUsuario, usuario.sucursales);
        await conn.query("COMMIT")
        return resp.json({
            error: false,
            data: 'ok'
        });
    } catch (error) {
        console.log(error);
        await conn.query("ROLLBACK");
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
                    data: error
                })
            }
    } finally {
        conn.end();
    }
}

export async function getPerfilesUsuario(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();
    
    try {
        const query = 'SELECT * FROM perfiles_usuario ORDER BY perfilUsuario';
        const [rows, fields] = await conn.query(query);
        const respDB = JSON.parse(JSON.stringify(rows));
        
        return resp.json({
            error: false,
            data: respDB
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