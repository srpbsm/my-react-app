FROM node:12.2.0-alpine as builder
RUN mkdir '/app'
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package*.json ./
RUN npm install --silent
RUN npm install react-scripts@1.1.1 -g --silent
COPY . /app
RUN npm run build
 
FROM nginx:1.14.1-alpine
EXPOSE 3001
RUN apk add --no-cache jq
# RUN rm -rf /etc/nginx/conf.d
COPY conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html
COPY docker-entrypoint.sh generate_config_js.sh /
RUN chmod +x docker-entrypoint.sh generate_config_js.sh
 
ENTRYPOINT ["/docker-entrypoint.sh"]