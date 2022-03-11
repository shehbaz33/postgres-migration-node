Follow these steps
Type these in PSQL shell
1)CREATE DATABASE attendancetracker;
2)CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

Type these in your project terminal
3)db-migrate up initialize(to get the exact db model we are working on)
4)db-migrate reset (to remove all the tables)
5)for all new tables you make on your local system enter that into migration > sql > 20220311115647-initialize-up.sql
6)Also put in commands to delete that table in migration > sql > 20220311115647-initialize-down.sql
