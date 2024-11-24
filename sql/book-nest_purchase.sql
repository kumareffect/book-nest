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
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `paymentId` varchar(255) DEFAULT NULL,
  `time` datetime(6) DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd2uh1ag46cp4bp78hub2avoyv` (`book_id`),
  KEY `FK15nvfxt1otlr20atpbi9c2uo3` (`customer_id`),
  CONSTRAINT `FK15nvfxt1otlr20atpbi9c2uo3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKd2uh1ag46cp4bp78hub2avoyv` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,590,'Love is Eternal','3c3aff2e-c4e0-4e03-9fc5-0509362e06e8','2024-11-10 19:03:04.492539',77,1),(2,490,'Bring Up the Bodies','536f62ef-8e0e-4273-815c-23962a37009b','2024-11-10 19:15:58.206852',92,2),(3,490,'Bring Up the Bodies','69eeeffa-c09c-4da8-bc6a-c66324d42f79','2024-11-10 19:18:51.296796',92,2),(4,490,'Bring Up the Bodies','03e4afb2-fde1-45b4-b8ea-d4ffca33387f','2024-11-10 19:20:33.828656',92,2),(5,490,'Bring Up the Bodies','b6410b5a-baf6-4138-a7b4-fca5d32b911d','2024-11-10 19:41:30.792022',92,3),(6,460,'Contact','f335ea58-7146-4987-98fc-356663952c2a','2024-11-10 19:53:06.650251',44,1),(7,290,'The Dragons of Eden','7f66ec18-3e76-46bf-a239-1cc52d00c8b1','2024-11-10 19:59:52.497944',46,6),(8,860,'The Origin','a5e02b60-791d-4a81-b8ea-ed9481b02035','2024-11-10 20:03:12.345700',74,6),(9,466,'The House of Lincoln','746eedf6-7aff-4108-a8c6-e31b928eb7e2','2024-11-10 20:16:36.249822',80,6),(10,680,'Claudius the God and His Wife Messalina','268aa0e8-1568-4a4b-89a7-b742f2a44d3a','2024-11-10 20:40:17.029369',66,2),(11,1505,'War and Peace','195974ab-f9c5-4a6c-aea4-339e347a8dd8','2024-11-10 20:43:23.885588',61,1),(12,756,'Wolf Hall','d57de4b4-69b6-4995-ad62-f9312b8da222','2024-11-10 20:46:46.085404',91,1),(13,555,'The Greatest Show on Earth','49e84446-6222-4795-843c-1896dfdccaab','2024-11-10 20:50:13.028662',90,3),(14,555,'The Greatest Show on Earth','c9edef6a-7ae0-4050-ba87-d09aa09e4a67','2024-11-10 20:51:41.370446',90,3),(15,756,'Wolf Hall','3e1079d0-3e95-490f-b513-85f647da2e1f','2024-11-10 20:56:03.183935',91,1),(16,370,'On the Origin of Time','5c3fdfc3-a624-4854-8835-2b25cb51d02e','2024-11-10 21:01:03.671701',49,2),(17,750,'Always Rachel','3bf1fe7d-a2f7-49a9-8520-f943fa1a2d3e','2024-11-10 21:03:00.806091',55,1),(18,150,'The Death of Ivan Ilych','598ec439-3f46-47fe-941e-3ec489d6e9d0','2024-11-10 21:06:58.418904',63,2),(19,150,'The Death of Ivan Ilych','7c7e783d-903a-444b-86da-3b4240c5e23c','2024-11-10 21:32:50.218829',63,2),(20,480,'Silent Spring','67ba2371-067d-49ac-9c87-f5fa1ffde28a','2024-11-10 21:38:52.749423',54,1),(21,650,'I, Claudius','ca8c00a3-57e3-4dbf-88fa-74b8f315c80c','2024-11-10 21:45:08.108155',64,2),(22,590,'Love is Eternal','06b78b57-7fe7-4a93-92e5-953c453366b9','2024-11-10 21:46:26.730467',77,6),(23,264,'The Theory of Everything','fc97abcb-0e08-46db-877e-6806816459e2','2024-11-10 22:03:19.407967',53,1),(24,450,'The God Delusion','f83cd5da-c3cc-4220-9993-0ff118c7a155','2024-11-10 22:08:40.426479',89,3),(25,850,'Harry Potter and the Goblet of Fire','e9f46cca-9b5d-4a79-a438-e210f6df959d','2024-11-10 22:09:16.554614',24,3),(26,466,'The House of Lincoln','9bf2c6fd-1a3b-48cc-acd4-9c2d014d7e3e','2024-11-10 22:15:57.885452',80,1),(27,590,'Love is Eternal','59415c33-c3b3-49f8-ad5d-3817273121e7','2024-11-11 11:00:53.098141',77,5),(28,420,'Dance Dance Dance','2ab9e72a-a83f-4f1e-b0be-10bc35daaadc','2024-11-11 13:37:58.281437',10,1),(29,520,'Becoming','289ee36f-e265-440c-944a-653c78dcb153','2024-11-11 18:47:36.828100',34,5),(30,850,'Harry Potter and the Goblet of Fire','c7739a2a-a89b-4173-ad33-dacebb23d28d','2024-11-12 11:39:21.010797',24,2),(31,555,'The Greatest Show on Earth','f9bdfdc1-3307-4d76-87da-7ce36deb2cb3','2024-11-13 11:18:50.780618',90,2),(32,352,'Brave New World','9ad66462-a6cf-4c9e-8fd6-564030e7c1c4','2024-11-24 23:13:24.794047',28,2);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
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
