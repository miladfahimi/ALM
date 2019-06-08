FROM nginx:1.17.0-alpine

EXPOSE 80

COPY dist/ALM/* /usr/share/nginx/html/