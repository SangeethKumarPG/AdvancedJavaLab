show databases;
create database java;
use java;
show tables;
CREATE TABLE `java`.`student` (
  `id` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `age` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
ALTER TABLE `java`.`student` CHANGE COLUMN `id` `id` INT NOT NULL AUTO_INCREMENT ;
 
 
  



