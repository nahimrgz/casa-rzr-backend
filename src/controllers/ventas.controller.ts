import { Response } from "express";
import { Request } from "../models/type";
import { Connect } from "../database/dataBaseConnection";
import { getOffsetOfPagination } from "../helpers/getOffsetPagination";
import { actualizarPrecioTotalVenta, actualizarStockProducto, buscarVentaPorIdVentaEnDB, getVentasFromDB, guardarDetalleVenta, insertarVentaEnDB } from "../services/ventas.service";
import { Venta } from "../models/venta.model";

export async function getTiposDePagoController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    try {
        const [rows, fields] = await conn.query('SELECT * FROM tipos_pago');
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

export async function getVentasController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    try {
        const idSucursal = typeof (req.query.idSucursal) === 'string' && req.query.idSucursal.length > 0 ? (parseInt(req.query.idSucursal as string, 10) || null) : null;
        const idTipoPago = typeof (req.query.idTipoPago) === 'string' && req.query.idTipoPago.length > 0 ? (parseInt(req.query.idTipoPago as string, 10) || null) : null;
        const pageIndex = parseInt(req.query.pageIndex as string, 10) || 1;
        const pageSize = parseInt(req.query.pageSize as string, 10) || 15;
        const offset = getOffsetOfPagination(pageIndex, pageSize);
        
        const ventas = await getVentasFromDB(conn, idSucursal, idTipoPago, offset, pageSize);
        if(!ventas || ventas.length === 0 ) throw '1';
  
        return resp.json({
            error: false,
            data: ventas
        });
    } catch (error) {
        console.log(error);                                                                                                                                 
        switch (error) {
            case '1':
                return resp.status(200).json({
                    data: [{ idVenta: -1, nombreCliente: 'Sin resultados' }],
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

export async function crearNuevaVentaController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    try {
        const venta: Venta = req.body;
        if (!venta.idSucursal || !venta.idVendedor) throw '4'; // Error de validacion
        if(venta.idTipoPago === 6 && !venta.idCliente) throw 'No se puede comprar a crédito sin cliente';
        conn.query('START TRANSACTION');
        const idVenta = await insertarVentaEnDB(conn, venta);
        if (!idVenta) throw "2"; // Error al guardar la venta en BD
        await guardarDetalleVenta(conn, venta.idSucursal, idVenta, venta.productos);
        await actualizarStockProducto(conn, venta.idSucursal, venta.productos);
        await actualizarPrecioTotalVenta(conn, idVenta);

        conn.query('COMMIT');
        return resp.json({
            error: false,
            data: 'ok'
        });
    } catch (error) {
        conn.query('ROLLBACK');

        console.log(error);
        switch (error) {
            case '1':
                return resp.status(200).json({
                    data: [{ idEmpresa: -1, descripcion: 'Sin resultados' }],
                    error: false,
                    mensaje: 'Sin información'
                });
            case '2':
                console.error('Error al guardar la venta')
                return resp.status(409).json({
                    error: true,
                    mensaje: 'Error al registrar la venta'
                });
            case '3':
                return resp.status(409).json({
                    error: true,
                    mensaje: 'productos vacíos o no existentes',
                });
            case 'No se puede comprar a crédito sin cliente':
                return resp.status(400).json({
                    error: true,
                    mensaje: 'Por favor selecciona un cliente',
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

export async function buscarVentaPorIdVenta(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();
    
    try {
        
        const idVenta = typeof (req.query.idVenta) === 'string' && req.query.idVenta.length > 0 ? req.query.idVenta : null;

        if (!idVenta) throw '1';
        
        const venta: Venta = await buscarVentaPorIdVentaEnDB(conn, idVenta);

        return resp.json({
            error: false,
            data: venta
        });
    } catch (error) {
        console.log(error);
        switch (error) {
            case '1':
                return resp.status(200).json({
                    data: [{ idVenta: -1, descripcion: 'Sin resultados' }],
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