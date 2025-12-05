package com.agrocontrol.backend.agriculturalProcess.application.internal.outboundservices.acl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * Stub de servicio externo de almacén/tienda.
 */
@Service
public class ExternalStoreService {
    private static final Logger logger = LoggerFactory.getLogger(ExternalStoreService.class);

    /**
     * Devuelve el nombre de un producto por su ID desde el servicio externo.
     */
    public String getProductNameById(Long productId) {
        logger.info("[Stub] getProductNameById -> productId={}", productId);
        return "Product-" + productId; // valor simulado
    }

    /**
     * Ajusta la cantidad de un producto en el inventario externo.
     */
    public void changeQuantityOfProduct(Long productId, Integer quantityDelta) {
        logger.info("[Stub] changeQuantityOfProduct -> productId={}, delta={} ", productId, quantityDelta);
        // TODO: Implementar integración real con servicio de inventario
    }
}

