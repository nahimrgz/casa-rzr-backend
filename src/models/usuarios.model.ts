import { Sucursal } from "./sucursales.model";

export interface Usuario {
 idVendedor: number; 
 idPerfilUsuario: number;
 activo: string; 
 usuario: string; 
 contrasena?: string; 
 nombre: string; 
 fechaCreacion?: string; 
 fechaActualizacion?: string; 
 celular: string; 
 fechaIngreso?: string; 
 nss: string;
 idSucursal: number;
 sucursales?: Sucursal[] | number[];
 perfilUsuario?: string;
}

