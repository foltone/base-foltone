-- Listage de la structure de la table nl. user_sim
CREATE TABLE IF NOT EXISTS user_sim (
  id int(11) NOT NULL AUTO_INCREMENT,
  identifier varchar(555) NOT NULL,
  number varchar(555) NOT NULL,
  label varchar(555) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`, `weight`) VALUES ('sim', 'Carte-SIM', '5', '0', '1', '0')
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`, `weight`) VALUES ('tel', 'Téléphone', '5', '0', '1', '0')
