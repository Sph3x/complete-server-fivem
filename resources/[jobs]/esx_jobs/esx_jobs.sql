USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
  ('caution', 'Caution', 0)
;

INSERT INTO `jobs` (name, label) VALUES
  ('slaughterer', 'Abatteur'),
  ('fisherman', 'Pêcheur'),
  ('miner', 'Mineur'),
  ('lumberjack', 'Bûcheron'),
  ('fueler', 'Raffineur'),
  ('reporter', 'Journaliste'),
  ('tailor', 'Couturier'),
  ('fermier', 'Fermier'),
  ('brasseur', 'Brasseur'),
  ('cuisinier', 'Cuisinier'),
  ('electricien', 'Electricien'),
  ('joaillier', 'Joaillier'),
  ('fossoyeur','Fossoyeur')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('lumberjack', 0, 'interim', 'Intérimaire', 0, '{}', '{}'),
  ('fisherman', 0, 'interim', 'Intérimaire', 0, '{}', '{}'),
  ('fueler', 0, 'interim', 'Intérimaire', 0, '{}', '{}'),
  ('reporter', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
  ('tailor',0,'interim','Intérimaire',0,'{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}','{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
  ('miner', 0, 'interim', 'Intérimaire', 0, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
  ('slaughterer',0,'interim','Intérimaire',0,'{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}','{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}')
;  
INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('fossoyeur', 0, 'interim', 'Intérimaire', 30, '{\"tshirt_2\":0,\"glasses_1\":0,\"torso_2\":0,\"glasses_2\":0,\"shoes_2\":0,\"pants_1\":10,\"shoes_1\":15,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":0,\"torso_1\":4,\"tshirt_1\":11,\"arms\":4,\"bags_2\":0,\"helmet_1\":8}', '{}'),
  ('brasseur', 0, 'interim', 'Intérimaire', 30, '{}', '{}'),
  ('brasseur', 1, 'boss', 'Patron', 30, '{}', '{}'),
  ('joaillier', 0, 'interim', 'Intérimaire', 30, '{}', '{}'),
  ('electricien', 0, 'interim', 'Intérimaire', 30, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes_1\":35,\"shoes_2\":0,\"torso_2\":0,\"hair_color_2\":0,\"pants_1\":47,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":11,\"face\":19,\"decals_1\":60,\"torso_1\":95,\"hair_2\":0,\"skin\":34,\"pants_2\":0}', '{}'),
  ('joaillier', 0, 'interim', 'Intérimaire', 30, '{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":0,\"torso_2\":2,\"ears_2\":2,\"glasses_2\":0,\"shoes_2\":0,\"pants_1\":9,\"shoes_1\":27,\"bags_1\":0,\"helmet_2\":3,\"pants_2\":7,\"torso_1\":0,\"tshirt_1\":59,\"arms\":63,\"bags_2\":0,\"helmet_1\":0}', '{}'),
  ('cuisinier', 0, 'interim', 'Intérimaire', 30, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes_1\":7,\"shoes_2\":0,\"torso_2\":0,\"hair_color_2\":0,\"pants_1\":25,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":7,\"helmet_2\":0,\"arms\":0,\"face\":19,\"decals_1\":60,\"torso_1\":146,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{}'),

  ;

INSERT INTO `items` (`name`, `label`, `limit`) VALUES
  ('alive_chicken', 'Poulet vivant', 20),
  ('slaughtered_chicken', 'Poulet abattu', 20),
  ('packaged_chicken', 'Poulet en barquette', 100),
  ('fish', 'Poisson', 100),
  ('stone', 'Pierre', 7),
  ('washed_stone', 'Pierre Lavée', 7),
  ('copper', 'Cuivre', 56),
  ('iron', 'Fer', 42),
  ('gold', 'Or', 21),
  ('diamond', 'Diamant', 50),
  ('wood', 'Bois', 20),
  ('cutted_wood', 'Bois coupé', 20),
  ('packaged_plank', 'Paquet de planches', 100),
  ('petrol', 'Pétrole', 24),
  ('petrol_raffin', 'Pétrole Raffiné', 24),
  ('essence', 'Essence', 24),
  ('whool', 'Laine', 40),
  ('fabric', 'Tissu', 80),
  ('clothe', 'Vêtement', 40),
 ; 
 INSERT INTO `items` (`name`, `label`, `limit`) VALUES
  ('corp', 'Corps', 40, 0, 1),
  ('corps', 'Corps emballé', 40, 0, 1),
  ('ingredient', 'Ingredient', 40, 0, 1),
  ('plat', 'Plat cuisiné', 40, 0, 1),
  ('fil', 'Fil de cuivre', 40, 0, 1),
  ('cable', 'Cable electrique', 40, 0, 1),
  ('cristaux', 'Cristaux de diamant', 40, 0, 1),
  ('diamant', 'Diamant', 40, 0, 1),
  ('malt', 'Malt', 40, 0, 1),
  ('beer', 'Bière', 40, 0, 1),
  ('pills', 'Pills', 40, 0, 1),
  ('ble', 'Blé', 40, 0, 1),
  ('farine', 'Farine', 40, 0, 1),
  ('biere', 'Bière sans alcool', 40, 0, 1)
;
  
INSERT INTO `addon_account` (`id`, `name`, `label`, `shared`) VALUES
(33, 'society_brasseur', 'brasseur', 1)
;