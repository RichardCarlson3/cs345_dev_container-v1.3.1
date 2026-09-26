# Dev Container Starter (Python + Postgres + Mongo) — Safe Ports + mongosh

## Getting Started (first-time setup)
1. **Install VS Code**
   - Download: https://code.visualstudio.com/
   - Install the **Dev Containers extension** (by Microsoft).

2. **Install Docker Desktop**
   - Download: https://www.docker.com/products/docker-desktop/
   - On Linux, you can install Docker Engine + Compose instead.
   - On Windows, enable the WSL2 backend when prompted.

3. **unzip this project** into a folder. that is your workspace root.

4. **Open the folder in VS Code.**
   - VS Code will detect `.devcontainer/` and prompt: *"Reopen in Container"* → click it.
   - If you don’t see the prompt: run **Dev Containers: Reopen in Container** from the Command Palette.

5. Wait for the container to build and start. VS Code will attach to the `app` container.

---

## Reopening later
- If you quit VS Code and come back later:
  1. Open the project folder in VS Code.
  2. You’ll be prompted to *Reopen in Container*. Click it.
  3. If you don’t see the prompt: run **Dev Containers: Reopen in Container**.
- Make sure Docker Desktop is running.

---

## Usage
- Connectivity check:
  ```bash
  python app/test_pg_and_mongo.py
  ```
- Postgres shell:
  ```bash
  psql "$DATABASE_URL"
  ```
  - alternative psql:
  ```bash
  psql "$ALT_DATABASE_URL"
  ```
  - MongoDB
  ```bash
    mongosh "$MONGO_URL"
  ```

- Mongo shell: see separate instructions for mongo
---

## Host vs Container ports
- Inside containers: Postgres is `db:5432`, Mongo is `mongo:27017`.
- From host: Postgres `localhost:5433`, Mongo `localhost:27018`.

---

## Extras
- `mongosh` is installed in the dev container.
- Sample SQL script is in `sql/db_build.sql`:
  ```bash
  psql "$DATABASE_URL" -f /workspace/sql/db_build.sql
  ```
- VS Code Tasks (Terminal → Run Task…):
  - **Mongo: Open mongosh**
  - **Postgres: Open psql**
  - **Run: Connectivity check (Postgres + Mongo)**
  - **Test: pytest**
  - **Compose: up -d**
  - **Compose: down**
