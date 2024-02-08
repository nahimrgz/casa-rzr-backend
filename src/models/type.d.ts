import { Request } from "express";

export interface Request extends Request {
    usuario?: { idUsuario: number, idPerfilUsuario: number, idSucursal: number, idVendedor: number }
}