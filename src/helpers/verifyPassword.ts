import bcrypt from "bcrypt";

export async function buscarUsuarioEnBD(
  conn: any,
  usuario: string
): Promise<any> {
  const query = `
  SELECT 
      usuarios.idUsuario as idVendedor,
      usuarios.activo,
      idPerfilUsuario,
      contrasena,
      nombre,
      email,
      celular,
      uhs.idSucursal
  FROM
      usuarios
          INNER JOIN
      usuarios_has_sucursales uhs on uhs.idUsuario = usuarios.idUsuario
  WHERE
      email = ?
  and usuarios.activo = 1;`;

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
