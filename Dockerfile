#FROM nginx:1.17-alpine
#COPY /dist/angular-docker-app /usr/share/nginx/html

FROM node:17-alpine3.14 as node
WORKDIR /app
COPY . .
RUN npm install
RUN export NODE_OPTIONS=--openssl-legacy-provider
RUN npm run build --prod
#WORKDIR /nodeproject
#ENTRYPOINT top



# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-docker-app /usr/share/nginx/html

