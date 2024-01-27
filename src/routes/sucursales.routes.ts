import { Router } from "express";
import { createSucursalController, getSucursales, putSucarsalController } from "../controllers/sucursales.controller";
const router = Router();
// ruta de prueba
router.get('/', getSucursales)
      .put('/', putSucarsalController)
      .post('/', createSucursalController);

export default router;