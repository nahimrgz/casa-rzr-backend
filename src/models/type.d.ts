import { Request } from "express";

//export type Request = Request & {userId?:{idUsuario:number,rol:number}}
export interface Request extends Request{
    userId?:{idUsuario:number,rol:number}
}