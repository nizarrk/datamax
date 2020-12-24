-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: datamax_lumen
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Makanan & Minuman',NULL,'2020-12-24 09:17:47','2020-12-24 09:17:47'),(2,'Handphone & Aksesoris',NULL,'2020-12-24 09:18:56','2020-12-24 09:58:18'),(3,'Baju & Aksesoris',NULL,'2020-12-24 09:19:05','2020-12-24 09:19:05'),(4,'Umum',NULL,'2020-12-24 09:19:27','2020-12-24 09:19:27'),(5,'Kering',1,'2020-12-24 09:21:05','2020-12-24 09:21:05'),(6,'Basah',1,'2020-12-24 09:21:11','2020-12-24 09:21:11'),(7,'Kue',1,'2020-12-24 09:21:52','2020-12-24 09:21:52'),(8,'Samsung',2,'2020-12-24 09:22:12','2020-12-24 09:22:12');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (2,'2020_12_24_073915_create_products_table',2),(3,'2020_12_24_073936_create_product_histories_table',3),(4,'2020_12_24_073648_create_categories_table',4),(5,'2020_12_24_112727_create_product_views_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_histories`
--

DROP TABLE IF EXISTS `product_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_histories`
--

LOCK TABLES `product_histories` WRITE;
/*!40000 ALTER TABLE `product_histories` DISABLE KEYS */;
INSERT INTO `product_histories` VALUES (1,'Samsung A51',4300000,1,8,2,'2020-12-24 10:15:09','2020-12-24 10:15:09');
/*!40000 ALTER TABLE `product_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_views`
--

DROP TABLE IF EXISTS `product_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_views` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_views`
--

