FROM mysql:latest
ENV MYSQL_ROOT_PASSWORD=#Arcadium
COPY ./arquivos_sql/ /docker-entrypoint-initdb.d/
EXPOSE 3306 