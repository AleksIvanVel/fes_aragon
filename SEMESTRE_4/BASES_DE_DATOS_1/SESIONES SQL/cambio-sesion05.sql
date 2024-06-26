-- MySQL Workbench Synchronization
-- Generated: 2023-03-14 11:48
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: makfi

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `colegio`.`alumno_salon` 
ADD COLUMN `id` INT(11) NOT NULL AUTO_INCREMENT AFTER `activo`,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id`);
;

ALTER TABLE `colegio`.`alumnos` 
ADD INDEX `fk_estado_idx` (`id_estado` ASC) VISIBLE;
;

ALTER TABLE `colegio`.`pagos` 
ADD INDEX `fk_alumnos_idx` (`clave_alu` ASC) VISIBLE;
;

ALTER TABLE `colegio`.`alumnos` 
ADD CONSTRAINT `fk_estado`
  FOREIGN KEY (`id_estado`)
  REFERENCES `colegio`.`estados` (`id_estado`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `colegio`.`pagos` 
ADD CONSTRAINT `fk_alumnos`
  FOREIGN KEY (`clave_alu`)
  REFERENCES `colegio`.`alumnos` (`clave_alu`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
