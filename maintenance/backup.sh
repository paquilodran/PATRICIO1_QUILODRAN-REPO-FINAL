#!/bin/bash

echo "INICIANDO BACKUP"

TIMESTAMP=$(date +"%Y-%m-%d_%H%M")
BACKUP_FILE="backup_web_${TIMESTAMP}.tar.gz"

echo "1. Creando backup: $BACKUP_FILE"
sudo mkdir -p /var/backups/webapp/
sudo tar -czf "/var/backups/webapp/${BACKUP_FILE}" -C /opt/webapp html

echo "2. Verificando backup..."
if [ -f "/var/backups/webapp/${BACKUP_FILE}" ]; then
    echo "Backup creado: /var/backups/webapp/${BACKUP_FILE}"
    ls -lh "/var/backups/webapp/${BACKUP_FILE}"
else
    echo "ERROR: Backup no creado"
    exit 1
fi

echo "3. Simulando transferencia remota..."
echo "scp /var/backups/webapp/${BACKUP_FILE} usuario@servidor:/backups/"

echo "BACKUP COMPLETADO"
