-- 1. PRIMERO: Crear la tabla 'agricultural_processes' (la tabla "padre")
CREATE TABLE agricultural_processes (
                                        id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                        created_at TIMESTAMP,
                                        updated_at TIMESTAMP,

                                        field_id BIGINT NOT NULL,
                                        start_date DATE,
                                        end_date DATE,
                                        finished BOOLEAN NOT NULL DEFAULT FALSE
);

-- 2. SEGUNDO: Crear la tabla 'agricultural_activities' (la "hija" que referencia a la padre)
CREATE TABLE agricultural_activities (
    -- Columna de Herencia
                                         type VARCHAR(31) NOT NULL,

    -- Columnas base (CON AUDITORÍA AÑADIDA)
                                         id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                         created_at TIMESTAMP, -- <-- ¡CORRECCIÓN AÑADIDA!
                                         updated_at TIMESTAMP, -- <-- ¡CORRECCIÓN AÑADIDA!

                                         agricultural_process_id BIGINT NOT NULL, -- Columna para la FK
                                         activity_type TINYINT NOT NULL,
                                         date VARCHAR(255) NOT NULL,
                                         activity_status TINYINT NOT NULL,
                                         workers_total_cost DOUBLE NOT NULL DEFAULT 0,

    -- Columnas de Seeding
                                         plant_type VARCHAR(255),
                                         quantity_planted INT,

    -- Columnas de Irrigation
                                         hours_irrigated INT,

    -- Columnas de CropTreatment
                                         treatment_type VARCHAR(255),

    -- Columnas de Harvest
                                         quantity_in_kg DOUBLE,
                                         price_per_kg DOUBLE,
                                         total_income DOUBLE NOT NULL DEFAULT 0,

    -- Definición de la Llave Foránea
                                         FOREIGN KEY (agricultural_process_id) REFERENCES agricultural_processes(id)
);

-- 3. TERCERO: Crear 'activity_resources' (la "nieta" que referencia a la "hija")
CREATE TABLE activity_resources (
                                    activity_id BIGINT NOT NULL,

                                    resource_id BIGINT,
                                    description VARCHAR(255),
                                    name VARCHAR(255),
                                    cost INT,
                                    quantity INT,

    -- Definición de la Llave Foránea
                                    FOREIGN KEY (activity_id) REFERENCES agricultural_activities(id)
);

-- 4. FINAL: Crear los índices
CREATE INDEX idx_agricultural_processes_field_id ON agricultural_processes(field_id);
CREATE INDEX idx_agricultural_activities_process_id ON agricultural_activities(agricultural_process_id);
CREATE INDEX idx_activity_resources_activity_id ON activity_resources(activity_id);