import { Router } from 'express';
import { verifyToken } from '../helpers/verifyToken';
import { buscarTiposVehiculosController, crearTipoVehiculoController } from '../controllers/tiposVehiculos.controller';

const router = Router()

// Rutas
router.route('/')
 .get(buscarTiposVehiculosController)
 .post(crearTipoVehiculoController);

export default router