-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Electronics'),(2,'Books'),(3,'Clothing');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,4,1,1,699.99),(2,5,1,1,699.99),(3,5,2,2,999.99),(4,6,4,1,19.99),(5,7,1,1,699.99),(6,7,2,1,999.99),(7,8,1,1,699.99),(8,9,1,1,699.99),(9,10,1,1,699.99),(10,11,8,1,29.99),(11,11,5,1,89.99),(12,12,1,1,699.99),(13,12,2,1,999.99),(14,13,2,1,999.99),(15,14,2,2,999.99),(16,15,2,2,999.99),(17,15,3,1,14.99),(18,15,5,1,89.99),(19,15,4,1,19.99),(20,16,2,3,999.99),(21,16,4,1,19.99),(22,17,1,1,699.99),(23,18,2,1,999.99),(24,18,5,1,89.99),(25,19,3,1,14.99),(26,19,2,1,999.99),(27,19,4,1,19.99),(28,20,2,1,999.99),(29,20,4,1,19.99),(30,21,2,1,999.99),(31,22,2,1,999.99),(32,22,8,1,29.99),(33,23,1,1,699.99),(34,24,2,1,999.99),(35,25,2,1,999.99),(36,25,3,1,14.99),(37,26,2,1,999.99),(38,26,8,1,29.99),(39,27,2,1,999.99),(40,27,3,1,14.99),(41,28,3,1,14.99),(42,29,2,1,999.99),(43,30,2,1,999.99),(44,31,2,1,999.99),(45,31,8,1,29.99),(46,32,2,1,999.99),(47,33,2,1,999.99),(48,34,2,1,999.99),(49,35,2,1,999.99),(50,36,1,2,699.99),(51,37,3,1,14.99),(52,37,4,1,19.99),(53,38,2,1,999.99),(54,38,4,1,19.99),(55,38,8,2,29.99),(56,39,2,1,999.99),(57,40,2,2,999.99),(58,40,4,1,19.99),(59,40,6,1,129.99),(60,41,2,1,999.99),(61,41,4,1,19.99),(62,42,2,1,999.99),(63,42,4,1,19.99);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `shipping_email` varchar(255) DEFAULT NULL,
  `shipping_phone` varchar(15) DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`usersID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,699.99,'myhouse','tranad@email.com','0934174952','2024-06-14 17:04:11'),(2,1,1699.98,'myhouse','tranad@email.com','0934174952','2024-06-14 17:11:09'),(3,1,699.99,'myhouse','tranad@email.com','0934174952','2024-06-14 18:02:24'),(4,1,699.99,'myhouse','tranad@email.com','0934174952','2024-06-14 18:03:07'),(5,1,2699.97,'myhouse','tranad@email.com','0934174952','2024-06-14 18:03:50'),(6,1,19.99,'myhouse','tranad@email.com','0934174952','2024-06-15 08:21:31'),(7,1,1699.98,'myhouse','tranad@email.com','0934174952','2024-06-15 08:29:34'),(8,1,699.99,'myhouse','tranad@email.com','0934174952','2024-06-15 08:40:54'),(9,1,699.99,'myhouse','tranad@email.com','0934174952','2024-06-15 10:01:45'),(10,7,699.99,'111/17/6 Phạm Văn Chiêu P14 Gò Vấp, Hcm','dohoangtruonghuy@gmail.com','0812000079','2024-06-15 10:22:09'),(11,1,119.98,'myhouse','tranad@email.com','0934174952','2024-06-15 12:17:45'),(12,9,1699.98,'111/17/6 Phạm Văn Chiêu P14 Gò Vấp, Hcm','dohoangtruonghuy@gmail.com','0812000079','2024-06-15 12:38:14'),(13,1,999.99,'myhouse','tranad@email.com','0934174952','2024-06-15 12:56:36'),(14,1,1999.98,'myhouse','tranad@email.com','0934174952','2024-06-15 13:51:11'),(15,1,2124.95,'myhouse','tranad@email.com','0934174952','2024-06-15 14:10:49'),(16,9,3019.96,'111/17/6 Phạm Văn Chiêu P14 Gò Vấp, Hcm','dohoangtruonghuy@gmail.com','0812000079','2024-06-15 15:46:49'),(17,1,699.99,'myhouse','tranad@email.com','0934174952','2024-06-16 02:59:16'),(18,9,1089.98,'111/17/6 Phạm Văn Chiêu P14 Gò Vấp, Hcm','dohoangtruonghuy@gmail.com','0812000079','2024-06-16 07:11:09'),(19,1,1034.97,'myhouse','tranad@email.com','0934174952','2024-06-16 07:19:38'),(20,1,1019.98,'myhouse','tranad@email.com','0934174952','2024-06-16 07:56:21'),(21,1,999.99,'myhouse','tranad@email.com','0934174952','2024-06-16 08:27:38'),(22,1,1029.98,'myhouse','tranad@email.com','0934174952','2024-06-16 09:06:21'),(23,1,699.99,'myhouse','tranad@email.com','0934174952','2024-06-16 09:13:03'),(24,1,999.99,'myhouse','tranad@email.com','0934174952','2024-06-16 10:18:05'),(25,1,1014.98,'myhouse','tranad@email.com','0934174952','2024-06-16 10:22:07'),(26,1,1029.98,'myhouse','tranad@email.com','0934174952','2024-06-16 10:27:20'),(27,1,1014.98,'myhouse','tranad@email.com','0934174952','2024-06-16 10:29:50'),(28,1,14.99,'myhouse','tranad@email.com','0934174952','2024-06-16 10:34:12'),(29,1,999.99,'myhouse','tranad@email.com','0934174952','2024-06-16 10:36:01'),(30,10,999.99,'111/17/6 Phạm Văn Chiêu P14 Gò Vấp, Hcm','dohoangtruonghuy@gmail.com','0812000079','2024-06-16 10:43:31'),(31,10,1029.98,'111/17/6 Phạm Văn Chiêu P14 Gò Vấp, Hcm','dohoangtruonghuy@gmail.com','0812000079','2024-06-16 10:55:16'),(32,10,999.99,'111/17/6 Phạm Văn Chiêu P14 Gò Vấp, Hcm','dohoangtruonghuy@gmail.com','0812000079','2024-06-16 10:55:31'),(33,10,999.99,'111/17/6 Phạm Văn Chiêu P14 Gò Vấp, Hcm','dohoangtruonghuy@gmail.com','0812000079','2024-06-16 10:59:14'),(34,10,999.99,'111/17/6 Phạm Văn Chiêu P14 Gò Vấp, Hcm','dohoangtruonghuy@gmail.com','0812000079','2024-06-16 11:33:41'),(35,1,999.99,'myhouse','tranad@email.com','0934174952','2024-06-16 11:39:21'),(36,1,1399.98,'myhouse','tranad@email.com','0934174952','2024-06-16 11:45:23'),(37,1,34.98,'myhouse','tranad@email.com','0934174952','2024-06-16 12:27:48'),(38,1,1079.96,'myhouse','tranad@email.com','0934174952','2024-06-16 12:44:27'),(39,1,999.99,'myhouse','tranad@email.com','0934174952','2024-06-16 12:50:05'),(40,1,2149.96,'myhouse','tranad@email.com','0934174952','2024-06-16 13:07:17'),(41,11,1019.98,'111/17/6 Phạm Văn Chiêu P14 Gò Vấp, Hcm','dohoangtruonghuy@gmail.com','0812000079','2024-06-16 13:09:03'),(42,11,1019.98,'111/17/6 Phạm Văn Chiêu P14 Gò Vấp, Hcm','dohoangtruonghuy@gmail.com','0812000079','2024-06-16 13:12:00');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `producer` varchar(100) DEFAULT NULL,
  `description` text,
  `image_url` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Smartphone',699.99,'TechCorp','Latest model with high-end specs','img/phone.jpg',1),(2,'Laptop',999.99,'CompWorld','High performance laptop for gaming and work','img/lap.png',1),(3,'Novel',14.99,'BookPublisher','Best-selling fiction book','img/novel.jpg',2),(4,'T-shirt',19.99,'FashionBrand','Comfortable cotton T-shirt','img/head phone.jpg',3),(5,'Headphones',89.99,'SoundMaster','Noise-cancelling over-ear headphones','img/pp3.jpg',1),(6,'E-Reader',129.99,'ReadTech','Portable e-reader with e-ink display','img/T-s.png',1),(7,'Jeans',49.99,'FashionBrand','Stylish denim jeans','img/jeans.jpg',3),(8,'Cookbook',29.99,'FoodPublisher','Recipe book for gourmet cooking','img/cb.jpg',2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `usersID` int NOT NULL AUTO_INCREMENT,
  `usersName` varchar(45) DEFAULT NULL,
  `usersPassword` varchar(45) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `usersFname` varchar(45) DEFAULT NULL,
  `usersDOB` date DEFAULT NULL,
  `usersAddress` varchar(45) DEFAULT NULL,
  `usersEmail` varchar(45) DEFAULT NULL,
  `usersPhone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usersID`),
  UNIQUE KEY `idusers_UNIQUE` (`usersID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'tran','123',1,'TranAdmin','2002-10-24','myhouse','tranad@email.com','0934174952'),(2,'tran2','234',0,'TranUser1','2002-10-24','myhouse','tranuser1@gmail.com','0123456789'),(3,'tran3','345',0,'TranUser2','2002-10-24','myhouse','tranuser1@gmail.com','0854713692'),(4,'tran4','456',0,'tranUser3','2002-10-24','myhouse','tranuser3@gmail.com','0915687423'),(7,'sai','123',0,'huy','2024-06-12','111/17/6 Phạm Văn Chiêu P14 Gò Vấp, Hcm','dohoangtruonghuy@gmail.com','0812000079'),(9,'zan','123',0,'huy','2024-09-02','111/17/6 Phạm Văn Chiêu P14 Gò Vấp, Hcm','dohoangtruonghuy@gmail.com','0812000079'),(10,'saiza','123',0,'huy','2024-06-21','111/17/6 Phạm Văn Chiêu P14 Gò Vấp, Hcm','dohoangtruonghuy@gmail.com','0812000079'),(11,'duy','123',0,'duy','2024-06-25','111/17/6 Phạm Văn Chiêu P14 Gò Vấp, Hcm','dohoangtruonghuy@gmail.com','0812000079');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-16 20:14:36
