CREATE DATABASE  IF NOT EXISTS `exercici6` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `exercici6`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: exercici6
-- ------------------------------------------------------
-- Server version	5.7.34-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `idBrands` int(11) NOT NULL AUTO_INCREMENT,
  `brandName` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idBrands`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Rayban'),(2,'Carolina Herrera'),(3,'Polaroid');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameClient` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `address` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `phoneNumer` int(11) NOT NULL,
  `email` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idRecommendedClient` int(11) DEFAULT NULL,
  `idGlasses` int(11) NOT NULL,
  `clientDate` date DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  KEY `fk_recomendations_idx` (`idRecommendedClient`),
  KEY `fk_clientsGlasses` (`idGlasses`),
  CONSTRAINT `fk_clientsGlasses` FOREIGN KEY (`idGlasses`) REFERENCES `glasses` (`idGlasses`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_recommendations` FOREIGN KEY (`idRecommendedClient`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Juan','Direccion1',611111111,'juan@email.com',NULL,0,'2021-06-03'),(2,'David','Direccion2',622222222,'david@email.com',1,1,'0000-00-00'),(3,'Maria','Direccion3',633333333,'maria@email.com',NULL,2,'0000-00-00'),(4,'Ana','Direccion4',644444444,'ana@email.com',NULL,0,'0000-00-00'),(5,'Marc','Direccion5',655555555,'marc@email.com',NULL,0,'0000-00-00');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `idEmployee` int(11) NOT NULL AUTO_INCREMENT,
  `employeeName` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Oscar'),(2,'Martin'),(3,'Elena');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frametypes`
--

DROP TABLE IF EXISTS `frametypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frametypes` (
  `idFrameTypes` int(11) NOT NULL AUTO_INCREMENT,
  `frameTypes` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idFrameTypes`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frametypes`
--

LOCK TABLES `frametypes` WRITE;
/*!40000 ALTER TABLE `frametypes` DISABLE KEYS */;
INSERT INTO `frametypes` VALUES (1,'flotante'),(2,'pasta'),(3,'metálica');
/*!40000 ALTER TABLE `frametypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses` (
  `idGlasses` int(11) NOT NULL AUTO_INCREMENT,
  `idBrand` int(11) NOT NULL,
  `graduation` decimal(5,2) DEFAULT NULL,
  `idFrameTypes` int(11) NOT NULL,
  `frameColor` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `colorGlass` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `idProvider` int(11) NOT NULL,
  `idEmployee` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGlasses`),
  KEY `fk_providersGlasses` (`idProvider`),
  KEY `fk_brandGlasses` (`idBrand`),
  KEY `fk_employeeGlasses` (`idEmployee`),
  KEY `fk_framesGlasses` (`idFrameTypes`),
  CONSTRAINT `fk_brandGlasses` FOREIGN KEY (`idBrand`) REFERENCES `brands` (`idBrands`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_employeeGlasses` FOREIGN KEY (`idEmployee`) REFERENCES `employees` (`idEmployee`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_framesGlasses` FOREIGN KEY (`idFrameTypes`) REFERENCES `frametypes` (`idFrameTypes`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_providersGlasses` FOREIGN KEY (`idProvider`) REFERENCES `providers` (`idProvider`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (1,1,4.50,2,'marrón','transparente',300.00,1,NULL),(2,3,1.25,3,'negras','marrón',150.00,2,2);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `providers` (
  `nameProvider` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `street` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `numberStreet` int(11) DEFAULT NULL,
  `floorNumber` int(11) DEFAULT NULL,
  `doorNumber` int(11) DEFAULT NULL,
  `city` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `zipCode` int(11) DEFAULT NULL,
  `country` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `phoneNumer` int(11) NOT NULL,
  `fax` int(11) DEFAULT NULL,
  `taxId` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `idProvider` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idProvider`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES ('Gafas1','Plaza Cataluña',10,1,2,'Barcelona',8032,'España',931111111,NULL,'11111111A',1),('MultiGafas','Plaza España',50,1,NULL,'Madrid',28008,'España',912222222,6854752,'22222222B',2);
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-03 16:53:07
