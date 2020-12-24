-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: datamax
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.38-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('Umum',NULL,1),('Handphone dan Aksesoris',NULL,2),('Baju dan Aksesoris',NULL,3),('Makanan dan Minuman',NULL,4),('Motor',NULL,5),('Aksesories',2,6),('Casing',2,7),('Samsung',2,8),('Kering',4,9),('Basah',4,10),('Honda',5,11),('Yamaha',5,12),('Suzuki',5,13),('Fashion Pria',3,14),('Fashion Wanita',3,15);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,1,'https://picsum.photos/200/300'),(2,1,'https://picsum.photos/200/300'),(3,1,'https://picsum.photos/200/300'),(4,2,'https://picsum.photos/200/300'),(5,2,'https://picsum.photos/200/300'),(6,3,'https://picsum.photos/200/300'),(7,4,'https://picsum.photos/200/300'),(8,4,'https://picsum.photos/200/300'),(9,5,'https://picsum.photos/200/300'),(10,5,'https://picsum.photos/200/300'),(11,5,'https://picsum.photos/200/300'),(12,6,'https://picsum.photos/200/300'),(13,6,'https://picsum.photos/200/300'),(14,7,'https://picsum.photos/200/300'),(15,8,'https://picsum.photos/200/300'),(16,8,'https://picsum.photos/200/300'),(17,8,'https://picsum.photos/200/300'),(18,8,'https://picsum.photos/200/300'),(19,8,'https://picsum.photos/200/300'),(20,12,'https://picsum.photos/200/300'),(21,12,'https://picsum.photos/200/300');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `name` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('Bakso aci telur puyuh',95000,NULL,1,1,'10'),('Es Teler',34000,NULL,2,1,'10'),('Rice bowl ayam suwir scrambled eggs',12000,NULL,3,3,'9'),('Puding Strawberry',19000,NULL,4,4,'10'),('roti korea',50000,NULL,5,5,'9'),('RED Jelly',13000,NULL,6,6,'10'),('Biji Salak',35000,NULL,7,7,'9'),('Huawei',23000,NULL,8,8,'2'),('soto',15000,NULL,9,9,'10'),('Ciki',25000,NULL,10,10,'9'),('Donken frozen',24000,NULL,11,11,'9'),('Bebek goreng',35000,NULL,12,12,'9'),('Pudding Strawberry',55000,NULL,13,13,'10'),('Iphone 7',60000,NULL,14,14,'2'),('Seprei Home Made Anti Luntur ',85000,NULL,15,15,'1');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Column4` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('USEM000000001','John Stone',1,''),('USEM000000002','Ponnappa Priya',2,''),('USEM000000003','Mia Wong',3,''),('USEM000000004','Peter Stanbridge',4,''),('USEM000000005','Natalie Lee-Walsh',5,''),('USEM000000006','Ang Li',6,''),('USEM000000007','Nguta Ithya',7,''),('USEM000000008','Tamzyn French',8,''),('USEM000000009','Salome Simoes',9,''),('USEM000000010','Trevor Virtue',10,''),('USEM000000011','Tarryn Campbell-Gillies',11,''),('USEM000000012','Eugenia Anders',12,''),('USEM000000013','Andrew Kazantzis',13,''),('USEM000000014','Verona Blair',14,''),('USEM000000015','Jane Meldrum',15,'');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'datamax'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-24 14:50:59
