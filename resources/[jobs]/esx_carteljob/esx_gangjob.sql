INSERT INTO `addon_account` (name, label, shared) VALUES 
	('organisation_cartel','Cartel',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('organisation_cartel','Cartel',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('organisation_cartel', 'Cartel', 1)
;

INSERT INTO `org` (`name`, `label`) VALUES
('cartel', 'Cartel');

INSERT INTO `org_gradeorg` (`org_name`, `gradeorg`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('cartel', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
('cartel', 1, 'capo', 'Capo', 1800, '{}', '{}'),
('cartel', 2, 'consigliere', 'Chef', 2100, '{}', '{}'),
('cartel', 3, 'boss', 'Patron', 2700, '{}', '{}');
