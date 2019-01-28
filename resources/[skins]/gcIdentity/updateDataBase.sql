-- add fields for gcIdentity
ALTER TABLE `users`
	ADD COLUMN `lastname` varchar(128) NOT NULL DEFAULT '' ,
	ADD COLUMN `firstname` varchar(128) NOT NULL DEFAULT '' ,
	ADD COLUMN `dateOfBirth` date DEFAULT '1980-01-01' ,
	ADD COLUMN `sex` varchar(1) NOT NULL DEFAULT 'm' ,
	ADD COLUMN `height` int(10) unsigned NOT NULL DEFAULT '0' ;