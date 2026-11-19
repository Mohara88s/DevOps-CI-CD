#!/bin/bash
set -e

echo "Start installation"

if [ "$(id -u)" -ne 0 ]; then
    echo "Run script as root or with sudo"
    exit 1
fi

if ! command -v docker > /dev/null 2>&1; then
    apt-get update
    apt-get install -y docker.io
    echo "Docker is installed"
fi

if [ -n "$SUDO_USER" ]; then
    usermod -aG docker "$SUDO_USER"
fi

if ! command -v docker-compose > /dev/null 2>&1 && ! docker compose version > /dev/null 2>&1; then
    apt-get update
    apt-get install -y docker-compose || {
        curl -L "https://github.com/docker/compose/releases/download/v2.24.0/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose
    }
    echo "Docker Compose is installed"
fi

if ! command -v python3 > /dev/null 2>&1 || ! python3 -c "import sys; exit(0 if sys.version_info >= (3, 9) else 1)"; then
    apt-get update
    apt-get install -y python3 python3-pip python3-venv
    echo "Python 3.9+ is installed"
else
    apt-get install -y python3-pip python3-venv
fi

VENV_DIR="/opt/django-venv"
if [ ! -x "$VENV_DIR/bin/python" ] || ! "$VENV_DIR/bin/python" -c "import django" > /dev/null 2>&1; then
    python3 -m venv "$VENV_DIR"
    "$VENV_DIR/bin/pip" install django
    echo "Django is installed"
fi

echo "Script is completed"
