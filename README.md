# devops-tp-docker--Ledoigt-

![Build and Scan](https://github.com/[username]/devops-tp-docker-
[nom]/actions/workflows/docker-deploy.yml/badge.svg)
![CodeQL](https://github.com/[username]/devops-tp-docker-
[nom]/actions/workflows/codeql-analysis.yml/badge.svg)

## ** Pipeline DevSecOps ** 
Ce projet implémente un pipeline CI/CD sécurisé pour Docker avec :
- Analyse statique du code (CodeQL)
- Lint du Dockerfile (Hadolint)
- Scan de l'image Docker (Trivy)
- Scan des dépendances (Dependabot)
- Secret Scanning
- Security Gates (blocage sur vulnérabilités critiques)
- SBOM (Software Bill of Materials)
## Architecture de Sécurité

## Sécurité de l'Image
- Image de base : nginx:alpine (version spécifique)
- Utilisateur non-root
- Headers de sécurité renforcés
- Health checks
- Pas de secrets dans l'image
## Exécution Locale
```bash
docker pull ghcr.io/[username]/devops-tp-docker-[nom]:main
docker run -p 8080:8080 ghcr.io/[username]/devops-tp-docker-[nom]:main


=======
# devops-tp-docker



