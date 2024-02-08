import { Categoria, Inventario, POST_NuevoProducto } from "../models/producto.model";

export async function getProductosPorIdSucursalDB(conn: any, idSucursal: string | null, offset: number, pageSize: number) {
    const query = `
        SELECT 
            JSON_ARRAYAGG(JSON_OBJECT('idProducto',
                            idProducto,
                            -- 'idCategoria', idCategoria,
                            'nombreProducto',
                            nombreProducto,
                            'descripcionProducto',
                            descripcionProducto,
                            'precioTaller',
                            precioTaller,
                            'precioPublico',
                            precioPublico,
                            'codigoProducto',
                            codigoProducto,
                            'cantidadDisponible',
                            IFNULL(cantidadDisponible, 0),
                            'proveedores',
                            IFNULL((SELECT 
                                            JSON_ARRAYAGG(JSON_OBJECT('idProveedor',
                                                                idProveedor,
                                                                'nombreProveedor',
                                                                nombreProveedor,
                                                                'telefonoProveedor',
                                                                telefonoProveedor))
                                        FROM
                                            (SELECT 
                                                p.idProveedor, p.nombreProveedor, p.telefonoProveedor
                                            FROM
                                                proveedores p
                                            INNER JOIN productos_has_proveedores php ON php.idProveedor = p.idProveedor
                                            WHERE
                                                php.idProducto = derived_table.idProducto) AS proveedores),
                                    JSON_ARRAY()))) AS data
        FROM
            (SELECT 
                    p.idProducto,
                    -- p.idCategoria,
                    p.nombreProducto,
                    p.descripcionProducto,
                    p.precioTaller,
                    p.precioPublico,
                    p.codigoProducto,
                    i.cantidadDisponible,
                    p.idMarcaVehiculo,
                    p.idTipoVehiculo
            FROM
                productos p
            -- INNER JOIN categorias c ON c.idCategoria = p.idCategoria
            LEFT JOIN inventarios i ON i.idProducto = p.idProducto
            WHERE
                i.idSucursal IS NULL OR i.idSucursal = ?
            LIMIT ? , ?) AS derived_table
`
    const [rows, fields] = await conn.query(query, [idSucursal, offset, pageSize]);
    const respDB = JSON.parse(JSON.stringify(rows));
    return respDB[0].data

}

