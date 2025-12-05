-- 1. Tabla para la entidad 'Field'
CREATE TABLE fields (
    -- Columnas de AuditableAbstractAggregateRoot
                        id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        created_at TIMESTAMP,
                        updated_at TIMESTAMP,

    -- Columna de @Embedded ProducerId (que es un Long/BIGINT)
    -- Esta es la 'llave foránea conceptual' a la tabla 'agricultural_producers'
                        producer_id BIGINT NOT NULL,

    -- Columnas de Field
                        field_name VARCHAR(255) NOT NULL,
                        location VARCHAR(255) NOT NULL,
                        size INT NOT NULL
);

-- 2. Tabla para la entidad 'Worker'
CREATE TABLE workers (
    -- Columnas de AuditableAbstractAggregateRoot
                         id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         created_at TIMESTAMP,
                         updated_at TIMESTAMP,

    -- Columna de @Embedded ProducerId (también ligada al 'producer')
                         producer_id BIGINT NOT NULL,

    -- Columnas de Worker
                         full_name VARCHAR(255) NOT NULL,
                         document_number VARCHAR(255) NOT NULL
);

-- Índices para búsquedas rápidas (muy recomendado)
CREATE INDEX idx_fields_producer_id ON fields(producer_id);
CREATE INDEX idx_workers_producer_id ON workers(producer_id);