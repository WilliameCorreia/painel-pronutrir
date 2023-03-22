# estágio de compilação
FROM node:16.17.0-bullseye-slim as build-stage

# faz da pasta 'app' o diretório atual de trabalho
WORKDIR /app

# copia os arquivos 'package.json' e 'package-lock.json' (se disponível)
COPY package*.json ./

# instala dependências do projeto
RUN npm install

# copia arquivos e pastas para o diretório atual de trabalho (pasta 'app')
COPY . .

# compila a aplicação de produção com minificação
RUN npm run build

# estágio de produção
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]