export async function getTodosProductos(
    conn: any,
    idProducto: number | null,
    nombreProducto: string,
    idMarcaVehiculo: number | null,
    idTipoVehiculo: number | null,
    idCategoria: number | null,
    offset: number,
    pageSize: number) {
    const query = `
    SELECT DISTINCT
        JSON_ARRAYAGG(JSON_OBJECT('idProducto',
                        idProducto,
                        'idTipoCantidad',
                        idTipoCantidad,
                        'idMarcaVehiculo',
                        idMarcaVehiculo,
                        'marcaVehiculo',
                         marcaVehiculo,
                        'idTipoVehiculo',
                        idTipoVehiculo,
                        'tipoVehiculo',
                        tipoVehiculo,
                        'tipoCantidades',  (SELECT 
                            JSON_ARRAYAGG(JSON_OBJECT('idTipoCantidad',
                                                    idTipoCantidad,
                                                'tipoCantidad',
                                                tipoCantidad))
                        FROM
                            tipo_cantidades inv),
                        'nombreProducto',
                        nombreProducto,
                        'descripcionProducto',
                        descripcionProducto,
                        'precioTaller',
                        precioTaller,
                        'precioPublico',
                        precioPublico,
                        'codigoProducto',
                        codigoProducto,
                        'categorias',
                        (SELECT
                            JSON_ARRAYAGG(JSON_OBJECT(
                                'idCategoria', cat.idCategoria,
                                'categoria', cat.categoria))
                        FROM
                            productos_has_categorias phc
                        INNER JOIN  categorias cat ON phc.idCategoria = cat.idCategoria
                        WHERE
                            phc.idProducto = derived_table.idProducto),
                        'inventario',
                        (SELECT 
                                JSON_ARRAYAGG(JSON_OBJECT('idSucursal',
                                                    inv.idSucursal,
                                                    'nombreSucursal',
                                                    s.nombreSucursal,
                                                    'cantidadDisponible',
                                                    inv.cantidadDisponible,
                                                    'multiplicadorPrecio',
                                                    inv.multiplicadorPrecio))
                            FROM
                                inventarios inv
                            INNER JOIN  sucursales s ON s.idSucursal = inv.idSucursal -- aqui agregue el inner
                            WHERE
                                inv.idProducto = derived_table.idProducto),
                        'totales',
                        IFNULL((SELECT 
                                        SUM(cantidadDisponible) AS totales
                                    FROM
                                        inventarios inv
                                    WHERE
                                        inv.idProducto = derived_table.idProducto),
                                0),
                        'proveedores',
                        IFNULL((SELECT 
                                        JSON_ARRAYAGG(JSON_OBJECT('idProveedor',
                                                            idProveedor,
                                                            'nombreProveedor',
                                                            nombreProveedor,
                                                            'telefonoProveedor',
                                                            telefonoProveedor))
                                    FROM
                                        (SELECT 
                                            p.idProveedor, p.nombreProveedor, p.telefonoProveedor
                                        FROM
                                            proveedores p
                                        INNER JOIN productos_has_proveedores php ON php.idProveedor = p.idProveedor
                                        WHERE
                                            php.idProducto = derived_table.idProducto) AS proveedores),
                                JSON_ARRAY()))) AS data
    FROM
        (SELECT 
            p.idProducto,
            p.nombreProducto,
            p.descripcionProducto,
            p.precioTaller,
            p.precioPublico,
            p.codigoProducto,
            p.idTipoCantidad,
            p.idMarcaVehiculo,
            p.idTipoVehiculo,
            mv.marcaVehiculo,
            tv.tipoVehiculo
        FROM
            productos p
        LEFT JOIN tipos_vehiculos tv ON tv.idTipoVehiculo = p.idTipoVehiculo
        LEFT JOIN  marcas_vehiculos mv ON mv.idMarcaVehiculo = p.idMarcaVehiculo
        WHERE 
            ( (? IS NULL OR p.idProducto = ?) AND (p.nombreProducto LIKE CONCAT("%", ?, "%")) )
            AND (? IS NULL OR p.idMarcaVehiculo = ?)
            AND (? IS NULL OR p.idTipoVehiculo = ?)
            AND (? IS NULL OR p.idProducto IN (SELECT idProducto FROM productos_has_categorias WHERE idCategoria = ?))
            LIMIT ?, ?
            ) AS derived_table
`
    const [rows, fields] = await conn.query(query, [
        idProducto, idProducto, nombreProducto,
        idMarcaVehiculo, idMarcaVehiculo,
        idTipoVehiculo, idTipoVehiculo,
        idCategoria, idCategoria,
        offset, pageSize]);
    const respDB = JSON.parse(JSON.stringify(rows));
    return respDB[0].data
}

export async function getInventarioVacio(conn: any) {
    const query = `SELECT DISTINCT
                        JSON_ARRAYAGG(JSON_OBJECT(
                        'idSucursal', idSucursal,
                        'nombreSucursal', nombreSucursal,
                        'cantidadDisponible', 0,
                        'multiplicadorPrecio', 1.0)) as data1
                    FROM
                        sucursales;`;
    const [rows, fields] = await conn.query(query);
    const respDB = JSON.parse(JSON.stringify(rows));
    return respDB[0].data1
}

export async function getTipoCantidades(conn: any) {
    const query = `SELECT * FROM tipo_cantidades`;
    const [rows, fields] = await conn.query(query);
    const respDB = JSON.parse(JSON.stringify(rows));
    return respDB;

}



export async function getCategoriasProductoDB(conn: any): Promise<any> {
    const query = `SELECT * FROM  productos_has_categorias`;
    const [rows, fields] = await conn.query(query);
    const respDB = JSON.parse(JSON.stringify(rows));
    return respDB;
}

export async function guardarNuevoProductoEnDb(conn: any, nuevoProducto: POST_NuevoProducto): Promise<any> {
    const np = getProductoCopy(nuevoProducto)

    const columnas = Object.keys(np).join(', ');
    const valores = Object.values(np);
    const marcadores = valores.map(() => '?').join(', ');

    const sql = `INSERT INTO productos (${columnas}) VALUES (${marcadores})`;
    const [rows, fields] = await conn.query(sql, valores);
    const respDB = JSON.parse(JSON.stringify(rows));

    if (respDB && respDB.insertId) return respDB.insertId
    else return 0;
}

