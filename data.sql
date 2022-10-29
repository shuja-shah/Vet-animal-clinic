/* Populate database with sample data. */
INSERT INTO animals (name,neutered,escape_attempts,date_of_birth,weight_kg) VALUES ('Agumon',TRUE,0,'2020-07-23',10.23),('Gabumon',TRUE,2,'2018-12-15',8), ('Pikachu',FALSE,1,'2021-01-7',15.08),('Devimon',TRUE,5,'2017-05-12',11);

INSERT INTO animals (name,neutered,escape_attempts,date_of_birth,weight_kg) VALUES ('Charmander',FALSE,0,'2020-02-08',-11),('Plantmon',TRUE,2,'2021-12-15',-5.7), ('Squirtle',FALSE,3,'1993-04-02',-12.13),('Angemon',TRUE,1,'2005-06-12',-45),('Boarmon',TRUE,7,'2005-06-07',20.4),('Blossom',TRUE,3,'1998-10-13',17),('Ditto',TRUE,4,'2022-05-14',22);

INSERT INTO owners (full_name,age) VALUES ('Sam Smith',34),('Jennifer Orwell',19),('Bob',45),('Melody Pond',77),('Dean Winchester',14),('Jodie Whittake',38);
INSERT INTO species (name) VALUES ('Pokemon'),('Digimon');


/* UPDATE DATA IN ANIMAL TABLE */
UPDATE animals SET species_id=2 where name LIKE '%mon';
UPDATE animals SET species_id=1 where name NOT LIKE '%mon';
