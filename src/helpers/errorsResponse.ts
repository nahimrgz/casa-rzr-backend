import { Response } from "express";
import { ERROR_TYPE } from "../constants/constants";

export function errorResponse(resp: Response, error: any) {
  switch (error) {
    case ERROR_TYPE.NO_AUTORIZADO:
      return resp.status(401).json({
        data: [],
        error: true,
        mensaje: "No tiene autorización para realizar esta acción",
      });
    case ERROR_TYPE.NO_PERMISOS:
      return resp.status(404).json({
        data: [],
        error: true,
        mensaje: "No tiene autorización para realizar esta acción",
      });
    case ERROR_TYPE.WRONG_PARAMETERS:
      return resp.status(200).json({
        data: [{ id: -1, descripcion: "parametros incorrectos" }],
        error: true,
        mensaje: "Error en la solicitud",
      });
    case ERROR_TYPE.WRONG_USER_PASWORD:
      return resp.status(400).json({
        error: true,
        mensaje: "Usuario o contraseña incorrectos",
      });
    case ERROR_TYPE.NO_FOUND:
      return resp.status(200).json({
        data: [{ id: -1, descripcion: "No hay datos en la base de datos" }],
        error: true,
        mensaje: "No se encontro el registro",
      });
    case ERROR_TYPE.UNIQUE:
      return resp.status(200).json({
        data: [{ id: -1, descripcion: "Campo repetido en base de datos" }],
        error: true,
        mensaje: "Este registro cuenta con un campo unico",
      });
    default:
      return resp.status(500).json({
        error: true,
        mensaje: "Ocurrió un error",
        data: null,
      });
  }
}
