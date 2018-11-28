FROM nginx:alpine
COPY ./quick/build /var/www
ENTRYPOINT ["nginx", "-g", "daemon off;"]
