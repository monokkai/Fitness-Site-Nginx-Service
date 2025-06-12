FROM nginx:alpine

COPY nginx-static/default.conf /etc/nginx/conf.d/default.conf
COPY nginx-static /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
