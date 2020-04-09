docker pull postgres

docker run --rm --name postgres -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres

psql -h localhost -U postgres -d postgres -f init.sql

mkdir -p $HOME/docker/volumes/postgres
