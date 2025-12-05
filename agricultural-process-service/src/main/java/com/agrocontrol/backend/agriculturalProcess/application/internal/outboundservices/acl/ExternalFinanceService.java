package com.agrocontrol.backend.agriculturalProcess.application.internal.outboundservices.acl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * Stub de servicio externo de finanzas.
 * Reemplazar por integración real cuando esté disponible.
 */
@Service
public class ExternalFinanceService {
    private static final Logger logger = LoggerFactory.getLogger(ExternalFinanceService.class);

    /**
     * Crea un registro financiero en el sistema externo.
     * @param processId id del proceso agrícola
     * @param type tipo de movimiento (INCOME/EXPENSE)
     * @param description descripción del movimiento
     * @param amount monto del movimiento
     */
    public void createFinance(Long processId, String type, String description, double amount) {
        logger.info("[Stub] createFinance -> processId={}, type={}, description={}, amount={}",
                processId, type, description, amount);
        // TODO: Implementar llamada HTTP/Feign al servicio real de finanzas
    }
}

