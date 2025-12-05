# --- ETAPA 1: Construcción con Node ---
FROM node:18-alpine as build

WORKDIR /app

# Copiamos dependencias e instalamos
COPY package*.json ./
RUN npm install

# Copiamos el código y construimos
COPY . .
# Construye la app para producción
RUN npm run build --configuration=production

# --- ETAPA 2: Servidor Web Nginx ---
FROM nginx:alpine

# Copiamos la configuración personalizada de Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiamos los archivos generados por Angular a Nginx
# ¡IMPORTANTE! Verifica si tu carpeta dist se llama 'dist/agrocontrol-frontend' o diferente
# Puedes verlo ejecutando 'ng build' en local una vez.
COPY --from=build /app/dist/*/browser /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]