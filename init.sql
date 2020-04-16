SELECT version();

DROP DATABASE meet_together;
CREATE DATABASE meet_together;

\c meet_together

create extension pgcrypto;

CREATE TABLE IF NOT EXISTS person (id SERIAL PRIMARY KEY, name TEXT, password TEXT, password_generated BOOLEAN);

-- Add in future maybe column password TEXT for event to increase security -- , start_date TIMESTAMP WITH TIME ZONE, end_date TIMESTAMP WITH TIME ZONE, flexible_time BOOLEAN
CREATE TABLE IF NOT EXISTS event (id SERIAL PRIMARY KEY, name TEXT, description TEXT, accesstoken TEXT, choosen_time_place INT);

CREATE TABLE IF NOT EXISTS person_interested_in_event (person_id SERIAL REFERENCES person (id), event_id SERIAL REFERENCES event (id), creator BOOLEAN, PRIMARY KEY (person_id, event_id));

CREATE TABLE IF NOT EXISTS message (id SERIAL PRIMARY KEY, person_id SERIAL REFERENCES person (id), event_id SERIAL REFERENCES event (id), time TIMESTAMP WITH TIME ZONE, content TEXT, generated BOOLEAN, generated_content_description smallint);

CREATE TABLE IF NOT EXISTS time_place_suggestion (id SERIAL PRIMARY KEY, event_id SERIAL REFERENCES event (id), start_date TIMESTAMP WITH TIME ZONE, end_date TIMESTAMP WITH TIME ZONE, place TEXT, link TEXT);

CREATE TABLE IF NOT EXISTS can_attend (person_id SERIAL REFERENCES person (id), time_place_suggestion_id SERIAL REFERENCES time_place_suggestion (id), PRIMARY KEY (person_id, time_place_suggestion_id));

ALTER TABLE event ADD FOREIGN KEY (choosen_time_place) REFERENCES time_place_suggestion (id)