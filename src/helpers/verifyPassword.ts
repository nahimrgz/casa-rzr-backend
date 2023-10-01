import bcrypt from "bcrypt";

export async function buscarUsuarioEnBD(
  conn: any,
  usuario: string
): Promise<any> {
  const query = `
  SELECT 
      usuarios.idUsuario,
      usuarios.activo,
      idPerfil,
      contrasena,
      nombreEmpleado,
      correo,
      celular as cellphone,
      GROUP_CONCAT(DISTINCT socketRoomName
          ORDER BY plantas.idPlanta) AS socketRoomName
  FROM
      usuarios
          INNER JOIN
      plantas_has_usuarios uhp ON uhp.idUsuario = usuarios.idUsuario
      inner join plantas ON uhp.idPlanta = plantas.idPlanta
  WHERE
      correo LIKE ?
  and usuarios.activo = 1
  GROUP BY usuarios.idUsuario , idPerfil , contrasena , nombreEmpleado  , correo;`;

  const [rows, fields] = await conn.query(query, usuario);
  return JSON.parse(JSON.stringify(rows))[0];
}

export async function comparePasswords(
  password: string,
  hash: string | undefined
): Promise<boolean> {
  if (!hash) return false;

  const match = await bcrypt.compare(password, hash);

  return match;
}
