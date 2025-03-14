FROM nuclia/nucliadb:2.26.0

# Set environment variables
ENV NUCLIADB_HOST=0.0.0.0 \
    NUCLIADB_PORT=8080

# No need for additional installations as the image already contains everything

# Expose port
EXPOSE 8080
