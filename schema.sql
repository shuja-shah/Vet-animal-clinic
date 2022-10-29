/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
);


/* Add Column */
ALTER TABLE animals ADD species VARCHAR(20);

/* Create new Owner Table */
CREATE TABLE IF NOT EXISTs owners(id SERIAL PRIMARY KEY,
full_name VARCHAR(60),
age INT);

/* Create Species Table */
CREATE TABLE IF NOT EXISTS species(
id SERIAL PRIMARY KEY,
name VARCHAR(50));
