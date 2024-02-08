import { Response } from "express";
import { Request } from "../models/type";
import { Connect } from "../database/dataBaseConnection";
import { getOffsetOfPagination } from "../helpers/getOffsetPagination";
import { actualizarClienteEnDB, buscarClientesEnBD, crearNuevoClienteEnDB } from "../services/clientes.service";
import { Cliente } from "../models/cliente.model";

export async function getClientesController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    try {

        const idCliente = typeof (req.query.idCliente) === 'string' && req.query.idCliente.length > 0 ? parseInt(req.query.idCliente as string, 10) : null;
        const nombreCliente = typeof (req.query.nombreCliente) === 'string' && req.query.nombreCliente.length > 0 ? req.query.nombreCliente : '';
        const clientes = await buscarClientesEnBD(conn, idCliente, nombreCliente)

        return resp.json({
            error: false,
            data: clientes
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

export async function crearNuevoClienteController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();
    
    try {
        const nuevoCliente: Cliente = req.body;
        const idCliente  = await crearNuevoClienteEnDB(conn, nuevoCliente);
        
        return resp.json({
            error: false,
            data: {
                idCliente,
                nombreCliente: nuevoCliente.nombreCliente
            }
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

export async function actualizarClienteController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();
    
    try {
        const cliente: Cliente = req.body;
        if (!cliente.idCliente) throw "Falta el ID del cliente";
        await actualizarClienteEnDB(conn, cliente)
        
        return resp.json({
            error: false,
            data: [],
            mensaje: 'Cliente actualizado correctamente.' 
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