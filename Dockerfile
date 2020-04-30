FROM postgres 
ENV POSTGRES_PASSWORD docker 
COPY init.sql /docker-entrypoint-initdb.d/