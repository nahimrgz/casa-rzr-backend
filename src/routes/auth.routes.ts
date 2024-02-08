import { Router } from 'express';
import { verifyToken } from '../helpers/verifyToken';
import { signInController } from '../controllers/auth.controller';

const router = Router()

// Rutas
router.post('/signin', signInController);


export default router