INSERT INTO `jobs` (`id`, `name`, `label`, `whitelisted`) VALUES
(300, 'reporter', 'Breaking News', 0),
(301, 'deliverer', 'Livreur', 0),
(302, 'fermier', 'Fermier', 0),
(303, 'tabac', 'Tabac', 0),
(304, 'vanilla', 'Vanilla', 0),
(305, 'brasseur', 'Brasseur', 0),
(306, 'cuisinier', 'Cuisinier', 0),
(307, 'chasse', 'Chasseur', 0),
(308, 'electricien', 'Electricien', 0),
(309, 'joaillier', 'Joaillier', 0),
(310, 'fossoyeur','èFossoyeur', 0),
(311, 'bahama', 'Bahama Mamas', 0),
(312, 'vigne', 'Vigneron', 0)


INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(300, 'deliverer', 0, 'interim', 'interim', 30, '{\"tshirt_1\":57,\"torso_1\":82,\"arms\":0,\"pants_1\":25,\"glasses_1\":0,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":2,\"glasses_2\":0,\"torso_2\":1,\"shoes_1\":25,\"shoes_2\":0,\"hair_1\":0,\"skin\":0,\"sex\":0,\"glasses_1\":0,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":5}', '{\"tshirt_1\":36,\"torso_1\":0,\"arms\":68,\"pants_1\":30,\"glasses_1\":15,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":0,\"face\":27,\"glasses_2\":0,\"torso_2\":11,\"shoes\":26,\"hair_1\":5,\"skin\":0,\"sex\":1,\"glasses_1\":15,\"pants_2\":2,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":19}'),
(301, 'tabac', 0, 'interim', 'Int√©rim', 30, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes_1\":27,\"torso_2\":0,\"hair_color_2\":0,\"pants_1\":0,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":11,\"face\":19,\"decals_1\":60,\"shoes_2\":0,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":0}', '{}'),
(302, 'fermier', 0, 'interim', 'Int√©rim', 30, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":39,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":1,\"face\":19,\"decals_1\":60,\"torso_1\":66,\"hair_2\":0,\"skin\":34,\"pants_2\":3}', '{}'),
(303, 'brasseur', 0, 'interim', 'Int√©rim', 0, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes_1\":12,\"torso_2\":10,\"hair_color_2\":0,\"pants_1\":9,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":11,\"face\":19,\"decals_1\":60,\"torso_1\":126,\"hair_2\":0,\"skin\":34,\"pants_2\":7}', '{}'),
(304, 'vigneron', 0, 'interim', 'Int√©rim', 30, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"torso_2\":2,\"hair_color_2\":0,\"pants_1\":39,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":6,\"helmet_2\":0,\"arms\":1,\"face\":19,\"decals_1\":60,\"torso_1\":66,\"hair_2\":0,\"skin\":34,\"pants_2\":2}', '{}'),
(305, 'cuisinier', 0, 'interim', 'Int√©rim', 30, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes_1\":7,\"shoes_2\":0,\"torso_2\":0,\"hair_color_2\":0,\"pants_1\":25,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":7,\"helmet_2\":0,\"arms\":0,\"face\":19,\"decals_1\":60,\"torso_1\":146,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{}'),
(306, 'chasse', 0, 'interim', 'Int√©rim', 30, '{}', '{}'),
(307, 'electricien', 0, 'interim', 'Int√©rim', 30, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":0,\"shoes_1\":35,\"shoes_2\":0,\"torso_2\":0,\"hair_color_2\":0,\"pants_1\":47,\"glasses_1\":0,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":11,\"face\":19,\"decals_1\":60,\"torso_1\":95,\"hair_2\":0,\"skin\":34,\"pants_2\":0}', '{}'),
(308, 'joaillier', 0, 'interim', 'Int√©rim', 30, '{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":0,\"torso_2\":2,\"ears_2\":2,\"glasses_2\":0,\"shoes_2\":0,\"pants_1\":9,\"shoes_1\":27,\"bags_1\":0,\"helmet_2\":3,\"pants_2\":7,\"torso_1\":0,\"tshirt_1\":59,\"arms\":63,\"bags_2\":0,\"helmet_1\":0}', '{}'),
(309, 'diver', 0, 'interim', 'Employ√©', 30, '{}', '{}'),
(310, 'fossoyeur', 0, 'interim', 'Int√©rim', 30, '{\"tshirt_2\":0,\"glasses_1\":0,\"torso_2\":0,\"glasses_2\":0,\"shoes_2\":0,\"pants_1\":10,\"shoes_1\":15,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":0,\"torso_1\":4,\"tshirt_1\":11,\"arms\":4,\"bags_2\":0,\"helmet_1\":8}', '{}'),
(311, 'brasseur', 1, 'boss', 'Patron', 30, '{}', '{}'),
(312, 'joaillier', 0, 'recruit', 'Recrue', 30, '{}', '{}'),


INSERT INTO `items` ( `name`, `label`, `limit`, `rare`, `can_remove`) VALUES
( 'diamond', 'Diamant', 40, 0, 1),
( 'beer', 'BiËre', 40, 0, 1),
( 'pills', 'Pills', 40, 0, 1),
( 'viande', 'Viande', 40, 0, 1),
( 'ble', 'BlÈ', 40, 0, 1),
( 'farine', 'Farine', 40, 0, 1),
( 'tabac', 'Feuille de tabac', 40, 0, 1),
( 'cigarette', 'Cigarette', 40, 0, 1),
( 'biere', 'BiËre sans alcool', 40, 0, 1),
( 'alcool', 'Alcool', 40, 0, 1),
( 'magnum', 'Magnum', 40, 0, 1),
( 'malt', 'Malt', 40, 0, 1),
( 'donut', 'Donut', 40, 0, 1),
( 'ingredient', 'Ingredient', 40, 0, 1),
( 'plat', 'Plat cuisinÈ', 40, 0, 1),
( 'fil', 'Fil de cuivre', 40, 0, 1),
( 'cable', 'Cable electrique', 40, 0, 1),
( 'cristaux', 'Cristaux de diamant', 40, 0, 1),
( 'diamant', 'Diamant', 40, 0, 1),
( 'corp', 'Corps', 40, 0, 1),
( 'corps', 'Corps emballÈ', 40, 0, 1),
( 'papier', 'Papier', 40, 0, 1),
('journaux', 'Journaux Breaking News', 40, 0, 1)
;

INSERT INTO `addon_account` (`id`, `name`, `label`, `shared`) VALUES
(30, 'society_deliverer', 'deliverer', 1),
(31, 'society_joaillier', 'Joaillier', 1),
(32, 'society_vigneron', 'Vigneron', 1),
(33, 'society_reporter', 'Journaliste', 1),
