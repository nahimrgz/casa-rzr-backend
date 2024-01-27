import { Router } from 'express';
import { getCiudadesByEstado, getEstados } from '../controllers/estadosRepublica.controller';
import { verifyToken } from '../helpers/verifyToken';

const router = Router()


router.get('/', getEstados)
    .get('/:idEstado', getCiudadesByEstado)

export default router