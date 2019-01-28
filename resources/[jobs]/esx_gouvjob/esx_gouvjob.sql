INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_gouv','Gouveneur',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_gouv','Gouverneur',1)
;

INSERT INTO `jobs` (name, label) VALUES 
	('gouv','Gouverneur')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('gouv',0,'recruit','garde du corps',20,'{\"tshirt_1\":57,\"torso_1\":55,\"arms\":0,\"pants_1\":35,\"glasses\":0,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":5,\"face\":19,\"glasses_2\":1,\"torso_2\":0,\"shoes\":24,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":8}','{\"tshirt_1\":34,\"torso_1\":48,\"shoes\":24,\"pants_1\":34,\"torso_2\":0,\"decals_2\":0,\"hair_color_2\":0,\"glasses\":0,\"helmet_2\":0,\"hair_2\":3,\"face\":21,\"decals_1\":0,\"glasses_2\":1,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"pants_2\":0,\"arms\":14,\"hair_color_1\":10,\"tshirt_2\":0,\"helmet_1\":57}'),
	('gouv',5,'boss','gouverneur',80,'{\"tshirt_1\":58,\"torso_1\":55,\"shoes\":24,\"pants_1\":35,\"pants_2\":0,\"decals_2\":3,\"hair_color_2\":0,\"face\":19,\"helmet_2\":0,\"hair_2\":0,\"arms\":41,\"torso_2\":0,\"hair_color_1\":5,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"glasses_2\":1,\"decals_1\":8,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":11}','{\"tshirt_1\":35,\"torso_1\":48,\"arms\":44,\"pants_1\":34,\"pants_2\":0,\"decals_2\":3,\"hair_color_2\":0,\"face\":21,\"helmet_2\":0,\"hair_2\":3,\"decals_1\":7,\"torso_2\":0,\"hair_color_1\":10,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"glasses_2\":1,\"shoes\":24,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":57}')
;

CREATE TABLE `fine_types` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  
  PRIMARY KEY (`id`)
);

INSERT INTO `fine_types` (label, amount, category) VALUES 
    ('Conduite en état d\'ébriété',8000,0),
	('Conduite Sans Permis ou Licence',8000,0),
	('Dégradation de la voie publique',1500,0),
	('Défaut du port du casque en moto',200,0),
	('Délit de fuite',6000,0),
	('Demi-Tour non autorisé',750,0),
    ('Ebriété sur la voie publique',1500,0),
	('Entrave à la circulation',800,0),
	('Excès de vitesse mois de 20km/h',2000,0),
	('Excès de vitesse de plus de 20km/h',4000,0),
	('Franchissement de la ligne continue',500,0),
	('Manisfestation sur la voie publique non autorisé' ,4000,0),
	('Non respect d\'un feu',2500,0),
	('Non respect d\'un stop',2000,0),
	('Non respect d\'un véhicules prioritaire',5000,0),
	('Taxe de fourrière',1000,0),
	('Usage abusif du klaxon',3500,0),
	('Véhicule Endommagé',3000,0),
	('Agression Physique',35000,1),
	('Dégradation de véhicule 10 mois',10000,1),
	('Entrave a l\'exercice 10 mois',10000,1),
	('Faux témoignage 20 mois',20000,1),
	('Homicide involontaire 30 mois',100000,1),
	('Agression volontaire Perpétuité',250000,1),
	('Menaces ou tentative d\'intimidation 25 mois',25000,1),
	('Outrage ou Insulte 15 mois',15000,1),
	('Rébellion, refus d\'obtempérer 20 mois',20000,1),
	('Séquestration, enlèvement Perpétuité',100000,1),
	('Tentative d\'homicide involontaire 15 mois',60000,1),
	('Tentaive d\'homicide Volontaire Perpétuité',150000,1),
	('Tentative de corruption 30 mois',75000,1),
	('Vol de Véhicule de service 30 mois',30000,1),
	('Accident de la route',1500,2),
	('Agression physique 5 mois',5000,2),
	('Agression verbales ou insultes',3000,2),
	('Coups et blessures 5 mois',5000,2),
	('Dégradation volontaire de véhicule',2000,2),
	('Homicide Involontaire 30 mois',30000,2),
	('Homicide Volontaire 60 mois',80000,2),
	('Menaces ou tentaive d\'intimidation',4000,2),
	('Séquestration ou enlèvement 20 mois',20000,2),
	('Tentative d\'homicide involontaire 20 mois',20000,2),
	('Tentative d\'homicide volontaire 40 mois',50000,2),
	('Vol de véhicules 10 mois',8000,2),
	('Sortie d\'une arme de 1ère categorie',2000,3),
	('Sortie d\'une arme de 2nd categorie',4000,3),
	('Sortie d\'une arme de 3ème catégorie',8000,3),
	('Usage d\'une arme de 1ère catégorie',4000,3),
	('Usage d\'une arme de 2nd catégorie',8000,3),
	('Usage d\'une arme de 3ème catégorie 15 mois',16000,3),
	('Possession illégale d\'une arme de 1ère catégorie',4000,3),
	('Possession illégale d\'une arme de 2nd catégorie',8000,3),
	('Possession illégale d\'une arme de 3ème catégorie 15 mois',16000,3),
    ('Récolte et ou culture de Cannabis 20 mois',20000,4),
	('Récolte et ou culture de Cocaine 30 mois',30000,4),
	('Transformation de Cannabis 15 mois',20000,4),
	('Transformation de Cocaine 25 mois',25000,4),
	('Revente illégale de cannabis 10 mois',10000,4),
	('Revente de cocaine 20 mois',20000,4),
	('Possession d\'argent sale',15000,4),
	('Récidive doublé les peines',0,4),
	('Possession d\'argent sale',15000,5),
	('Braquage de Magasin 20 mois',20000,5),
	('Attaque de magasin 30 mois',20000,5),
	('Attaque armée de magasin 30 mois',30000,5),
	('Braquage armée de banque Perpétuité',250000,5),
	('Complicité 30 mois',50000,5),
	('Acte de terrorisme Perpétuité',750000,5),
	('Incitation au terrorisme 50 mois',350000,5),
	('Association de malfaiteurs 40 mois',250000,5),
	('Récidive doublé les peines',0,5),
	('Agression physique',70000,6),
	('Dégradation de véhicule',20000,6),
	('Entrave a l\'exercice',20000,6),
	('Faux témoignage' ,40000,6),
	('Homicide involontaire',200000,6),
	('Homicide volontaire',500000,6),
	('Menace ou tentative d\'intimidation',50000,6),
	('Outrages ou insultes',30000,6),
	('Rébellion, refus d\'obtempérer',40000,6),
	('Sequestration, enlèvement',200000,6),
	('Tentative d\'homicide involontaire',120000,6),
	('Tentative d\'homicide volontaire',300000,6),
	('Tentative de corruption',150000,6),
	('Vol de véhicule de service',60000,6),
	('Agression physique',10000,6),
	('Coups et blessures',10000,6),
	('Homicide involontaire',40000,6),
	('Homicide volontaire',160000,6),
	('Séquestration, enlèvement',40000,6),
	('Tentative d\'homicide involontaire',40000,6),
	('Tentative d\'homicide volontaire',100000,6),
	('Vol de véhicule',16000,6),
	('Usage d\'une arme de 3ème catégorie',64000,6),
	('Possession illégale d\'une arme de 3ème catégorie',32000,6),
	('Attaque de magasin',40000,6),
	('Attaque Armée de magasin',60000,6),
	('Complicité',100000,6),
	('Association de malfaiteurs',500000,6),
	('Attaque de banque',500000,6)
;