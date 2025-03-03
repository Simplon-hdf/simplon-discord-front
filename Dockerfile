# Image de base Node.js
FROM node:22-alpine as developpement

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de configuration
COPY package*.json ./
COPY angular.json tsconfig*.json ./
COPY tailwind.config.js ./

# Installer les dépendances
RUN npm ci

# Copier le code source
COPY . .

# Exposer le port utilisé par Angular (4200 par défaut)
EXPOSE 4200

# Commande pour démarrer le serveur Angular avec accessibilité depuis l'extérieur
CMD ["npm", "run", "start"] 