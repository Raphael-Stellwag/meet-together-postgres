# Meet-together Postgres Database

Here is the database needed by the meet-together backend documented

## Installation

The postgres database server runs in a docker container. For this we are using the official postgres image provided under [https://hub.docker.com/_/postgres/](https://hub.docker.com/_/postgres/), we customizing it and add our init script in it so first build our custom image:

```
	docker build -t meet-together-postgres .
```

Afterwards we can run ($HOME systemvariable needed: Under windows use ${$HOME} instead of $HOME in the instruction): 

```
	docker run --rm --name meet-together-postgres -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data meet-together-postgres
```

This starts a container from our image. For this we are pointing the port 5432 from the docker container to the port 5432 of the host machine, this makes the database accessible from the local network (On windows you additionally have to set the port forwarding: https://github.com/docker/for-win/issues/204#issuecomment-303461340). We are also making one folder accessible for the docker container. The volume is setting the postgresql data to the host machine, so that the data is stored on the host machine and not deleted when the container is killed.

## Run the container (from the second time on)

At the second start of the container we have to run the container without the database initiation script:

```
	docker run --rm --name postgres -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres
```

## Database model

You can find the database model as pdf in this folder.

Here a short description:

 - person: one row represents on user.
 - event: one row represents one event. The choosen_time_place property represents the id in time_place_suggestion of where and when to meet (can also be null, when none time_place_suggestion have been choosen yet).
 - person_interested_in_event: one row represents a user who has joined the event over the inivitation link.
 - message: one row represents one message from one user in an event. These are at the moment just auto generated in the nodejs server. There a 6 different types of auto generated messages: user_joined_event, user_left_event, event_updated, event_created, time_place_suggestion_added, time_place_suggestion_choosen.
 - time_place_suggestion: to one event there can be multiply suggestion when and where to meet, this is saved here.
 - can_attend: user can attend on time_place_suggestion, this gives the organizer an overview where the most people could attend

## Development tools

A good tool for directly accessing the database is **pgadmin** (provides a GUI), another good cli alternative is **psql**.

 

Rarely used development instructions:

psql -h localhost -U postgres -d postgres -f init.sql
docker kill postgres
mkdir -p $HOME/docker/volumes/postgres


docker -H 192.168.1.66 run --rm --name postgres -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres

docker -H 192.168.1.66 run --rm --name postgres -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v /home/raphael/docker/volumes/postgres:/var/lib/postgresql/data postgres

docker run --rm --name postgres -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v /home/raphael/docker/volumes/postgres:/var/lib/postgresql/data postgres