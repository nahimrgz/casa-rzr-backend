import { Router } from "express";
import { crearNuevoUsuarioController, getUsersController } from "../controllers/usuarios.controller";
const router = Router();
// ruta de prueba
router.get('/', getUsersController)
    .post('/', crearNuevoUsuarioController)


export default router;