CREATE TABLE payments (
    -- Columnas de AuditableAbstractAggregateRoot
                          id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          created_at TIMESTAMP,
                          updated_at TIMESTAMP,

    -- Columna de @Embedded SubscriptionId (que es un Long/BIGINT)
    -- Esta es la 'llave foránea conceptual' a la tabla 'subscriptions'
                          subscription_id BIGINT NOT NULL,

    -- Columnas de Payment
                          date DATE,
                          state VARCHAR(255) NOT NULL,
                          card_holder_name VARCHAR(255) NOT NULL,
                          card_number VARCHAR(16) NOT NULL, -- Usando la anotación @Size(max = 16)
                          expire_date VARCHAR(255) NOT NULL, -- Tu entidad lo define como String
                          cvv VARCHAR(255) NOT NULL -- Tu entidad lo define como String
);

-- Índice para buscar pagos por suscripción
CREATE INDEX idx_payments_subscription_id ON payments(subscription_id);