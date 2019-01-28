INSERT INTO `addon_account` (`id`, `name`, `label`, `shared`) VALUES
(null, 'society_armurier', 'Armurier', 1);

INSERT INTO `addon_inventory` (`id`, `name`, `label`, `shared`) VALUES
(null, 'society_armurier', 'Armurier', 1),
(null, 'society_armurier_coffre', 'Armurier (patron)', 1),

INSERT INTO `datastore` (`id`, `name`, `label`, `shared`) VALUES
(null, 'society_armurier', 'Armurier', 1),
(null, 'society_armurier_coffre', 'Armurier', 1);

INSERT INTO `jobs` (`id`, `name`, `label`, `whitelisted`) VALUES
(null, 'armurier', 'Armurier', 1);

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(null, 'armurier', 1, 'boss', 'Patron', 1700, '{}', '{}'),
(null, 'armurier', 0, 'employe', 'Employé', 1300, '{}', '{}');
