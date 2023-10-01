import { Router } from "express";
import { getMain } from "../controllers/main.controller";
const router = Router();
// ruta de prueba
router.get('/',getMain)

export default router;