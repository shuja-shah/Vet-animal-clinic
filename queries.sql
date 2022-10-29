/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-01-01';
SELECT name FROM animals WHERE neutered AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');
SELECT date_of_birth, name FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3
/* UPDATE */

BEGIN;
UPDATE animals SET species='unspecified';
select * from animals;
ROLLBACK;
select * from animals;

BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species IS NULL;
COMMIT;


/* DELETE */
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE from animals where date_of_birth>'2022-01-01';
SAVEPOINT sp1;
UPDATE animals SET weight_kg=weight_kg*-1;
ROLLBACK to sp1;
UPDATE animals SET weight_kg=weight_kg*-1 WHERE weight_kg<0;
COMMIT;


/* QUESTIONS */
SELECT count(*) from animals;
SELECT count(*) from animals where escape_attempts=0;
SELECT AVG(weight_kg) from animals;
SELECT MAX(escape_attempts),neutered from animals GROUP BY neutered;
SELECT MIN(weight_kg),MAX(weight_kg),species from animals GROUP BY species;
SELECT AVG(escape_attempts),species from animals WHERE date_of_birth BETWEEN '1990-01-01' and '2000-01-01' GROUP BY species;


/* QUERY MULTI TABLE */

SELECT a.name,v.name,vi.visist_date from animals a,vets v,visits vi where vi.animals_id=a.id and vi.vets_id=v.id and v.id=1;
SELECT count(a.name),a.name,v.name as vet_name from animals a,vets v,visits vi where vi.animals_id=a.id and vi.vets_id=v.id and v.id=3 GROUP BY a.name,v.name;
SELECT v.name, s.name from species s full join specializations spe on spe.species_id = s.id FULL JOIN vets v on v.id = spe.vets_id;
SELECT a.name, a.date_of_birth,v.name,vi.visist_date from animals a,vets v, visits vi where vi.animals_id=a.id and vi.vets_id=v.id and v.id=3 and visist_date BETWEEN '2020-04-01' and '2020-08-30';
SELECT count(a.name) as Number_of_visist, a.name as animal_name from animals a JOIN visits v ON v.animals_id=a.id GROUP BY a.name;
SELECT a.name,v.name,vi.visist_date from animals a,vets v, visits vi where vi.animals_id=a.id and vi.vets_id=v.id and v.id=2 ORDER BY vi.visist_date LIMIT 1;
SELECT a.name as animal_name,v.name as vet_name,v.age, vi.visist_date from animals a,vets v, visits vi where vi.animals_id=a.id and vi.vets_id=v.id ORDER BY vi.visist_date DESC;
SELECT COUNT(v.name), v.name FROM visits vi RIGHT JOIN vets v ON v.id = vi.vets_id JOIN animals a ON a.id = vi.animals_id JOIN specializations sp ON sp.vets_id = v.id WHERE sp.species_id != a.species_id GROUP BY v.name;
SELECT V.name as vet_name, A.name as animals_name, s.name as species_name from visits vi join animals a on a.id = vi.animals_id join vets v on v.id = vi.vets_id join species S on S.id = A.species_id where V.id = 2 GROUP by s.name, v.name, a.name;
