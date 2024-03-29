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


/* Alter Table Animals */
 ALTER TABLE animals DROP COLUMN species; 
 ALTER TABLE animals ADD species_id INT;
 ALTER TABLE animals ADD CONSTRAINT species_constraint FOREIGN KEY (species_id) references species (id);

 ALTER TABLE animals ADD owner_id INT;
 ALTER TABLE animals ADD CONSTRAINT owner_constraint FOREIGN KEY (owner_id) REFERENCES owners (id);

 
/* Create Vets Table */
CREATE TABLE IF NOT EXISTS vets(
id SERIAL,
name VARCHAR(60),
age INT,
date_of_graduation date,
PRIMARY KEY(id));

/* Create Specialization Table */
CREATE TABLE IF NOT EXISTS specializations (
species_id INT,
vets_id INT,
CONSTRAINT vets_fk FOREIGN KEY(vets_id) REFERENCES vets (id),
CONSTRAINT species_fk FOREIGN KEY(species_id) REFERENCES species (id));

/* Create Visits Table */
CREATE TABLE IF NOT EXISTS visits (animals_id INT,
vets_id INT,
visist_date date,
CONSTRAINT vets_fk
 FOREIGN KEY(vets_id) 
 REFERENCES vets (id),
CONSTRAINT animals_fk 
FOREIGN KEY(animals_id) 
REFERENCES animals (id));

