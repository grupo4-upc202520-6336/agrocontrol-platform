package com.agrocontrol.backend.profiles.application.internal.commandservices;

import com.agrocontrol.backend.profiles.domain.model.aggregates.AgriculturalProducer;
import com.agrocontrol.backend.profiles.domain.model.commands.CreateAgriculturalProducerCommand;
import com.agrocontrol.backend.profiles.domain.services.AgriculturalProducerCommandService;
import com.agrocontrol.backend.profiles.infrastructure.persistence.jpa.repositories.AgriculturalProducerRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AgriculturalProducerCommandServiceImpl implements AgriculturalProducerCommandService {
    private final AgriculturalProducerRepository agriculturalProducerRepository;

    public AgriculturalProducerCommandServiceImpl(AgriculturalProducerRepository agriculturalProducerRepository) {
        this.agriculturalProducerRepository = agriculturalProducerRepository;
    }

    // CORREGIDO: Se elimina 'Long userId' de los parámetros para coincidir con la interfaz
    @Override
    public Optional<AgriculturalProducer> handle(CreateAgriculturalProducerCommand command) {

        if (agriculturalProducerRepository.existsByPhone_Phone(command.phone())) {
            throw new IllegalArgumentException("Phone already exists");
        }

        if (agriculturalProducerRepository.existsByDni_Dni(command.dni())) {
            throw new IllegalArgumentException("DNI already exists");
        }

        // CORREGIDO: Usamos command.userId() porque el ID ahora viaja dentro del record
        var agriculturalProducer = new AgriculturalProducer(command, command.userId());

        var createdAgriculturalProducer = agriculturalProducerRepository.save(agriculturalProducer);
        return Optional.of(createdAgriculturalProducer);
    }
}