import { Router } from 'express';
import { verifyToken } from '../helpers/verifyToken';
import {
    buscarVentaPorIdVenta,
    crearNuevaVentaController,
    getTiposDePagoController,
    getVentasController
} from '../controllers/ventas.controller';

const router = Router()

router.get('/tiposDePago', getTiposDePagoController)

router.route('/',)
    .get(getVentasController)
    .post(crearNuevaVentaController);

router.get('/porIdVenta', buscarVentaPorIdVenta)



export default router