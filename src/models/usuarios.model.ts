import { Sucursal } from "./sucursales.model";

export interface Usuario {
 idUsuario: number; 
 idPerfilUsuario: number;
 activo: string; 
 usuario: string; 
 contrasena: string; 
 nombre: string; 
 fechaCreacion: string; 
 fechaActualizacion: string; 
 celular: string; 
 fechaIngreso: string; 
 nss: string;
 sucursales?: Sucursal[];
}

