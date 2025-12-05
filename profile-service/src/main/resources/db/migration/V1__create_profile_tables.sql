-- SQL NUEVO (CORRECTO PARA TU ENTIDAD)
CREATE TABLE distributors (
                              id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- CAMBIADO
                              company_name VARCHAR(255),
                              full_name VARCHAR(255),
                              ruc VARCHAR(20),
                              phone VARCHAR(20),
                              city VARCHAR(100),
                              country VARCHAR(100),
                              created_at TIMESTAMP,
                              updated_at TIMESTAMP,

    -- Esta columna SIGUE SIENDO VARCHAR, lo cual es correcto
                              user_id BIGINT NOT NULL UNIQUE
);

CREATE TABLE agricultural_producers (
                                        id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- CAMBIADO
                                        full_name VARCHAR(255),
                                        dni VARCHAR(20),
                                        phone VARCHAR(20),
                                        city VARCHAR(100),
                                        country VARCHAR(100),
                                        created_at TIMESTAMP,
                                        updated_at TIMESTAMP,

    -- Esta columna SIGUE SIENDO VARCHAR, lo cual es correcto
                                        user_id BIGINT NOT NULL UNIQUE
);