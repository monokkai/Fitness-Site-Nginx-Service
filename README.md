# 📽️ Static Media Server with NGINX

This service handles static file delivery (e.g. background videos like `run.mp4`) via a dedicated NGINX container. It is designed to serve lightweight media assets to the frontend (Next.js), helping keep the main app fast and modular.

---

## 🚀 Purpose

- Serve videos, images, or other static files without bloating the main frontend app
- Support progressive enhancements like fullscreen background videos
- Easily replaceable or extendable (e.g. with CDN, S3, or Cloudflare later)

---

## 📦 Structure

static-server/
├── media/
│ └── run.mp4 # Your video background file
├── nginx.conf # NGINX configuration file

> The video will be available at:  
> `http://localhost:8081/media/run.mp4`

---

## 🐳 Docker Compose Setup

In your root `docker-compose.yml`:

```yaml
services:
  static-server:
    image: nginx:latest
    container_name: static-server
    ports:
      - "8081:80"
    volumes:
      - ./static-server:/usr/share/nginx/html:ro
And inside static-server/nginx.conf:

events {}

http {
  server {
    listen 80;

    location / {
      root /usr/share/nginx/html;
      index index.html;
    }

    location /media/ {
      alias /usr/share/nginx/html/media/;
      add_header Access-Control-Allow-Origin *;
    }
  }
}
```
