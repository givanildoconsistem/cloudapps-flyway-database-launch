-- Arquivo sql para criação do banco de dados

CREATE USER terra WITH ENCRYPTED PASSWORD 'terra';
-- GRANT terra TO postgres;
CREATE SCHEMA IF NOT EXISTS terra AUTHORIZATION terra;

GRANT USAGE ON SCHEMA terra TO terra ;
ALTER DEFAULT privileges in SCHEMA terra GRANT ALL ON TABLES TO terra ;
ALTER DEFAULT privileges in SCHEMA terra GRANT ALL ON SEQUENCES TO terra ;
ALTER DEFAULT privileges in SCHEMA terra GRANT ALL ON FUNCTIONS TO terra ;

-- organization é a tabela modelo de Business Entity do CCApps, que possui no mínimo os campos id, name e status.
CREATE TABLE terra.organization (
	id SERIAL NOT NULL,
	-- staus não é palavra reservada (https://www.postgresql.org/docs/current/sql-keywords-appendix.html)
	status INT NOT NULL DEFAULT 1 CHECK(status in (-1, 0, 1)), 
	-- name  não é palavra reservada (https://www.postgresql.org/docs/current/sql-keywords-appendix.html)
	name VARCHAR(80) NOT NULL,	   
	PRIMARY KEY (id)
);
CREATE UNIQUE INDEX unique_organization_idx ON terra.organization (name) WHERE status <> -1;
