import { Usuario } from "./usuarios.model";

export interface Sucursal {
    idSucursal: number;
    idCiudad: number;
    nombreSucursal: string;
    ciudad: string;
    estado: string;
    direccion: string;
    telefono: string;
    codigoPostal: number;
    usuarios?: Usuario[];
}