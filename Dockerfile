FROM python:3.12-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PATH="/root/.cargo/bin:${PATH}" \
    RUSTUP_HOME="/root/.rustup" \
    CARGO_HOME="/root/.cargo"

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    pkg-config \
    libssl-dev \
    git \
    curl \
    gcc \
    g++ \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Set working directory
WORKDIR /app

# Install Python dependencies first (without nucliadb)
RUN pip install --upgrade pip setuptools wheel

# Clone and build nidx_binding explicitly
RUN git clone https://github.com/nuclia/nucliadb.git /tmp/nucliadb \
    && cd /tmp/nucliadb \
    && pip install -e "./nucliadb_utils[dev]" \
    && cd /tmp/nucliadb/nucliadb_vectors/vectors_nidx \
    && pip install -e .

# Now install NucliaDB after the binding is installed
RUN pip install "nucliadb[standalone,uvloop]==2.26.0"

# Verify installation (will fail the build if import fails)
RUN python -c "import nidx_binding; print('nidx_binding successfully installed')"

# Expose port for NucliaDB
EXPOSE 8080

# Command to run NucliaDB
CMD ["nucliadb"]
