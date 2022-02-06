DELETE FROM `addon_account` WHERE `name` = 'society_icebox';
INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_icebox', 'icebox', 1)
;

DELETE FROM `jobs` WHERE `name` = 'icebox';
INSERT INTO `jobs` (name, label) VALUES
	('icebox', 'icebox')
;

DELETE FROM `job_grades` WHERE `job_name` = 'icebox';
INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('icebox',0,'goldsmith','Goldsmith',20,'{}','{}'),
	('icebox',1,'shopkeeper','Shopkeeper',40,'{}','{}'),
	('icebox',2,'manager','Manager',60,'{}','{}'),
	('icebox',3,'boss','Owner',100,'{}','{}')
;
