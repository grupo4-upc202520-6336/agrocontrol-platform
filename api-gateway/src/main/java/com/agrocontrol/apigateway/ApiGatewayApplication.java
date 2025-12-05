package com.agrocontrol.apigateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;
import org.springframework.web.cors.reactive.CorsWebFilter;

// --- ¡ESTAS SON LAS LÍNEAS QUE TE FALTABAN! ---
import java.util.Arrays;
import java.util.Collections;
// ----------------------------------------------

@SpringBootApplication
public class ApiGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(ApiGatewayApplication.class, args);
    }

    @Bean
    public CorsWebFilter corsWebFilter() {
        CorsConfiguration corsConfig = new CorsConfiguration();
        
        // 1. Permitir todos los orígenes (Patrón)
        corsConfig.setAllowedOriginPatterns(Collections.singletonList("*")); 
        
        // 2. Permitir todos los métodos
        corsConfig.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE", "OPTIONS", "PATCH"));
        
        // 3. Permitir todas las cabeceras
        corsConfig.setAllowedHeaders(Collections.singletonList("*"));
        
        // 4. Permitir credenciales
        corsConfig.setAllowCredentials(true);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", corsConfig);

        return new CorsWebFilter(source);
    }
}
