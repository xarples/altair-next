import { config as dotenvConfig } from 'dotenv';

import { IConfig } from './types';

dotenvConfig();

const config: IConfig = {
  api: {
    port: process.env.PORT || 5000,
  },
  app: {
    port: process.env.PORT || 3000,
  },
};

export default config;
