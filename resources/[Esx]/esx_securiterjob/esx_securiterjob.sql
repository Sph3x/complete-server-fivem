USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_securiter','Securiter',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_securiter','Securiter',1)
;

INSERT INTO `jobs` (name, label) VALUES
  ('securiter','Agent')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('securiter',0,'agents','Securiter SHIELD',1700,'{}','{}'),
  ('securiter',1,'boss','Patron',3000,'{}','{}')
;