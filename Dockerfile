# Utilise une image Nginx légère basée sur Alpine Linux
FROM nginx:alpine

# Métadonnées de l'image
LABEL maintainer="TP DevOps"
LABEL description="Application DevOps sécurisée"
LABEL maintainer="Garance Ledoigt <gledoigt40@gmail.com>"

#LABEL description="Application DevOps containerisée avec Nginx pour le TP Docker/CI-CD - Garance Ledoigt"

# installer uniquement les dépendances nécessaires 

RUN apk add --no-cache \
ca-certificates \
&& rm -rf /var/cache/apk/*

# Copie la configuration Nginx personnalisée
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Copie les fichiers de l'application web
COPY src/ /usr/share/nginx/html/

# Définir les permissions appropriéees 
RUN chown -R appuser:appgroup /usr/share/nginx/html && \
chmod -R 755 /usr/share/nginx/html

# Modifier les permissions pour nginx
RUN touch /var/run/nginx.pid && \
chown -R appuser:appgroup /var/run/nginx.pid && \
chown -R appuser:appgroup /var/cache/nginx

# Passer à l'utilisateur non-root 

USER appuser

# Expose le port 80 pour le trafic HTTP
EXPOSE 8082

# Vérification de santé du container
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --quiet --spider http://localhost/ || exit 1

# Commande de démarrage du serveur Nginx
CMD ["nginx", "-g", "daemon off;"]

