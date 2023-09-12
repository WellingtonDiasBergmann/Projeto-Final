-- MySQL Script generated by MySQL Workbench
-- Tue Sep 12 16:38:58 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TrabalhoFinal
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `TrabalhoFinal` ;

-- -----------------------------------------------------
-- Schema TrabalhoFinal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TrabalhoFinal` DEFAULT CHARACTER SET utf8 ;
USE `TrabalhoFinal` ;

-- -----------------------------------------------------
-- Table `TrabalhoFinal`.`Pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TrabalhoFinal`.`Pessoa` ;

CREATE TABLE IF NOT EXISTS `TrabalhoFinal`.`Pessoa` (
  `ID_Pessoa` INT NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `Usuario` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_Pessoa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TrabalhoFinal`.`Equipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TrabalhoFinal`.`Equipe` ;

CREATE TABLE IF NOT EXISTS `TrabalhoFinal`.`Equipe` (
  `ID_Equipe` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_Equipe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TrabalhoFinal`.`Projeto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TrabalhoFinal`.`Projeto` ;

CREATE TABLE IF NOT EXISTS `TrabalhoFinal`.`Projeto` (
  `ID_Projeto` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  `DataEntrega` DATE NOT NULL,
  `DataInicial` DATE NOT NULL,
  `ID_Equipe` INT NOT NULL,
  PRIMARY KEY (`ID_Projeto`),
  INDEX `fk_Projeto_Equipe1_idx` (`ID_Equipe` ASC) VISIBLE,
  CONSTRAINT `fk_Projeto_Equipe1`
    FOREIGN KEY (`ID_Equipe`)
    REFERENCES `TrabalhoFinal`.`Equipe` (`ID_Equipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TrabalhoFinal`.`Tarefa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TrabalhoFinal`.`Tarefa` ;

CREATE TABLE IF NOT EXISTS `TrabalhoFinal`.`Tarefa` (
  `ID_Tarefa` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  `HorasTrabalhadas` TIME NOT NULL,
  `ID_Projeto` INT NOT NULL,
  `ID_Pessoa` INT NOT NULL,
  PRIMARY KEY (`ID_Tarefa`),
  INDEX `fk_Tarefa_Projeto1_idx` (`ID_Projeto` ASC) VISIBLE,
  INDEX `fk_Tarefa_Pessoa1_idx` (`ID_Pessoa` ASC) VISIBLE,
  CONSTRAINT `fk_Tarefa_Projeto1`
    FOREIGN KEY (`ID_Projeto`)
    REFERENCES `TrabalhoFinal`.`Projeto` (`ID_Projeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tarefa_Pessoa1`
    FOREIGN KEY (`ID_Pessoa`)
    REFERENCES `TrabalhoFinal`.`Pessoa` (`ID_Pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TrabalhoFinal`.`Pessoa_has_Equipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TrabalhoFinal`.`Pessoa_has_Equipe` ;

CREATE TABLE IF NOT EXISTS `TrabalhoFinal`.`Pessoa_has_Equipe` (
  `Pessoa_ID_Pessoa` INT NOT NULL,
  `Equipe_ID_Equipe` INT NOT NULL,
  PRIMARY KEY (`Pessoa_ID_Pessoa`, `Equipe_ID_Equipe`),
  INDEX `fk_Pessoa_has_Equipe_Equipe1_idx` (`Equipe_ID_Equipe` ASC) VISIBLE,
  INDEX `fk_Pessoa_has_Equipe_Pessoa1_idx` (`Pessoa_ID_Pessoa` ASC) VISIBLE,
  CONSTRAINT `fk_Pessoa_has_Equipe_Pessoa1`
    FOREIGN KEY (`Pessoa_ID_Pessoa`)
    REFERENCES `TrabalhoFinal`.`Pessoa` (`ID_Pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoa_has_Equipe_Equipe1`
    FOREIGN KEY (`Equipe_ID_Equipe`)
    REFERENCES `TrabalhoFinal`.`Equipe` (`ID_Equipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
