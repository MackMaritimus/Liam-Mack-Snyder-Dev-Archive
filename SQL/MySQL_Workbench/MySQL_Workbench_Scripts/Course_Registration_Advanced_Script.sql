-- MySQL Script generated by MySQL Workbench
-- Tue May 13 09:13:59 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`INSTRUCTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`INSTRUCTOR` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Instructors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Instructors` (
  `instructorID` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `phoneNumber` CHAR(10) NULL,
  PRIMARY KEY (`instructorID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Department` (
  `deptCode` VARCHAR(4) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `deptOffice` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`deptCode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Courses` (
  `courseID` INT NOT NULL,
  `courseName` VARCHAR(45) NOT NULL,
  `courseFee` INT NOT NULL,
  `Instructors_instructorID` INT NOT NULL,
  `deptCode` VARCHAR(4) NOT NULL,
  `prereqCode` INT NULL,
  `prereqDepartment` VARCHAR(4) NULL,
  PRIMARY KEY (`courseID`, `deptCode`),
  UNIQUE INDEX `courseName_UNIQUE` (`courseName` ASC) VISIBLE,
  INDEX `fk_Courses_Instructors_idx` (`Instructors_instructorID` ASC) VISIBLE,
  INDEX `fk_Courses_Department1_idx` (`deptCode` ASC) VISIBLE,
  INDEX `fk_Courses_Courses1_idx` (`prereqCode` ASC, `prereqDepartment` ASC) VISIBLE,
  CONSTRAINT `fk_Courses_Instructors`
    FOREIGN KEY (`Instructors_instructorID`)
    REFERENCES `mydb`.`Instructors` (`instructorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Courses_Department1`
    FOREIGN KEY (`deptCode`)
    REFERENCES `mydb`.`Department` (`deptCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Courses_Courses1`
    FOREIGN KEY (`prereqCode` , `prereqDepartment`)
    REFERENCES `mydb`.`Courses` (`courseID` , `deptCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Students` (
  `studentID` INT NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `phoneNumber` CHAR(10) NULL,
  `instructorcol` VARCHAR(45) NULL,
  PRIMARY KEY (`studentID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Has/Takes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Has/Takes` (
  `courseID` INT NOT NULL,
  `deptCode` VARCHAR(4) NOT NULL,
  `Students_studentID` INT NOT NULL,
  `finalGrade` VARCHAR(2) NULL,
  PRIMARY KEY (`courseID`, `deptCode`, `Students_studentID`),
  INDEX `fk_Courses_has_Students_Students1_idx` (`Students_studentID` ASC) VISIBLE,
  INDEX `fk_Courses_has_Students_Courses1_idx` (`courseID` ASC, `deptCode` ASC) VISIBLE,
  CONSTRAINT `fk_Courses_has_Students_Courses1`
    FOREIGN KEY (`courseID` , `deptCode`)
    REFERENCES `mydb`.`Courses` (`courseID` , `deptCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Courses_has_Students_Students1`
    FOREIGN KEY (`Students_studentID`)
    REFERENCES `mydb`.`Students` (`studentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`graduateStudents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`graduateStudents` (
  `studentID` INT NOT NULL,
  `degreeProgram` VARCHAR(45) NOT NULL,
  `graduateStudentscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`studentID`),
  CONSTRAINT `fk_graduateStudents_Students1`
    FOREIGN KEY (`studentID`)
    REFERENCES `mydb`.`Students` (`studentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`undergradStudents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`undergradStudents` (
  `studentID` INT NOT NULL,
  `classYear` VARCHAR(45) NOT NULL,
  `advisorsName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`studentID`),
  CONSTRAINT `fk_undergradStudents_Students1`
    FOREIGN KEY (`studentID`)
    REFERENCES `mydb`.`Students` (`studentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
