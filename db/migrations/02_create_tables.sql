CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(60) UNIQUE, password VARCHAR(60), email VARCHAR(70) UNIQUE, phone_number BIGINT);
CREATE TABLE peeps (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users(id), peep VARCHAR(250);

This is for both chitter and chitter_test databases.
