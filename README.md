# Proyecto Final - Automatización de Servidor Linux

## Autor: Patricio Quilodran

## Guía de Despliegue

### Prerrequisitos
- Ubuntu Server 22.04 o similar
- Acceso sudo
- Conexión a Internet
- Git instalado

### Clonar Repositorio
git clone git@github.com:paquilodran/PATRICIO1_QUILODRAN-REPO-FINAL.git

2. Paso entrar a cd PATRICIO1_QUILODRAN-REPO-FINAL

### Orden de Ejecución
1. sudo ./deploy/setup.sh
<img width="717" height="499" alt="image" src="https://github.com/user-attachments/assets/9200ddb2-e827-4aad-a9c6-74b02c39efc1" />
2. sudo ./security/hardening.sh
<img width="677" height="271" alt="image" src="https://github.com/user-attachments/assets/89c3da86-9d50-4bd9-a4a8-a9c0c799dbbc" />
3. sudo ./maintenance/backup.sh
<img width="779" height="140" alt="image" src="https://github.com/user-attachments/assets/21d19d42-70e2-46de-a8ef-a6db33f0f86d" />

### Verificación
1. Navegar a: http://localhost:8080
2. Verificar firewall: sudo ufw status
3. Verificar docker: sudo docker ps
4. Verificar backup: ls -la /var/backups/webapp/

## Justificación de Seguridad

Deshabilitar el login de root por SSH es fundamental porque el usuario root tiene acceso completo al sistema y es el primer objetivo en ataques de fuerza bruta. Al deshabilitarlo, forzamos a los atacantes a adivinar tanto el nombre de usuario como la contraseña, aumentando la seguridad.

Filtrar puertos con UFW reduce la superficie de ataque. Solo exponemos los puertos necesarios: 22 para SSH y 8080 para la aplicación web. Esto previene acceso no autorizado a otros servicios que podrían tener vulnerabilidades.

Ambas medidas implementan el principio de mínimo privilegio, dando solo el acceso necesario para las funciones requeridas, mejorando la seguridad general del sistema.

## Registro de Evidencia

### 1. Configuración SSH
<img width="1919" height="1028" alt="ssh" src="https://github.com/user-attachments/assets/879dd116-188a-47de-8487-894837831d46" />

### 2. Firewall Configurado
<img width="1919" height="1030" alt="uwf" src="https://github.com/user-attachments/assets/faf4b3e0-bc94-463d-b94f-ab70cba5dbd2" />

### 3. Aplicación Web Funcionando
<img width="1918" height="1030" alt="web_access" src="https://github.com/user-attachments/assets/cabe3e41-2a76-46ca-b2a8-a970b83b3c27" />

## Archivos Principales

### 1. Docker Compose
deploy/docker-compose.yml

### 2. Script de Setup
deploy/setup.sh

### 3. Script de Seguridad
security/hardening.sh

### 4. Script de Backup
maintenance/backup.sh

## Repositorio
https://github.com/paquilodran/PATRICIO1_QUILODRAN-REPO-FINAL