LOCK TABLES `product_views` WRITE;
/*!40000 ALTER TABLE `product_views` DISABLE KEYS */;
INSERT INTO `product_views` VALUES (1,1,2,'2020-12-24 11:41:47','2020-12-24 11:41:47'),(2,1,2,'2020-12-24 12:07:33','2020-12-24 12:07:33'),(3,1,2,'2020-12-24 12:07:35','2020-12-24 12:07:35');
/*!40000 ALTER TABLE `product_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Donat Telo',15000,1,7,'2020-12-24 09:54:38','2020-12-24 09:54:38'),(2,'Samsung asdas',9300000,1,8,'2020-12-24 09:55:33','2020-12-24 10:15:09');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Herbert Torphy1','awawawaw@example.com','$2y$10$ph0onz0zttcCvd02Rv.ceu2pbvN.c3WAR8D4MOPnU.2Jq9aqsMKXW','2020-12-23 08:06:57','2020-12-24 14:23:52'),(2,'Dr. Leon Gislason Sr.','romaguera.darrell@example.org','$2y$10$wr0Wa1JL52DJrNoGimz56eNIg5XGV9vqDSrRREVxswLo9lGdc/T9q','2020-12-23 08:06:57','2020-12-23 08:06:57'),(3,'Kianna Treutel III','hodkiewicz.mya@example.com','$2y$10$.ZiqxNrQfMtQTOKwLaowWOK4kpTNPjkeB4Yxi/ZQJ.qqx5GLmO0tm','2020-12-23 08:06:57','2020-12-23 08:06:57'),(4,'Prof. Kara Grady IV','jerrold.stroman@example.com','$2y$10$hZ5LdJ3qWGRU6hxMClPWDeThwxufAVtNYy/GxpWhrBNBMyj5xpQ.2','2020-12-23 08:06:57','2020-12-23 08:06:57'),(5,'Winnifred Will','tremblay.eriberto@example.net','$2y$10$9ffPXor4aOHYbH.9GZ47guUlgE6GoPmpeYeToxAiPXpSqkNkjFuTm','2020-12-23 08:06:57','2020-12-23 08:06:57'),(6,'Asa Johnson','kassandra91@example.net','$2y$10$m6R.1/Q8L8EH.J.gflTx0elJZApne/Q23GNgp6ihOPPIuXja7HYnm','2020-12-23 08:06:57','2020-12-23 08:06:57'),(7,'Johnson Lakin','bmitchell@example.net','$2y$10$FpcMGRajOAFp5YX2qbHkg.zhRiuB9u/GPmnLOjc10kwZk6bolbbRS','2020-12-23 08:06:57','2020-12-23 08:06:57'),(8,'Wilma Medhurst','carmela.heller@example.com','$2y$10$XOcZ7mRKeO4EJWfok96GouVOoOF.lr7WKvck/Ni6TWT8OlmY/rg6C','2020-12-23 08:06:57','2020-12-23 08:06:57'),(9,'Felicity Schowalter','enrico.veum@example.com','$2y$10$jQjoblynciExfTV/kL.b4.Xy3SM8EWIrR2f8r0Mfd7arSh/j0lcju','2020-12-23 08:06:57','2020-12-23 08:06:57'),(10,'Dr. Leonel Kilback Jr.','westley23@example.org','$2y$10$SE22FauZpmARYTcUlApxsuFyX6quSQ4RSSflj1c4F5JBxV0LAcRcO','2020-12-23 08:06:57','2020-12-23 08:06:57'),(11,'Prof. Dessie Raynor','armand.lakin@example.com','$2y$10$dmV/uLHcsHD0/O6U0hsh2eTMvRtSgWTmjVb6lldDCFGIClZBU/SaO','2020-12-23 08:06:57','2020-12-23 08:06:57'),(12,'Stewart Waters','perry29@example.org','$2y$10$tq.gAwF0Y/Hnam4lEVSJP.gkQ9rPG3E9EP3i2Mw5M3buHeX2XwyiC','2020-12-23 08:06:57','2020-12-23 08:06:57'),(13,'Jaime Waelchi','tkunze@example.com','$2y$10$6Pp78c.JT2qxXh4LbEH5JeGewZkzCrtSZzpwFTWQrhkNGt4HXf5eu','2020-12-23 08:06:57','2020-12-23 08:06:57'),(14,'Dr. Giuseppe Volkman IV','lbauch@example.com','$2y$10$2lJxx/PXGbRY2f4/WOjrPebKITgdL2Kay8mB55tUSpnZCCD3DpOeW','2020-12-23 08:06:57','2020-12-23 08:06:57'),(15,'Cleo Mayert','edyth35@example.com','$2y$10$zVuLXLGE7hVagvS/Ta1.mObAnOm03IcBUbErfktkAdBGdKfE2e9ym','2020-12-23 08:06:57','2020-12-23 08:06:57'),(16,'Juwan Hansen','gordon65@example.net','$2y$10$OIo/dExNG9ofbTbEGQ1QAeN83OvOgjKubJ4IgEGUJ2pSqP2mgBR76','2020-12-23 08:06:57','2020-12-23 08:06:57'),(17,'Dr. Jarvis Conn MD','wisoky.lindsay@example.com','$2y$10$1gDK03LF9FpvbEQcFDoqB.Yp30YvJ7TqUtJG8BfqXRJsgJoHVpuM.','2020-12-23 08:06:57','2020-12-23 08:06:57'),(18,'Edgar Toy','qbeier@example.com','$2y$10$C.r/Hwy.WllMiFYCv.l1peKXineIFAl6RJrKenmGaPKfNE7pDDyD.','2020-12-23 08:06:57','2020-12-23 08:06:57'),(19,'Darryl Beer','antonina.ziemann@example.com','$2y$10$qsZNJALCfKnyRnFeDYX7zuymbvnaqJgY8KFK3O8IMX/6ONVtpqajS','2020-12-23 08:06:57','2020-12-23 08:06:57'),(20,'Vaughn Bogisich','bergstrom.mariane@example.net','$2y$10$kMdPBUf4AN.hqP14bdCnNOlV/jQhYoYhgxQjM3Cg/1TRW1dOdbt0S','2020-12-23 08:06:57','2020-12-23 08:06:57'),(21,'Miss Margie Nicolas IV','yheathcote@example.com','$2y$10$Vu4CyZi7JT8dsDSxVLp.ju7mCWZpjP7RI/RTJEBpEdLx/kJy6fjE6','2020-12-23 08:06:57','2020-12-23 08:06:57'),(22,'Vincenzo Turcotte','pvandervort@example.net','$2y$10$M6Hgq/l/S5iHUWF7C40Vae6snDx2x/AYSNiUgFfLIBh1O6DS4csSK','2020-12-23 08:06:57','2020-12-23 08:06:57'),(23,'Camille Vandervort','sylvan.stoltenberg@example.net','$2y$10$Q1.pjLPy2eSNVOEg/Yzv3O6uiS8ECQMQbYTPApkcwibKVCCzQB8/.','2020-12-23 08:06:57','2020-12-23 08:06:57'),(24,'Mr. Rocky Blanda','moore.omari@example.com','$2y$10$Mn9Dbbegb7MZjAj0hnNdaOMte80SKbe7lBau/cGN4N3zbOUP5fGvO','2020-12-23 08:06:57','2020-12-23 08:06:57'),(25,'Jordan Breitenberg','estella07@example.org','$2y$10$e6gWk7yblAi4Nh1q8SF.R.2tYYqBwgGDRvJHgQHUNfWNKBTY6mAOe','2020-12-23 08:06:57','2020-12-23 08:06:57'),(26,'Precious Raynor III','irma61@example.com','$2y$10$YXJ0aOaI8JeallYwAgkt6.JYF5w05ftKcPC2NWsV3y/nZJL7ICC1W','2020-12-23 08:06:57','2020-12-23 08:06:57'),(27,'Mina Kutch','west.sally@example.org','$2y$10$gIeGcz4VKX.k/x3djlMUvOwyfwRC0jBTqU/Rd1g84ubC36aysUADi','2020-12-23 08:06:57','2020-12-23 08:06:57'),(28,'Larue Mayert','loren.jerde@example.net','$2y$10$YHEraAnmK0v8MND.hSyteuQVXM0cx1HNnbZGH4cJ3xXfrODnAnhne','2020-12-23 08:06:57','2020-12-23 08:06:57'),(29,'Katharina O\'Reilly','beatty.forest@example.org','$2y$10$2fxh7Ua2qVUqGRTNklhiluXZpx2g5BaLH6dm71oYHS37YyeEECKhG','2020-12-23 08:06:57','2020-12-23 08:06:57'),(30,'Isaias Mohr','lysanne60@example.net','$2y$10$rxOhl69Wctd3sENxWw2eA.pUHvOvLrW2KH8oUz86doLWlMIkymR7u','2020-12-23 08:06:57','2020-12-23 08:06:57'),(31,'NRK','nrk@example.com','$2y$10$Lzac06EyBFDC/x7Rkd/MIeZi/cB1OGDSLUdrf8U9HNkPd4QlMwtim','2020-12-23 10:57:49','2020-12-23 10:57:49'),(32,'NRK','nrak@example.com','$2y$10$zbA3.L5d9OqALC5osCMbV.8iHkWmYcic9TlsCP.OdTuch/rLj3hWa','2020-12-23 11:40:17','2020-12-23 11:40:17'),(33,'NRK','nraak@example.com','$2y$10$2Hc.49E2noZxPpPNfkWbKuePnyR14myNA1q5usJErZFBt6QH.m2na','2020-12-23 11:41:12','2020-12-23 11:41:12'),(34,'NRK','nraaak@example.com','$2y$10$CNoTW6gjsC38CxCCPUIVnuEGu0a4dAdp3x.qElae9Db2TSl6RyTK2','2020-12-24 03:09:41','2020-12-24 03:09:41'),(35,'NRK','aaa@example.com','$2y$10$XXVt3/uXtWrLjoRhrObzyeXeGGCZKFeVFc90l8aNDjHSfqPBkKggO','2020-12-24 03:33:53','2020-12-24 03:33:53'),(36,'NRK','aaaa@example.com','$2y$10$t1dTU6npf3C9yamzDS8oieTZKbsUvzfiDqIaYphZvu.LkpbdUbggi','2020-12-24 03:34:34','2020-12-24 03:34:34'),(37,'NRK','aaaaa@example.com','$2y$10$pKBlZVYrEYS1LQadlmHG9OZmyxmQrXNF5t081.Iq.oDvkyNUDZK9K','2020-12-24 03:36:38','2020-12-24 03:36:38'),(38,'NRK','aaaaaa@example.com','$2y$10$vLNhYkSCU3a7p2CMOFxpV.UGO47WK1SehhZGYOzpunZmwJj0p6GpG','2020-12-24 03:45:38','2020-12-24 03:45:38'),(39,'Testing','testing1@test.com','$2y$10$3c6zEdFXj0CTeqt/ikhj4uc5Ynd8GNTHn4bls3ElH0hCmThtW/Hoi','2020-12-24 13:46:03','2020-12-24 13:46:03'),(40,'NRK','tes@example.com','$2y$10$u1no.BFS7I3WgC4f6S9vdO1J31IiGbmM3EGA309CVHJ7wqvgqrI0S','2020-12-24 14:09:28','2020-12-24 14:09:28');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'datamax_lumen'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-24 21:55:52
