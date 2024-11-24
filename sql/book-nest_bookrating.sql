-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: book-nest
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `bookrating`
--

DROP TABLE IF EXISTS `bookrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookrating` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `comment` text,
  `rating` int NOT NULL,
  `rating_time` datetime(6) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK5y6k4uja5kh3yvwwvn8foj2a6` (`customer_id`),
  KEY `FKi88kmaaw2t96ul27t105veonr` (`book_id`),
  CONSTRAINT `FK5y6k4uja5kh3yvwwvn8foj2a6` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKi88kmaaw2t96ul27t105veonr` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookrating`
--

LOCK TABLES `bookrating` WRITE;
/*!40000 ALTER TABLE `bookrating` DISABLE KEYS */;
INSERT INTO `bookrating` VALUES (1,'Not too good not too bad it was a medium experience.',3,'2024-11-07 14:02:47.458107',2,93),(2,'It\'s a beautiful story of Hilary Mantel',4,'2024-11-07 14:07:17.012790',1,93),(3,'Nice book but read for once.',4,'2024-11-09 10:21:12.319377',1,92),(4,'It\'s a beautiful story about the greatest show on earth!',4,'2024-11-09 11:52:30.989219',2,90),(5,'Naah not too good',3,'2024-11-09 18:38:19.356732',3,92),(6,'Good Book, must read!',4,'2024-11-10 00:29:19.933656',2,48),(7,'Great Book',5,'2024-11-10 22:03:08.019214',1,53),(8,'Best book of the year about god delusion.',4,'2024-11-10 22:08:31.397849',3,89),(9,'Great book must read!!!',4,'2024-11-10 22:15:48.188111',1,80),(10,'This book is lovely',4,'2024-11-11 11:00:18.832471',5,77),(11,'good',3,'2024-11-11 13:37:38.124988',1,10),(12,'Great book about Michelle Obama.',4,'2024-11-11 18:47:03.029241',5,34),(13,'This book is awesome',4,'2024-11-24 23:13:16.984999',2,28);
/*!40000 ALTER TABLE `bookrating` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-24 23:23:30
