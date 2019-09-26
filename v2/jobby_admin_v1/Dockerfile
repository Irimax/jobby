FROM nginx:alpine

COPY ./ /usr/share/nginx/html

RUN mkdir -p /etc/nginx/conf.d/


EXPOSE 80
RUN echo 'server { \
          listen       80; \
          server_name  localhost; \
          root /usr/share/nginx/html/; \

          location / { \
              index views/index.html index.htm; \
              expires -1; \
              add_header Pragma "no-cache"; \
              add_header Cache-Control "no-store, no-cache, must-revalidate, post-check=0, pre-check=0"; \
              try_files $uri$args $uri$args/ $uri $uri/ /index.html =404; \
          } \
      }' >  /etc/nginx/conf.d/default.conf