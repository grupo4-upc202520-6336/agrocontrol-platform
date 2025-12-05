-- Tabla de suscripciones
CREATE TABLE subscriptions (
                               id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                               cost DOUBLE, -- Asumo un tipo de dato numérico
                               plan_type TINYINT, -- Asumo un tipo de dato numérico
                               renewal_date DATE,
                               start_date DATE,
                               status VARCHAR(255),
                               created_at TIMESTAMP,
                               updated_at TIMESTAMP,

    -- ESTA ES LA CLAVE:
    -- Es solo un ID de texto/varchar.
    -- NO hay FOREIGN KEY a la tabla 'users'
    -- porque esa tabla vive en OTRA base de datos.
                               user_id BIGINT NOT NULL UNIQUE
);