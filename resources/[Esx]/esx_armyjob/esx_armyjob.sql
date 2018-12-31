INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_army','Army',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_army','Army',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_army', 'Army', 1)
;

INSERT INTO `jobs` (name, label) VALUES 
	('army','Army')
;

 INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('army',0,'recruit','Recru',67,'{}','{}'),
  ('army',1,'firstclass','Soldat',70,'{}','{}'),
  ('army',2,'capo','Caporal',77,'{}','{}'),
  ('army',3,'sergeant','Sergent',80,'{}','{}'),
  ('army',4,'adjudant','Adjudant',87,'{}','{}'),
  ('army',5,'lieutenant','Lieutenant',90,'{}','{}'),
  ('army',20,'boss','Commandant',97,'{"sex":0,\"lipstick_2\":0,"lipstick_1":0,\"helmet_2\":5,"shoes_1":25,\"lipstick_4\":0,"hair_color_1":0,\"hair_2\":0,"helmet_1":106,\"age_1\":0,"makeup_1":0,\"mask_1\":0,"decals_2":0,\"pants_1\":87,"eyebrows_2":10,\"hair_color_2\":0,"decals_1":0,\"eyebrows_4\":0,"age_2":0,\"bags_2\":0,"makeup_2":0,\"bags_1":0,\"glasses_1":5,\"chain_2":0,\"tshirt_2":5,\"tshirt_1":99,\"makeup_3":0,\"eyebrows_3":0,\"torso_1\":222,"shoes_2":0}','{}'),
;