export async function getProductosPorIdSucursalDB(conn: any, idSucursal: string | null, offset: number, pageSize: number) {
const query = `
SELECT 
    JSON_ARRAYAGG(JSON_OBJECT('idProducto',
                    idProducto,
                    'idCategoria',
                    idCategoria,
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
            p.idCategoria,
            p.nombreProducto,
            p.descripcionProducto,
            p.precioTaller,
            p.precioPublico,
            p.codigoProducto,
            i.cantidadDisponible
    FROM
        productos p
    INNER JOIN categorias c ON c.idCategoria = p.idCategoria
    LEFT JOIN inventarios i ON i.idProducto = p.idProducto
    WHERE
        i.idSucursal IS NULL OR i.idSucursal = ?
    LIMIT ? , ?) AS derived_table
`
    const [rows, fields] = await conn.query(query, [idSucursal, offset, pageSize]);
    const respDB = JSON.parse(JSON.stringify(rows));
    return respDB

}


export async function getTodosProductos(params:any) {
    const query = `
    SELECT distinct
    JSON_ARRAYAGG(JSON_OBJECT('idProducto',
                    idProducto,
                    'idCategoria',
                    idCategoria,
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
            p.idCategoria,
            p.nombreProducto,
            p.descripcionProducto,
            p.precioTaller,
            p.precioPublico,
            p.codigoProducto
    FROM
        productos p
    INNER JOIN categorias c ON c.idCategoria = p.idCategoria
    
    
    LIMIT 0 , 10) AS derived_table
    `
}