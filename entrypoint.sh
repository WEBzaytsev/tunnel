#!/bin/sh

# Проверка наличия токена
if [ -z "${AUTH_TOKEN}" ]; then
    echo "Error: AUTH_TOKEN is not set. Please provide authentication token."
    exit 1
fi

# Установка порта по умолчанию если не указан
PORT=${PORT:-80}

# Установка удаленного хоста по умолчанию если не указан
REMOTE_HOST=${REMOTE_HOST:-t.letsmake.cc}

# Настройка и запуск Portr
portr auth set --token ${AUTH_TOKEN} --remote ${REMOTE_HOST}

if [ -n "${SUBDOMAIN}" ]; then
    exec portr http ${PORT} --subdomain ${SUBDOMAIN}
else
    exec portr http ${PORT}
fi 