export async function guardarInventarioEnDb(conn: any, idProducto: number, inventarios: Inventario[] | undefined): Promise<void> {

    let query = 'INSERT INTO inventarios (idProducto, idSucursal, cantidadDisponible, multiplicadorPrecio) VALUES ';
    if (!inventarios) throw new Error('No hay inventarios');

    inventarios.forEach(inventario => {
        query += `(${idProducto}, ${inventario.idSucursal}, ${inventario.cantidadDisponible}, ${inventario.multiplicadorPrecio}),`;
    });

    // Elimina la última coma y añade un punto y coma al final
    query = query.slice(0, -1) + ';';

    const [rows, fields] = await conn.query(query);
    const respDB = JSON.parse(JSON.stringify(rows));
}

export async function actualizarProductoEnDB(conn: any, idProducto: number, producto: POST_NuevoProducto): Promise<any> {
    const np = getProductoCopy(producto);

    const condiciones = `idProducto = ?` /* Tu condición de actualización */;

    // Construir la parte SET de la consulta
    const actualizaciones = Object.keys(np).map((columna) => `${columna} = ?`).join(', ');

    // Construir la consulta UPDATE completa
    const sql = `UPDATE productos SET ${actualizaciones} WHERE ${condiciones}`;

    // Obtener los valores de las actualizaciones
    const valores = Object.values(np);

    // Ejecutar la consulta
    await conn.query(sql, [...valores, idProducto]);
}

export async function guardarProveedorProducto(conn: any, idProducto: any, idProveedor: number | undefined): Promise<any> {
    if (!idProveedor) return
    const sql = `INSERT INTO productos_has_proveedores VALUES (?, ?)`;
    await conn.query(sql, [idProducto, idProveedor]);
}

export async function guardarCategoriaEnDB(conn: any, idProducto: number, categorias: Categoria[]) {
    const sql = `INSERT INTO productos_has_categorias VALUES (?, ?)`;
    await conn.query(sql, [idProducto, categorias[0].idCategoria]);
}

export async function actualizarInventariosEnDB(conn: any, idProducto: number, idSucursal: number, idPerfilUsuario: number, inventarios: Inventario[], idUsuario: number) {

    if (idPerfilUsuario === 1) {
        for await (const inventario of inventarios) {
            await actualizarInventariosSync(conn, idProducto, idUsuario, inventario);
        }
    } else if (idPerfilUsuario === 2) {
        let inventarioSuc = inventarios.find(inventario => inventario.idSucursal === idSucursal);
        if (!inventarioSuc) throw "No se encontro el inventario de la sucursal especificada";
        await actualizarInventariosSync(conn, idProducto, idUsuario, inventarioSuc);

    }

}

function getProductoCopy(producto: POST_NuevoProducto) {
    const np = { ...producto };
    delete np.idProducto;
    delete np.idProveedor;
    delete np.nombreProveedor;
    delete np.inventario;
    delete np.tipoCantidad;
    delete np.categorias; // Porque es una tabla muchos a muchos
    delete np.marcaVehiculo;
    delete np.tipoVehiculo;
    return np;
}

async function actualizarInventariosSync(conn: any, idProducto: number, idUsuario: number, inventario: Inventario): Promise<any> {
    const [rows, fields] = await conn.query(`SELECT cantidadDisponible, multiplicadorPrecio FROM inventarios WHERE idProducto = ? AND idSucursal = ?`, [idProducto, inventario.idSucursal]);
    const respDB = JSON.parse(JSON.stringify(rows));
    if (!respDB || respDB.length === 0) throw 'Algo salio mal al consultar el inventario'

    const cantidadDisponibleAnterior = respDB[0].cantidadDisponible;
    const cantidadDisponibleNuevo = inventario.cantidadDisponible;
    let idTipoMovimiento = 0; // 0 es igual a SIN MOVIMIENTO
    (cantidadDisponibleNuevo > cantidadDisponibleAnterior) ? idTipoMovimiento = 1 : (cantidadDisponibleNuevo < cantidadDisponibleAnterior) ? idTipoMovimiento = 2 : idTipoMovimiento = 0;

    if (idTipoMovimiento != 0) {
        await conn.query(`INSERT INTO productos_logs(idUsuario, idProducto, idSucursal, idTipoMovimientoLog, cantidadAnterior, nuevaCantidad) VALUES (?, ?, ?, ?, ?, ?)`, [
            idUsuario,
            idProducto,
            inventario.idSucursal,
            idTipoMovimiento,
            cantidadDisponibleAnterior,
            cantidadDisponibleNuevo
        ]);
    }

    const query = `UPDATE inventarios SET cantidadDisponible = ?, multiplicadorPrecio = ? WHERE idProducto = ? AND idSucursal = ?`;
    await conn.query(query, [inventario.cantidadDisponible, inventario.multiplicadorPrecio, idProducto, inventario.idSucursal]);
}


