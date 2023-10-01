import { Response, Request } from "express";
import { Connect } from "../database/dataBaseConnection";
import { Usuarios } from "../models/usuarios.model";
import { encryptPassword } from "../helpers/verifyToken";
import { registerUserDB,  signInService } from "../services/auth.services";
import { errorResponse } from "../helpers/errorsResponse";

export async function signIn(req: Request, resp: Response): Promise<Response> {
  const conn = await Connect();

  try {
    const { usuario, contrasena } = req.body;
    const { token, user } = await signInService(conn, usuario, contrasena);

    return resp.json({
      error: false,
      data: {
        idRol: user.idPerfilUsuario,
        token,
        nombreUsuario: user.nombre,
        idUsuario: user.idUsuario,
        celular: user.celular,
      },
    });
  } catch (error) {
    console.log("auth.controller.ts line 27, error: ", error);
    return errorResponse(resp, error);
  } finally {
    conn.end();
  }
}

export async function register(
  req: Request,
  resp: Response
): Promise<Response> {
  const conn = await Connect();

  try {
    const user: Usuarios = req.body;

    await conn.query("START TRANSACTION;");
    user.contrasena = await encryptPassword(user.contrasena);
    user.idUsuario = await registerUserDB(conn, user);
    await conn.query("COMMIT;");

    return resp.json({
      error: false,
      data: "ok",
    });
  } catch (error) {
    await conn.query("ROLLBACK;");
    console.log("auth.controller.ts linea 53, error: ",error);
    return errorResponse(resp, error);
  } finally {
    conn.end();
  }
}

// export async function requestNewPassword(
//   req: Request,
//   resp: Response
// ): Promise<Response> {
//   const conn = await Connect();

//   try {
//     const { usuario } = req.body;
//     console.log(
//       "🚀 ~ file: auth.controller.ts:73 ~ requestNewPassword ~ req.body:",
//       req.body
//     );

//     await requestNewPasswordService(conn, usuario);

//     return resp.json({
//       error: false,
//       data: "ok",
//     });
//   } catch (error) {
//     console.log(error);
//     return errorResponse(resp, error);
//   } finally {
//     conn.end();
//   }
// }

// export async function resetPassword(
//   req: Request,
//   res: Response
// ): Promise<Response> {
//   const body:ResetPassword = req.body;
//   console.log("🚀 ~ file: auth.controller.ts:96 ~ resetPassword ~ body:", body);

//   if (body.contrasena === body.confirmContrasena) {
//     const conn = await Connect();
//     return await resetPasswordService(res, conn, body);
  
//   } else {
//     return res.status(400).json({
//       data: { errors: ["Las contraseñas no coinciden"] },
//     });
//   }
// }