#!/bin/bash

echo "INICIANDO APROVISIONAMIENTO"

echo "1. Actualizando sistema..."
sudo apt update

echo "2. Instalando herramientas..."
sudo apt install -y git curl ufw docker.io docker-compose

echo "3. Iniciando Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "4. Creando directorios..."
sudo mkdir -p /opt/webapp/html

echo "5. Descargando docker-compose.yml..."
cd /opt/webapp
sudo curl -L "https://gist.githubusercontent.com/DarkestAbed/0c1cee748bb9e3b22f89efe1933bf125/raw/5801164c0a6e4df7d8ced00122c76895997127a2/docker-compose.yml" -o docker-compose.yml || sudo cp ~/PATRICIOQP-REPO-FINAL/deploy/docker-compose.yml . 2>/dev/null || true

echo "6. Creando pagina web..."
sudo sh -c 'echo "<html><body><h1>Servidor Seguro Propiedad de Patricio QP - Acceso Restringido</h1></body></html>" > /opt/webapp/html/index.html'

echo "7. Creando usuario sysadmin..."
sudo useradd -m -s /bin/bash sysadmin 2>/dev/null || true
sudo usermod -aG docker sysadmin

echo "8. Configurando permisos..."
sudo chmod 600 /opt/webapp/docker-compose.yml

echo "APROVISIONAMIENTO COMPLETADO"

