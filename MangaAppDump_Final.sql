CREATE DATABASE  IF NOT EXISTS `mangaproj` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mangaproj`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: mangaproj
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `admininfo`
--

DROP TABLE IF EXISTS `admininfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admininfo` (
  `adminId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  PRIMARY KEY (`adminId`),
  UNIQUE KEY `adminId` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admininfo`
--

LOCK TABLES `admininfo` WRITE;
/*!40000 ALTER TABLE `admininfo` DISABLE KEYS */;
INSERT INTO `admininfo` VALUES (1,'Luffy','Smith');
/*!40000 ALTER TABLE `admininfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminlogin`
--

DROP TABLE IF EXISTS `adminlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminlogin` (
  `adminId` int NOT NULL AUTO_INCREMENT,
  `loginId` varchar(100) NOT NULL,
  `loginPassword` varchar(100) NOT NULL,
  PRIMARY KEY (`loginId`),
  UNIQUE KEY `loginId` (`loginId`),
  KEY `adminId` (`adminId`),
  CONSTRAINT `adminlogin_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `admininfo` (`adminId`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlogin`
--

LOCK TABLES `adminlogin` WRITE;
/*!40000 ALTER TABLE `adminlogin` DISABLE KEYS */;
INSERT INTO `adminlogin` VALUES (1,'luffy','luffy$123');
/*!40000 ALTER TABLE `adminlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manga`
--

DROP TABLE IF EXISTS `manga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manga` (
  `mangaId` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `releaseDate` date NOT NULL,
  `genre` varchar(100) NOT NULL,
  `numOfPages` int NOT NULL,
  PRIMARY KEY (`mangaId`),
  UNIQUE KEY `mangaId` (`mangaId`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manga`
--

LOCK TABLES `manga` WRITE;
/*!40000 ALTER TABLE `manga` DISABLE KEYS */;
INSERT INTO `manga` VALUES (1,'Solo Leveling','2018-03-04','Action',400),(2,'Berserk','1989-04-20','Action',780),(3,'One Piece','1997-11-03','Adventure',2500),(4,'The beginning after the end','2018-02-21','Adventure',460),(5,'Fullmetal Alchemist','2001-06-05','Fantasy',800),(6,'Jojo\'s bizarre adventure','2000-07-04','Adventure',1980),(7,'One-punch man','2012-08-05','Action',230),(8,'Vagabond','1998-11-07','Action',650),(9,'Akuyaku Reijou no Naka no Hito','2021-03-21','Drama',100),(10,'Haikyuu','2012-09-15','Comedy',500),(11,'Reincarnated as a slime','2015-01-03','Fantasy',230),(12,'Ki ni natteru','2022-05-20','Romance',400),(13,'Spy X Family','2019-04-04','Comedy',230),(14,'Yana of the dawn','2009-06-07','Adventure',670),(15,'eleceed','2018-04-15','Action',230);
/*!40000 ALTER TABLE `manga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangaauthor`
--

DROP TABLE IF EXISTS `mangaauthor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mangaauthor` (
  `authorId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `dateOfBirth` date NOT NULL,
  PRIMARY KEY (`authorId`),
  UNIQUE KEY `authorId` (`authorId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangaauthor`
--

LOCK TABLES `mangaauthor` WRITE;
/*!40000 ALTER TABLE `mangaauthor` DISABLE KEYS */;
INSERT INTO `mangaauthor` VALUES (1,'Wen','Chugong','1995-05-01'),(2,'Eiichiro','Oda','1975-01-01'),(3,'Hiromu','Arakawa','1973-05-08'),(4,'Jeho','Son','1987-06-29'),(5,'Li','Zhena','1988-10-09');
/*!40000 ALTER TABLE `mangaauthor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangalisting`
--

DROP TABLE IF EXISTS `mangalisting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mangalisting` (
  `adminId` int NOT NULL,
  `mangaId` int NOT NULL,
  `listingDate` date NOT NULL,
  PRIMARY KEY (`adminId`,`mangaId`),
  KEY `mangaId` (`mangaId`),
  CONSTRAINT `mangalisting_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `admininfo` (`adminId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `mangalisting_ibfk_2` FOREIGN KEY (`mangaId`) REFERENCES `manga` (`mangaId`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangalisting`
--

LOCK TABLES `mangalisting` WRITE;
/*!40000 ALTER TABLE `mangalisting` DISABLE KEYS */;
INSERT INTO `mangalisting` VALUES (1,1,'2022-09-20'),(1,2,'2022-09-22'),(1,3,'2022-09-22'),(1,4,'2022-09-22'),(1,5,'2022-09-22'),(1,6,'2022-09-22'),(1,7,'2022-10-03'),(1,8,'2022-10-03'),(1,9,'2022-10-05'),(1,10,'2022-10-05'),(1,11,'2022-10-05'),(1,12,'2022-10-05'),(1,13,'2022-10-05'),(1,14,'2022-10-07'),(1,15,'2022-10-10');
/*!40000 ALTER TABLE `mangalisting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangapublisher`
--

DROP TABLE IF EXISTS `mangapublisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mangapublisher` (
  `publisherId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `website` varchar(1000) NOT NULL,
  PRIMARY KEY (`publisherId`),
  UNIQUE KEY `publisherId` (`publisherId`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangapublisher`
--

LOCK TABLES `mangapublisher` WRITE;
/*!40000 ALTER TABLE `mangapublisher` DISABLE KEYS */;
INSERT INTO `mangapublisher` VALUES (1,'Kakao Corp','https://www.kakaocorp.com/page/service/service/KakaoPage?lang=en'),(2,'Hakusensha','https://en.wikipedia.org/wiki/Hakusensha'),(3,'Shueisha','https://en.wikipedia.org/wiki/Shueisha'),(4,'Viz Media','https://www.viz.com/'),(5,'Enix','https://en.wikipedia.org/wiki/Enix'),(6,'Webtoon','https://www.webtoons.com');
/*!40000 ALTER TABLE `mangapublisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publications` (
  `mangaId` int NOT NULL,
  `publisherId` int NOT NULL,
  `authorId` int NOT NULL,
  PRIMARY KEY (`mangaId`,`publisherId`,`authorId`),
  KEY `publisherId` (`publisherId`),
  KEY `authorId` (`authorId`),
  CONSTRAINT `publications_ibfk_1` FOREIGN KEY (`mangaId`) REFERENCES `manga` (`mangaId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `publications_ibfk_2` FOREIGN KEY (`publisherId`) REFERENCES `mangapublisher` (`publisherId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `publications_ibfk_3` FOREIGN KEY (`authorId`) REFERENCES `mangaauthor` (`authorId`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,1,1),(12,1,1),(5,2,3),(10,2,3),(13,2,2),(15,2,3),(2,3,4),(7,3,4),(11,3,4),(3,4,3),(6,4,1),(8,4,5),(4,5,2),(14,5,5),(9,6,2);
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readinglist`
--

DROP TABLE IF EXISTS `readinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `readinglist` (
  `userId` int NOT NULL,
  `mangaId` int NOT NULL,
  `isFavorite` tinyint(1) NOT NULL DEFAULT '0',
  `readingStatus` enum('completed','ongoing','not-started') DEFAULT NULL,
  PRIMARY KEY (`userId`,`mangaId`),
  KEY `mangaId` (`mangaId`),
  CONSTRAINT `readinglist_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`userId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `readinglist_ibfk_2` FOREIGN KEY (`mangaId`) REFERENCES `manga` (`mangaId`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readinglist`
--

LOCK TABLES `readinglist` WRITE;
/*!40000 ALTER TABLE `readinglist` DISABLE KEYS */;
INSERT INTO `readinglist` VALUES (1,7,1,'completed'),(1,9,1,'ongoing'),(1,10,0,'not-started'),(2,2,0,'not-started'),(2,3,0,'not-started'),(3,7,1,'ongoing'),(4,1,0,'ongoing'),(4,2,0,'completed'),(4,11,1,'ongoing'),(5,3,0,'not-started'),(5,6,0,'not-started'),(5,8,0,'not-started'),(6,1,0,'not-started'),(6,4,0,'not-started'),(6,5,0,'not-started'),(6,11,0,'ongoing'),(6,12,1,'not-started'),(6,13,0,'not-started'),(6,14,0,'ongoing'),(6,15,1,'not-started'),(7,3,0,'ongoing'),(7,9,0,'completed'),(7,15,1,'not-started');
/*!40000 ALTER TABLE `readinglist` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `added_to_reading_list_update_review` AFTER INSERT ON `readinglist` FOR EACH ROW BEGIN
    INSERT INTO reviews (userId, mangaId, rating, review)
    VALUES(new.userId, new.mangaId, NULL, NULL);
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `deleted_from_reading_list` AFTER DELETE ON `readinglist` FOR EACH ROW BEGIN
    DELETE FROM reviews WHERE mangaid = old.mangaid and userid = old.userid;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `userId` int NOT NULL,
  `mangaId` int NOT NULL,
  `rating` float DEFAULT NULL,
  `review` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`,`mangaId`),
  KEY `mangaId` (`mangaId`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`userId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`mangaId`) REFERENCES `manga` (`mangaId`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,7,4.8,'Great manga, one of my favorites'),(1,9,5,'I really like this manga (manhwa). It\'s so wholesome and just overall good story.'),(1,10,2.3,'Did not like the characters or story'),(2,2,3.5,'Generic and predictable plot'),(2,3,2.7,'Not a fan of this manga'),(3,7,4,'The story has a good pace making it easier to binge.'),(4,1,3.6,'Love the artist but plot is only okay'),(4,2,3.8,'Old manga but good story and character'),(4,11,4.8,'One of the best fanatasy manga!'),(5,3,3.7,'Decent read'),(5,6,4.5,'Great character development'),(5,8,3.1,'Nothing special, but enjoyable read'),(6,1,1.6,'One of the worst mangas I\'ve read'),(6,4,3.5,'Decent'),(6,5,3.5,'Okay, nothing special'),(6,11,2.5,'Pretty bad story'),(6,12,4.5,'One of my favorite mangas'),(6,13,2.4,'Story progression is way too slow'),(6,14,2.8,'Was promising at the start, but the author ruined it'),(6,15,4.6,'Love this manga, cool characters and art'),(7,3,4.5,'Great adventure story and characters'),(7,9,2.4,'Found it very boring'),(7,15,5,'Amazing manga, loved the characters and story');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellerinfo`
--

DROP TABLE IF EXISTS `sellerinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellerinfo` (
  `sellerId` int NOT NULL AUTO_INCREMENT,
  `sellerName` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  PRIMARY KEY (`sellerId`),
  UNIQUE KEY `sellerName` (`sellerName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellerinfo`
--

LOCK TABLES `sellerinfo` WRITE;
/*!40000 ALTER TABLE `sellerinfo` DISABLE KEYS */;
INSERT INTO `sellerinfo` VALUES (1,'Amazon','https://www.amazon.com/'),(2,'Cruncyroll','https://www.crunchyroll.com'),(3,'Funanimation','https://www.funimation.com/'),(4,'Etsy','https://www.etsy.com/');
/*!40000 ALTER TABLE `sellerinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellinginfo`
--

DROP TABLE IF EXISTS `sellinginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellinginfo` (
  `sellerId` int NOT NULL,
  `mangaId` int NOT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`sellerId`,`mangaId`),
  KEY `mangaId` (`mangaId`),
  CONSTRAINT `sellinginfo_ibfk_1` FOREIGN KEY (`sellerId`) REFERENCES `sellerinfo` (`sellerId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `sellinginfo_ibfk_2` FOREIGN KEY (`mangaId`) REFERENCES `manga` (`mangaId`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellinginfo`
--

LOCK TABLES `sellinginfo` WRITE;
/*!40000 ALTER TABLE `sellinginfo` DISABLE KEYS */;
INSERT INTO `sellinginfo` VALUES (1,1,8),(1,3,3),(1,4,4),(1,6,1),(1,7,3),(1,9,5),(1,10,7),(1,12,7),(1,14,5),(1,15,3),(2,1,11),(2,2,13),(2,3,12),(2,4,15),(2,5,3),(2,6,15),(2,7,12),(2,8,14),(2,9,12),(2,10,16),(2,11,13),(2,12,12),(2,13,10),(2,14,10),(2,15,10),(3,1,34),(3,2,5),(3,3,43),(3,4,4),(3,5,6),(3,7,6),(3,9,4),(3,11,3),(3,12,5),(3,13,4),(3,15,7),(4,1,15),(4,2,15),(4,4,15),(4,5,15),(4,6,15),(4,8,15),(4,9,15),(4,11,15),(4,12,15),(4,13,15);
/*!40000 ALTER TABLE `sellinginfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `emailId` varchar(100) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'Roy','Mustang','r.mustang@gmail.com'),(2,'Ace','Smith','a.smith@gmail.com'),(3,'Erwin','Johnson','e.johnson@gmail.com'),(4,'Levi','Strongarm','l.strongarm@gmail.com'),(5,'Becky','Blackbell','b.blackbell@gmail.com'),(6,'Zoro','Roronoa','Zoro@1234'),(7,'Naruto','Uzumaki','naruto@1234');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogin`
--

DROP TABLE IF EXISTS `userlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlogin` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `loginId` varchar(100) NOT NULL,
  `loginPassword` varchar(100) NOT NULL,
  PRIMARY KEY (`loginId`),
  UNIQUE KEY `loginId` (`loginId`),
  KEY `userId` (`userId`),
  CONSTRAINT `userlogin_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`userId`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogin`
--

LOCK TABLES `userlogin` WRITE;
/*!40000 ALTER TABLE `userlogin` DISABLE KEYS */;
INSERT INTO `userlogin` VALUES (2,'ace','Ace@1234'),(5,'becky','Becky@1234'),(3,'erwin','Erwin@1234'),(4,'levi','Levi@1234'),(1,'mustang','Mustang@1234'),(7,'NARUTO','Naruto@1234'),(6,'Zoro','Zoro@1234');
/*!40000 ALTER TABLE `userlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mangaproj'
--

--
-- Dumping routines for database 'mangaproj'
--
/*!50003 DROP FUNCTION IF EXISTS `check_author` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_author`(authorFirst VARCHAR(100), authorLast VARCHAR(100), authorDOB DATE) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
	IF EXISTS(SELECT * FROM mangaAuthor WHERE mangaAuthor.firstName LIKE authorFirst 
											AND mangaAuthor.lastName LIKE authorLast
											AND mangaAuthor.dateOfBirth = authorDOB) THEN
		RETURN(FALSE);
	ELSE 
		RETURN(TRUE);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_manga` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_manga`(title  VARCHAR(100), release_date DATE, genre  VARCHAR(100), num_of_pages INT) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
	IF EXISTS(SELECT * FROM manga WHERE manga.title LIKE title AND manga.releaseDate=release_date AND manga.genre LIKE genre
										AND manga.numOfPages = num_of_pages) THEN
		RETURN(FALSE);
	ELSE 
		RETURN(TRUE);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_publisher` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_publisher`(publisherName VARCHAR(100), publisherWeb VARCHAR(100)) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
	IF EXISTS(SELECT * FROM mangaPublisher WHERE mangaPublisher.name LIKE publisherName AND mangaPublisher.website LIKE publisherWeb) THEN
		RETURN(FALSE);
	ELSE 
		RETURN(TRUE);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addManga` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addManga`(in adminName varchar(100), title  varchar(100), release_date date, genre  varchar(100), num_of_pages int, 
							publisherName varchar(100), publisherWeb varchar(100), authorFirst varchar(100), authorLast varchar(100), authorDOB date)
BEGIN
	-- condition to check manga
    if check_manga(title  , release_date, genre, num_of_pages) then
		INSERT INTO manga(title, releaseDate, genre, numOfPages)
				VALUES (title, release_date, genre, num_of_pages);
	end if;
	-- condition to check mangaAuthor
	if check_author(authorFirst , authorLast , authorDOB) then
		INSERT INTO mangaAuthor(firstName, lastName, dateOfBirth)
				VALUES (authorFirst, authorLast, authorDOB);
	end if;
	-- condition to check mangaPublisher
    if check_publisher(publisherName , publisherWeb) then
		INSERT INTO mangaPublisher(name, website)
				VALUES (publisherName, publisherWeb);
    end if;
    
    -- updating publications
    call updatePublications(title, release_date, genre, num_of_pages, 
							publisherName, publisherWeb, authorFirst, authorLast, authorDOB);
                            
	-- updating manga listings
    call updateMangaListings(adminName, title, release_date, genre, num_of_pages);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addPrice`(IN mangaid INT, sellerid INT, price FLOAT)
BEGIN
	IF NOT EXISTS(SELECT * FROM sellinginfo WHERE sellinginfo.sellerId=sellerid 
											AND sellinginfo.mangaId=mangaid) THEN
	INSERT INTO sellinginfo(sellerId, mangaId, price)
			VALUES (sellerid, mangaid, price);
	 ELSE
		UPDATE sellinginfo
 		SET sellinginfo.price = price
 		WHERE sellinginfo.sellerId = sellerid AND
         sellinginfo.mangaId = mangaid; 
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addSeller` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addSeller`(IN seller_Name VARCHAR(100), sellerWeb VARCHAR(100))
BEGIN
	IF NOT EXISTS(SELECT * FROM sellerinfo WHERE sellerinfo.sellerName LIKE seller_Name 
											AND sellerinfo.website LIKE sellerWeb) THEN
		INSERT INTO sellerinfo(sellerName, website)
					VALUES (seller_Name, sellerWeb);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addToReadingList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addToReadingList`(IN username VARCHAR(100), IN in_mangaId INT)
BEGIN
	DECLARE UID INT;
    DECLARE m_genre VARCHAR(100);
    SELECT userId FROM userlogin WHERE loginId LIKE username INTO UID;
	INSERT INTO readinglist(userId, mangaId, isFavorite, readingStatus)
	VALUES (UID, in_mangaId, FALSE, 'not-started');
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_login_check` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_login_check`(IN adminLogin varchar(100), IN adminPassword varchar(100))
BEGIN
    SELECT UPPER(loginId) AS loginId, loginPassword FROM adminlogin WHERE loginId LIKE adminLogin AND loginPassword = adminPassword;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeFavoriteStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeFavoriteStatus`(IN username VARCHAR(100) ,IN in_mangaId INT, favoriteStatus BOOLEAN)
BEGIN
	DECLARE UID INT;
    SELECT userId FROM userlogin WHERE loginId LIKE username INTO UID;
    UPDATE readinglist
	SET isFavorite = favoriteStatus
	WHERE mangaId = in_mangaId AND userId = UID; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeReadingStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeReadingStatus`(IN username varchar(100) ,IN in_mangaId INT, new_status VARCHAR(100))
BEGIN
	Declare UID INT;
    SELECT userId FROM userlogin WHERE loginId LIKE username INTO UID;
    UPDATE readinglist
	SET readingStatus = new_status
	WHERE mangaId = in_mangaId AND userId = UID; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_user`(IN username VARCHAR(100), IN user_password VARCHAR(100), IN first_name VARCHAR(100), IN last_name VARCHAR(100), IN email_Id VARCHAR(100))
BEGIN
	declare in_userId int;
    INSERT INTO userInfo(firstName, lastName, emailId)
    VALUES(first_name, last_name, email_Id);
    SELECT userId into in_userId FROM userInfo WHERE userInfo.firstName=first_name and
											userInfo.lastName=last_name and userInfo.emailId=email_Id;
    INSERT INTO userLogin(userId, loginId, loginPassword)
    VALUES(in_userId, username, user_password);
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getReadingList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getReadingList`(IN username VARCHAR(100))
BEGIN
	DECLARE user_id INT;
    SELECT userId INTO user_id FROM UserLogin WHERE loginId = username;
    SELECT mangaId, title , genre, IF(isFavorite IS TRUE, 'Favorite', 'Not Favorite') as Favorite_Status, readingstatus as Reading_Status , rating FROM
    (SELECT * FROM readinglist NATURAL JOIN Manga
    WHERE userId = user_id) AS tableOne
    NATURAL JOIN
    (SELECT * FROM Reviews WHERE userId = user_id) AS tableTwo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getReviews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getReviews`(IN mangaId_U INT)
BEGIN
SELECT 
    FORMAT((@cnt:=@cnt + 1), 0) AS review_number, review
FROM
    reviews
  CROSS JOIN (SELECT @cnt := 0) AS d
  WHERE mangaId = mangaId_U AND review IS NOT NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manga_by_author` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manga_by_author`(IN selected_author varchar(100))
BEGIN
    SELECT mangaId, title, releaseDate, genre, numofpages, firstname as author_first_name, lastname as author_last_name FROM (SELECT * FROM manga NATURAL JOIN publications 
NATURAL JOIN mangaauthor WHERE mangaauthor.lastname LIKE selected_author) AS t1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manga_by_genre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manga_by_genre`(IN selected_genre varchar(50))
BEGIN
    SELECT * FROM manga where selected_genre = genre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manga_by_mangaId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manga_by_mangaId`(IN selected_mangaId int)
BEGIN
    SELECT mangaId, title, releaseDate, genre, numofpages, name as publisher, firstname as author_first_name, lastname as author_last_name  FROM (SELECT * FROM manga NATURAL JOIN publications 
NATURAL JOIN mangapublisher NATURAL JOIN mangaauthor WHERE mangaId = selected_mangaId) AS t1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manga_by_publisher` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manga_by_publisher`(IN selected_publisher varchar(100))
BEGIN
    SELECT mangaId, title, releaseDate, genre, numofpages, name as publisher FROM (SELECT * FROM manga NATURAL JOIN publications 
NATURAL JOIN mangapublisher WHERE mangapublisher.name LIKE selected_publisher) AS t1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `removefromreadinglist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `removefromreadinglist`(IN selected_mangaId INT, IN user_name VARCHAR(100))
BEGIN
DELETE FROM readinglist WHERE mangaId = selected_mangaId AND user_name LIKE (SELECT loginId FROM userLogin WHERE loginId LIKE user_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `top_10_by_average_rating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `top_10_by_average_rating`()
BEGIN
SELECT
    Format((@cnt := @cnt + 1), 0) AS ranking,
    mangaId, title, releaseDate, genre, numofpages, name AS publisher, firstname AS author_first_name, lastname AS author_last_name, average_rating
    FROM (SELECT * FROM manga NATURAL JOIN publications NATURAL JOIN mangapublisher NATURAL JOIN mangaauthor) AS t1
    NATURAL JOIN (SELECT mangaId, FORMAT(AVG(rating), 2) AS average_rating FROM reviews GROUP BY mangaId ORDER BY average_rating DESC) AS t
  CROSS JOIN (SELECT @cnt := 0) AS d
  WHERE average_rating IS NOT NULL
  LIMIT 10;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateMangaListings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateMangaListings`(IN adminName VARCHAR(100), title  VARCHAR(100), release_date DATE, genre  VARCHAR(100), num_of_pages INT)
BEGIN
	DECLARE manga_id, admin_id INT;
    
    SELECT mangaId INTO manga_id FROM Manga WHERE manga.title LIKE title AND manga.releaseDate=release_date AND manga.genre LIKE genre
										AND manga.numOfPages = num_of_pages;
	
    SELECT adminId INTO admin_id FROM adminLogin WHERE adminLogin.loginId LIKE adminName;
                                        
    INSERT INTO mangalisting(adminId, mangaId, listingDate)
				VALUES (admin_id, manga_id, (SELECT CURDATE()));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updatePublications` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePublications`(IN title  VARCHAR(100), release_date DATE, genre  VARCHAR(100), num_of_pages INT, 
							publisherName VARCHAR(100), publisherWeb VARCHAR(100), authorFirst VARCHAR(100), authorLast VARCHAR(100), authorDOB DATE)
BEGIN
	DECLARE manga_id, publisher_id, author_id INT;
    
    SELECT mangaId INTO manga_id FROM Manga WHERE manga.title=title AND manga.releaseDate=release_date AND manga.genre=genre
										AND manga.numOfPages = num_of_pages;
                                        
    SELECT publisherId INTO publisher_id FROM MangaPublisher WHERE mangaPublisher.name LIKE publisherName AND mangaPublisher.website LIKE publisherWeb;
    
    SELECT authorId INTO author_id FROM MangaAuthor WHERE mangaAuthor.firstName=authorFirst 
											AND mangaAuthor.lastName=authorLast
											AND mangaAuthor.dateOfBirth = authorDOB;
    INSERT INTO Publications(mangaId, publisherId,authorId)
				VALUES (manga_id, publisher_id, author_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateRatingReview` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateRatingReview`(IN username varchar(100), IN mangaId_U INT, IN new_rating FLOAT, IN new_review varchar(100))
BEGIN
	Declare UID INT;
    SELECT userId FROM userlogin WHERE loginId LIKE username INTO UID;
    Update reviews
	SET
	rating = new_rating,
    review = new_review    
	WHERE userId = UID AND mangaId = mangaId_U;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_login_check` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_login_check`(IN userLogin varchar(100), IN userPassword varchar(100))
BEGIN
    SELECT UPPER(loginId) AS loginId, loginPassword FROM userlogin WHERE loginId LIKE userLogin AND loginPassword = userPassword;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_names_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_names_list`()
BEGIN
    SELECT UPPER(loginId) AS loginId FROM userlogin UNION SELECT UPPER(loginId) AS loginId FROM adminlogin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `viewMangaInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `viewMangaInfo`(IN in_mangaId INT)
BEGIN
    SELECT tablesix.mangaId as mangaId, title, releaseDate, genre, numofpages, publisherName, AuthorFirstName, AuthorLastName,
    IF(averageRating IS NULL, 'unrated', averageRating) as averageRating, lowestSellerName, LowestPrice, sellerwebsite
    FROM (Select tableThree.mangaId as mangaId, title, releaseDate, genre, numOfPages, name AS publisherName, firstname AS AuthorFirstName, lastname AS AuthorLastName, dateOfBirth, website, averageRating
From (SELECT * FROM (SELECT * FROM (SELECT * FROM (SELECT * FROM manga WHERE mangaId = in_mangaId) AS tableZero NATURAL JOIN publications) 
    AS tableOne NATURAL JOIN mangaAuthor) AS tableTwo NATURAL JOIN mangapublisher) AS tableThree
    LEFT OUTER JOIN (SELECT mangaId, FORMAT(AVG(rating), 2) AS averageRating FROM reviews WHERE mangaId = in_mangaId GROUP BY mangaId) AS tablefour ON tableThree.mangaId = tablefour.mangaId) as tablesix
    LEFT OUTER JOIN (SELECT mangaId, CONCAT('$', FORMAT(price, 2)) AS LowestPrice, website AS sellerwebsite, sellername AS lowestSellerName FROM sellinginfo NATURAL JOIN sellerinfo WHERE mangaId = in_mangaId ORDER BY price ASC LIMIT 1) AS tablefive ON tablefive.mangaId = tablesix.mangaId
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-09 17:18:08
