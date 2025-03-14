# Use the official NucliaDB image
FROM ghcr.io/nuclia/nucliadb:latest

# Set environment variables (to be set in Render)
ENV DRIVER_PG_URL=postgresql://n8ndb_up4r_user:IyuLg18GEPWNify32bLQYFOK2dOYDf8o@dpg-cv9ueajtq21c73bokqj0-a/n8ndb_up4r
ENV NDX_MODE=standalone
ENV LOG_LEVEL=info

# Expose the default NucliaDB port
EXPOSE 8080

# Start NucliaDB
CMD ["nucliadb"]
