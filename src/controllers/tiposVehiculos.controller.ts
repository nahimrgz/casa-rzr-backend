import { Response } from "express";
import { Request } from "../models/type";
import { Connect } from "../database/dataBaseConnection";
import { getTiposVehiculosDB, insertarTipoVehiculoEnDB } from "../services/tiposVehiculos.service";

export async function buscarTiposVehiculosController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    try {
        const idTipoVehiculo = typeof (req.query.idTipoVehiculo) === 'string' && req.query.idTipoVehiculo.length > 0 ? parseInt(req.query.idTipoVehiculo as string, 10) : null;
        const tipoVehiculo = typeof (req.query.tipoVehiculo) === 'string' && req.query.tipoVehiculo.length > 0 ? req.query.tipoVehiculo : '';
        
        const tiposVehiculos = await getTiposVehiculosDB(conn, idTipoVehiculo, tipoVehiculo);
        if (tiposVehiculos && tiposVehiculos.length === 0) {
            tiposVehiculos.push({idTipoVehiculo: -1, tipoVehiculo})
        }

        return resp.json({
            error: false,
            data: tiposVehiculos
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

export async function crearTipoVehiculoController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();
    
    try {
        const {idTipoVehiculo, tipoVehiculo} = req.body;
        if (!idTipoVehiculo || !tipoVehiculo || tipoVehiculo.length === 0) throw '1'
        const idTipoVehiculoInsertado = await insertarTipoVehiculoEnDB(conn, tipoVehiculo);
        return resp.json({
            error: false,
            data: {
                idTipoVehiculo: idTipoVehiculoInsertado,
                tipoVehiculo
            }
        });
    } catch (error) {
        console.log(error);
        switch (error) {
            case '1':
                return resp.status(200).json({
                    data: [{ idTipoVehiculo: -1, tipoVehiculo: '' }],
                    error: false,
                    mensaje: 'Por favor ingresa un tipo  de vehículo valido.'
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

