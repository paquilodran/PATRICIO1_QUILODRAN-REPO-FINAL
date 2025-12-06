# Proyecto Final - Automatización de Servidor Linux

## Autor: Patricio Quilodran

## Guía de Despliegue

### Prerrequisitos
- Ubuntu Server 22.04 o similar
- Acceso sudo

### Orden de Ejecución
1. sudo ./deploy/setup.sh
2. sudo ./security/hardening.sh  
3. sudo ./maintenance/backup.sh

### Verificación
1. Navegar a: http://localhost:8080
2. Verificar firewall: sudo ufw status
3. Verificar backup: ls -la /var/backups/webapp/

## Justificación de Seguridad

Deshabilitar el login de root por SSH es fundamental porque el usuario root tiene acceso completo al sistema y es el primer objetivo en ataques de fuerza bruta. Al deshabilitarlo, forzamos a los atacantes a adivinar tanto el nombre de usuario como la contraseña, aumentando la seguridad.

Filtrar puertos con UFW reduce la superficie de ataque. Solo exponemos los puertos necesarios: 22 para SSH y 8080 para la aplicación web. Esto previene acceso no autorizado a otros servicios que podrían tener vulnerabilidades.

Ambas medidas implementan el principio de mínimo privilegio, dando solo el acceso necesario para las funciones requeridas, mejorando la seguridad general del sistema.

## Evidencia

Ver capturas en carpeta evidence/
