import { Router } from 'express';
import { verifyToken } from '../helpers/verifyToken';
import {
    actualizarProductoController,
    crearNuevoProducto,
    getInfoNuevoProducto,
    getProductosPorIdSucursalController,
    getTodosLosProductos
} from '../controllers/productos.controller';

const router = Router()

// Rutas
router.get('/', getTodosLosProductos);

router.get('/porIdSucursal', getProductosPorIdSucursalController);

router
    .route('/nuevoProducto')
    .get(getInfoNuevoProducto)
    .patch(verifyToken, actualizarProductoController)
    .post(crearNuevoProducto);

export default router