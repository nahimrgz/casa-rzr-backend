import { Router } from 'express';
import { verifyToken } from '../helpers/verifyToken';
import { buscarMarcasController, crearMarcaVehiculoController } from '../controllers/marcas.controller';

const router = Router()


router.route('/',)
    .get(buscarMarcasController)
    .post(crearMarcaVehiculoController)

export default router