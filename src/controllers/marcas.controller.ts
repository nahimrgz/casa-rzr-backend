import { Response } from "express";
import { Request } from "../models/type";
import { Connect } from "../database/dataBaseConnection";
import { getMarcasVehiculosDB, insertarMarcaVehiculoEnDB } from "../services/marcas.service";

export async function buscarMarcasController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    
    try {
       
        const idMarcaVehiculo = typeof (req.query.idMarcaVehiculo) === 'string' && req.query.idMarcaVehiculo.length > 0 ? parseInt(req.query.idMarcaVehiculo as string, 10) : null;
        const marcaVehiculo = typeof (req.query.marcaVehiculo) === 'string' && req.query.marcaVehiculo.length > 0 ? req.query.marcaVehiculo : '';
        
        const marcas = await getMarcasVehiculosDB(conn, idMarcaVehiculo, marcaVehiculo);
        if (marcas && marcas.length === 0) {
            marcas.push({idMarcaVehiculo: -1, marcaVehiculo})
        }

        return resp.json({
            error: false,
            data: marcas
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

export async function crearMarcaVehiculoController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();
    
    try {
        const {idMarcaVehiculo, marcaVehiculo} = req.body;
        if (!idMarcaVehiculo  || !marcaVehiculo || marcaVehiculo.length === 0) throw '1'; // Error de validacion
        const idMarcaVehiculoInsertado = await insertarMarcaVehiculoEnDB(conn, idMarcaVehiculo, marcaVehiculo);

        return resp.json({
            error: false,
            data: {
                idMarcaVehiculo: idMarcaVehiculoInsertado,
                marcaVehiculo
            }
        });
    } catch (error) {
        console.log(error);
        switch (error) {
            case '1':
                return resp.status(200).json({
                    data: [{ idMarcaVehiculo: -1, marcaVehiculo: '' }],
                    error: true,
                    mensaje: 'Por favor ingresa una marca valida'
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

