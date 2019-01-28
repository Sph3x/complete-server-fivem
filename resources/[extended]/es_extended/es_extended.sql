USE `essentialmode`;

ALTER TABLE `users`
	ADD COLUMN `org` varchar(255) NULL DEFAULT 'freecity' AFTER `job_grade`,
	ADD COLUMN `org_gradeorg` INT NULL DEFAULT 0 AFTER `org`
;

CREATE TABLE `org_gradeorg` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`org_name` varchar(255) DEFAULT NULL,
	`gradeorg` int(11) NOT NULL,
	`name` varchar(255) NOT NULL,
	`label` varchar(255) NOT NULL,
	`salary` int(11) NOT NULL,
	`skin_male` longtext NOT NULL,
	`skin_female` longtext NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `org_gradeorg` VALUES (1,'recrue',0,'org','Citoyen',200,'{}','{}');

CREATE TABLE `org` (
	`name` varchar(50) NOT NULL,
	`label` varchar(255) DEFAULT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `org` VALUES ('org','Citoyen');
