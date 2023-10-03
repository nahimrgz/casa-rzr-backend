import { Request, Response } from "express";

export async function getMain(req: Request, resp: Response): Promise<Response> {
    try {

        return resp.status(404).json({
            error: false,
            data: 'Recurso no encontrado | La casa del rzr v1.0.0'
        });
    } catch (error) {
        console.log(error);
        return resp.status(500).json({
            error: true,
            mensaje: 'Ocurrió un error',
            data: null
        })
    }
}