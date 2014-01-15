1. Create a database called wizards. The rest of the assesment all will take place in the wizards db.

2. Create a table called wizards with the following columns (name, age).

CREATE TABLE wizards
(
	name TEXT,
	age INTEGER
);

3. Write a statement to count the number of rows in the wizards table. How many wizards are there?

SELECT COUNT(name) FROM wizards

#=> 0

4. Insert a wizard into the database.

INSERT INTO wizards(name) values ('Yoda') 

5. Write a statement to count the number of rows in the wizards table. How many wizards are there now?

SELECT COUNT(name) FROM wizards

#=> 1

6. Insert another wizard into the database.

INSERT INTO wizards(name) values ('Dr.Strange')

7. Write a statement to change the second wizards age to 21.

INSERT INTO wizards(age) VALUES (21) WHERE wizards(name) = 'Dr.Strange'

# didn't work when testing

8. Write a statement to change all wizards ages to 40.

UPDATE wizards SET age = 40

9. Write a statement to delete the last wizard.

DELETE FROM wizards WHERE name= 'Dr.Strange'

10. Write a statement to delete the wizards table.

DROP TABLE wizards


11. Create two data models for wizards. The wizards are going to have a name, an age and two powers each. Let's pretend we're in a world where wizards have many powers, but powers belong to one wizard (two wizards cant have the same power) Each power is going to have a name and a damage amount. Write out the sql to create the two schemas and some sample records. What are the costs/benefits of the two approaches? If you only see one way of doing this that's ok. Please explain any potential problems with your approach. What questions can this schema answer easily? What questions can this schema not answer easily?

CREATE TABLE wizards
(
	name TEXT,
	age INTEGER,
	power1_id INTEGER,
	power2_id INTEGER,
	total_damage INTEGER
)

CREATE TABLE powers
(
	power_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	name TEXT,
	damage INTEGER 
)

Wizards will be identified as having a power if one of their power ids matched a power id from the powers table.  Powers table, lists name and damage.  

We will then add the damages from the two wizard powers for each wizard's full damage capability.


INSERT INTO wizards (name, age, power1_id, power2_id) VALUES ('Bill', 22, 1, 2)
INSERT INTO wizards (name, age, power1_id, power2_id) VALUES ('Carrie', 32, 3, 4)
INSERT INTO wizards (name, age, power1_id, power2_id) VALUES ('Bilbo', 42, 5, 6)



INSERT INTO powers (name, damage) VALUES ('smells', 10 )
INSERT INTO powers (name, damage) VALUES ('shrink', 20 )
INSERT INTO powers (name, damage) VALUES ('fly' 0 )
INSERT INTO powers (name, damage) VALUES ('teleport', 0 )
INSERT INTO powers (name, damage) VALUES ('exterminate', 100 )
INSERT INTO powers (name, damage) VALUES ('push', 5 )

12.  Retrieve all the wizards with powers that have the letter "l" in them.

We use the wildcard to get powers beginning with l
SELECT * FROM powers WHERE name LIKE 'l%' 
Now I have to find the proper join for the tables, and compare the power id with wizard powers....

alt attempt: 
SELECT * from wizards WHERE power1_id OR power2_id IN (SELECT FROM powers WHERE power_id (SELECT * FROM powers WHERE name LIKE 'l%' ))

#above is incorrect 

13. Retrieve all the wizards who have a combined damage of 10 or more.

14. Retrieve all the wizards sorted by their total damage. Your returned data should look like so.. wizard_name, total_damage.

15. Create a wizard that has no powers.

INSERT INTO wizards (name, age) VALUES ('Doug', 18)

16. Retrieve all wizards that have no powers.

SELECT * FROM wizards WHERE power2_id IS NULL AND power1_id IS NULL 

17. Create a data model for wizards for a world where wizards have many powers and multiple wizards can have the same power. Create some sample records.

18. Retrieve the first wizard and any powers he/she has with damage greater than 5.

19. What's the difference between an outer and inner join?

20. If I just write JOIN, is that an inner or outer join?

21. When would I want to use an outer join?