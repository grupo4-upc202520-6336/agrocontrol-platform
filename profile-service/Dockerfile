# --- ETAPA 1: Compilación con Maven ---
FROM maven:3.9.9-eclipse-temurin-21-alpine AS build

WORKDIR /app

# Copiamos el pom.xml y descargamos dependencias
COPY pom.xml .
RUN mvn dependency:go-offline

# Copiamos el código fuente
COPY src ./src

# Compilamos el JAR (saltando tests para ir rápido)
RUN mvn clean package -DskipTests

# --- ETAPA 2: Ejecución con Java 21 ---
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copiamos el JAR generado en la etapa anterior
COPY --from=build /app/target/*.jar app.jar

# El puerto se expone (opcional, solo documentación)
# Docker Compose se encarga del mapeo real
EXPOSE 8080 

ENTRYPOINT ["java", "-jar", "app.jar"]