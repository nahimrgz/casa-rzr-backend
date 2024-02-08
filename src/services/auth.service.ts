import jwt from "jsonwebtoken";
import { OkPacket, Pool } from "mysql2/promise";
import config from "../config/config";
import { buscarUsuarioEnBD, comparePasswords } from "../helpers/verifyPassword";
import { Usuario } from "../models/usuarios.model";
import { ERROR_TYPE } from "../constants/constants";
import { encryptPassword } from "../helpers/verifyToken";
import { Response } from "express";

export async function signInService(
  conn: Pool,
  usuario: string,
  contrasena: string
) {
  const user: Usuario = await buscarUsuarioEnBD(conn, usuario);

  if (!user || !user.activo) throw ERROR_TYPE.WRONG_USER_PASWORD; // Usuario o contraseña incorrectos
  if (!(await comparePasswords(contrasena, user.contrasena))) throw ERROR_TYPE.WRONG_USER_PASWORD; // Usuario o contraseña incorrectos
  
  const token = jwt.sign(
    {
      nombreUsuario: user.nombre,
      idVendedor: user.idVendedor,
      idPerfilUsuario: user.idPerfilUsuario,
      idSucursal: user.idSucursal
    },
    config.secretKey,
    { expiresIn: "8h" }
  );

  return { token, user };
}