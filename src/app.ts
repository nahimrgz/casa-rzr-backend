import express, { Application } from "express";
import cors from "cors";
import morgan from "morgan";
import http from 'http';
import https from 'https';
import EstadosRoutes from "./routes/estadosRepublica.routes";




//import of routes
import MainRouter from "./routes/main.routes";
import SucursalesRouter from "./routes/sucursales.routes";
import UsuariosRouter from "./routes/usuarios.routes";


// const options = {
//     cert: fs_1.default.readFileSync(path_1.default.resolve('/etc/letsencrypt/live/axess.sidon.mx/fullchain.pem')),
//     key: fs_1.default.readFileSync(path_1.default.resolve('/etc/letsencrypt/live/axess.sidon.mx/privkey.pem')),
// };

// const options = {
//     cert: fs.readFileSync(path.resolve(__dirname, '/etc/letsencrypt/live/axess.sidon.mx/fullchain.pem')),
//     key: fs.readFileSync(path.resolve(__dirname, '/etc/letsencrypt/live/axess.sidon.mx/privkey.pem'))
// }

export class App {

    private app: Application;
    private server: any;
    private corsOptions = {
        origin: '*', // Reemplaza esto con el origen de tu cliente
        methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
        credentials: true, // Habilita el uso de cookies, si es necesario
        optionsSuccessStatus: 204, // Respuesta exitosa sin contenido
    };

    constructor(private port?: number | string) {

        this.app = express();
        this.server = http.createServer(this.app);
        // this.server = https.createServer(options, this.app)
        this.middlewares();
        this.settings();
        this.routes();
    }

    

    settings(): void {
        this.app.set('port', process.env.PORT || this.port || 3005);
    }

    middlewares(): void {
        this.app.use(cors(this.corsOptions));
        this.app.use(morgan('dev'));
        this.app.use(express.json({ limit: '20mb' }));
        this.app.use(express.urlencoded({ extended: true }));
    }

    routes(): void {
       
        this.app.use('/api/v1/sucursales', SucursalesRouter);
        this.app.use('/api/v1/usuarios', UsuariosRouter);
        this.app.use('/api/v1/estados', EstadosRoutes);
        
        this.app.use('*', MainRouter);
    }

    

    async listen() {
        this.server.listen(this.app.get('port'));
        console.log('Rondines running on port', this.app.get('port'));
    }
}