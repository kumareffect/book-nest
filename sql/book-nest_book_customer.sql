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
-- Table structure for table `book_customer`
--

DROP TABLE IF EXISTS `book_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_customer` (
  `book_id` int NOT NULL,
  `customer_id` int NOT NULL,
  KEY `FKpwb1m9xnjdr2xi1c3tkafqt3c` (`customer_id`),
  KEY `FK8ercp20t6iftjo8halpvrc5lb` (`book_id`),
  CONSTRAINT `FK8ercp20t6iftjo8halpvrc5lb` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `FKpwb1m9xnjdr2xi1c3tkafqt3c` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_customer`
--

LOCK TABLES `book_customer` WRITE;
/*!40000 ALTER TABLE `book_customer` DISABLE KEYS */;
INSERT INTO `book_customer` VALUES (77,1),(92,2),(92,2),(92,2),(92,3),(44,1),(46,6),(74,6),(80,6),(66,2),(61,1),(91,1),(90,3),(90,3),(91,1),(49,2),(55,1),(63,2),(63,2),(54,1),(64,2),(77,6),(53,1),(89,3),(24,3),(80,1),(77,5),(10,1),(34,5),(24,2),(90,2),(28,2);
/*!40000 ALTER TABLE `book_customer` ENABLE KEYS */;
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
