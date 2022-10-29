/* Populate database with sample data. */
INSERT INTO animals (name,neutered,escape_attempts,date_of_birth,weight_kg) VALUES ('Agumon',TRUE,0,'2020-07-23',10.23),('Gabumon',TRUE,2,'2018-12-15',8), ('Pikachu',FALSE,1,'2021-01-7',15.08),('Devimon',TRUE,5,'2017-05-12',11);

INSERT INTO animals (name,neutered,escape_attempts,date_of_birth,weight_kg) VALUES ('Charmander',FALSE,0,'2020-02-08',-11),('Plantmon',TRUE,2,'2021-12-15',-5.7), ('Squirtle',FALSE,3,'1993-04-02',-12.13),('Angemon',TRUE,1,'2005-06-12',-45),('Boarmon',TRUE,7,'2005-06-07',20.4),('Blossom',TRUE,3,'1998-10-13',17),('Ditto',TRUE,4,'2022-05-14',22);

INSERT INTO owners (full_name,age) VALUES ('Sam Smith',34),('Jennifer Orwell',19),('Bob',45),('Melody Pond',77),('Dean Winchester',14),('Jodie Whittake',38);
INSERT INTO species (name) VALUES ('Pokemon'),('Digimon');


/* UPDATE DATA IN ANIMAL TABLE */
UPDATE animals SET species_id=2 where name LIKE '%mon';
UPDATE animals SET species_id=1 where name NOT LIKE '%mon';

/* UPDATA OWNER ID  TO OWN ANIMALS TABLE*/

UPDATE animals SET owner_id=1 where name='Agumon';
UPDATE animals SET owner_id=2 where name IN ('Gabumon','Pikachu');
UPDATE animals SET owner_id=3 where name IN ('Devimon','Plantmon');
UPDATE animals SET owner_id=4 where name IN ('Charmander','Squirtle','Blossom');
UPDATE animals SET owner_id=5 where name IN ('Angemon','Boarmon');

/* INSERT DATA INTO VETS TABLE */
INSERT INTO vets (name,age,date_of_graduation) 
VALUES ('William Tatcher',45,'2000-04-23'),
('Maisy Smith',26,'2019-01-17'),
('Stephanie Mendez',64,'1981-05-04'),
('Jack Harkness',38,'2008-06-08');

/* INSERT DATA INTO SPECALIZATION TABLE */
INSERT INTO specializations (vets_id,species_id)
 VALUES (1,1),
 (3,1),
 (3,2),
 (4,2);


/* INSERT DATA INTO VISITS TABLE */
INSERT INTO VISITS(animals_id,vets_id,visist_date)
 VALUES (1,1,'2020-07-22'),
 (1,3,'2020-07-22'),
 (2,4,'2021-02-02'),
 (3,2,'2020-01-05'),
 (3,2,'2020-03-08'),
 (3,2,'2020-06-14'),
 (4,3,'2021-05-04'),
 (5,4,'2021-02-24'),
 (6,2,'2019-12-21'),
 (6,1,'2020-08-10'),
 (6,2,'2021-04-07'),
 (7,3,'2019-09-29'),
 (8,4,'2020-10-03'),
 (8,4,'2020-11-04'),
 (9,2,'2019-01-24'),
 (9,2,'2019-05-15'),
 (9,2,'2020-02-27'),
 (9,2,'2020-08-03'),
 (10,3,'2020-05-24'),
 (10,1,'2021-01-11');
