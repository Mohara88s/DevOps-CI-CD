#!/bin/sh
echo "start instalation"

if ! command -v docker > /dev/null 2>&1; then
    apt-get update
    apt-get install -y docker.io
    echo "Docker is installed"
fi

if ! command -v docker-compose > /dev/null 2>&1 && ! docker compose version > /dev/null 2>&1; then
    apt-get update
    apt-get install -y docker-compose || {
        curl -L "https://github.com/docker/compose/releases/download/v2.24.0/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose
    }
    echo "Docker Compose is installed"
fi

if ! command -v python3 > /dev/null 2>&1; then
    apt-get update
    apt-get install -y python3 python3-pip
    echo "Python is installed"
else
    apt-get install -y python3-pip
fi

if ! python3 -c "import django" > /dev/null 2>&1; then
    pip3 install --break-system-packages django
    echo "Django is installed"
fi

echo "script is completed"
