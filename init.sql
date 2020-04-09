SELECT version();

--DROP DATABASE meet_together;
CREATE DATABASE meet_together;

\c meet_together

CREATE TABLE IF NOT EXISTS person (id SERIAL PRIMARY KEY, name TEXT);

CREATE TABLE IF NOT EXISTS event (id SERIAL PRIMARY KEY, name TEXT, description TEXT, accesstoken TEXT, password TEXT, flexible_time BOOLEAN, start_time TIMESTAMP, end_time TIMESTAMP);

CREATE TABLE IF NOT EXISTS person_participats_event (person_id SERIAL REFERENCES person (id), event_id SERIAL REFERENCES event (id), creator BOOLEAN, PRIMARY KEY (person_id, event_id));

CREATE TABLE IF NOT EXISTS message (id SERIAL PRIMARY KEY, person_id SERIAL REFERENCES person (id), event_id SERIAL REFERENCES event (id), time TIMESTAMP, content TEXT);

CREATE TABLE IF NOT EXISTS time_suggestion (id SERIAL PRIMARY KEY, event_id SERIAL REFERENCES event (id), start_time TIMESTAMP, end_time TIMESTAMP);

CREATE TABLE IF NOT EXISTS can_attend (person_id SERIAL REFERENCES person (id), time_suggestion_id SERIAL REFERENCES time_suggestion (id), PRIMARY KEY (person_id, time_suggestion_id));