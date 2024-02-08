import { Router } from 'express';
import { verifyToken } from '../helpers/verifyToken';
import {
    actualizarClienteController,
    crearNuevoClienteController,
    getClientesController
} from '../controllers/clientes.controller';

const router = Router()

// Rutas
router.get('/', getClientesController);


router
    .route('/nuevoCliente')
    .post(crearNuevoClienteController)
    .patch(actualizarClienteController);

export default router