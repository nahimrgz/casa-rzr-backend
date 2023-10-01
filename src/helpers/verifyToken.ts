import  config  from "../config/config";
import { Response, NextFunction } from "express";
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt'
import { Request } from "../models/type";

export function verifyToken(req: Request, res: Response, next: NextFunction) {
    try {
        
       if (req.headers.authorization) {
        let token = req.headers.authorization;
        const array = req.headers.authorization.split(' ');
        if (array.length > 1) {
            token = array[1];
        }
        if (token) {
            jwt.verify(token, config.secretKey, function (err: any, payload: any) {
                if (err) throw err;
                req.userId = {idUsuario:payload.idUsuario, rol:payload.rol} ;
                return payload;
            });
            next()
        } else throw 'wrong token'
    } else throw 'no headers';
      
    } catch (err) {
        switch (err) {
            case 'no headers':
                return res.status(401).json({
                    error: true,
                    message: 'No headers authorization; Unauthorized Request'
                });
            case 'jwt expired':
                return res.status(401).json({
                    error: true,
                    message: 'JWT expired'
                })
            default:
                console.log(err);
                return res.status(401).json({
                    error: true,
                    err
                })
        }
    }
}

export async function encryptPassword(password: string): Promise<string> {
    const saltRounds = 10;
    const hash = await bcrypt.hash(password, saltRounds);
    return hash;
}