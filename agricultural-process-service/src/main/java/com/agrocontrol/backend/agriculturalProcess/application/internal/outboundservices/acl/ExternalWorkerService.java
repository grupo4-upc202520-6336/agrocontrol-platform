package com.agrocontrol.backend.agriculturalProcess.application.internal.outboundservices.acl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * Stub de servicio externo de trabajadores.
 */
@Service
public class ExternalWorkerService {
    private static final Logger logger = LoggerFactory.getLogger(ExternalWorkerService.class);

    /**
     * Obtiene el nombre del trabajador por su ID desde el servicio externo.
     */
    public String getWorkerNameById(Long workerId) {
        logger.info("[Stub] getWorkerNameById -> workerId={}", workerId);
        return "Worker-" + workerId; // valor simulado
    }
}

