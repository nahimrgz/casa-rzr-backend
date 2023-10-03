import { Request, Response } from 'express';
import { Connect } from '../database/dataBaseConnection';
import { errorResponse } from '../helpers/errorsResponse';
import { ERROR_TYPE } from '../constants/constants';
    
    
export async function getEstados(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();
    
    try {
     
        const query = `SELECT * FROM estados_republica ORDER BY nombre;`
        const [rows, fields] = await conn.query(query);
        const data = JSON.parse(JSON.stringify(rows));
        
        return resp.json({
            error: false,
            data
        });
    } catch (error) {
        console.log(error);
        return errorResponse(resp, error);
    } finally {
        conn.end();
    }
}

export async function getCiudadesByEstado(req: Request, resp: Response): Promise<Response> {
    const conn = await Connect();
    
    try {
        const idEstado = parseInt(req.params.idEstado);

        if(Number.isNaN(idEstado)) throw ERROR_TYPE.WRONG_PARAMETERS;

        const query = `SELECT * FROM ciudades WHERE idEstadoRep = ? ORDER BY nombre;`

        const [rows, fields] = await conn.query(query, [idEstado]);
        const data = JSON.parse(JSON.stringify(rows));

        if(data.length === 0) throw ERROR_TYPE.NO_FOUND;
        
        return resp.json({
            error: false,
            data
        });
    } catch (error) {
        console.log(error);
        return errorResponse(resp, error);
    } finally {
        conn.end();
    }
}