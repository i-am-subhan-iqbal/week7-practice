FROM node:alpine AS builder
WORKDIR /seg3-web-app
COPY . .
RUN npm install parcel
RUN npx parcel build "src/index.html" --dist-dir "dist" --public-url "/"

FROM nginx:alpine
COPY --from=builder /seg3-web-app/dist /usr/share/nginx/html