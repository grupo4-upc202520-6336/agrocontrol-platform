
CREATE TABLE products (
    -- ID local de este servicio (BIGINT como preferiste)
                          id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,

    -- ID de un producto anterior (BIGINT, coincide con el 'id' local)
                          previous_id BIGINT NULL,

                          name VARCHAR(255) NOT NULL,
                          quantity_per_unit VARCHAR(255) NOT NULL,
                          unit_price DOUBLE NOT NULL,
                          quantity INT NOT NULL,
                          photo_url VARCHAR(255) NOT NULL,

                          created_at TIMESTAMP,
                          updated_at TIMESTAMP,
                          user_id BIGINT NOT NULL,


                              -- Llave foránea local (opcional, pero buena idea)
                          FOREIGN KEY (previous_id) REFERENCES products(id)
);

-- Creación de la tabla de "recibos" o "items de pago"
CREATE TABLE payment_products (
    -- ID local de este servicio
                                  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,

                                  date DATE,

    -- ID del producto comprado (FK a la tabla 'products' de arriba)
                                  product_id BIGINT NOT NULL,

    -- Denormalizado para no tener que consultar la otra tabla
                                  product_name VARCHAR(255) NOT NULL,

                                  quantity_product INT NOT NULL,



    -- ID del usuario que VENDIÓ (DEBE SER VARCHAR)
                                  owner_product_id BIGINT NOT NULL,

                                  total_cost DOUBLE NOT NULL,

                                  created_at TIMESTAMP,
                                  updated_at TIMESTAMP,
    -- ID del usuario que COMPRÓ (DEBE SER VARCHAR)
                                  user_id BIGINT NOT NULL,

    -- Llave foránea a la tabla 'products' de este mismo servicio
                                  FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Índices para búsquedas rápidas
CREATE INDEX idx_products_user_id ON products(user_id);
CREATE INDEX idx_payment_products_user_id ON payment_products(user_id);
CREATE INDEX idx_payment_products_owner_id ON payment_products(owner_product_id);