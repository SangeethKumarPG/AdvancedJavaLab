

CREATE TABLE `java`.`Registration` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `country` VARCHAR(65) NULL,
  PRIMARY KEY (`id`));
  
ALTER TABLE `java`.`Registration` 
ADD COLUMN `email` VARCHAR(65) NOT NULL AFTER `country`,
ADD UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE;
;

