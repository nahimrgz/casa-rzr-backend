import { Router } from 'express';
import { verifyToken } from '../helpers/verifyToken';
import { getCategoriasProductoController } from '../controllers/categoriasProducto.controller';

const router = Router()


router.get('/', getCategoriasProductoController);


export default router