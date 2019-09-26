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
  `addressStreetType` tinytext,
  `addressStreetName` tinytext,
  `addressCity` tinytext,
  `addressType` tinytext,
  `addressZipCode` int(11) DEFAULT NULL,
  `addressCountry` varchar(100) DEFAULT NULL,
  `addressRegion` varchar(45) DEFAULT NULL,
  `addressBuildingName` varchar(45) DEFAULT NULL,
  `addressBuildingNumber` int(11) DEFAULT NULL,
  `addressFloorNumber` int(11) DEFAULT NULL,
  `addressIsArchived` tinyint(1) DEFAULT '0',
  `addressCreationDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `address_userId` int(11) DEFAULT NULL,
  `address_proId` int(11) DEFAULT NULL,
  PRIMARY KEY (`addressId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,NULL,'rue','du colonel moutarde','cluedo',NULL,666,'le paradie','cloud',NULL,NULL,NULL,NULL,'2019-03-14 11:26:27',NULL,NULL);
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
  `categoryIsArchived` tinyint(1) DEFAULT '0',
  `categoryCreationDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `categoryParentId` int(11) DEFAULT NULL,
  `categoryIsService` tinyint(1) DEFAULT NULL,
  `categoryLink` tinytext,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'category_27c58b72-45ab-11e9-bf5d-acbc32cafef3','Reparation & Bricolage','https://i.imgur.com/1XrPTg8.jpg',NULL,NULL,'2019-03-13 17:15:02',NULL,NULL,'/categories/parent'),(2,'category_27c596fe-45ab-11e9-bf5d-acbc32cafef3','transport','https://i.imgur.com/BZedtDL.jpg',NULL,NULL,'2019-03-13 17:15:02',NULL,NULL,'/categories/parent'),(3,'category_27c59af1-45ab-11e9-bf5d-acbc32cafef3','apprentissage','https://i.imgur.com/GdSFShm.jpg',NULL,NULL,'2019-03-13 17:15:02',NULL,NULL,'/categories/parent'),(4,'category_27c59e12-45ab-11e9-bf5d-acbc32cafef3','multimédia','https://i.imgur.com/I6GSsT9.jpg',NULL,NULL,'2019-03-13 17:15:02',NULL,NULL,'/categories/parent'),(5,'category_2a9126e2-45ab-11e9-bf5d-acbc32cafef3','maison',NULL,NULL,NULL,'2019-03-13 17:15:06',1,NULL,'/form'),(6,'category_2a9129a7-45ab-11e9-bf5d-acbc32cafef3','multimedia',NULL,NULL,NULL,'2019-03-13 17:15:06',1,NULL,'/form'),(7,'category_2a912a34-45ab-11e9-bf5d-acbc32cafef3','vehicules',NULL,NULL,NULL,'2019-03-13 17:15:06',1,NULL,'/form'),(8,'category_2a912a8f-45ab-11e9-bf5d-acbc32cafef3','jardin & exterieur',NULL,NULL,NULL,'2019-03-13 17:15:06',1,NULL,'/form'),(9,'category_2c405427-45ab-11e9-bf5d-acbc32cafef3','voiture',NULL,NULL,NULL,'2019-03-13 17:15:09',2,NULL,'/form'),(10,'category_2c4056aa-45ab-11e9-bf5d-acbc32cafef3','covoiturage',NULL,NULL,NULL,'2019-03-13 17:15:09',2,NULL,'/form'),(11,'category_2c40572c-45ab-11e9-bf5d-acbc32cafef3','demenagement',NULL,NULL,NULL,'2019-03-13 17:15:09',2,NULL,'/form'),(12,'category_2c405781-45ab-11e9-bf5d-acbc32cafef3','transport marchandise',NULL,NULL,NULL,'2019-03-13 17:15:09',2,NULL,'/form'),(13,'category_2e778ea6-45ab-11e9-bf5d-acbc32cafef3','web & design',NULL,NULL,NULL,'2019-03-13 17:15:13',3,NULL,'/form'),(14,'category_2e779178-45ab-11e9-bf5d-acbc32cafef3','cours & conseil',NULL,NULL,NULL,'2019-03-13 17:15:13',3,NULL,'/form'),(15,'category_2e7791f7-45ab-11e9-bf5d-acbc32cafef3','soin du corps',NULL,NULL,NULL,'2019-03-13 17:15:13',3,NULL,'/form'),(16,'category_2e779249-45ab-11e9-bf5d-acbc32cafef3','dessin',NULL,NULL,NULL,'2019-03-13 17:15:13',3,NULL,'/form'),(17,'category_30d21682-45ab-11e9-bf5d-acbc32cafef3','jeux video',NULL,NULL,NULL,'2019-03-13 17:15:17',4,NULL,'/form'),(18,'category_30d21913-45ab-11e9-bf5d-acbc32cafef3','tablet et smartphone',NULL,NULL,NULL,'2019-03-13 17:15:17',4,NULL,'/form'),(19,'category_30d21990-45ab-11e9-bf5d-acbc32cafef3','ubuntu',NULL,NULL,NULL,'2019-03-13 17:15:17',4,NULL,'/form'),(20,'category_30d21a2c-45ab-11e9-bf5d-acbc32cafef3','desktop & laptop',NULL,NULL,NULL,'2019-03-13 17:15:17',4,NULL,'/form');
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
  `clientAnswerIsArchived` tinyint(1) DEFAULT '0',
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
  `commentIsArchived` tinyint(1) DEFAULT '0',
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
  `demandId` int(11) NOT NULL AUTO_INCREMENT,
  `demandCode` tinytext,
  `demandIsArchived` tinyint(1) DEFAULT '0',
  `demandCreationDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `demand_userId` int(11) DEFAULT NULL,
  `demand_categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`demandId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demand`
--

LOCK TABLES `demand` WRITE;
/*!40000 ALTER TABLE `demand` DISABLE KEYS */;
INSERT INTO `demand` VALUES (1,'demand_25107300-466c-11e9-bf5d-acbc32cafef3',0,'2019-03-14 16:16:30',2,5),(2,'demand_af85573a-466c-11e9-bf5d-acbc32cafef3',0,'2019-03-14 16:20:22',2,5);
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
-- Table structure for table `footer`
--

DROP TABLE IF EXISTS `footer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `footer` (
  `footerId` int(11) NOT NULL AUTO_INCREMENT,
  `footerTitle` varchar(100) DEFAULT NULL,
  `footerLink` varchar(100) DEFAULT NULL,
  `footerIcon` tinytext,
  `footerParentLinks` int(11) DEFAULT NULL,
  `footerParentLocations` int(11) DEFAULT NULL,
  PRIMARY KEY (`footerId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footer`
--

LOCK TABLES `footer` WRITE;
/*!40000 ALTER TABLE `footer` DISABLE KEYS */;
INSERT INTO `footer` VALUES (1,'links',NULL,NULL,NULL,NULL),(2,'locations',NULL,NULL,NULL,NULL),(3,'Accueil','/home',NULL,1,NULL),(4,'Contact','/contact',NULL,1,NULL),(5,'Blog','/blog',NULL,1,NULL),(6,'facebook',NULL,'fab fa-facebook-square',1,NULL),(7,'twitter',NULL,'fab fa-twitter-square',1,NULL),(8,'Lille',NULL,NULL,NULL,2),(9,'Paris',NULL,NULL,NULL,2),(10,'Bordeaux',NULL,NULL,NULL,2),(11,'Lyon',NULL,NULL,NULL,2),(12,'Marseille',NULL,NULL,NULL,2);
/*!40000 ALTER TABLE `footer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT,
  `menuTitle` varchar(100) DEFAULT NULL,
  `menuLink` tinytext,
  `menuCode` tinytext,
  `menuH1` tinytext,
  `menuId2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Inscription','/register',NULL,NULL,NULL),(2,'Connexion','/connexion',NULL,NULL,NULL),(3,'À propos','/about',NULL,NULL,NULL),(4,'Contact','/contact',NULL,NULL,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
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
  `possibleResponseIsArchived` tinyint(1) DEFAULT '0',
  `possibleResponseCreationDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `possibleResponse_questionId` int(11) DEFAULT NULL,
  `possibleResponseName` varchar(100) DEFAULT NULL,
  `possibleResponseValue` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`possibleResponseId`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possibleResponse`
--

LOCK TABLES `possibleResponse` WRITE;
/*!40000 ALTER TABLE `possibleResponse` DISABLE KEYS */;
INSERT INTO `possibleResponse` VALUES (1,'possibleResponse_cab972c8-45aa-11e9-bf5d-acbc32cafef3',NULL,NULL,'1000',NULL,'2019-03-13 17:12:25',1,'bidon','bidon'),(2,'possibleResponse_cce0344c-45aa-11e9-bf5d-acbc32cafef3','UN PEU DEFECTUEUX',NULL,'1000',NULL,'2019-03-13 17:12:29',2,'bidon','bidon'),(3,'possibleResponse_cce038bc-45aa-11e9-bf5d-acbc32cafef3','TRES DEFECTUEUX',NULL,'2000',NULL,'2019-03-13 17:12:29',2,'bidon','bidon'),(4,'possibleResponse_cce0394e-45aa-11e9-bf5d-acbc32cafef3','HORS D\'USAGE',NULL,'3000',NULL,'2019-03-13 17:12:29',2,'bidon','bidon'),(5,'possibleResponse_4fe0992c-45ab-11e9-bf5d-acbc32cafef3',NULL,NULL,'1000',NULL,'2019-03-13 17:16:09',3,'bidon','bidon'),(6,'possibleResponse_516e7d03-45ab-11e9-bf5d-acbc32cafef3','matin',NULL,'1000',NULL,'2019-03-13 17:16:11',4,'bidon','bidon'),(7,'possibleResponse_516e8080-45ab-11e9-bf5d-acbc32cafef3','midi',NULL,'2000',NULL,'2019-03-13 17:16:11',4,'bidon','bidon'),(8,'possibleResponse_516e8138-45ab-11e9-bf5d-acbc32cafef3','apres midi',NULL,'3000',NULL,'2019-03-13 17:16:11',4,'bidon','bidon'),(9,'possibleResponse_516e81b0-45ab-11e9-bf5d-acbc32cafef3','soir',NULL,'4000',NULL,'2019-03-13 17:16:11',4,'bidon','bidon'),(10,'possibleResponse_52ea4018-45ab-11e9-bf5d-acbc32cafef3','oui',NULL,'1000',NULL,'2019-03-13 17:16:14',5,'bidon','bidon'),(11,'possibleResponse_52ea42b4-45ab-11e9-bf5d-acbc32cafef3','non',NULL,'2000',NULL,'2019-03-13 17:16:14',5,'bidon','bidon'),(12,'possibleResponse_54c6d41c-45ab-11e9-bf5d-acbc32cafef3',NULL,NULL,'1000',NULL,'2019-03-13 17:16:17',6,'bidon','bidon'),(13,'possibleResponse_573c388c-45ab-11e9-bf5d-acbc32cafef3',NULL,NULL,'1000',NULL,'2019-03-13 17:16:21',7,'bidon','bidon'),(14,'possibleResponse_59578e29-45ab-11e9-bf5d-acbc32cafef3','UN PEU DEFECTUEUX',NULL,'1000',NULL,'2019-03-13 17:16:25',8,'bidon','bidon'),(15,'possibleResponse_595790ba-45ab-11e9-bf5d-acbc32cafef3','TRES DEFECTUEUX',NULL,'2000',NULL,'2019-03-13 17:16:25',8,'bidon','bidon'),(16,'possibleResponse_5957913d-45ab-11e9-bf5d-acbc32cafef3','HORS D\'USAGE',NULL,'3000',NULL,'2019-03-13 17:16:25',8,'bidon','bidon'),(17,'possibleResponse_5bc1b1df-45ab-11e9-bf5d-acbc32cafef3',NULL,NULL,'1000',NULL,'2019-03-13 17:16:29',9,'bidon','bidon'),(18,'possibleResponse_5d68cfcf-45ab-11e9-bf5d-acbc32cafef3','matin',NULL,'1000',NULL,'2019-03-13 17:16:32',10,'bidon','bidon'),(19,'possibleResponse_5d68d2c8-45ab-11e9-bf5d-acbc32cafef3','midi',NULL,'2000',NULL,'2019-03-13 17:16:32',10,'bidon','bidon'),(20,'possibleResponse_5d68d377-45ab-11e9-bf5d-acbc32cafef3','apres midi',NULL,'3000',NULL,'2019-03-13 17:16:32',10,'bidon','bidon'),(21,'possibleResponse_5d68d3e5-45ab-11e9-bf5d-acbc32cafef3','soir',NULL,'4000',NULL,'2019-03-13 17:16:32',10,'bidon','bidon'),(22,'possibleResponse_5f2d1360-45ab-11e9-bf5d-acbc32cafef3','oui',NULL,'1000',NULL,'2019-03-13 17:16:35',11,'bidon','bidon'),(23,'possibleResponse_5f2d1653-45ab-11e9-bf5d-acbc32cafef3','non',NULL,'2000',NULL,'2019-03-13 17:16:35',11,'bidon','bidon'),(24,'possibleResponse_611c21d7-45ab-11e9-bf5d-acbc32cafef3',NULL,NULL,'1000',NULL,'2019-03-13 17:16:38',12,'bidon','bidon'),(25,'possibleResponse_6351dd3f-45ab-11e9-bf5d-acbc32cafef3','UN PEU DEFECTUEUX',NULL,'1000',NULL,'2019-03-13 17:16:41',13,'bidon','bidon'),(26,'possibleResponse_6351e0a6-45ab-11e9-bf5d-acbc32cafef3','TRES DEFECTUEUX',NULL,'2000',NULL,'2019-03-13 17:16:41',13,'bidon','bidon'),(27,'possibleResponse_6351e174-45ab-11e9-bf5d-acbc32cafef3','HORS D\'USAGE',NULL,'3000',NULL,'2019-03-13 17:16:41',13,'bidon','bidon'),(28,'possibleResponse_65029ff0-45ab-11e9-bf5d-acbc32cafef3',NULL,NULL,'1000',NULL,'2019-03-13 17:16:44',14,'bidon','bidon'),(29,'possibleResponse_66db6adc-45ab-11e9-bf5d-acbc32cafef3','matin',NULL,'1000',NULL,'2019-03-13 17:16:47',15,'bidon','bidon'),(30,'possibleResponse_66db6e65-45ab-11e9-bf5d-acbc32cafef3','midi',NULL,'2000',NULL,'2019-03-13 17:16:47',15,'bidon','bidon'),(31,'possibleResponse_66db6f3f-45ab-11e9-bf5d-acbc32cafef3','apres midi',NULL,'3000',NULL,'2019-03-13 17:16:47',15,'bidon','bidon'),(32,'possibleResponse_66db6fc9-45ab-11e9-bf5d-acbc32cafef3','soir',NULL,'4000',NULL,'2019-03-13 17:16:47',15,'bidon','bidon'),(33,'possibleResponse_68708a58-45ab-11e9-bf5d-acbc32cafef3','oui',NULL,'1000',NULL,'2019-03-13 17:16:50',16,'bidon','bidon'),(34,'possibleResponse_68708d64-45ab-11e9-bf5d-acbc32cafef3','non',NULL,'2000',NULL,'2019-03-13 17:16:50',16,'bidon','bidon'),(35,'possibleResponse_6c1e5ba0-45ab-11e9-bf5d-acbc32cafef3',NULL,NULL,'1000',NULL,'2019-03-13 17:16:56',17,'bidon','bidon'),(36,'possibleResponse_6dde6382-45ab-11e9-bf5d-acbc32cafef3',NULL,NULL,'1000',NULL,'2019-03-13 17:16:59',18,'bidon','bidon'),(37,'possibleResponse_6fb19f9e-45ab-11e9-bf5d-acbc32cafef3',NULL,NULL,'1000',NULL,'2019-03-13 17:17:02',19,'bidon','bidon'),(38,'possibleResponse_716769ec-45ab-11e9-bf5d-acbc32cafef3','UN PEU DEFECTUEUX',NULL,'1000',NULL,'2019-03-13 17:17:05',20,'bidon','bidon'),(39,'possibleResponse_71676cb2-45ab-11e9-bf5d-acbc32cafef3','TRES DEFECTUEUX',NULL,'2000',NULL,'2019-03-13 17:17:05',20,'bidon','bidon'),(40,'possibleResponse_71676d7d-45ab-11e9-bf5d-acbc32cafef3','HORS D\'USAGE',NULL,'3000',NULL,'2019-03-13 17:17:05',20,'bidon','bidon'),(41,'possibleResponse_7376db78-45ab-11e9-bf5d-acbc32cafef3',NULL,NULL,'1000',NULL,'2019-03-13 17:17:09',21,'bidon','bidon'),(42,'possibleResponse_76bbe1aa-45ab-11e9-bf5d-acbc32cafef3','matin',NULL,'1000',NULL,'2019-03-13 17:17:14',22,'bidon','bidon'),(43,'possibleResponse_76bbe493-45ab-11e9-bf5d-acbc32cafef3','midi',NULL,'2000',NULL,'2019-03-13 17:17:14',22,'bidon','bidon'),(44,'possibleResponse_76bbe52f-45ab-11e9-bf5d-acbc32cafef3','apres midi',NULL,'3000',NULL,'2019-03-13 17:17:14',22,'bidon','bidon'),(45,'possibleResponse_76bbe59e-45ab-11e9-bf5d-acbc32cafef3','soir',NULL,'4000',NULL,'2019-03-13 17:17:14',22,'bidon','bidon'),(46,'possibleResponse_78d22736-45ab-11e9-bf5d-acbc32cafef3','oui',NULL,'1000',NULL,'2019-03-13 17:17:18',23,'bidon','bidon'),(47,'possibleResponse_78d22a13-45ab-11e9-bf5d-acbc32cafef3','non',NULL,'2000',NULL,'2019-03-13 17:17:18',23,'bidon','bidon'),(48,'possibleResponse_7a65d67f-45ab-11e9-bf5d-acbc32cafef3',NULL,NULL,'1000',NULL,'2019-03-13 17:17:20',24,'bidon','bidon'),(52,NULL,'reponse',NULL,NULL,NULL,'2019-03-14 15:09:31',25,'bidon','bidon'),(54,NULL,'reponse2',NULL,NULL,NULL,'2019-03-14 15:16:39',NULL,'bidon','bidon');
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
  `proIsArchived` tinyint(1) DEFAULT '0',
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
  `professionIsArchived` tinyint(1) DEFAULT '0',
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
  `questionOrder` int(11) DEFAULT NULL,
  `questionIsArchived` tinyint(1) DEFAULT '0',
  `questionCreationDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `question_categoryId` int(11) DEFAULT NULL,
  `question_questionTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`questionId`),
  KEY `fk_question_1_idx` (`question_categoryId`),
  CONSTRAINT `fk_question_1` FOREIGN KEY (`question_categoryId`) REFERENCES `category` (`categoryId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'question_b807b722-45aa-11e9-bf5d-acbc32cafef3','quel type de materiel avez-vous besoin de reparer ?',1000,NULL,'2019-03-13 17:11:54',5,1),(2,'question_b807b99e-45aa-11e9-bf5d-acbc32cafef3','dans quel etat ce trouve le materiel ?',2000,NULL,'2019-03-13 17:11:54',5,2),(3,'question_b807ba7f-45aa-11e9-bf5d-acbc32cafef3','quel jour seriez-vous disponible pour recevoir un jobbeur ?',3000,NULL,'2019-03-13 17:11:54',5,3),(4,'question_b807bb11-45aa-11e9-bf5d-acbc32cafef3','dans quel creneau horaire ?',4000,NULL,'2019-03-13 17:11:54',5,4),(5,'question_b807bbb4-45aa-11e9-bf5d-acbc32cafef3','votre domicile possede t\'il un ascenseur ?',5000,NULL,'2019-03-13 17:11:54',5,2),(6,'question_b807bc38-45aa-11e9-bf5d-acbc32cafef3','avez-vous une remarque suplementaire a faire ?',6000,NULL,'2019-03-13 17:11:54',5,6),(7,'question_c7499f2f-45aa-11e9-bf5d-acbc32cafef3','quel type de materiel avez-vous besoin de reparer ?',1000,NULL,'2019-03-13 17:12:20',6,1),(8,'question_c749a1c9-45aa-11e9-bf5d-acbc32cafef3','dans quel etat ce trouve le materiel ?',2000,NULL,'2019-03-13 17:12:20',6,2),(9,'question_c749a290-45aa-11e9-bf5d-acbc32cafef3','quel jour seriez-vous disponible pour recevoir un jobbeur ?',3000,NULL,'2019-03-13 17:12:20',6,3),(10,'question_c749a2ed-45aa-11e9-bf5d-acbc32cafef3','dans quel creneau horaire ?',4000,NULL,'2019-03-13 17:12:20',6,4),(11,'question_c749a335-45aa-11e9-bf5d-acbc32cafef3','votre domicile possede t\'il un ascenseur ?',5000,NULL,'2019-03-13 17:12:20',6,2),(12,'question_c749a37d-45aa-11e9-bf5d-acbc32cafef3','avez-vous une remarque suplementaire a faire ?',6000,NULL,'2019-03-13 17:12:20',6,6),(13,'question_3ea48900-45ab-11e9-bf5d-acbc32cafef3','quel type de vehicule avez-vous besoin de reparer ?',1000,NULL,'2019-03-13 17:15:40',7,1),(14,'question_3ea48fe2-45ab-11e9-bf5d-acbc32cafef3','dans quel etat ce trouve le vehicule ?',2000,NULL,'2019-03-13 17:15:40',7,2),(15,'question_3ea4916b-45ab-11e9-bf5d-acbc32cafef3','quel jour seriez-vous disponible pour recevoir un jobbeur ?',3000,NULL,'2019-03-13 17:15:40',7,3),(16,'question_3ea49255-45ab-11e9-bf5d-acbc32cafef3','dans quel creneau horaire ?',4000,NULL,'2019-03-13 17:15:40',7,4),(17,'question_3ea492ee-45ab-11e9-bf5d-acbc32cafef3','votre domicile possede t\'il un ascenseur ?',5000,NULL,'2019-03-13 17:15:40',7,2),(18,'question_3ea493cd-45ab-11e9-bf5d-acbc32cafef3','avez-vous une remarque suplementaire a faire ?',6000,NULL,'2019-03-13 17:15:40',7,6),(19,'question_40d0a792-45ab-11e9-bf5d-acbc32cafef3','quel type de vehicule avez-vous besoin de reparer ?',1000,NULL,'2019-03-13 17:15:44',8,1),(20,'question_40d0aa73-45ab-11e9-bf5d-acbc32cafef3','dans quel etat ce trouve le vehicule ?',2000,NULL,'2019-03-13 17:15:44',8,2),(21,'question_40d0ab28-45ab-11e9-bf5d-acbc32cafef3','quel jour seriez-vous disponible pour recevoir un jobbeur ?',3000,NULL,'2019-03-13 17:15:44',8,3),(22,'question_40d0abbe-45ab-11e9-bf5d-acbc32cafef3','dans quel creneau horaire ?',4000,NULL,'2019-03-13 17:15:44',8,4),(23,'question_40d0ac21-45ab-11e9-bf5d-acbc32cafef3','votre domicile possede t\'il un ascenseur ?',5000,NULL,'2019-03-13 17:15:44',8,2),(24,'question_40d0ac73-45ab-11e9-bf5d-acbc32cafef3','avez-vous une remarque suplementaire a faire ?',6000,NULL,'2019-03-13 17:15:44',8,6);
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
INSERT INTO `questionType` VALUES (1,'questionType_b782a57f-45ab-11e9-bf5d-acbc32cafef3','text'),(2,'questionType_b782a840-45ab-11e9-bf5d-acbc32cafef3','radio'),(3,'questionType_b782a8fe-45ab-11e9-bf5d-acbc32cafef3','date'),(4,'questionType_b782a954-45ab-11e9-bf5d-acbc32cafef3','checkbox'),(6,'questionType_b782a9c9-45ab-11e9-bf5d-acbc32cafef3','textarea');
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
  `reviewIsArchived` tinyint(1) DEFAULT '0',
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
-- Table structure for table `testLog`
--

DROP TABLE IF EXISTS `testLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `testLog` (
  `testLogId` int(11) NOT NULL AUTO_INCREMENT,
  `testLogLevel` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `testLogMessage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `testLogDetailJSON` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `testLogDatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`testLogId`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testLog`
--

LOCK TABLES `testLog` WRITE;
/*!40000 ALTER TABLE `testLog` DISABLE KEYS */;
INSERT INTO `testLog` VALUES (1,'info','coucou Log','{\"message\":\"coucou Log\",\"level\":\"info\"}','2019-04-01 16:35:46'),(2,'info','coucou Log','{\"message\":\"coucou Log\",\"level\":\"info\"}','2019-04-01 16:35:47'),(3,'info','coucou Log','{\"message\":\"coucou Log\",\"level\":\"info\"}','2019-04-01 16:35:47'),(4,'info','coucou Log','{\"message\":\"coucou Log\",\"level\":\"info\"}','2019-04-01 16:35:47'),(5,'info','coucou Log','{\"message\":\"coucou Log\",\"level\":\"info\"}','2019-04-01 16:40:41'),(6,'info','coucou Log','{\"message\":\"coucou Log\",\"level\":\"info\"}','2019-04-01 16:41:05'),(7,'info','coucou','{\"message\":\"coucou\",\"othersStuffs\":{\"detail\":\"111\"},\"filename\":\"/home/lidian/lidian.manoha/Jobby/api.jobby.com/src/router/logger.js\",\"level\":\"info\"}','2019-04-01 16:41:05'),(8,'info','coucou Log','{\"message\":\"coucou Log\",\"level\":\"info\"}','2019-04-01 16:41:07'),(9,'info','coucou','{\"message\":\"coucou\",\"othersStuffs\":{\"detail\":\"111\"},\"filename\":\"/home/lidian/lidian.manoha/Jobby/api.jobby.com/src/router/logger.js\",\"level\":\"info\"}','2019-04-01 16:41:07'),(10,'info','ER_NO_SUCH_TABLE: Table \'jobbydb.menuf\' doesn\'t exist','{\"code\":\"ER_NO_SUCH_TABLE\",\"errno\":1146,\"sqlMessage\":\"Table \'jobbydb.menuf\' doesn\'t exist\",\"sqlState\":\"42S02\",\"index\":0,\"sql\":\"SELECT menuTitle AS title, menuLink AS link FROM menuf\",\"level\":\"info\"}','2019-04-02 10:55:38'),(11,'info','ER_NO_SUCH_TABLE: Table \'jobbydb.menuf\' doesn\'t exist','{\"code\":\"ER_NO_SUCH_TABLE\",\"errno\":1146,\"sqlMessage\":\"Table \'jobbydb.menuf\' doesn\'t exist\",\"sqlState\":\"42S02\",\"index\":0,\"sql\":\"SELECT menuTitle AS title, menuLink AS link FROM menuf\",\"level\":\"info\"}','2019-04-02 10:55:38'),(12,'info','ER_BAD_FIELD_ERROR: Unknown column \'1000\' in \'order clause\'','{\"code\":\"ER_BAD_FIELD_ERROR\",\"errno\":1054,\"sqlMessage\":\"Unknown column \'1000\' in \'order clause\'\",\"sqlState\":\"42S22\",\"index\":0,\"sql\":\"SELECT questionOrder AS id, questionLabel AS title, question_questionType AS type FROM question ORDER BY 1000\",\"level\":\"info\"}','2019-04-02 12:34:25'),(13,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponse_questionId , pr.possibleResponseLabel, pr.possibleResponseOrder FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-03 15:50:50'),(14,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponse_questionId , pr.possibleResponseLabel, pr.possibleResponseOrder FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-03 15:50:50'),(15,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponse_questionId , pr.possibleResponseLabel, pr.possibleResponseOrder FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-03 15:50:52'),(16,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponse_questionId , pr.possibleResponseLabel, pr.possibleResponseOrder FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-03 15:51:26'),(17,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponse_questionId , pr.possibleResponseLabel, pr.possibleResponseOrder FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-03 15:51:26'),(18,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponse_questionId , pr.possibleResponseLabel, pr.possibleResponseOrder FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-03 15:51:49'),(19,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponse_questionId , pr.possibleResponseLabel, pr.possibleResponseOrder FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-03 15:52:25'),(20,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponse_questionId , pr.possibleResponseLabel, pr.possibleResponseOrder FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-03 15:52:26'),(21,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponse_questionId , pr.possibleResponseLabel, pr.possibleResponseOrder FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-03 15:55:16'),(22,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponse_questionId , pr.possibleResponseLabel, pr.possibleResponseOrder FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-03 15:55:16'),(23,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponse_questionId , pr.possibleResponseLabel, pr.possibleResponseOrder FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-03 15:55:16'),(24,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'.possibleResponse_questionId , pr.possibleResponseLabel, pr.possibleResponseOrde\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'.possibleResponse_questionId , pr.possibleResponseLabel, pr.possibleResponseOrde\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId pr.possibleResponse_questionId , pr.possibleResponseLabel, pr.possibleResponseOrder FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9, 10, 11, 12)\",\"level\":\"info\"}','2019-04-03 16:04:26'),(25,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9,\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9,\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId AS id, pr.possibleResponse_questionId AS id, pr.possibleResponseLabel AS label, pr.possibleResponseOrder AS order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9, 10, 11, 12)\",\"level\":\"info\"}','2019-04-03 16:43:33'),(26,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9,\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9,\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId AS id, pr.possibleResponse_questionId, pr.possibleResponseLabel AS label, pr.possibleResponseOrder AS order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9, 10, 11, 12)\",\"level\":\"info\"}','2019-04-03 16:43:45'),(27,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9,\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9,\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId AS id, pr.possibleResponse_questionId, pr.possibleResponseLabel AS label, pr.possibleResponseOrder AS order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9, 10, 11, 12)\",\"level\":\"info\"}','2019-04-03 16:43:46'),(28,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9,\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9,\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseLabel AS label, pr.possibleResponseOrder AS order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9, 10, 11, 12)\",\"level\":\"info\"}','2019-04-03 16:43:54'),(29,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9,\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9,\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseLabel AS label, pr.possibleResponseOrder AS order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9, 10, 11, 12)\",\"level\":\"info\"}','2019-04-03 16:43:54'),(30,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9,\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9,\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId , pr.possibleResponse_questionId AS id, pr.possibleResponseLabel AS reponse, pr.possibleResponseOrder AS order FROM possibleResponse AS pr WHERE possibleResponse_questionId IN (7, 8, 9, 10, 11, 12)\",\"level\":\"info\"}','2019-04-03 16:46:12'),(31,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseLabel AS reponse, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-03 17:09:08'),(32,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseLabel AS reponse, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-03 17:09:11'),(33,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseLabel AS reponse, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-03 17:10:07'),(34,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 10:21:48'),(35,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:46:49'),(36,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:47:01'),(37,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:49:18'),(38,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:51:13'),(39,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:51:19'),(40,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:08'),(41,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:09'),(42,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:10'),(43,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:11'),(44,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:11'),(45,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:11'),(46,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:11'),(47,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:23'),(48,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:23'),(49,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:24'),(50,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:24'),(51,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:24'),(52,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:24'),(53,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:24'),(54,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:25'),(55,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:25'),(56,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:25'),(57,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:25'),(58,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:26'),(59,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:26'),(60,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:26'),(61,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:26'),(62,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:47'),(63,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 15:59:47'),(64,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:39'),(65,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:46'),(66,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:47'),(67,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:47'),(68,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:47'),(69,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:47'),(70,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:47'),(71,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:48'),(72,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:48'),(73,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:48'),(74,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:48'),(75,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:48'),(76,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:48'),(77,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:49'),(78,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:49'),(79,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:49'),(80,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:49'),(81,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:50'),(82,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:50'),(83,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:00:50'),(84,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:01:33'),(85,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:03:55'),(86,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:04:01'),(87,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:11:07'),(88,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:11:08'),(89,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:11:14'),(90,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:11:28'),(91,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:11:29'),(92,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:30:41'),(93,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:31:36'),(94,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:34:59'),(95,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:35:28'),(96,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:40:01'),(97,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:41:41'),(98,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:46:17'),(99,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:51:58'),(100,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:56:22'),(101,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.questionCode AS code, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:56:46'),(102,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:59:21'),(103,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 16:59:41'),(104,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 17:00:01'),(105,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 17:00:02'),(106,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 17:00:16'),(107,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 17:00:17'),(108,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 17:00:18'),(109,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 17:00:18'),(110,'info','ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1','{\"code\":\"ER_PARSE_ERROR\",\"errno\":1064,\"sqlMessage\":\"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\' at line 1\",\"sqlState\":\"42000\",\"index\":0,\"sql\":\"SELECT pr.possibleResponseId, pr.possibleResponse_questionId, pr.possibleResponseName AS name,pr.possibleResponseValue AS value, pr.possibleResponseLabel AS reponses, pr.possibleResponseOrder AS orderQuestion FROM possibleResponse AS pr WHERE possibleResponse_questionId IN ()\",\"level\":\"info\"}','2019-04-04 17:00:18');
/*!40000 ALTER TABLE `testLog` ENABLE KEYS */;
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
  `userIsArchived` tinyint(1) DEFAULT '0',
  `userCreationDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,'manoha','lidian','irimax','31101978','male',31101978,NULL,NULL,'0619753092','lidianmanoha@gmail.com',NULL,'2019-03-13 17:14:52'),(2,NULL,'valjean','jean',NULL,'pass0401','male',601700,NULL,NULL,'0645978936','jeanvaljean@gmail.com',NULL,'2019-03-13 17:14:56');
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

-- Dump completed on 2019-04-05 12:07:39
