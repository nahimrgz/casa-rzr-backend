
interface GET_NuevoProducto {
  sucursales: Inventario[];
  tipoCantidades: TipoCantidades[];
}

interface TipoCantidades {
  idTipoCantidad: number;
  tipoCantidad: string;
}

export interface Inventario {
  idSucursal: number;
  nombreSucursal: string;
  cantidadDisponible: number;
  multiplicadorPrecio: number;
}

export interface POST_NuevoProducto {
  idProducto?: number;
  codigo: string;
  nombre: string;
  descripcion: string;
  idProveedor?: number;
  nombreProveedor?: string;
  precioTaller: number;
  precioPublico: number;
  idTipoCantidad: number;
  tipoCantidad?: string;
  inventario?: Inventario[]
  idMarcaVehiculo: number,
  marcaVehiculo?: string,
  idTipoVehiculo: number,
  tipoVehiculo?: string,
  categorias?:  Categoria[],
}

export interface Categoria {
  idCategoria: number,
  categoria: string
}

