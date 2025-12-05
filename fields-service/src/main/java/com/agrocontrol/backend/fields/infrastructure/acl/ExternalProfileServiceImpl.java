package com.agrocontrol.backend.fields.infrastructure.acl;

import com.agrocontrol.backend.fields.application.internal.outboundservices.acl.ExternalProfileService;
import org.springframework.stereotype.Service;

@Service
public class ExternalProfileServiceImpl implements ExternalProfileService {
    @Override
    public boolean exitsAgriculturalProducer(String producerId) {
        // TODO: Implement actual check with the external service
        return true;
    }
}

