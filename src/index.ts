import { App } from './app';
import 'dotenv/config';

async function main() {
    const app = new App();
    await app.listen();
}

main();