INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_yakuza','yakuza',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_yakuza','yakuza',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_yakuza', 'yakuza', 1)
;

INSERT INTO `jobs` (`name`, `label`,`whitelisted`) VALUES
('yakuza', 'yakuza', 1);

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('yakuza', 0, 'soldato', 'recrue', 1500, '{}', '{}'),
('yakuza', 1, 'capo', 'Soldat', 1800, '{}', '{}'),
('yakuza', 2, 'consigliere', 'Lieutenant', 2100, '{}', '{}'),
('yakuza', 3, 'boss', 'Boss des Yakuza', 2700, '{}', '{}');

CREATE TABLE `fine_types_yakuza` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  
  PRIMARY KEY (`id`)
);

INSERT INTO `fine_types_yakuza` (label, amount, category) VALUES 
	('Raket',3000,0),
	('Raket',5000,0),
	('Raket',10000,1),
	('Raket',20000,1),
	('Raket',50000,2),
	('Raket',150000,3),
	('Raket',350000,3)
;
