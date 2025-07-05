#Imagem servidor Web Nginx
FROM nginx:alpine

#Copiar o aquivo index.html para a pasta padrão do Nginx dentro do Container
COPY ./index.html /usr/share/nginx/html/
