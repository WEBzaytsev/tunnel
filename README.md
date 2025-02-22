# Portr Tunnel

Docker образ для создания HTTP туннелей с помощью [Portr](https://github.com/amalshaji/portr) v0.0.28-beta.

## Запуск

```bash
docker run -d \
  --network host \
  -e AUTH_TOKEN=your_token \
  ghcr.io/webzaytsev/tunnel:latest
```

## Переменные окружения

| Переменная  | Обязательная | Описание                                   |
|-------------|--------------|---------------------------------------------|
| AUTH_TOKEN  | Да          | Токен авторизации. Контейнер не запустится без токена |
| SUBDOMAIN   | Нет         | Поддомен для доступа. Если не указан, будет сгенерирован автоматически |
| PORT        | Нет         | Порт для проксирования (по умолчанию 80)    |
| REMOTE_HOST | Нет         | Удаленный хост (по умолчанию t.letsmake.cc) |

## Docker Compose

```yaml
services:
  portr:
    image: ghcr.io/webzaytsev/tunnel:latest
    network_mode: host
    restart: unless-stopped
    environment:
      - AUTH_TOKEN=your_token
      - SUBDOMAIN=myapp      # опционально
      - PORT=80             # опционально, по умолчанию 80
      - REMOTE_HOST=t.letsmake.cc  # опционально