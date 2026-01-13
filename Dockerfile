# Utilise une image Nginx légère basée sur Alpine Linux
FROM nginx:alpine

# Métadonnées de l'image
LABEL maintainer="Garance Ledoigt <gledoigt40@gmail.com>"
LABEL description="Application DevOps containerisée avec Nginx pour le TP Docker/CI-CD - Garance Ledoigt"

# Copie la configuration Nginx personnalisée
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Copie les fichiers de l'application web
COPY src/ /usr/share/nginx/html/

# Expose le port 80 pour le trafic HTTP
EXPOSE 80

# Vérification de santé du container
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --quiet --spider http://localhost/ || exit 1

# Commande de démarrage du serveur Nginx
CMD ["nginx", "-g", "daemon off;"]

