import os, psycopg2
from psycopg2.extras import RealDictCursor
from pymongo import MongoClient

pg_dsn = os.getenv("DATABASE_URL")
mongo_url = os.getenv("MONGO_URL")

print("Connecting to Postgres:", pg_dsn)
with psycopg2.connect(pg_dsn) as conn:
    conn.autocommit = True
    with conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute("CREATE TABLE IF NOT EXISTS ping (id serial PRIMARY KEY, ts timestamptz DEFAULT now());")
        cur.execute("INSERT INTO ping DEFAULT VALUES RETURNING id, ts;")
        row = cur.fetchone()
        cur.execute("SELECT count(*) AS n FROM ping;")
        total = cur.fetchone()["n"]
        print(f"Postgres ok. Inserted row: {row}. Total rows now: {total}")

print("Connecting to Mongo:", mongo_url)
mc = MongoClient(mongo_url)
db = mc.get_database("dev")
res = db.pings.insert_one({"hello": "world"})
print(f"Mongo ok. Inserted _id: {res.inserted_id}, total docs: {db.pings.count_documents({})}")
