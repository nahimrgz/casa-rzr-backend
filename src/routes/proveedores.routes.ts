import { Router } from 'express';
import { verifyToken } from '../helpers/verifyToken';
import { createProveedorController, getProveedres, putProveedorController } from '../controllers/proveedores.controller';

const router = Router()


router.get('/', getProveedres)
    .put('/', putProveedorController)
    .post('/', createProveedorController)


export default router