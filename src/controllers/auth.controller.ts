import { Response, Request } from "express";
import { Connect } from "../database/dataBaseConnection";
import { encryptPassword } from "../helpers/verifyToken";
import { errorResponse } from "../helpers/errorsResponse";
import { signInService } from "../services/auth.service";

export async function signInController(req: Request, resp: Response): Promise<Response> {
  const conn = await Connect();

  try {
    const { usuario, contrasena } = req.body;
    const { token, user } = await signInService(conn, usuario, contrasena);

    return resp.json({
      error: false,
      data: {
        idPerfilUsuario: user.idPerfilUsuario,
        token,
        nombre: user.nombre,
        idVendedor: user.idVendedor,
        celular: user.celular,
        idSucursal: user.idSucursal
      },
    });
  } catch (error) {
    console.log("auth.controller.ts line 27, error: ", error);
    return errorResponse(resp, error);
  } finally {
    conn.end();
  }
}

// export async function register(
//   req: Request,
//   resp: Response
// ): Promise<Response> {
//   const conn = await Connect();

//   try {
//     const user: Usuario = req.body;

//     await conn.query("START TRANSACTION;");
//     user.contrasena = await encryptPassword(user.contrasena);
//     user.idUsuario = await registerUserDB(conn, user);
//     await conn.query("COMMIT;");

//     return resp.json({
//       error: false,
//       data: "ok",
//     });
//   } catch (error) {
//     await conn.query("ROLLBACK;");
//     console.log("auth.controller.ts linea 53, error: ",error);
//     return errorResponse(resp, error);
//   } finally {
//     conn.end();
//   }
// }
