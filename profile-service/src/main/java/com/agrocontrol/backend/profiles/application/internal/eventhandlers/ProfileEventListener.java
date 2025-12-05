package com.agrocontrol.backend.profiles.application.internal.eventhandlers;

import com.agrocontrol.backend.profiles.domain.model.commands.CreateAgriculturalProducerCommand;
import com.agrocontrol.backend.profiles.domain.model.commands.CreateDistributorCommand;
import com.agrocontrol.backend.profiles.domain.model.events.UserRegisteredEvent;
import com.agrocontrol.backend.profiles.domain.services.AgriculturalProducerCommandService;
import com.agrocontrol.backend.profiles.domain.services.DistributorCommandService;
// Importa tu record UserRegisteredEvent local
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.function.Consumer;

@Configuration
public class ProfileEventListener {

    private final AgriculturalProducerCommandService producerService;
    private final DistributorCommandService distributorService;

    public ProfileEventListener(AgriculturalProducerCommandService producerService,
                                DistributorCommandService distributorService) {
        this.producerService = producerService;
        this.distributorService = distributorService;
    }

    @Bean
    public Consumer<UserRegisteredEvent> userRegistered() {
        return event -> {
            System.out.println("¡Evento recibido! Creando perfil para: " + event.email());

            if ("AGRICULTURAL_PRODUCER".equals(event.role())) {
                var command = new CreateAgriculturalProducerCommand(
                        event.fullName(), event.city(), event.country(),
                        event.phone(), event.dni(), event.userId()
                );
                producerService.handle(command);

            } else if ("DISTRIBUTOR".equals(event.role())) {
                var command = new CreateDistributorCommand(
                        event.fullName(), event.city(), event.country(),
                        event.phone(), event.companyName(), event.ruc(), event.userId()
                );
                distributorService.handle(command);
            }
        };
    }
}