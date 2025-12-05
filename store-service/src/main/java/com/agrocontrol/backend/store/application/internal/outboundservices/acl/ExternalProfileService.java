package com.agrocontrol.backend.store.application.internal.outboundservices.acl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service("externalProfileServiceStore")
public class ExternalProfileService {

    private static final Logger logger = LoggerFactory.getLogger(ExternalProfileService.class);

    public ExternalProfileService() {
    }

    public void existsDistributor(Long userId) {
        logger.info("[Stub] existsDistributor -> userId={}", userId);
        // Stub: no validamos; integración real debe consultar servicio de perfiles.
    }

    public void exitsAgriculturalProducer(Long userId) {
        logger.info("[Stub] exitsAgriculturalProducer -> userId={}", userId);
        // Stub: no validamos; integración real debe consultar servicio de perfiles.
    }
}
