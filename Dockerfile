FROM node:alpine as builder
WORKDIR /usr/webapp
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /usr/webapp/build /usr/share/nginx/html