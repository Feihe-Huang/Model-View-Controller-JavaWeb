CREATE DATABASE  IF NOT EXISTS `group16` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `group16`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: group16
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `com_id` int NOT NULL,
  `details` varchar(50) NOT NULL,
  `risk_level` int NOT NULL,
  PRIMARY KEY (`com_id`),
  UNIQUE KEY `com_id_UNIQUE` (`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (1,'2977 Miller Pass',1),(2,'34 Rockefeller Way',2),(3,'5779 Anderson Alley',2),(4,'328 Carioca Pass',3),(5,'418 Charing Cross Point',3),(6,'0541 Arkansas Point',3),(7,'8 Menomonie Road',3),(8,'5045 Homewood Plaza',2),(9,'34 Banding Terrace',2),(10,'7 Esch Pass',3);
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `c_id` int NOT NULL,
  `c_name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `phone` int NOT NULL,
  PRIMARY KEY (`c_id`),
  UNIQUE KEY `c_id_UNIQUE` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phoneNumber` varchar(100) NOT NULL,
  `consumption` int NOT NULL,
  `lastConsume` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `e_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `communityno` int NOT NULL,
  `teamno` int NOT NULL,
  `performance` int NOT NULL,
  `salary` int NOT NULL,
  `commenting` varchar(50) NOT NULL,
  `leader` varchar(50) NOT NULL,
  `editing` varchar(50) NOT NULL,
  `likes` int NOT NULL,
  PRIMARY KEY (`e_id`),
  UNIQUE KEY `e_id_UNIQUE` (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Timewell','Male','8129901249',2,1,197,740,'0','1','0',10),(2,'Georgina Litchmore','Female','4617237491',3,1,122,931,'0','0','0',2),(3,'Mandy Snewin','Female','4411722831',1,2,175,530,'0','1','1',2),(4,'Jennee Befroy','Female','1124029443',1,2,108,538,'0','0','0',1),(5,'Loren Norfolk','Male','5985844564',5,3,115,757,'0','1','0',6),(6,'Jaime Pablos','Male','5233430461',7,3,170,751,'1','0','1',5),(7,'Thatcher Storms','Male','4654979339',8,4,119,805,'1','1','0',1),(8,'Hubey Cheine','Male','4987453732',5,4,129,865,'1','1','0',2),(9,'Dory Knatt','Female','3659414880',4,5,103,556,'1','1','1',6),(10,'Ardyth Corke','Female','6437884053',2,6,183,933,'0','0','1',6);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `Email` varchar(45) NOT NULL,
  `usertype` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`Email`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('1@q.qq','1','q'),('2@q.qq','0','q'),('3@q.qq','1','q');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produce`
--

DROP TABLE IF EXISTS `produce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produce` (
  `producer_id` int NOT NULL,
  `products_id` int NOT NULL,
  `ce_amount` int DEFAULT NULL,
  `ce_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`producer_id`,`products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produce`
--

LOCK TABLES `produce` WRITE;
/*!40000 ALTER TABLE `produce` DISABLE KEYS */;
/*!40000 ALTER TABLE `produce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer` (
  `pro_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `pro_amount` int DEFAULT NULL,
  `pro_likes` int DEFAULT NULL,
  `pro_tel` varchar(45) NOT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer`
--

LOCK TABLES `producer` WRITE;
/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
INSERT INTO `producer` VALUES (1,'Mynte',530,6,'6122493319'),(2,'Edgeclub',343,1,'5972199128'),(3,'Skyble',387,59,'5127759646'),(4,'Voomm',772,35,'6615458203'),(5,'Realcube',785,31,'3214262968'),(6,'Yodo',958,13,'6151447388'),(7,'Rhynoodle',277,2,'6244529987'),(8,'Flipopia',612,8,'6711108232'),(9,'Youbridge',987,1,'5992421681'),(10,'Skinix',92,89,'9015950070');
/*!40000 ALTER TABLE `producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `pdt_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int NOT NULL,
  `input` int NOT NULL,
  `output` int NOT NULL,
  `daily_sale` int NOT NULL,
  `sale` int NOT NULL,
  `left` int DEFAULT NULL,
  PRIMARY KEY (`pdt_id`,`name`),
  UNIQUE KEY `pdt_id_UNIQUE` (`pdt_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Medroxyprogesterone Acetate',4,621,426,32,9040,195),(2,'Amoxicillin',21,566,490,91,1929,76),(3,'Azithromycin',38,657,236,41,1594,421),(4,'CAMPHOR',57,545,373,4,7799,172),(5,'Sertraline',66,956,451,48,3893,505),(6,'Aspirin',27,862,300,45,6934,562),(7,'Dicloxacillin Sodium',33,976,106,72,9180,870),(8,'Carvedilol',33,797,496,14,3337,301),(9,'Plumbum 5',11,579,487,56,3267,92),(10,'isotretinoin',14,702,355,68,8632,347);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sale`
--

DROP TABLE IF EXISTS `Sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sale` (
  `t_id` varchar(5) NOT NULL,
  `pdt_id` varchar(5) NOT NULL,
  `daily_sale` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sale`
--

LOCK TABLES `Sale` WRITE;
/*!40000 ALTER TABLE `Sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `t_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `sale` int NOT NULL,
  PRIMARY KEY (`t_id`),
  UNIQUE KEY `t_id_UNIQUE` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Alis',855),(2,'Nolana',304),(3,'Ryon',746),(4,'Maggi',682),(5,'Catie',802),(6,'Carce',830),(7,'Annabel',46);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `a_id` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `a_name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL DEFAULT '',
  `state` varchar(45) NOT NULL DEFAULT '',
  `city` varchar(45) NOT NULL DEFAULT '',
  `ID` int DEFAULT NULL,
  `phone` varchar(45) DEFAULT '',
  PRIMARY KEY (`a_id`),
  UNIQUE KEY `a_id_UNIQUE` (`a_id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('111111111111111111','2@q.qq','h','','d','d',111111,'11111111111'),('111111111111111116','3@q.qq','hh','','s','s',111111,'11111111113');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Works_in`
--

DROP TABLE IF EXISTS `Works_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Works_in` (
  `e_id` varchar(5) NOT NULL,
  `t_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Works_in`
--

LOCK TABLES `Works_in` WRITE;
/*!40000 ALTER TABLE `Works_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `Works_in` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-05 22:10:16
