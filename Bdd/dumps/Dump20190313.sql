CREATE DATABASE  IF NOT EXISTS `jobbydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `jobbydb`;
-- MySQL dump 10.13  Distrib 8.0.15, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: jobbydb
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `addressCode` tinytext,
  `addressStreetType` varchar(45) DEFAULT NULL,
  `addressStreetName` varchar(45) DEFAULT NULL,
  `addressCity` tinytext,
  `addressType` varchar(45) DEFAULT NULL,
  `addressZipCode` int(11) DEFAULT NULL,
  `addressCountry` varchar(100) DEFAULT NULL,
  `addressRegion` varchar(45) DEFAULT NULL,
  `addressBuildingName` varchar(45) DEFAULT NULL,
  `addressBuildingNumber` int(11) DEFAULT NULL,
  `addressFloorNumber` int(11) DEFAULT NULL,
  `addressIsArchived` tinyint(1) DEFAULT NULL,
  `addressCreationDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `address_userId` int(11) DEFAULT NULL,
  `address_proId` int(11) DEFAULT NULL,
  PRIMARY KEY (`addressId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryCode` tinytext,
  `categoryLabel` tinytext,
  `categoryImage` tinytext,
  `categoryDescription` tinytext,
  `categoryIsArchived` tinyint(1) DEFAULT NULL,
  `categoryCreationDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `categoryParentId` int(11) DEFAULT NULL,
  `categoryIsService` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'category_27c58b72-45ab-11e9-bf5d-acbc32cafef3','Reparation & Bricolage','https://i.imgur.com/1XrPTg8.jpg',NULL,NULL,'2019-03-13 17:15:02',NULL,NULL),(2,'category_27c596fe-45ab-11e9-bf5d-acbc32cafef3','transport','https://i.imgur.com/BZedtDL.jpg',NULL,NULL,'2019-03-13 17:15:02',NULL,NULL),(3,'category_27c59af1-45ab-11e9-bf5d-acbc32cafef3','apprentissage','https://i.imgur.com/GdSFShm.jpg',NULL,NULL,'2019-03-13 17:15:02',NULL,NULL),(4,'category_27c59e12-45ab-11e9-bf5d-acbc32cafef3','multimédia','https://i.imgur.com/I6GSsT9.jpg',NULL,NULL,'2019-03-13 17:15:02',NULL,NULL),(5,'category_2a9126e2-45ab-11e9-bf5d-acbc32cafef3','maison',NULL,NULL,NULL,'2019-03-13 17:15:06',1,NULL),(6,'category_2a9129a7-45ab-11e9-bf5d-acbc32cafef3','multimedia',NULL,NULL,NULL,'2019-03-13 17:15:06',1,NULL),(7,'category_2a912a34-45ab-11e9-bf5d-acbc32cafef3','vehicules',NULL,NULL,NULL,'2019-03-13 17:15:06',1,NULL),(8,'category_2a912a8f-45ab-11e9-bf5d-acbc32cafef3','jardin & exterieur',NULL,NULL,NULL,'2019-03-13 17:15:06',1,NULL),(9,'category_2c405427-45ab-11e9-bf5d-acbc32cafef3','voiture',NULL,NULL,NULL,'2019-03-13 17:15:09',2,NULL),(10,'category_2c4056aa-45ab-11e9-bf5d-acbc32cafef3','covoiturage',NULL,NULL,NULL,'2019-03-13 17:15:09',2,NULL),(11,'category_2c40572c-45ab-11e9-bf5d-acbc32cafef3','demenagement',NULL,NULL,NULL,'2019-03-13 17:15:09',2,NULL),(12,'category_2c405781-45ab-11e9-bf5d-acbc32cafef3','transport marchandise',NULL,NULL,NULL,'2019-03-13 17:15:09',2,NULL),(13,'category_2e778ea6-45ab-11e9-bf5d-acbc32cafef3','web & design',NULL,NULL,NULL,'2019-03-13 17:15:13',3,NULL),(14,'category_2e779178-45ab-11e9-bf5d-acbc32cafef3','cours & conseil',NULL,NULL,NULL,'2019-03-13 17:15:13',3,NULL),(15,'category_2e7791f7-45ab-11e9-bf5d-acbc32cafef3','soin du corps',NULL,NULL,NULL,'2019-03-13 17:15:13',3,NULL),(16,'category_2e779249-45ab-11e9-bf5d-acbc32cafef3','dessin',NULL,NULL,NULL,'2019-03-13 17:15:13',3,NULL),(17,'category_30d21682-45ab-11e9-bf5d-acbc32cafef3','jeux video',NULL,NULL,NULL,'2019-03-13 17:15:17',4,NULL),(18,'category_30d21913-45ab-11e9-bf5d-acbc32cafef3','tablet et smartphone',NULL,NULL,NULL,'2019-03-13 17:15:17',4,NULL),(19,'category_30d21990-45ab-11e9-bf5d-acbc32cafef3','ubuntu',NULL,NULL,NULL,'2019-03-13 17:15:17',4,NULL),(20,'category_30d21a2c-45ab-11e9-bf5d-acbc32cafef3','desktop & laptop',NULL,NULL,NULL,'2019-03-13 17:15:17',4,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientAnswer`
--

DROP TABLE IF EXISTS `clientAnswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clientAnswer` (
  `clientAnswerId` int(11) NOT NULL AUTO_INCREMENT,
  `clientAnswerCode` tinytext,
  `clientAnswerLabel` tinytext,
  `clientAnswerType` varchar(45) DEFAULT NULL,
  `clientAnswerOrder` varchar(45) DEFAULT NULL,
  `clientAnswerText` tinytext,
  `clientAnswerIsArchived` tinyint(1) DEFAULT NULL,
  `clientAnswerCreationDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `clientAnswer_possibleResponseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`clientAnswerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientAnswer`
--

LOCK TABLES `clientAnswer` WRITE;
/*!40000 ALTER TABLE `clientAnswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientAnswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `commentCode` tinytext,
  `commentLabel` tinytext,
  `commentText` tinytext,
  `commentIsArchived` tinyint(1) DEFAULT NULL,
  `commentCreationDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `commentType` tinytext,
  `comment_userId` int(11) DEFAULT NULL,
  `comment_proId` int(11) DEFAULT NULL,
  `comment_demandId` int(11) DEFAULT NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demand`
--

DROP TABLE IF EXISTS `demand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `demand` (
  `userDemandId` int(11) NOT NULL AUTO_INCREMENT,
  `userDemandCode` tinytext,
  `userDemand` tinytext,
  `userDemandIsArchived` tinyint(1) DEFAULT NULL,
  `userDemandCreationDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `demand_userId` int(11) DEFAULT NULL,
  `demand_categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userDemandId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demand`
--

LOCK TABLES `demand` WRITE;
/*!40000 ALTER TABLE `demand` DISABLE KEYS */;
/*!40000 ALTER TABLE `demand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demandQuestion`
--

DROP TABLE IF EXISTS `demandQuestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `demandQuestion` (
  `demandQuestionId` int(11) NOT NULL AUTO_INCREMENT,
  `demandQuestion_demandId` int(11) DEFAULT NULL,
  `demandQuestion_questionCode` tinytext,
  `demandQuestion_clientAnswer` int(11) DEFAULT NULL,
  PRIMARY KEY (`demandQuestionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandQuestion`
--

LOCK TABLES `demandQuestion` WRITE;
/*!40000 ALTER TABLE `demandQuestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `demandQuestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possibleResponse`
--

DROP TABLE IF EXISTS `possibleResponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `possibleResponse` (
  `possibleResponseId` int(11) NOT NULL AUTO_INCREMENT,
  `possibleResponseCode` tinytext,
  `possibleResponseLabel` tinytext,
  `possibleResponseType` varchar(45) DEFAULT NULL,
  `possibleResponseOrder` varchar(45) DEFAULT NULL,
  `possibleResponseIsArchived` tinyint(1) DEFAULT NULL,
  `possibleResponseCreationDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `possibleResponse_questionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`possibleResponseId`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possibleResponse`
--

LOCK TABLES `possibleResponse` WRITE;
/*!40000 ALTER TABLE `possibleResponse` DISABLE KEYS */;
INSERT INTO `possibleResponse` VALUES (1,'possibleResponse_cab972c8-45aa-11e9-bf5d-acbc32cafef3','',NULL,'1000',NULL,'2019-03-13 17:12:25',1),(2,'possibleResponse_cce0344c-45aa-11e9-bf5d-acbc32cafef3','UN PEU DEFECTUEUX',NULL,'1000',NULL,'2019-03-13 17:12:29',2),(3,'possibleResponse_cce038bc-45aa-11e9-bf5d-acbc32cafef3','TRES DEFECTUEUX',NULL,'2000',NULL,'2019-03-13 17:12:29',2),(4,'possibleResponse_cce0394e-45aa-11e9-bf5d-acbc32cafef3','HORS D\'USAGE',NULL,'3000',NULL,'2019-03-13 17:12:29',2),(5,'possibleResponse_4fe0992c-45ab-11e9-bf5d-acbc32cafef3','',NULL,'1000',NULL,'2019-03-13 17:16:09',3),(6,'possibleResponse_516e7d03-45ab-11e9-bf5d-acbc32cafef3','matin',NULL,'1000',NULL,'2019-03-13 17:16:11',4),(7,'possibleResponse_516e8080-45ab-11e9-bf5d-acbc32cafef3','midi',NULL,'2000',NULL,'2019-03-13 17:16:11',4),(8,'possibleResponse_516e8138-45ab-11e9-bf5d-acbc32cafef3','apres midi',NULL,'3000',NULL,'2019-03-13 17:16:11',4),(9,'possibleResponse_516e81b0-45ab-11e9-bf5d-acbc32cafef3','soir',NULL,'4000',NULL,'2019-03-13 17:16:11',4),(10,'possibleResponse_52ea4018-45ab-11e9-bf5d-acbc32cafef3','oui',NULL,'1000',NULL,'2019-03-13 17:16:14',5),(11,'possibleResponse_52ea42b4-45ab-11e9-bf5d-acbc32cafef3','non',NULL,'2000',NULL,'2019-03-13 17:16:14',5),(12,'possibleResponse_54c6d41c-45ab-11e9-bf5d-acbc32cafef3','',NULL,'1000',NULL,'2019-03-13 17:16:17',6),(13,'possibleResponse_573c388c-45ab-11e9-bf5d-acbc32cafef3','',NULL,'1000',NULL,'2019-03-13 17:16:21',7),(14,'possibleResponse_59578e29-45ab-11e9-bf5d-acbc32cafef3','UN PEU DEFECTUEUX',NULL,'1000',NULL,'2019-03-13 17:16:25',8),(15,'possibleResponse_595790ba-45ab-11e9-bf5d-acbc32cafef3','TRES DEFECTUEUX',NULL,'2000',NULL,'2019-03-13 17:16:25',8),(16,'possibleResponse_5957913d-45ab-11e9-bf5d-acbc32cafef3','HORS D\'USAGE',NULL,'3000',NULL,'2019-03-13 17:16:25',8),(17,'possibleResponse_5bc1b1df-45ab-11e9-bf5d-acbc32cafef3','',NULL,'1000',NULL,'2019-03-13 17:16:29',9),(18,'possibleResponse_5d68cfcf-45ab-11e9-bf5d-acbc32cafef3','matin',NULL,'1000',NULL,'2019-03-13 17:16:32',10),(19,'possibleResponse_5d68d2c8-45ab-11e9-bf5d-acbc32cafef3','midi',NULL,'2000',NULL,'2019-03-13 17:16:32',10),(20,'possibleResponse_5d68d377-45ab-11e9-bf5d-acbc32cafef3','apres midi',NULL,'3000',NULL,'2019-03-13 17:16:32',10),(21,'possibleResponse_5d68d3e5-45ab-11e9-bf5d-acbc32cafef3','soir',NULL,'4000',NULL,'2019-03-13 17:16:32',10),(22,'possibleResponse_5f2d1360-45ab-11e9-bf5d-acbc32cafef3','oui',NULL,'1000',NULL,'2019-03-13 17:16:35',11),(23,'possibleResponse_5f2d1653-45ab-11e9-bf5d-acbc32cafef3','non',NULL,'2000',NULL,'2019-03-13 17:16:35',11),(24,'possibleResponse_611c21d7-45ab-11e9-bf5d-acbc32cafef3','',NULL,'1000',NULL,'2019-03-13 17:16:38',12),(25,'possibleResponse_6351dd3f-45ab-11e9-bf5d-acbc32cafef3','UN PEU DEFECTUEUX',NULL,'1000',NULL,'2019-03-13 17:16:41',13),(26,'possibleResponse_6351e0a6-45ab-11e9-bf5d-acbc32cafef3','TRES DEFECTUEUX',NULL,'2000',NULL,'2019-03-13 17:16:41',13),(27,'possibleResponse_6351e174-45ab-11e9-bf5d-acbc32cafef3','HORS D\'USAGE',NULL,'3000',NULL,'2019-03-13 17:16:41',13),(28,'possibleResponse_65029ff0-45ab-11e9-bf5d-acbc32cafef3','',NULL,'1000',NULL,'2019-03-13 17:16:44',14),(29,'possibleResponse_66db6adc-45ab-11e9-bf5d-acbc32cafef3','matin',NULL,'1000',NULL,'2019-03-13 17:16:47',15),(30,'possibleResponse_66db6e65-45ab-11e9-bf5d-acbc32cafef3','midi',NULL,'2000',NULL,'2019-03-13 17:16:47',15),(31,'possibleResponse_66db6f3f-45ab-11e9-bf5d-acbc32cafef3','apres midi',NULL,'3000',NULL,'2019-03-13 17:16:47',15),(32,'possibleResponse_66db6fc9-45ab-11e9-bf5d-acbc32cafef3','soir',NULL,'4000',NULL,'2019-03-13 17:16:47',15),(33,'possibleResponse_68708a58-45ab-11e9-bf5d-acbc32cafef3','oui',NULL,'1000',NULL,'2019-03-13 17:16:50',16),(34,'possibleResponse_68708d64-45ab-11e9-bf5d-acbc32cafef3','non',NULL,'2000',NULL,'2019-03-13 17:16:50',16),(35,'possibleResponse_6c1e5ba0-45ab-11e9-bf5d-acbc32cafef3','',NULL,'1000',NULL,'2019-03-13 17:16:56',17),(36,'possibleResponse_6dde6382-45ab-11e9-bf5d-acbc32cafef3','',NULL,'1000',NULL,'2019-03-13 17:16:59',18),(37,'possibleResponse_6fb19f9e-45ab-11e9-bf5d-acbc32cafef3','',NULL,'1000',NULL,'2019-03-13 17:17:02',19),(38,'possibleResponse_716769ec-45ab-11e9-bf5d-acbc32cafef3','UN PEU DEFECTUEUX',NULL,'1000',NULL,'2019-03-13 17:17:05',20),(39,'possibleResponse_71676cb2-45ab-11e9-bf5d-acbc32cafef3','TRES DEFECTUEUX',NULL,'2000',NULL,'2019-03-13 17:17:05',20),(40,'possibleResponse_71676d7d-45ab-11e9-bf5d-acbc32cafef3','HORS D\'USAGE',NULL,'3000',NULL,'2019-03-13 17:17:05',20),(41,'possibleResponse_7376db78-45ab-11e9-bf5d-acbc32cafef3','',NULL,'1000',NULL,'2019-03-13 17:17:09',21),(42,'possibleResponse_76bbe1aa-45ab-11e9-bf5d-acbc32cafef3','matin',NULL,'1000',NULL,'2019-03-13 17:17:14',22),(43,'possibleResponse_76bbe493-45ab-11e9-bf5d-acbc32cafef3','midi',NULL,'2000',NULL,'2019-03-13 17:17:14',22),(44,'possibleResponse_76bbe52f-45ab-11e9-bf5d-acbc32cafef3','apres midi',NULL,'3000',NULL,'2019-03-13 17:17:14',22),(45,'possibleResponse_76bbe59e-45ab-11e9-bf5d-acbc32cafef3','soir',NULL,'4000',NULL,'2019-03-13 17:17:14',22),(46,'possibleResponse_78d22736-45ab-11e9-bf5d-acbc32cafef3','oui',NULL,'1000',NULL,'2019-03-13 17:17:18',23),(47,'possibleResponse_78d22a13-45ab-11e9-bf5d-acbc32cafef3','non',NULL,'2000',NULL,'2019-03-13 17:17:18',23),(48,'possibleResponse_7a65d67f-45ab-11e9-bf5d-acbc32cafef3','',NULL,'1000',NULL,'2019-03-13 17:17:20',24);
/*!40000 ALTER TABLE `possibleResponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro`
--

DROP TABLE IF EXISTS `pro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pro` (
  `proId` int(11) NOT NULL AUTO_INCREMENT,
  `proCode` tinytext,
  `proLastName` varchar(45) DEFAULT NULL,
  `proFirstName` varchar(45) DEFAULT NULL,
  `proName` varchar(45) DEFAULT NULL,
  `proPassword` varchar(45) DEFAULT NULL,
  `proGender` varchar(45) DEFAULT NULL,
  `proBirthDate` int(11) DEFAULT NULL,
  `proAvatar` varchar(255) DEFAULT NULL,
  `proType` varchar(255) DEFAULT NULL,
  `proPhone` varchar(45) DEFAULT NULL,
  `proEmail` varchar(255) DEFAULT NULL,
  `proIsArchived` tinyint(1) DEFAULT NULL,
  `proCreationDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`proId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro`
--

LOCK TABLES `pro` WRITE;
/*!40000 ALTER TABLE `pro` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proProfession`
--

DROP TABLE IF EXISTS `proProfession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proProfession` (
  `proProfessionId` int(11) NOT NULL AUTO_INCREMENT,
  `proProfession_professionId` int(11) DEFAULT NULL,
  `proProfession_proId` int(11) DEFAULT NULL,
  PRIMARY KEY (`proProfessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proProfession`
--

LOCK TABLES `proProfession` WRITE;
/*!40000 ALTER TABLE `proProfession` DISABLE KEYS */;
/*!40000 ALTER TABLE `proProfession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profession`
--

DROP TABLE IF EXISTS `profession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profession` (
  `professionID` int(11) NOT NULL AUTO_INCREMENT,
  `professionCode` tinytext,
  `professionLabel` varchar(100) DEFAULT NULL,
  `professionImage` tinytext,
  `professionIsArchived` tinyint(1) DEFAULT NULL,
  `professionCreationDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`professionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profession`
--

LOCK TABLES `profession` WRITE;
/*!40000 ALTER TABLE `profession` DISABLE KEYS */;
/*!40000 ALTER TABLE `profession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question` (
  `questionId` int(11) NOT NULL AUTO_INCREMENT,
  `questionCode` tinytext,
  `questionLabel` tinytext,
  `questionType` varchar(45) DEFAULT NULL,
  `questionOrder` int(11) DEFAULT NULL,
  `questionIsArchived` tinyint(1) DEFAULT NULL,
  `questionCreationDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `question_categoryId` int(11) DEFAULT NULL,
  `question_questionType` int(11) DEFAULT NULL,
  PRIMARY KEY (`questionId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'question_b807b722-45aa-11e9-bf5d-acbc32cafef3','quel type de materiel avez-vous besoin de reparer ?',NULL,1000,NULL,'2019-03-13 17:11:54',5,NULL),(2,'question_b807b99e-45aa-11e9-bf5d-acbc32cafef3','dans quel etat ce trouve le materiel ?',NULL,2000,NULL,'2019-03-13 17:11:54',5,NULL),(3,'question_b807ba7f-45aa-11e9-bf5d-acbc32cafef3','quel jour seriez-vous disponible pour recevoir un jobbeur ?',NULL,3000,NULL,'2019-03-13 17:11:54',5,NULL),(4,'question_b807bb11-45aa-11e9-bf5d-acbc32cafef3','dans quel creneau horaire ?',NULL,4000,NULL,'2019-03-13 17:11:54',5,NULL),(5,'question_b807bbb4-45aa-11e9-bf5d-acbc32cafef3','votre domicile possede t\'il un ascenseur ?',NULL,5000,NULL,'2019-03-13 17:11:54',5,NULL),(6,'question_b807bc38-45aa-11e9-bf5d-acbc32cafef3','avez-vous une remarque suplementaire a faire ?',NULL,6000,NULL,'2019-03-13 17:11:54',5,NULL),(7,'question_c7499f2f-45aa-11e9-bf5d-acbc32cafef3','quel type de materiel avez-vous besoin de reparer ?',NULL,1000,NULL,'2019-03-13 17:12:20',6,NULL),(8,'question_c749a1c9-45aa-11e9-bf5d-acbc32cafef3','dans quel etat ce trouve le materiel ?',NULL,2000,NULL,'2019-03-13 17:12:20',6,NULL),(9,'question_c749a290-45aa-11e9-bf5d-acbc32cafef3','quel jour seriez-vous disponible pour recevoir un jobbeur ?',NULL,3000,NULL,'2019-03-13 17:12:20',6,NULL),(10,'question_c749a2ed-45aa-11e9-bf5d-acbc32cafef3','dans quel creneau horaire ?',NULL,4000,NULL,'2019-03-13 17:12:20',6,NULL),(11,'question_c749a335-45aa-11e9-bf5d-acbc32cafef3','votre domicile possede t\'il un ascenseur ?',NULL,5000,NULL,'2019-03-13 17:12:20',6,NULL),(12,'question_c749a37d-45aa-11e9-bf5d-acbc32cafef3','avez-vous une remarque suplementaire a faire ?',NULL,6000,NULL,'2019-03-13 17:12:20',6,NULL),(13,'question_3ea48900-45ab-11e9-bf5d-acbc32cafef3','quel type de vehicule avez-vous besoin de reparer ?',NULL,1000,NULL,'2019-03-13 17:15:40',7,NULL),(14,'question_3ea48fe2-45ab-11e9-bf5d-acbc32cafef3','dans quel etat ce trouve le vehicule ?',NULL,2000,NULL,'2019-03-13 17:15:40',7,NULL),(15,'question_3ea4916b-45ab-11e9-bf5d-acbc32cafef3','quel jour seriez-vous disponible pour recevoir un jobbeur ?',NULL,3000,NULL,'2019-03-13 17:15:40',7,NULL),(16,'question_3ea49255-45ab-11e9-bf5d-acbc32cafef3','dans quel creneau horaire ?',NULL,4000,NULL,'2019-03-13 17:15:40',7,NULL),(17,'question_3ea492ee-45ab-11e9-bf5d-acbc32cafef3','votre domicile possede t\'il un ascenseur ?',NULL,5000,NULL,'2019-03-13 17:15:40',7,NULL),(18,'question_3ea493cd-45ab-11e9-bf5d-acbc32cafef3','avez-vous une remarque suplementaire a faire ?',NULL,6000,NULL,'2019-03-13 17:15:40',7,NULL),(19,'question_40d0a792-45ab-11e9-bf5d-acbc32cafef3','quel type de vehicule avez-vous besoin de reparer ?',NULL,1000,NULL,'2019-03-13 17:15:44',8,NULL),(20,'question_40d0aa73-45ab-11e9-bf5d-acbc32cafef3','dans quel etat ce trouve le vehicule ?',NULL,2000,NULL,'2019-03-13 17:15:44',8,NULL),(21,'question_40d0ab28-45ab-11e9-bf5d-acbc32cafef3','quel jour seriez-vous disponible pour recevoir un jobbeur ?',NULL,3000,NULL,'2019-03-13 17:15:44',7,NULL),(22,'question_40d0abbe-45ab-11e9-bf5d-acbc32cafef3','dans quel creneau horaire ?',NULL,4000,NULL,'2019-03-13 17:15:44',8,NULL),(23,'question_40d0ac21-45ab-11e9-bf5d-acbc32cafef3','votre domicile possede t\'il un ascenseur ?',NULL,5000,NULL,'2019-03-13 17:15:44',8,NULL),(24,'question_40d0ac73-45ab-11e9-bf5d-acbc32cafef3','avez-vous une remarque suplementaire a faire ?',NULL,6000,NULL,'2019-03-13 17:15:44',8,NULL);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionType`
--

DROP TABLE IF EXISTS `questionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `questionType` (
  `questionTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `questionTypeCode` tinytext,
  `questionTypeLabel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`questionTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionType`
--

LOCK TABLES `questionType` WRITE;
/*!40000 ALTER TABLE `questionType` DISABLE KEYS */;
INSERT INTO `questionType` VALUES (1,'questionType_b782a57f-45ab-11e9-bf5d-acbc32cafef3','text'),(2,'questionType_b782a840-45ab-11e9-bf5d-acbc32cafef3','radio'),(3,'questionType_b782a8fe-45ab-11e9-bf5d-acbc32cafef3','date'),(4,'questionType_b782a954-45ab-11e9-bf5d-acbc32cafef3','checkbox'),(5,'questionType_b782a991-45ab-11e9-bf5d-acbc32cafef3','radio'),(6,'questionType_b782a9c9-45ab-11e9-bf5d-acbc32cafef3','textarea');
/*!40000 ALTER TABLE `questionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `review` (
  `reviewId` int(11) NOT NULL AUTO_INCREMENT,
  `reviewCode` tinytext,
  `reviewLabel` varchar(100) DEFAULT NULL,
  `reviewIsArchived` tinyint(1) DEFAULT NULL,
  `reviewNotice` tinytext,
  `reviewRatio` int(11) DEFAULT NULL,
  `reviewCreationDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `review_userId` int(11) DEFAULT NULL,
  `review_proId` int(11) DEFAULT NULL,
  PRIMARY KEY (`reviewId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userCode` tinytext,
  `userLastName` varchar(45) DEFAULT NULL,
  `userFirstName` varchar(45) DEFAULT NULL,
  `userName` varchar(45) DEFAULT NULL,
  `userPassword` varchar(45) DEFAULT NULL,
  `userGender` varchar(45) DEFAULT NULL,
  `userBirthDate` int(11) DEFAULT NULL,
  `userAvatar` varchar(255) DEFAULT NULL,
  `userType` varchar(255) DEFAULT NULL,
  `userPhone` varchar(45) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userIsArchived` tinyint(1) DEFAULT NULL,
  `userCreationDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,'manoha','lidian',NULL,'31101978','male',31101978,NULL,NULL,'0619753092','lidianmanoha@gmail.com',NULL,'2019-03-13 17:14:52'),(2,NULL,'valjean','jean',NULL,'pass0401','male',601700,NULL,NULL,'0645978936','jeanvaljean@gmail.com',NULL,'2019-03-13 17:14:56');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'jobbydb'
--

--
-- Dumping routines for database 'jobbydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-13 17:23:36
