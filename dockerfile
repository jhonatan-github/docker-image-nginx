# Imagem base do Alpine 3.14
FROM alpine:3.14

# Instalar o Nginx e outras dependências
RUN apk update && apk add nginx

# Copiar o arquivo de configuração personalizada para o contêiner
COPY nginx.conf /etc/nginx/nginx.conf

# Copiar os arquivos estáticos do seu site para o diretório apropriado
COPY ./projeto/ /usr/share/nginx/html

# Expor a porta 80 para a máquina host
EXPOSE 80

# Iniciar o Nginx quando o contêiner for iniciado
CMD ["nginx", "-g", "daemon off;"]