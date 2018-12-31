USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_bahama','Bahama Mas',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_bahama','Bahama Mas',1)
;

INSERT INTO `jobs` (name, label) VALUES
  ('bahama','Bahama Mas')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('bahama',0,'recrue','Recrue',0,'{}','{}'),
  ('bahama',1,'novice','Novice',0,'{}','{}'),
  ('bahama',2,'experimente','Experimente',0,'{}','{}'),
  ('bahama',3,'boss','Patron',0,'{}','{}')
;

INSERT INTO `items` (name, label) VALUES
	('myrtealcool', 'alcool de myrte'),
	('alcool', 'alcool'),
	('myrte', 'myrte'),
  ('whiskycoc', 'Whisky CorsicaCola'),
  ('redbull', 'RedBull'),
  ('vodkrb', 'Vodka RedBull'),
  ('alcool_cargo', 'Cargaison d\'alcool'),
  ('redbull_cargo', 'Cargaison de RedBull'),
  ('myrte_cargo', 'Cargaison de Myrte')
;