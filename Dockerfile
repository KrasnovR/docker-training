FROM node:alpine as builder

WORKDIR /usr/apps

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginsx
EXPOSE 80
COPY --from=builder /usr/app/build /usr/share/nginx/html
