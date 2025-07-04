#Imagem servidor Web Nginx
FROM nginx:alpine

#Copiar o aquivo index.html para a pasta padrãoi do Nginx dentro do Container
COPY ./index.html /usr/share/nginx/html/
