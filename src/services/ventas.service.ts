import { ProductoVenta, Venta } from "../models/venta.model";

export async function getVentasFromDB(conn: any, idSucursal: number | null, idTipoPago: number | null, offset: number, pageSize: number): Promise<any> {
    const query = `SELECT 
                        ventas.*,
                        tipos_pago.tipoPago,
                        IFNULL(ventas.idCliente, 0) as idCliente,
                        usuarios.nombre as nombreUsuario,
                       IFNULL( clientes.nombreCliente, 'Desconocido')  as nombreCliente
                    FROM
                        ventas
                    INNER JOIN tipos_pago ON ventas.idTipoPago = tipos_pago.idTipoPago
                    LEFT JOIN clientes ON ventas.idCliente = clientes.idCliente
                    LEFT JOIN usuarios ON ventas.idVendedor = usuarios.idUsuario
                    WHERE
                        (? IS NULL OR ventas.idTipoPago = ?)
                        AND idVendedor IN (SELECT 
                                idUsuario
                            FROM
                                usuarios_has_sucursales
                            WHERE
                                 ? is NULL OR idSucursal = ?)
                    LIMIT ?, ?;`;
    const [rows, fields] = await conn.query(query, [idTipoPago, idTipoPago, idSucursal, idSucursal, offset, pageSize]);
    const respDB = JSON.parse(JSON.stringify(rows));
    
    return respDB
}

//  insertarVentaEnDB(conn, venta.idTipoPago, venta.idVendedor, venta.idCliente)
export async function insertarVentaEnDB(conn: any, venta: Venta): Promise<any> {
    const vCopy = { ...venta }
    delete vCopy.idVenta;
    delete vCopy.tipoPago;
    delete vCopy.nombreCliente;
    delete vCopy.productos;
    delete vCopy.idSucursal;
    delete vCopy.fechaVenta;
    if(vCopy.idCliente === 0) delete vCopy.idCliente

    const columnas = Object.keys(vCopy).join(', ');
    const valores = Object.values(vCopy);
    const marcadores = valores.map(() => '?').join(', ');

    const sql = `INSERT INTO ventas (${columnas}) VALUES (${marcadores})`;
    const [rows, fields] = await conn.query(sql, valores);
    const respDB = JSON.parse(JSON.stringify(rows));

    if (respDB && respDB.insertId) return respDB.insertId
    else return 0
}

export async function guardarDetalleVenta(conn: any, idSucursal: number, idVenta: number, productos: ProductoVenta[] | undefined): Promise<any> {
    if (!productos || productos.length === 0) throw '3' // productos vacíos o no existentes

    let query = 'INSERT INTO detalle_venta (idVenta, idProducto, cantidad, precio) VALUES ';

    productos.forEach(producto => {
        // query += `(${idProducto}, ${inventario.idSucursal}, ${inventario.cantidadDisponible}, ${inventario.multiplicadorPrecio}),`;
        query += `(${idVenta}, ${producto.idProducto}, ${producto.cantidad}, ( SELECT 
            (inv.multiplicadorPrecio * p.precioPublico) precio
       FROM
           inventarios inv
               INNER JOIN
           productos p ON inv.idProducto = p.idProducto
       WHERE
           inv.idProducto = ${producto.idProducto} AND idSucursal = ${idSucursal})),`
    });

    // Elimina la última coma y añade un punto y coma al final
    query = query.slice(0, -1) + ';';

    const [rows, fields] = await conn.query(query);
    const respDB = JSON.parse(JSON.stringify(rows));
    console.log("🚀 ~ guardarDetalleVenta ~ respDB:", respDB)
}

export async function actualizarStockProducto(conn: any, idSucursal: number, productos: ProductoVenta[] | undefined): Promise<any> {
    if (!productos || productos.length === 0) throw '3' // productos vacíos o no existentes

    for await (const producto of productos) {
        const query = `UPDATE inventarios SET cantidadDisponible = cantidadDisponible - ? WHERE idProducto = ? AND idSucursal = ?`;
        await conn.query(query, [producto.cantidad, producto.idProducto, idSucursal]);
    }
}

export async function actualizarPrecioTotalVenta(conn: any, idVenta: number): Promise<any> {
    const query = `UPDATE ventas 
                    SET 
                        totalVenta = (SELECT 
                                SUM(precio * cantidad)
                            FROM
                                detalle_venta
                            WHERE
                                idVenta = ?)
                    WHERE
                        idVenta = ?;`;
    const [rows, fields] = await conn.query(query, [idVenta, idVenta]);
    const respDB = JSON.parse(JSON.stringify(rows));

}

export async function buscarVentaPorIdVentaEnDB(conn: any, idVenta: any):Promise<any> {
    await conn.query("SET lc_time_names = 'es_MX';")
    const query = `
    SELECT 
        JSON_ARRAYAGG(JSON_OBJECT('idVenta',
                        v.idVenta,
                        'tipoPago',
                        tp.tipoPago,
                        'idVendedor',
                        v.idVendedor,
                        'idCliente',
                        IFNULL(v.idCliente, 0),
                        'nombreCliente',
                        IFNULL(c.nombreCliente, 'Desconocido'),
                        'fechaVenta',
                        DATE_FORMAT(fechaVenta, '%W %d de %M a las %r'),
                        'totalVenta',
                        CONCAT('$ ', FORMAT(totalVenta, 2)),
                        'productos',
                        (SELECT 
                                JSON_ARRAYAGG(JSON_OBJECT('idProducto',
                                                    dv.idProducto,
                                                    'cantidad',
                                                    dv.cantidad,
                                                    'precio',
                                                    dv.precio,
                                                    'nombreProducto',
                                                    p.nombreProducto))
                            FROM
                                detalle_venta dv
                            INNER JOIN productos p ON p.idProducto = dv.idProducto
                            WHERE
                                dv.idVenta = v.idVenta))) AS data
    FROM
        ventas v
            INNER JOIN
        tipos_pago tp ON tp.idTipoPago = v.idTipoPago
            LEFT JOIN
        clientes c ON c.idCliente = v.idCliente
    WHERE
        v.idVenta = ?;`; 
    const [rows, fields] = await conn.query(query, [idVenta]);
    const respDB = JSON.parse(JSON.stringify(rows));
    return respDB[0].data;

}