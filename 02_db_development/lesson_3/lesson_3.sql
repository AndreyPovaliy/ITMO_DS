-- создать базу
CREATE DATABASE "ApressFinancial"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = 1
    IS_TEMPLATE = False;
-- создать схему
CREATE SCHEMA IF NOT EXISTS "TransactionDetails"
    AUTHORIZATION  postgres;