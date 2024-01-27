use java;

CREATE TABLE `java`.`login_table` (
  `id` INT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

INSERT INTO java.login_table (
	username, password)
    VALUES('test@gmail.com','testpassword');
    
SELECT * FROM java.login_table;