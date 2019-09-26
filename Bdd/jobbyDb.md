-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema jobbydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema jobbydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `jobbydb` ;
USE `jobbydb` ;

-- -----------------------------------------------------
-- Table `jobbydb`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jobbydb`.`address` (
  `addressId` INT NOT NULL AUTO_INCREMENT,
  `addressCode` INT NULL,
  `addressStreetType` VARCHAR(45) NULL,
  `addressStreetName` VARCHAR(45) NULL,
  `addressCity` TINYTEXT NULL,
  `addressType` VARCHAR(45) NULL,
  `addressZipCode` INT NULL,
  `addressCountry` VARCHAR(100) NULL,
  `addressRegion` VARCHAR(45) NULL,
  `addressBuildingName` VARCHAR(45) NULL,
  `addressBuildingNumber` INT NULL,
  `addressFloorNumber` INT NULL,
  `addressIsArchived` TINYINT(1) NULL,
  `addressCreationDateTime` DATETIME NULL DEFAULT now(),
  `address_userId` INT NULL,
  `address_proId` INT NULL,
  PRIMARY KEY (`addressId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jobbydb`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jobbydb`.`comment` (
  `commentId` INT NOT NULL AUTO_INCREMENT,
  `commentCode` INT NULL,
  `commentLabel` VARCHAR(45) NULL,
  `commentText` TINYTEXT NULL,
  `commentIsArchived` TINYINT(1) NULL,
  `commentCreationDateTime` DATETIME NULL DEFAULT now(),
  `commentType` TINYTEXT NULL,
  `comment_userId` INT NULL,
  `comment_proId` INT NULL,
  `comment_demandId` INT NULL,
  PRIMARY KEY (`commentId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jobbydb`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jobbydb`.`review` (
  `reviewId` INT NOT NULL AUTO_INCREMENT,
  `reviewCode` INT NULL,
  `reviewLabel` VARCHAR(100) NULL,
  `reviewIsArchived` TINYINT(1) NULL,
  `reviewNotice` TINYTEXT NULL,
  `reviewRatio` INT NULL,
  `reviewCreationDateTime` DATETIME NULL DEFAULT now(),
  `review_userId` INT NULL,
  `review_proId` INT NULL,
  PRIMARY KEY (`reviewId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jobbydb`.`demandQuestion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jobbydb`.`demandQuestion` (
  `demandQuestionId` INT NOT NULL AUTO_INCREMENT,
  `demandQuestion_demandId` INT NULL,
  `demandQuestion_questionId` INT NULL,
  `demandQuestion_clientAnswer` INT NULL,
  PRIMARY KEY (`demandQuestionId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jobbydb`.`demand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jobbydb`.`demand` (
  `userDemandId` INT NOT NULL AUTO_INCREMENT,
  `userDemandCode` INT NULL,
  `userDemand` TINYTEXT NULL,
  `userDemandIsArchived` TINYINT(1) NULL,
  `userDemandCreationDateTime` DATETIME NULL DEFAULT now(),
  `demand_userId` INT NULL,
  `demand_categoryId` INT NULL,
  PRIMARY KEY (`userDemandId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jobbydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jobbydb`.`user` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `userCode` VARCHAR(45) NULL,
  `userLastName` VARCHAR(45) NULL,
  `userFirstName` VARCHAR(45) NULL,
  `userName` VARCHAR(45) NULL,
  `userPassword` VARCHAR(45) NULL,
  `userGender` VARCHAR(45) NULL,
  `userBirthDate` INT NULL,
  `userAvatar` VARCHAR(255) NULL,
  `userType` VARCHAR(255) NULL,
  `userPhone` VARCHAR(45) NULL,
  `userEmail` VARCHAR(255) NULL,
  `userIsArchived` TINYINT(1) NULL,
  `userCreationDateTime` DATETIME NULL DEFAULT now(),
  PRIMARY KEY (`userId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jobbydb`.`proProfession`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jobbydb`.`proProfession` (
  `proProfessionId` INT NOT NULL AUTO_INCREMENT,
  `proProfession_professionId` INT NULL,
  `proProfession_proId` INT NULL,
  PRIMARY KEY (`proProfessionId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jobbydb`.`pro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jobbydb`.`pro` (
  `proId` INT NOT NULL AUTO_INCREMENT,
  `proCode` VARCHAR(45) NULL,
  `proLastName` VARCHAR(45) NULL,
  `proFirstName` VARCHAR(45) NULL,
  `proName` VARCHAR(45) NULL,
  `proPassword` VARCHAR(45) NULL,
  `proGender` VARCHAR(45) NULL,
  `proBirthDate` INT NULL,
  `proAvatar` VARCHAR(255) NULL,
  `proType` VARCHAR(255) NULL,
  `proPhone` VARCHAR(45) NULL,
  `proEmail` VARCHAR(255) NULL,
  `proIsArchived` TINYINT(1) NULL,
  `proCreationDateTime` DATETIME NULL DEFAULT now(),
  PRIMARY KEY (`proId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jobbydb`.`profession`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jobbydb`.`profession` (
  `professionID` INT NOT NULL AUTO_INCREMENT,
  `professionCode` INT NULL,
  `professionLabel` VARCHAR(100) NULL,
  `professionImage` TINYTEXT NULL,
  `professionIsArchived` TINYINT(1) NULL,
  `professionCreationDateTime` DATETIME NULL DEFAULT now(),
  PRIMARY KEY (`professionID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jobbydb`.`clientAnswer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jobbydb`.`clientAnswer` (
  `clientAnswerId` INT NOT NULL AUTO_INCREMENT,
  `clientAnswerCode` INT NULL,
  `clientAnswerLabel` VARCHAR(45) NULL,
  `clientAnswerType` VARCHAR(45) NULL,
  `clientAnswerOrder` VARCHAR(45) NULL,
  `clientAnswerText` TINYTEXT NULL,
  `clientAnswerIsArchived` TINYINT(1) NULL,
  `clientAnswerCreationDateTime` DATETIME NULL DEFAULT now(),
  `clientAnswer_possibleResponseId` INT NULL,
  PRIMARY KEY (`clientAnswerId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jobbydb`.`possibleResponse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jobbydb`.`possibleResponse` (
  `possibleResponseId` INT NOT NULL AUTO_INCREMENT,
  `possibleResponseCode` INT NULL,
  `possibleResponseLabel` VARCHAR(45) NULL,
  `possibleResponseType` VARCHAR(45) NULL,
  `possibleResponseOrder` VARCHAR(45) NULL,
  `possibleResponseIsArchived` TINYINT(1) NULL,
  `possibleResponseCreationDateTime` DATETIME NULL DEFAULT now(),
  `possibleResponse_questionId` INT NULL,
  PRIMARY KEY (`possibleResponseId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jobbydb`.`questionType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jobbydb`.`questionType` (
  `questionTypeId` INT NOT NULL AUTO_INCREMENT,
  `questionTypeCode` INT NULL,
  `questionTypeLabel` VARCHAR(45) NULL,
  `questionType_questionId` INT NULL,
  PRIMARY KEY (`questionTypeId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jobbydb`.`question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jobbydb`.`question` (
  `questionId` INT NOT NULL AUTO_INCREMENT,
  `questionCode` INT NULL,
  `questionLabel` VARCHAR(45) NULL,
  `questionType` VARCHAR(45) NULL,
  `questionOrder` INT NULL,
  `questionIsArchived` TINYINT(1) NULL,
  `questionCreationDateTime` DATETIME NULL DEFAULT now(),
  `question_categoryId` INT NULL,
  PRIMARY KEY (`questionId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jobbydb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jobbydb`.`category` (
  `categoryId` INT NOT NULL AUTO_INCREMENT,
  `categoryCode` INT NULL,
  `categoryLabel` VARCHAR(45) NULL,
  `categoryImage` TINYTEXT NULL,
  `categoryDescription` TINYTEXT NULL,
  `categoryIsArchived` TINYINT(1) NULL,
  `categoryCreationDateTime` DATETIME NULL DEFAULT now(),
  `categoryParentId` INT NULL,
  `categoryIsService` TINYINT(1) NULL,
  PRIMARY KEY (`categoryId`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
