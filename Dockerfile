FROM nuclia/nucliadb:latest

# Expose the port NucliaDB will run on
EXPOSE 8080

# Define healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/healthz || exit 1

# Command to run NucliaDB
CMD ["nucliadb"]
