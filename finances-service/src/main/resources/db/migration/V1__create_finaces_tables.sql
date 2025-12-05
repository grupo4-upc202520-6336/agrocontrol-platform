CREATE TABLE finances (
    -- Columnas de AuditableAbstractAggregateRoot
                          id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          created_at TIMESTAMP,
                          updated_at TIMESTAMP,

    -- Columna de @Embedded AgriculturalProcessId (que es un Long/BIGINT)
    -- Esta es la 'llave foránea conceptual' a la tabla 'agricultural_processes'
                          agricultural_process_id BIGINT NOT NULL,

    -- Columnas de Finance
                          date DATE NOT NULL,
                          type VARCHAR(255) NOT NULL,
                          description VARCHAR(255) NOT NULL,
                          value DOUBLE NOT NULL
);

-- Índice para buscar finanzas por proceso
CREATE INDEX idx_finances_process_id ON finances(agricultural_process_id);