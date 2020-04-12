FROM node:latest as node
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:latest
RUN rm -f /etc/nginx/nginx.conf
COPY --from=node /usr/src/app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 8080
CMD ["nginx","-g","daemon off;"]
