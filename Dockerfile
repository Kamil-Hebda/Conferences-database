FROM postgres:latest

ENV POSTGRES_DB=conferences
ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword

RUN mkdir -p /docker-entrypoint-initdb.d

COPY init-scripts/*.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
