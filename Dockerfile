FROM nginx:1.25
COPY ./dist/build/h5 /usr/share/nginx/html/h5
COPY ./dist/build/admin /usr/share/nginx/html/admin
COPY ./nginx.conf /etc/nginx/conf.d
