# Proyecto Final - Automatización de Servidor Linux

**Autor:** Patricio Quilodrán  

---

## 1. Guía de Despliegue

### Prerrequisitos
- Ubuntu Server 22.04 o similar
- Acceso sudo

### Clonar el repositorio
```bash
git clone git@github.com:paquilodran/PATRICIO1_QUILODRAN-REPO-FINAL.git
cd PATRICIO1_QUILODRAN-REPO-FINAL

Orden de ejecución de scripts
sudo chmod +x deploy/setup.sh
sudo chmod +x security/hardening.sh
sudo chmod +x maintenance/backup.sh

sudo ./deploy/setup.sh
sudo ./security/hardening.sh
sudo ./maintenance/backup.sh

Verificación

Abrir navegador en: http://localhost:8080

Verificar firewall:
sudo ufw status verbose

Verificar backup:
ls -la /var/backups/webapp/


2. Justificación de Seguridad

Deshabilitar el login de root por SSH es fundamental porque el usuario root tiene acceso completo al sistema y es el primer objetivo en ataques de fuerza bruta. Al deshabilitarlo, forzamos a los atacantes a adivinar tanto el nombre de usuario como la contraseña, aumentando la seguridad.

Filtrar puertos con UFW reduce la superficie de ataque. Solo exponemos los puertos necesarios: 22 para SSH y 8080 para la aplicación web. Esto previene accesos no autorizados a otros servicios que podrían tener vulnerabilidades.

Ambas medidas implementan el principio de mínimo privilegio, otorgando solo el acceso necesario para las funciones requeridas y mejorando la seguridad general del sistema.

3. Registro de Evidencia

Las capturas se encuentran en la carpeta evidence/ y certifican el funcionamiento de cada módulo:

Imagen	Descripción
ufw_status.png	Estado del firewall con las reglas aplicadas
web_access.png	Página web accesible en puerto 8080
ssh_config.png	Configuración de SSH con PermitRootLogin no

4. Estructura del Repositorio
PATRICIO1_QUILODRAN-REPO-FINAL/
│
├── README.md
├── deploy/
│   ├── docker-compose.yml
│   └── setup.sh
├── security/
│   └── hardening.sh
├── maintenance/
│   └── backup.sh
└── evidence/
    ├── ufw_status.png
    ├── web_access.png
    └── ssh_config.png
