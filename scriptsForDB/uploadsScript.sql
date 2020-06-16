CREATE DATABASE IF NOT EXISTS `dog_breed_login` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dog_breed_login`;

CREATE TABLE IF NOT EXISTS `uploads` (
	`id` int NOT NULL AUTO_INCREMENT,
  	`name` varchar(50) NOT NULL,
  	`date_of_creation` varchar(255) NOT NULL,
    `predicted_class` varchar(255) NOT NULL,
    `accuracy` varchar(255) NOT NULL, 
    `account_id` int,
    INDEX `account_id` (account_id),
    FOREIGN KEY (account_id)
        REFERENCES accounts(id)
        ON DELETE CASCADE, 
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;