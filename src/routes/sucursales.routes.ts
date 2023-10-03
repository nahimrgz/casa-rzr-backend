import { Router } from "express";
import { createSucursalController, getSucursales } from "../controllers/sucursales.controller";
const router = Router();
// ruta de prueba
router.get('/', getSucursales)
      .post('/', createSucursalController);

export default router;