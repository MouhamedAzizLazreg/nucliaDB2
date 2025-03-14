# NucliaDB2 on Render
This repository contains the setup to deploy NucliaDB on Render using Docker.

## Deployment Steps
1. Create a PostgreSQL database on Render.
2. Deploy this repo as a new Web Service on Render.
3. Set the `DRIVER_PG_URL` environment variable with the database connection string.

## Environment Variables
- `DRIVER_PG_URL`: PostgreSQL connection string (set in Render).
- `NDX_MODE`: Set to `standalone`.
- `LOG_LEVEL`: Set to `info`.
