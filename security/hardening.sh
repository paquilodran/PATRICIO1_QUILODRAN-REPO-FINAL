#!/bin/bash

echo "CONFIGURANDO SEGURIDAD"

echo "1. Configurando firewall..."
sudo ufw --force enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 8080/tcp
sudo ufw --force reload

echo "2. Verificando SSH..."
if [ -f "/etc/ssh/sshd_config" ]; then
    echo "Deshabilitando root login SSH..."
    sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
    sudo systemctl restart ssh 2>/dev/null || true
else
    echo "SSH no instalado, omitiendo..."
fi

echo "3. Configurando permisos..."
sudo chmod 700 ~/PATRICIOQP-REPO-FINAL/deploy/setup.sh
sudo chmod 700 ~/PATRICIOQP-REPO-FINAL/security/hardening.sh

echo "SEGURIDAD CONFIGURADA"
