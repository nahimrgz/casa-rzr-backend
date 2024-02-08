export interface Venta {
    idVenta?: number;
    idTipoPago?: number;
    tipoPago?: string;
    idVendedor: number;
    idCliente?: number;
    nombreCliente?: string;
    fechaVenta?: string;
    totalVenta?: number;
    productos?: ProductoVenta[];
    idSucursal?: number;
}

export interface ProductoVenta {
    idProducto: string;
    nombreProducto: string;
    cantidad: number;
    precio: number;
}