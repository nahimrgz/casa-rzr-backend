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
  if (!(await comparePasswords(contrasena, user.contrasena)))
    throw ERROR_TYPE.WRONG_USER_PASWORD; // Usuario o contraseña incorrectos
  console.log("🚀 ~ file: auth.services.ts:13 ~ signIn ~ user:", user);

  const token = jwt.sign(
    {
      nombreUsuario: user.nombre,
      idUsuario: user.idUsuario,
      rol: user.idPerfilUsuario,
    },
    config.secretKey,
    { expiresIn: "8h" }
  );

  return { token, user };
}

export async function registerUserDB(conn: Pool, user: Usuario) {
  const query = `INSERT INTO usuarios (nombre, correo, celular, contrasena, activo, idPerfil) VALUE (?,?,?,?,1,?)`;
  const [rows, fields] = await conn.query(query, [
    user.nombre,
    user.usuario,
    user.celular,
    user.contrasena,
    user.idPerfilUsuario,
  ]);
  const respDB = JSON.parse(JSON.stringify(rows));
  return respDB.insertId;
}

// export async function requestNewPasswordService(conn: Pool, usuario: string) {
//   if (!usuario) throw ERROR_TYPE.WRONG_PARAMETERS;

//   const user: Usuarios = await buscarUsuarioEnBD(conn, usuario);
//   console.log(
//     "🚀 ~ file: auth.controller.ts:64 ~ requestNewPassword ~ user:",
//     user
//   );

//   if (!user.idUsuario) throw ERROR_TYPE.NO_FOUND;

//   const token = jwt.sign(
//     { nombreUsuario: user.nombre, usuario: user.idUsuario },
//     config.secretKey,
//     { expiresIn: "30m" }
//   );
//   const respc = await sendEmail(user.nombre, user.usuario, token);
// }

// async function sendEmail(
//   name: string,
//   email: string,
//   jwt: string
// ): Promise<void> {
//   const infoEmail: any = {
//     nombre: name,
//     email: email,
//     jwt,
//   };

//   await enviarEmailParaRestablecerContrasena(infoEmail);
// }

// export async function resetPasswordService(res:Response, conn:Pool, body:ResetPassword) {
//   try {
//     const hash: string = await encryptPassword(body.contrasena);

//     const payload: any = jwt.verify(
//       body.token,
//       config.secretKey,
//       function (err: any, payload: any) {
//         if (err) throw err;
//         return payload;
//       }
//     );

//     await conn.query( "UPDATE usuarios SET contrasena = ? WHERE nombreEmpleado = ? ", [hash, payload.nombreUsuario]);

//     return res.json({
//       data: {
//         error: false,
//         mensaje: "Se ha cambiado la contraseña",
//       },
//     });
//   } catch (err: any) {
//     console.log(err);
//     if (err.name == "TokenExpiredError") {
//       return res.status(400).json({
//         data: {
//           error: true,
//           mensaje:
//             "Tu token ha expirado, por favor vuelve a solicitar el cambio de contraseña.",
//         },
//       });
//     } else {
//       console.log(err.name);

//       return res.status(500).json({
//         data: {
//           error: true,
//           mensaje: "Ocurrió un error, vuelve a intentarlo más tarde",
//         },
//       });
//     }
//   } finally {
//     conn.end();
//   }
// }