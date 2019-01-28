INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_bodyguard','bodyguard',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_bodyguard','bodyguard',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_bodyguard', 'bodyguard', 1)
;

INSERT INTO `jobs` (name, label) VALUES 
	('bodyguard','bodyguard')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
('bodyguard', 0, 'recrue',           'recrue',         1000, '{"tshirt_1":75,"torso_1":30,"arms":20,"pants_1":10,"shoes_1":20,"shoes_2":7}','{}'),
('bodyguard', 1, 'agent',            'agent',          2500, '{"tshirt_1":90,"tshirt_2":1,"torso_1":30,"arms":20,"pants_1":10,"shoes_1":20,"shoes_2":7}','{}'),
('bodyguard', 2, 'garde du corps',   'garde du corps', 3500, '{"tshirt_1":90,"tshirt_2":1,"torso_1":30,"arms":20,"pants_1":10,"shoes_1":20,"shoes_2":7,"chain_1":12,"chain_2":2}','{}'),
('bodyguard', 3, 'boss',             'patron',         4000, '{"tshirt_1":35,"tshirt_2":5,"torso_1":30,"arms":38,"pants_1":86,"pants_2":5,shoes_1":12,"shoes_2":6,"chain_1":12,"chain_2":2}','{}')
;

CREATE TABLE `bodyguard_illegal_locker` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`object` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL,
	`ammount` int(11) NOT NULL,
	`locker` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `bodyguard_illegal_garage` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	'carname' varchar(2000) NOT NULL,
	'carlabel' varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);
