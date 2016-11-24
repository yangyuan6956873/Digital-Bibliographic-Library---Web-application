-- MySQL Script generated by MySQL Workbench
-- Sun Sep 18 14:39:54 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema comp9321Ass2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `comp9321Ass2` ;

-- -----------------------------------------------------
-- Schema comp9321Ass2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `comp9321Ass2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `comp9321Ass2` ;

-- -----------------------------------------------------
-- Table `comp9321Ass2`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comp9321Ass2`.`Users` ;

CREATE TABLE IF NOT EXISTS `comp9321Ass2`.`Users` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `username` VARCHAR(45) NOT NULL COMMENT '',
  `password` VARCHAR(45) NOT NULL COMMENT '',
  `email` VARCHAR(145) NULL COMMENT '',
  `yearOfBirth` INT NULL COMMENT '',
  `address` VARCHAR(245) NULL COMMENT '',
  `creditcard` VARCHAR(45) NULL COMMENT '',
  `hash` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  UNIQUE INDEX `username_UNIQUE` (`username` ASC)  COMMENT '',
  UNIQUE INDEX `hash_UNIQUE` (`hash` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comp9321Ass2`.`Items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comp9321Ass2`.`Items` ;

CREATE TABLE IF NOT EXISTS `comp9321Ass2`.`Items` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `publtype` VARCHAR(45) NULL COMMENT '',
  `venues` VARCHAR(45) NULL COMMENT '',
  `mdate` DATETIME NULL COMMENT '',
  `Itemscol` VARCHAR(45) NULL COMMENT '',
  `stock` INT NULL COMMENT '',
  `isPaused` TINYINT(1) NULL COMMENT '',
  `Users_Id` INT NOT NULL COMMENT '',
  `title` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_Items_Users_idx` (`Users_Id` ASC)  COMMENT '',
  CONSTRAINT `fk_Items_Users`
    FOREIGN KEY (`Users_Id`)
    REFERENCES `comp9321Ass2`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comp9321Ass2`.`ShoppingCart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comp9321Ass2`.`ShoppingCart` ;

CREATE TABLE IF NOT EXISTS `comp9321Ass2`.`ShoppingCart` (
  `Users_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Users_id`)  COMMENT '',
  INDEX `fk_Users_has_Items_Users1_idx` (`Users_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Users_has_Items_Users1`
    FOREIGN KEY (`Users_id`)
    REFERENCES `comp9321Ass2`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comp9321Ass2`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comp9321Ass2`.`Orders` ;

CREATE TABLE IF NOT EXISTS `comp9321Ass2`.`Orders` (
  `id` INT NOT NULL COMMENT '',
  `Users_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_Users_has_Items_Users2_idx` (`Users_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Users_has_Items_Users2`
    FOREIGN KEY (`Users_id`)
    REFERENCES `comp9321Ass2`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comp9321Ass2`.`OrderItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comp9321Ass2`.`OrderItems` ;

CREATE TABLE IF NOT EXISTS `comp9321Ass2`.`OrderItems` (
  `Order_Users_id` INT NOT NULL COMMENT '',
  `quantity` INT NOT NULL COMMENT '',
  `Items_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Order_Users_id`)  COMMENT '',
  INDEX `fk_OrderItems_Items1_idx` (`Items_id` ASC)  COMMENT '',
  CONSTRAINT `fk_OrderItems_Order1`
    FOREIGN KEY (`Order_Users_id`)
    REFERENCES `comp9321Ass2`.`Orders` (`Users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderItems_Items1`
    FOREIGN KEY (`Items_id`)
    REFERENCES `comp9321Ass2`.`Items` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comp9321Ass2`.`ShoppingCartItem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comp9321Ass2`.`ShoppingCartItem` ;

CREATE TABLE IF NOT EXISTS `comp9321Ass2`.`ShoppingCartItem` (
  `ShoppingCart_Users_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`ShoppingCart_Users_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comp9321Ass2`.`ShoppingCartItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comp9321Ass2`.`ShoppingCartItems` ;

CREATE TABLE IF NOT EXISTS `comp9321Ass2`.`ShoppingCartItems` (
  `ShoppingCart_Users_id` INT NOT NULL COMMENT '',
  `Items_id` INT NOT NULL COMMENT '',
  `quantity` INT NOT NULL COMMENT '',
  INDEX `fk_ShoppingCartItems_ShoppingCart1_idx` (`ShoppingCart_Users_id` ASC)  COMMENT '',
  INDEX `fk_ShoppingCartItems_Items1_idx` (`Items_id` ASC)  COMMENT '',
  CONSTRAINT `fk_ShoppingCartItems_ShoppingCart1`
    FOREIGN KEY (`ShoppingCart_Users_id`)
    REFERENCES `comp9321Ass2`.`ShoppingCart` (`Users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ShoppingCartItems_Items1`
    FOREIGN KEY (`Items_id`)
    REFERENCES `comp9321Ass2`.`Items` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comp9321Ass2`.`Authors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comp9321Ass2`.`Authors` ;

CREATE TABLE IF NOT EXISTS `comp9321Ass2`.`Authors` (
  `id` INT NOT NULL COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comp9321Ass2`.`write`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comp9321Ass2`.`write` ;

CREATE TABLE IF NOT EXISTS `comp9321Ass2`.`write` (
  `Items_id` INT NOT NULL COMMENT '',
  `Authors_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Items_id`, `Authors_id`)  COMMENT '',
  INDEX `fk_Items_has_Authors_Authors1_idx` (`Authors_id` ASC)  COMMENT '',
  INDEX `fk_Items_has_Authors_Items1_idx` (`Items_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Items_has_Authors_Items1`
    FOREIGN KEY (`Items_id`)
    REFERENCES `comp9321Ass2`.`Items` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Items_has_Authors_Authors1`
    FOREIGN KEY (`Authors_id`)
    REFERENCES `comp9321Ass2`.`Authors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;