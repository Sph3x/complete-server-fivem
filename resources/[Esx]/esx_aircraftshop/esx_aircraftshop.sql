USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_aircraftdealer','Airliner',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_aircraftdealer','Airliner',1)
;

INSERT INTO `jobs` (name, label) VALUES
	('aircraftdealer','Airliner')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('aircraftdealer',0,'recruit','Recruit',10,'{}','{}'),
	('aircraftdealer',1,'novice','Novice',25,'{}','{}'),
	('aircraftdealer',2,'experienced','Expert',40,'{}','{}'),
	('aircraftdealer',3,'boss','Boss',0,'{}','{}')
;

INSERT INTO `licenses` (type, label) VALUES
  ('aircraft', "Aircraft License")
;

CREATE TABLE `aircraftdealer_aircrafts` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`vehicle` varchar(255) NOT NULL,
	`price` int(11) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `owned_aircrafts` (
	`owner` varchar(30) NOT NULL,
	`plate` varchar(12) NOT NULL,
	`vehicle` longtext,

	PRIMARY KEY (`plate`)
);

CREATE TABLE `rented_aircrafts` (
	`vehicle` varchar(60) NOT NULL,
	`plate` varchar(12) NOT NULL,
	`player_name` varchar(255) NOT NULL,
	`base_price` int(11) NOT NULL,
	`rent_price` int(11) NOT NULL,
	`owner` varchar(30) NOT NULL,

	PRIMARY KEY (`plate`)
);

CREATE TABLE `aircraft_categories` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `aircraft_categories` (name, label) VALUES
	('plane','Planes'),
	('heli','Helicopters')
;

CREATE TABLE `aircrafts` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,
	PRIMARY KEY (`model`)
);

INSERT INTO `aircrafts` (name, model, price, category) VALUES
	('Alpha Z1', 'alphaz1', 1121000, 'plane'),
	('Besra', 'besra', 1000000, 'plane'),
	('Cuban 800', 'cuban800', 240000, 'plane'),
	('Dodo', 'dodo', 500000, 'plane'),
	('Duster', 'duster', 175000, 'plane'),
	('Howard NX25', 'howard', 975000, 'plane'),
	('Luxor', 'luxor', 1500000, 'plane'),
	('Luxor Deluxe ', 'luxor2', 1750000, 'plane'),
	('Mallard', 'stunt', 250000, 'plane'),
	('Mammatus', 'mammatus', 300000, 'plane'),
	('Nimbus', 'nimbus', 900000, 'plane'),
	('Rogue', 'rogue', 1000000, 'plane'),
	('Sea Breeze', 'seabreeze', 850000, 'plane'),
	('Shamal', 'shamal', 1150000, 'plane'),
	('Ultra Light', 'microlight', 50000, 'plane'),
	('Velum', 'velum2', 450000, 'plane'),
	('Vestra', 'vestra', 950000, 'plane'),
	('Buzzard', 'buzzard2', 500000, 'heli'),
	('Frogger', 'frogger', 800000, 'heli'),
	('Havok', 'havok', 250000, 'heli'),
	('Maverick', 'maverick', 750000, 'heli'),
	('Sea Sparrow', 'seasparrow', 815000, 'heli'),
	('SuperVolito', 'supervolito', 1000000, 'heli'),
	('SuperVolito Carbon', 'supervolito2', 1250000, 'heli'),
	('Swift', 'swift', 1000000, 'heli'),
	('Swift Deluxe', 'swift2', 1250000, 'heli'),
	('Volatus', 'volatus', 1250000, 'heli')
;
