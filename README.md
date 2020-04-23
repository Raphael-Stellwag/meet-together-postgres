docker pull postgres

docker -H 192.168.1.66 run --rm --name postgres -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres
docker -H 192.168.1.66 run --rm --name postgres -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v /home/raphael/docker/volumes/postgres:/var/lib/postgresql/data postgres


docker run --rm --name postgres -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v /home/raphael/docker/volumes/postgres:/var/lib/postgresql/data postgres


docker kill postgres

psql -h localhost -U postgres -d postgres -f init.sql

docker build -t mypostgres . 

mkdir -p $HOME/docker/volumes/postgres

pgadmin 4