# Drizzle Studio — Dockerized UI for PostgreSQL

This project runs **Drizzle Studio** in a lightweight Node.js Docker container so you can browse and query a PostgreSQL database — similar to pgAdmin, but more developer-friendly.

> ⚠️ Drizzle Studio is currently **Beta** — features and behavior may change.

---

## 🚀 What You Get

✔ A Docker-packaged Drizzle Studio
✔ Zero-install UI for your Postgres database
✔ Works alongside any PostgreSQL instance
✔ Simple configuration using environment variables

---

## 🧩 Project Structure

```
drizzle-studio/
 ├── Dockerfile
 ├── docker-compose.yml
 ├── drizzle.config.ts
 ├── package.json
 └── lockfile (pnpm / npm)
```

---

## 🛠 Requirements

* Docker Desktop
* A running PostgreSQL database
* A valid connection string

---

## ⚙️ Configuration

This setup connects to a database running on your **host machine** via:

```
host.docker.internal
```

Your `docker-compose.yml`:

```yaml
services:
  drizzle-studio:
    build: .
    environment:
      DATABASE_URL: postgres://aiagent:Zy8r%401LpQmVw@host.docker.internal:5432/obl-aiagent-new
    ports:
      - "4983:4983"
```

🔐 **Important**

If your DB password contains special characters (`@ : / # % ?`),
encode them (example: `@ → %40`).

---

## 🐳 Run Drizzle Studio

From this folder:

```sh
docker compose up -d --build
```

This will:

✔ build a Node 20 Alpine image
✔ install `drizzle-kit`, `drizzle-orm`, and `pg`
✔ start Drizzle Studio API on port **4983**

---

## 🌐 Open the Studio UI

The UI is served from a hosted page that connects to your local service.

Open in your browser:

```
https://local.drizzle.studio?host=localhost&port=4983
```

💡 Seeing `404` at `http://localhost:4983` is **normal** — that port exposes the local API, not the UI.

---

## 🔍 Verify Studio is Running

Check logs:

```sh
docker logs drizzle-studio
```

You should see something like:

```
Using 'pg' driver for database querying
Drizzle Studio is up and running on https://local.drizzle.studio...
```

---

## 🛑 Stop Studio

```sh
docker compose down
```

---

## 🧠 Notes

* Works on **macOS & Windows** via `host.docker.internal`
* If your Postgres runs inside Docker instead, use a **Docker network + container hostname** instead of `host.docker.internal`
* Drizzle Studio supports **read/write queries** — be careful on production databases
* If login fails with `ECONNREFUSED`, check:

  * DB is running
  * Port `5432` is exposed
  * Credentials + DB name are correct

---

## ❤️ Credits

Powered by:

* **Drizzle ORM & Studio** — [https://orm.drizzle.team](https://orm.drizzle.team)
* **Node.js**
* **Docker**