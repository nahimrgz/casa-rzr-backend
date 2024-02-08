import { Response } from "express";
import { Request } from "../models/type";
import { Connect } from "../database/dataBaseConnection";
import { getOffsetOfPagination } from "../helpers/getOffsetPagination";
import { POST_NuevoProducto } from "../models/producto.model";
import {
    getInventarioVacio,
    getProductosPorIdSucursalDB,
    getTipoCantidades,
    getTodosProductos,
    guardarNuevoProductoEnDb,
    guardarInventarioEnDb,
    getCategoriasProductoDB,
    guardarProveedorProducto,
    actualizarProductoEnDB,
    actualizarInventariosEnDB,
    guardarCategoriaEnDB,
} from "../services/productos.service";
import { getMarcasVehiculosDB } from "../services/marcas.service";
import { getTiposVehiculosDB } from "../services/tiposVehiculos.service";

export async function getInfoNuevoProducto(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    try {

        const sucursales = await getInventarioVacio(conn);
        const tipoCantidades = await getTipoCantidades(conn);
        const marcasVehiculos = await getMarcasVehiculosDB(conn, null, '');
        const tiposVehiculos = await getTiposVehiculosDB(conn, null, '');
        const categoriasVehiculos = await getCategoriasProductoDB(conn);

        return resp.json({
            error: false,
            data: {
                sucursales,
                tipoCantidades,
                marcasVehiculos,
                tiposVehiculos,
                categoriasVehiculos
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

export async function getProductosPorIdSucursalController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    try {
        const idSucursal = typeof (req.query.idSucursal) === 'string' ? req.query.idSucursal : null;
        const pageIndex = parseInt(req.query.pageIndex as string, 10) || 1;
        const pageSize = parseInt(req.query.pageSize as string, 10) || 15;

        const offset = getOffsetOfPagination(pageIndex, pageSize);

        const productos = await getProductosPorIdSucursalDB(conn, idSucursal, offset, pageSize)

        return resp.json({
            error: false,
            data: productos
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

export async function getTodosLosProductos(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    try {

        // const idProducto = typeof (req.query.idProducto) === 'string' && req.query.idProducto.length > 0 ? parseInt(req.query.idProducto as string, 10) : null;
        const nombreProducto = typeof (req.query.nombreProducto) === 'string' && req.query.nombreProducto.length > 0 ? req.query.nombreProducto : '';
        const pageIndex = parseInt(req.query.pageIndex as string, 10) || 1;
        const pageSize = parseInt(req.query.pageSize as string, 10) || 15;
        const idMarcaVehiculo = typeof (req.query.idMarcaVehiculo) === 'string' && req.query.idMarcaVehiculo.length > 0 ? (parseInt(req.query.idMarcaVehiculo as string, 10) || null) : null;
        const idTipoVehiculo = typeof (req.query.idTipoVehiculo) === 'string' && req.query.idTipoVehiculo.length > 0 ? (parseInt(req.query.idTipoVehiculo as string, 10) || null) : null;
        const idCategoria = typeof (req.query.idCategoria) === 'string' && req.query.idCategoria.length > 0 ? (parseInt(req.query.idCategoria as string, 10) || null) : null;
        const idProducto = typeof (req.query.idProducto) === 'string' && req.query.idProducto.length > 0 ? (parseInt(req.query.idProducto as string, 10) || null) : null;
        
        const offset = getOffsetOfPagination(pageIndex, pageSize);

        const productos = await getTodosProductos(conn, idProducto, nombreProducto, idMarcaVehiculo, idTipoVehiculo, idCategoria, offset, pageSize);
        if (!productos) throw '1'
        return resp.json({
            error: false,
            data: productos
        });
    } catch (error) {
        console.log(error);
        switch (error) {
            case '1':
                console.error(`No se encontraron productos`);
                return resp.status(200).json({
                    data: [{ idProducto: -1, nombreProducto: 'No se encontraron productos' }],
                    error: false,
                    mensaje: 'No se encontraron productos'
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

export async function crearNuevoProducto(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    try {
        const nuevoProducto: POST_NuevoProducto = req.body;
        conn.query('START TRANSACTION;');
        if (!nuevoProducto.inventario || !nuevoProducto.categorias) throw "Faltan campos";
        const idProducto = await guardarNuevoProductoEnDb(conn, nuevoProducto);
        await guardarInventarioEnDb(conn, idProducto, nuevoProducto.inventario);
        await guardarProveedorProducto(conn, idProducto, nuevoProducto.idProveedor);
        await guardarCategoriaEnDB(conn, idProducto, nuevoProducto.categorias);
        conn.query('COMMIT;');
        return resp.json({
            error: false,
            data: 'Se  ha agregado el producto correctamente',
        });
    } catch (error) {
        conn.query('ROLLBACK;');
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

export async function actualizarProductoController(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();

    try {

        const idSucursal = req.usuario?.idSucursal;
        const idPerfilUsuario = req.usuario?.idPerfilUsuario;
        const idUsuario = req.usuario?.idUsuario;
        const idVendedor = req.usuario?.idVendedor
        
        const producto: POST_NuevoProducto = req.body;
        if (idPerfilUsuario === 3) throw '3';

        if (!idSucursal || !producto.idProducto || !idPerfilUsuario || !producto.inventario || !idUsuario) throw '2';


        await actualizarProductoEnDB(conn, producto.idProducto, producto);
        await actualizarInventariosEnDB(conn, producto.idProducto, idSucursal, idPerfilUsuario, producto.inventario, idUsuario);


        return resp.json({
            error: false,
            data: 'ok'
        });
    } catch (error) {
        console.error(error);
        switch (error) {
            case '1':
                return resp.status(400).json({
                    data: [{ idProducto: -1, descripcion: 'Información faltante' }],
                    error: false,
                    mensaje: 'Información faltante'
                });
            case '2':
                console.error('idProducto, idPerfilUsuario y/o idSucursal faltante')
                return resp.status(400).json({
                    error: true,
                    mensaje: `Información faltante`
                });
            case '3':
                console.warn('Vendedor no tiene permisos para actualizar los inventarios');
                return resp.status(405).json({
                    error: true,
                    mensaje: "No tienes permiso para realizar esta acción"
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