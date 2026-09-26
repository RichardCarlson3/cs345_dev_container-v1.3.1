FROM mcr.microsoft.com/devcontainers/python:3.12-bookworm

# PostgreSQL 16 client and build dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    gcc && \
    install -d /usr/share/postgresql-common/pgdg && \
    curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc \
    | gpg --dearmor \
    -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.gpg && \
    echo "deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.gpg] https://apt.postgresql.org/pub/repos/apt bookworm-pgdg main" \
    > /etc/apt/sources.list.d/pgdg.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    libpq-dev \
    postgresql-client-16 && \
    rm -rf /var/lib/apt/lists/*

# MongoDB Database Tools: includes mongoimport
RUN curl -L -o /tmp/mongodb-database-tools.deb \
    https://fastdl.mongodb.org/tools/db/mongodb-database-tools-debian12-x86_64-100.12.2.deb && \
    apt-get update && \
    apt-get install -y /tmp/mongodb-database-tools.deb && \
    rm /tmp/mongodb-database-tools.deb && \
    rm -rf /var/lib/apt/lists/*

# mongosh shell
RUN curl -L -o /tmp/mongosh.deb \
    https://downloads.mongodb.com/compass/mongodb-mongosh_2.5.6_amd64.deb && \
    apt-get update && \
    apt-get install -y /tmp/mongosh.deb && \
    rm /tmp/mongosh.deb && \
    rm -rf /var/lib/apt/lists/*

RUN python -m pip install --upgrade pip \
    && python -m pip install debugpy

WORKDIR /workspace