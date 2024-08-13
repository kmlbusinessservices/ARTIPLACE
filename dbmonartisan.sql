-- MySQL Script generated by MySQL Workbench
-- 08/03/24 17:02:19
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`administrateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`administrateur` (
  `idadministrateur` INT NOT NULL AUTO_INCREMENT,
  `nom-administrateur` VARCHAR(45) NOT NULL,
  `prenom-administrateur` VARCHAR(45) NOT NULL,
  `sexe-administrateur` VARCHAR(45) NOT NULL,
  `contact-administrateur` VARCHAR(45) NOT NULL,
  `email-administrateur` VARCHAR(45) NOT NULL,
  `mot-de-passe administrateur` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`idadministrateur`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`artisan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`artisan` (
  `idartisan` INT NOT NULL AUTO_INCREMENT,
  `Nom-artisan` VARCHAR(45) NOT NULL,
  `Prenom-artisan` VARCHAR(60) NOT NULL,
  `Sexe-artisan` VARCHAR(45) NOT NULL,
  `contact-artisan` VARCHAR(45) NOT NULL,
  `Année-experience-artisan` VARCHAR(45) NOT NULL,
  `Email-artisan` VARCHAR(45) NOT NULL,
  `Geo-localisation` VARCHAR(60) NOT NULL,
  `Mot-de-passe-artisan` VARCHAR(250) NOT NULL,
  `administrateur_idadministrateur` INT NOT NULL,
  PRIMARY KEY (`idartisan`, `administrateur_idadministrateur`),
  INDEX `fk_artisan_administrateur1_idx` (`administrateur_idadministrateur` ASC),
  CONSTRAINT `fk_artisan_administrateur1`
    FOREIGN KEY (`administrateur_idadministrateur`)
    REFERENCES `mydb`.`administrateur` (`idadministrateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`type-artisan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`type-artisan` (
  `idtype-artisan` INT NOT NULL AUTO_INCREMENT,
  `nom-type-artisan` VARCHAR(45) NOT NULL,
  `description-artisan` VARCHAR(60) NULL,
  `artisan_idartisan` INT NOT NULL,
  `artisan_administrateur_idadministrateur` INT NOT NULL,
  PRIMARY KEY (`idtype-artisan`, `artisan_idartisan`, `artisan_administrateur_idadministrateur`),
  INDEX `fk_type-artisan_artisan1_idx` (`artisan_idartisan` ASC, `artisan_administrateur_idadministrateur` ASC),
  CONSTRAINT `fk_type-artisan_artisan1`
    FOREIGN KEY (`artisan_idartisan` , `artisan_administrateur_idadministrateur`)
    REFERENCES `mydb`.`artisan` (`idartisan` , `administrateur_idadministrateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clients` (
  `idclients` INT NOT NULL AUTO_INCREMENT,
  `nom-clients` VARCHAR(45) NOT NULL,
  `prenom-clients` VARCHAR(45) NOT NULL,
  `sexe-clients` VARCHAR(45) NOT NULL,
  `contact-clients` VARCHAR(45) NOT NULL,
  `email-clients` VARCHAR(45) NOT NULL,
  `geo-localisation-artisan` VARCHAR(45) NOT NULL,
  `mot-de-passe-clients` VARCHAR(250) NOT NULL,
  `artisan_idartisan` INT NOT NULL,
  PRIMARY KEY (`idclients`, `artisan_idartisan`),
  INDEX `fk_clients_artisan_idx` (`artisan_idartisan` ASC),
  CONSTRAINT `fk_clients_artisan`
    FOREIGN KEY (`artisan_idartisan`)
    REFERENCES `mydb`.`artisan` (`idartisan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;