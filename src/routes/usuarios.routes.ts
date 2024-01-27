import { Router } from "express";
import { crearNuevoUsuarioController, getPerfilesUsuario, getUsersController } from "../controllers/usuarios.controller";
const router = Router();
// ruta de prueba
router.get('/', getUsersController)
    .post('/', crearNuevoUsuarioController);

router.get('/perfiles', getPerfilesUsuario)



export default router;