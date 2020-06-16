CREATE DATABASE IF NOT EXISTS `dog_breed_login` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dog_breed_login`;

CREATE TABLE IF NOT EXISTS `accounts` (
	`id` int NOT NULL AUTO_INCREMENT,
  	`username` varchar(50) NOT NULL,
  	`password` varchar(255) NOT NULL,
  	`email` varchar(100) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `accounts` (`id`, `username`, `password`, `email`) VALUES (1, 'test', 'test', 'test@test.com');
INSERT INTO `accounts` (`id`, `username`, `password`, `email`) VALUES (2, 'pati', 'pati', 'truta_georgiana@yahoo.com');
INSERT INTO `accounts` (`id`, `username`, `password`, `email`) VALUES (3, 'dia', 'dia', 'truta_diana@yahoo.com');