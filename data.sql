CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `test`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `_user`
--

DROP TABLE IF EXISTS `_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_user` (
  `id` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reset_password_token` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_user`
--

LOCK TABLES `_user` WRITE;
/*!40000 ALTER TABLE `_user` DISABLE KEYS */;
INSERT INTO `_user` VALUES (1,'truongduy22d1@gmail.com','Duy Nguyen','Ancol',NULL,NULL,'USER','118411670339032408975','Tỉnh Quảng Nam / Huyện Nam Trà My / Xã Trà Tập / Ap3','0377155498'),(3,'fr@gmail.com','Nguyễn','Duy','$2a$10$gtWbUgOkuy5m1MSkfcUfheVRQzSyT4N.Lb3IiIrFIdFSUkcORsV66',NULL,'ADMIN',NULL,NULL,NULL),(102,'truongduy22d2@gmail.com','Duy Nguyen','Van',NULL,NULL,'USER','116492752059245619246','Tỉnh Bến Tre / Thành phố Bến Tre / Phường 6 /  Ap4','+84377155498'),(152,'19130057@st.hcmuaf.edu.vn','NGUYỄN VĂN ','TƯỜNG DUY',NULL,NULL,'ADMIN','103919814080430383085','Tỉnh Long An / Huyện Tân Thạnh / Xã Tân Thành / Ap 5','0377155494'),(202,'nguyenduy.30719@gmail.com','Van','B','$2a$10$ntUTXFPzVVubooqlB0K/D.5kAqHaHIoJoTk9RNN8kuyWT4IpHVjm6',NULL,'USER',NULL,NULL,NULL);
/*!40000 ALTER TABLE `_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_user_seq`
--

DROP TABLE IF EXISTS `_user_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_user_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_user_seq`
--

LOCK TABLES `_user_seq` WRITE;
/*!40000 ALTER TABLE `_user_seq` DISABLE KEYS */;
INSERT INTO `_user_seq` VALUES (301);
/*!40000 ALTER TABLE `_user_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `img` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `cart_id` bigint DEFAULT NULL,
  `id_product` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpcttvuq4mxppo8sxggjtn5i2c` (`cart_id`),
  CONSTRAINT `FKpcttvuq4mxppo8sxggjtn5i2c` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (1,'img-Nike1.jpg','Nike Red',19,1,1,0),(2,'img-Nike5.jpeg','Adidas Hong',29,2,1,0),(3,'img-Nike1.jpg','Nike Red',19,1,2,0),(4,'img-Nike4.jpg','MQUEEN Air',10,2,2,0),(5,'img-women3.jpg','Giay NIKE red',16,1,3,0),(6,'img-Nike10.jpg','Adidas blue',16,2,3,0),(7,'img-Nike12.jpg','Adidas sport',29,1,4,0),(8,'img-Nike11.jpg','NIKE BLUE NEW',19,3,4,0),(9,'img-Nike1.jpg','Nike Red',19,1,5,0),(10,'img-nike-jordan.jpg','Giay NIKE Sheet',11,2,5,0),(11,'img-Nike1.jpg','Nike Red',19,1,6,0),(12,'img-women3.jpg','Giay NIKE red',16,2,6,0),(13,'img-Nike1.jpg','Nike Red',19,1,7,0),(14,'img-women3.jpg','Giay NIKE red',16,2,7,0),(15,'img-Nike1.jpg','Nike Red',19,1,8,0),(16,'img-nike-jordan.jpg','Giay NIKE Sheet',11,2,8,0),(17,'img-Nike1.jpg','Nike Red',19,1,9,0),(18,'img-nike-jordan.jpg','Giay NIKE Sheet',11,2,9,0),(19,'img-women3.jpg','Giay NIKE red',16,2,9,0),(20,'img-Nike1.jpg','Nike Red',19,1,10,0),(21,'img-nike-jordan.jpg','Giay NIKE Sheet',11,2,10,0),(22,'img-women3.jpg','Giay NIKE red',16,2,10,0),(23,'img-Nike1.jpg','Nike Red',19,1,11,0),(24,'img-Nike4.jpg','MQUEEN Air',10,2,11,0),(25,'img-Nike4.jpg','MQUEEN Air',10,1,12,0),(26,'img-Nike5.jpeg','Adidas Hong',29,2,12,0),(27,'img-Nike1.jpg','Nike Red',19,1,13,0),(28,'img-nike-jordan.jpg','Giay NIKE Sheet',11,2,13,0),(29,'img-Nike1.jpg','Nike Red',19,3,14,0),(30,'img-nike-jordan.jpg','Giay NIKE Sheet',11,2,14,0),(31,'img-Nike1.jpg','Nike Red',19,1,15,0),(32,'img-nike-jordan.jpg','Giay NIKE Sheet',11,4,15,0),(33,'img-Nike1.jpg','Nike Red',19,1,16,0),(34,'img-Nike1.jpg','Nike Red',19,1,17,0),(35,'img-Nike1.jpg','Nike Red',19,1,18,0),(36,'img-Nike1.jpg','Nike Red',19,1,19,0),(37,'img-nike-jordan.jpg','Giay NIKE Sheet',11,2,19,0),(38,'img-Nike1.jpg','Nike Red',19,2,20,0),(39,'img-Nike1.jpg','Nike Red',19,1,21,0),(40,'img-nike-jordan.jpg','Giay NIKE Sheet',11,1,21,0),(41,'img-Nike1.jpg','Nike Red',19,1,22,0),(42,'img-Nike1.jpg','Nike Red',19,1,23,0),(43,'img-nike-jordan.jpg','Giay NIKE Sheet',11,2,24,0),(44,'img-nike-jordan.jpg','Giay NIKE Sheet',11,2,25,0),(45,'img-women3.jpg','Giay NIKE red',16,3,25,0),(46,'img-Nike10.jpg','Adidas blue',16,1,27,0),(47,'img-Nike12.jpg','Adidas sport',29,1,29,0),(48,'img-Nike1.jpg','Nike Red giày mới',19,1,30,0),(49,'img-nike-jordan.jpg','Giay NIKE Sheet',11,1,30,0),(50,'img-Nike1.jpg','Nike Red giày mới',19,1,31,0),(51,'img-Nike1.jpg','Nike Red giày mới',19,1,32,0),(52,'img-Nike1.jpg','Nike Red giày mới',19,1,33,0),(53,'img-Nike1.jpg','Nike Red giày mới',19,1,34,0),(54,'img-Nike1.jpg','Nike Red giày mới',19,1,35,0),(55,'img-Nike1.jpg','Nike Red giày mới',19,1,36,0),(56,'img-Nike1.jpg','Nike Red giày mới',19,1,37,1),(57,'img-Nike1.jpg','Nike Red giày mới',19,2,38,1),(58,'img-nike-jordan.jpg','Giay NIKE Sheet',11,2,38,2),(59,'img-women3.jpg','Giay NIKE red',16,3,38,3),(60,'img-Nike1.jpg','Nike Red giày mới',19,1,39,1),(61,'img-nike-jordan.jpg','Giay NIKE Sheet',11,2,39,2),(62,'img-women3.jpg','Giay NIKE red',16,1,39,3),(63,'img-Nike12.jpg','Adidas sport',29,1,40,6),(64,'img-women3.jpg','Giay NIKE red',16,1,41,3),(65,'img-Nike5.jpeg','Adidas Hong',29,1,42,8),(66,'img-Nike11.jpg','NIKE BLUE NEW',19,1,43,9),(67,'img-Nike4.jpg','MQUEEN Air',22,1,44,7),(68,'img-Nike12.jpg','Adidas sport',29,1,45,6),(69,'img-women3.jpg','Giay NIKE red',16,1,46,3),(70,'img-Nike1.jpg','Nike Red giày mới',19,1,47,1),(71,'img-nike-jordan.jpg','Giay NIKE Sheet',11,2,47,2);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `userid` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,'Long an','2023-05-27 06:26:59.177469','0377155498','48','0','2'),(2,'Long an','2023-05-27 06:33:14.547165','1233232','39','0','2'),(3,'Long an','2023-05-27 06:34:57.729705','0377155498','48','1','2'),(4,'Long an','2023-05-27 06:36:16.023869','1233232','86','1','2'),(5,'Chợ nhỏ, Đại học Nông Lâm','2023-05-27 06:40:46.789876','0377155498','41','1','2'),(6,'Long an','2023-05-27 06:43:58.581318','1233232','51','0','3'),(7,'Long an','2023-05-27 06:44:47.830489','1233232','51','1','3'),(8,'Long an','2023-05-27 06:46:58.289969','1233232','41','1','4'),(9,'Long an','2023-05-27 22:59:05.223412','1233232','57','1','2'),(10,'Long an','2023-05-27 22:59:08.207945','1233232','73','1','2'),(11,'Long an','2023-05-27 23:00:32.665053','1233232','39','1','2'),(12,'Long an','2023-05-28 13:37:34.730170','1233232','68','1','2'),(13,'Long an','2023-05-29 08:52:18.735996','0377155498','30','1','2'),(14,'Long an','2023-05-29 12:31:46.482166','1233232','79','1','52'),(15,'Long an','2023-05-29 13:35:25.982755','1233232','63','1','53'),(16,'Long an','2023-06-14 12:50:12.652247','1233232','','1','53'),(17,'Long an','2023-06-14 12:53:15.387988','1233232','','0','53'),(18,'Long an','2023-06-14 12:55:01.404073','1233232','','1','53'),(19,'Long an','2023-06-14 12:59:53.479049','1233232','41','1','53'),(20,'Long an','2023-06-14 13:01:05.300418','1233232','38','1','53'),(21,'Long an','2023-06-14 13:02:07.513146','1233232','','0','53'),(22,'Long an','2023-06-14 13:05:39.271076','1233232','19','1','53'),(23,'Long an','2023-06-14 13:09:27.702105','1233232','19','1','53'),(24,'Long an','2023-07-22 00:05:53.926843','+844377155498','22','1','53'),(25,'Long an','2023-07-22 00:06:46.945734','+844377155498','70','1','53'),(27,'Long an','2023-07-23 20:43:36.116667','+844377155498','16','1','53'),(29,'Long an','2023-07-23 20:58:11.933929','+844377155498','29','1','53'),(30,'Long an','2023-07-23 21:00:31.273502','+844377155498','30','1','53'),(31,'Long an','2023-07-23 21:05:11.180595','+11111111111111','19','1','53'),(32,'Long an','2023-07-23 21:06:46.521491','+844377155498','19','1','53'),(33,'Long an','2023-07-23 21:09:57.165688','+844377155498','19','1','53'),(34,'Long an','2023-07-23 21:11:59.894254','+844377155498','19','1','53'),(35,'Long an','2023-07-23 21:13:46.674703','+844377155498','19','1','53'),(36,'Long an','2023-07-23 21:16:23.916933','+844377155498','19','1','53'),(37,'Long an','2023-07-23 21:24:34.349956','+844377155498','19','2','53'),(38,'Long an','2023-07-23 21:27:17.807238','+844377155498','108','1','53'),(39,'Long an','2023-07-23 21:29:25.978485','+844377155498','46','1','53'),(40,'so nha 20','2023-07-25 08:32:56.397153','1233232','29','1','53'),(41,'ap 3','2023-07-26 19:59:24.844200','0377345678','16','1','53'),(42,'Long an','2023-07-26 23:16:51.679322','1233232','29','1','53'),(43,'ap 3','2023-07-27 15:35:40.020753','+844377155498','19','1','2'),(44,'Long an','2023-07-27 15:39:45.265068','+844377155498','22','1','2'),(45,'ap 4','2023-07-27 15:42:08.445309','1233232','29','1','2'),(46,'Thành phố Hà Nội / Huyện Hà Quảng / Xã Cần Nông / Long an','2023-07-27 15:48:08.462476','1233232','16','1','2'),(47,'Thành phố Hà Nội / Quận Tây Hồ / Phường Nhật Tân / Long an','2023-08-03 19:01:06.005675','+844377155498','41','1','152');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'cai gi do','nt@gmail.com','Responded'),(2,'cai gi do','nt@gmail.com','Responded'),(3,'cai gi do','nt@gmail.com','Responded'),(4,'Ok.Test','truongduy22d1@gmail.com','Responded'),(5,'Test','truongduy22d1@gmail.com','Responded'),(6,'San pham Giay Nike chung nao moi co hang vay ?','fr@gmail.com',NULL),(7,'Don hang cua toi sao toi gio chua co','19130057@st.hcmuaf.edu.vn',NULL),(8,'San pham cua toi chung nao moi co v','19130057@st.hcmuaf.edu.vn','Responded');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'03 Đ. Số 16, Phường Linh Trung, Thủ Đức, Thành phố Hồ Chí Minh 70000, Việt Nam '),(2,'Khu chế xuất Linh, Trung 1, Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam '),(3,'125 Linh Trung, Phường Linh Trung, Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam '),(4,'4 Chương Dương, Linh Chiểu, Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam '),(5,'199 Đặng Văn Bi, Bình Thọ, Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam '),(6,'63 Đặng Văn Bi, Bình Thọ, Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam '),(7,'2/3 Đuờng 10, Đường Đ. Hồ Văn Tư, Trường Thọ, Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam '),(8,'36A Đ. Võ Văn Ngân, Trường Thọ, Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam '),(9,'38 Đ. 24, Linh Đông, Thủ Đức, Thành phố Hồ Chí Minh 700000, Việt Nam '),(10,'18 Đường Số 22, Linh Đông, Thủ Đức, Thành phố Hồ Chí Minh 700000, Việt Nam '),(11,'59 Hồ Xuân Hương, Phường 6, Quận 3, Thành phố Hồ Chí Minh, Việt Nam '),(12,'27 Trần Quốc Thảo, Phường 6, Quận 3, Thành phố Hồ Chí Minh, Việt Nam '),(13,'12 Alexandre de Rhodes, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh 700000, Việt Nam '),(14,'182 Pasteur, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh, Việt Nam '),(15,'5D Đ. Nguyễn Siêu, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh, Việt Nam '),(16,'1A Đ. Tôn Đức Thắng, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh, Việt Nam '),(17,'27 Ngô Đức Kế, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh 700000, Việt Nam '),(18,'15 Pasteur, Phường Nguyễn Thái Bình, Quận 1, Thành phố Hồ Chí Minh, Việt Nam '),(19,'19 Đ. Calmette, Phường Nguyễn Thái Bình, Quận 1, Thành phố Hồ Chí Minh, Việt Nam '),(20,'139 Đ. Đề Thám, Phường Cô Giang, Quận 1, Thành phố Hồ Chí Minh, Việt Nam '),(21,'tổ8 Ấp1 thạnh phú, ĐT768, Thanh Phú, Vĩnh Cửu, Đồng Nai, Việt Nam '),(22,'28 Hương Lộ 6, Ấp 6, Vĩnh Cửu, Đồng Nai, Việt Nam '),(23,'13 Đường Khu Phố 4, Trảng Dài, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(24,'207 Đ. Nguyễn Phúc Chu, Trảng Dài, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(25,'80 Đường P88 - Hoàng Bá Bích, Long Bình, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(26,'53/3 Khu Phố 3, Tân Hoà, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(27,'84/28 Lê Ngô Cát, KP 5, Phường Tân Hòa, Thành phố Biên Hòa, Tỉnh Đồng Nai 76113, Đồng Nai 76000, Việt Nam '),(28,'85/14 khu phố 4, Tân Hoà, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(29,'Hẻm 134 Nguyễn Ái Quốc, Tân Biên, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(30,'48 đường N 8, khu pho 8A, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(31,'11 Đ. Đồng Khởi, Tân Hiệp, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(32,'1/94 tổ 4, Khu Phố 3, Tam Hoà, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(33,'Lô 202, KCN, Amata, Long Bình, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(34,'30 Lê Nguyên Đạt, Long Bình, Thành phố Biên Hòa, Đồng Nai 812586, Việt Nam '),(35,'806/, Hẻm 1 Xa lộ Hà Nội, Tam Hoà, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(36,'51/11C, khu phố 2, Hồ Văn Leo, Tam Hoà, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(37,'350/1, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(38,'138 tổ 31 khu phố 4 phường bình đa, Bình Đa, Thành phố Biên Hòa, Đồng Nai 812690, Việt Nam '),(39,'162 Đ. Phạm Văn Thuận, Tam Hiệp, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(40,'37/21 Đ. Phạm Văn Thuận, Tam Hiệp, Thành phố Biên Hòa, Tam Hiệp, Việt Nam '),(41,'17A Đoàn Văn Cự, Tam Hiệp, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(42,'628 Đ. Phạm Văn Thuận, Tam Hiệp, Thành phố Biên Hòa, Đồng Nai 76000, Việt Nam '),(43,'25/2, KP8, P. Tam Hiếp, Tam Hiệp, Thành phố Biên Hòa, Đồng Nai 76000, Việt Nam '),(44,'2 Đ. Đồng Khởi, Tân Hiệp, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(45,'15 Đ. Đồng Khởi, Tân Hiệp, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(46,'H17 1K, Tân Hiệp, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(47,'126A Nguyễn Ái Quốc, Tân Hiệp, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(48,'Hẻm 93/38 Gx Thái Hiệp, P, Đồng Nai, Việt Nam '),(49,'112 Đ. Bùi Trọng Nghĩa, Trảng Dài, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(50,'Tổ 22D, Khu phố 2, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(51,'Hẻm 1 Tổ 2, Khu Phố 5, Đồng Nai 81000, Việt Nam '),(52,'123 Đ. Nguyễn Khuyến, Trảng Dài, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(53,'454 2A, Khu phố 3, Thành phố Biên Hòa, Đồng Nai 810000, Việt Nam '),(54,'409, Trần Văn Xã, Phường Trảng Dài, Thành Phố Biên Hòa, Tỉnh Đồng Nai, Việt Nam '),(55,'439 Đ. Bùi Trọng Nghĩa, Trảng Dài, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(56,'1270/40/6, tổ 15, KP3, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(57,'1328 Đ. Đồng Khởi, Tân Phong, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(58,'186 Đ. Đồng Khởi, Khu phố 11, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(59,'126D Đ. Đồng Khởi, Trảng Dài, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(60,'25 D. Chợ Bà Thức, Tân Phong, Vĩnh Cửu, Đồng Nai, Việt Nam '),(61,'H31A, Kp7, Đồng Nai, Việt Nam '),(62,'38 Hồ Hòa, Tân Phong, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(63,'5 Khu Phố 11, Tân Phong, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(64,'Số 1344 Đ. Nguyễn Ái Quốc/33/37b Nguyễn Ái Quốc, Kp7, Tp. Biên Hòa, Đồng Nai 812307, Việt Nam '),(65,'205 Đ. Phan Trung, Tân Mai, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(66,'181 Đ. Trương Định, Tân Mai, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(67,'45/223 Đ. Phạm Văn Thuận, Kp3, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(68,'Hẻm 76 Dương Bạch Mai, Tam Hiệp, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(69,'7/10c tổ 43, Kp2, Tân Mai, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(70,'26/2 Hẻm 26 Lý Văn Sâm, Tam Hiệp, Thành phố Biên Hòa, Đồng Nai, Việt Nam '),(71,'1A Đường số 5F, Bình Hưng Hoà A, Bình Tân, Thành phố Hồ Chí Minh 700000, Việt Nam '),(72,'81D Đường số 5B, Bình Hưng Hoà A, Bình Tân, Thành phố Hồ Chí Minh 700000, Việt Nam '),(73,'231 Bình Long, Bình Hưng Hoà A, Bình Tân, Thành phố Hồ Chí Minh, Việt Nam '),(74,'227 Đường Lê Niệm, Phú Thạnh, Tân Phú, Thành phố Hồ Chí Minh, Việt Nam '),(75,'166A Đỗ Bí, Phú Thạnh, Tân Phú, Thành phố Hồ Chí Minh 700000, Việt Nam '),(76,'242c Thoại Ngọc Hầu, Phú Thạnh, Tân Phú, Thành phố Hồ Chí Minh, Việt Nam '),(77,'455 Lũy Bán Bích, Hoà Thanh, Tân Phú, Thành phố Hồ Chí Minh, Việt Nam '),(78,'34 Trịnh Đình Thảo, Phú Trung, Tân Phú, Thành phố Hồ Chí Minh, Việt Nam '),(79,'315 Đ. Kênh Tân Hóa, Phú Trung, Tân Phú, Thành phố Hồ Chí Minh, Việt Nam '),(80,'136 Trịnh Đình Trọng, Phú Trung, Tân Phú, Thành phố Hồ Chí Minh, Việt Nam '),(81,'38 Trịnh Đình Trọng, Phú Trung, Tân Phú, Thành phố Hồ Chí Minh 700000, Việt Nam '),(82,'586 Lạc Long Quân, Phường 5, Quận 11, Thành phố Hồ Chí Minh, Việt Nam '),(83,'592/1C Lạc Long Quân, Phường 5, Quận 11, Thành phố Hồ Chí Minh, Việt Nam '),(84,'287 Âu Cơ, Phú Trung, Tân Phú, Thành phố Hồ Chí Minh, Việt Nam '),(85,'225 Âu Cơ, Phường 10, Tân Bình, Thành phố Hồ Chí Minh, Việt Nam '),(86,'164 Nguyễn Thị Nhỏ, Phường 15, Quận 11, Thành phố Hồ Chí Minh 700000, Việt Nam '),(87,'42 Đường Số 2, Phường 15, Quận 11, Thành phố Hồ Chí Minh 700000, Việt Nam '),(88,'70 Lữ Gia, Phường 15, Quận 11, Thành phố Hồ Chí Minh, Việt Nam '),(89,'12 Hẻm 324 Lý Thường Kiệt, Phường 14, Quận 10, Thành phố Hồ Chí Minh 700000, Việt Nam '),(90,'Hem 252 Lý Thường Kiệt, Phường 14, Quận 10, Thành phố Hồ Chí Minh, Việt Nam '),(91,'594 Đ. 3 Tháng 2, Phường 14, Quận 10, Thành phố Hồ Chí Minh, Việt Nam '),(92,'144 Lý Thường Kiệt, Phường 14, Quận 10, Thành phố Hồ Chí Minh 700000, Việt Nam '),(93,'873 Đ. 3 Tháng 2, Phường 7, Quận 11, Thành phố Hồ Chí Minh, Việt Nam '),(94,'Hẻm 66 Lãnh Binh Thăng, Phường 13, Quận 11, Thành phố Hồ Chí Minh, Việt Nam '),(95,'43 Lê Thị Bạch Cát, Phường 13, Quận 11, Thành phố Hồ Chí Minh, Việt Nam '),(96,'323-325 Lãnh Binh Thăng, Phường 8, Quận 11, Thành phố Hồ Chí Minh 70000, Việt Nam '),(97,'283 Lãnh Binh Thăng, Phường 8, Quận 11, Thành phố Hồ Chí Minh, Việt Nam '),(98,'181/31/15 Bình Thới, Phường 9, Quận 11, Thành phố Hồ Chí Minh, Việt Nam '),(99,'44 Hòa Bình, Phường 5, Quận 11, Thành phố Hồ Chí Minh 700000, Việt Nam '),(100,'341/82D Lạc Long Quân, Phường 5, Quận 11, Thành phố Hồ Chí Minh 72608, Việt Nam ');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `derectory` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `img` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `price` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `quantity_sol` int DEFAULT NULL,
  `report_start` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jmivyxk9rmgysrmsqw15lqr5b` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'NIKE','SAN PHAM MOI','img-Nike1.jpg','Nike Red (Giày mới)',19,4,0,'4.0'),(2,'NIKE','SAN PHAM MOI','img-nike-jordan.jpg','Giay NIKE Sheet',11,0,0,'4.0'),(3,'NIKE WOMAN','SAN PHAM MOI','img-women3.jpg','Giay NIKE red',16,5,0,'0'),(5,'Adidas','SAN PHAM MOI','img-Nike10.jpg','Adidas blue',16,5,0,'0'),(6,'Adidas','Giay The Thao','img-Nike12.jpg','Adidas sport',29,18,0,'2.0'),(7,'MQUEEN WOMAN','SAN PHAM MOI','img-Nike4.jpg','MQUEEN Air',22,9,0,'4.0'),(8,'ALIDAS WOMAN','SAN PHAM MOI','img-Nike5.jpeg','Adidas Hong',29,9,0,'0'),(9,'NIKE MEN','SAN PHAM MOI','img-Nike11.jpg','NIKE BLUE NEW',19,9,0,'0'),(10,'NIKE FOODBALL','SAN PHAM MOI','img-women2.jpg','Vanga Women ',15,14,0,'0'),(12,'Giay Nam','SAN PHAM MOI','img-Nike5.jpg','Giay The Thao (Giày mới)',25,3,0,NULL),(13,'cai gi do','SAN PHAM MOI','img-Nike9.jpg','NIKE AIR POST 12',23,5,0,NULL),(14,'cai gi do','SAN PHAM MOI','anh3.jpg','NIKE AIR POST 13',10,5,0,NULL),(15,'NIKE','SAN PHAM MOI','anh4.jpg','NIKE AIR POST 14',18,0,0,NULL),(19,'cai gi do','SAN PHAM MOI','4.jpeg','NIKE AIR POST 100',25,5,0,NULL),(20,'NIKE WOMAN','SAN PHAM MOI','15.jpg','NIKE AIR POST 20',44,4,0,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `report` double DEFAULT NULL,
  `userid` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `productid` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (25,NULL,4,'152','1'),(26,NULL,4,'152','2'),(27,NULL,4,'152','7'),(28,NULL,0,'152','6'),(29,NULL,4,'152','6');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `id` int NOT NULL,
  `expired` bit(1) NOT NULL,
  `revoked` bit(1) NOT NULL,
  `token` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `token_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pddrhgwxnms2aceeku9s2ewy5` (`token`),
  KEY `FKiblu4cjwvyntq3ugo31klp1c6` (`user_id`),
  CONSTRAINT `FKiblu4cjwvyntq3ugo31klp1c6` FOREIGN KEY (`user_id`) REFERENCES `_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0cnVvbmdkdXkyMmQxQGdtYWlsLmNvbSIsImlhdCI6MTY5MDU3MzIyNiwiZXhwIjoxNjkwNTc2MjI2fQ.MyQ_1DuBn9lsRQL89wXj0H0dusaP6icg7L3RZzwckIA','BEARER',1),(3,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmckBnbWFpbC5jb20iLCJpYXQiOjE2OTA1NzM0NzIsImV4cCI6MTY5MDU3NjQ3Mn0.QCTwpDT3Jof0RD4whjWZ_gY3nOsgXnU9a4rqKC6ZNok','BEARER',3),(4,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmckBnbWFpbC5jb20iLCJpYXQiOjE2OTA1NzM0NzYsImV4cCI6MTY5MDU3NjQ3Nn0.Y_9umufdrnhg_Q--i5lap5rSo0v0b5uGPUE49Gzk58M','BEARER',3),(5,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmckBnbWFpbC5jb20iLCJpYXQiOjE2OTA1NzM2NDcsImV4cCI6MTY5MDU3NjY0N30.xfwdza8hNWs-o6CmEftH0w3CqwRMjKEIa6zSJuN86Hs','BEARER',3),(6,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmckBnbWFpbC5jb20iLCJpYXQiOjE2OTA1NzM3NjMsImV4cCI6MTY5MDU3Njc2M30.09G4RvjH0jd1MBIbg5XynXIm4j6gf0Fb2rC5GKwrUBk','BEARER',3),(152,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0cnVvbmdkdXkyMmQyQGdtYWlsLmNvbSIsImlhdCI6MTY5MDU3NTYyNywiZXhwIjoxNjkwNTc4NjI3fQ.4bvHEHU97YiV01pj49GgEw6aehHabC8WPwCwMDf0UnA','BEARER',102),(202,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmckBnbWFpbC5jb20iLCJpYXQiOjE2OTA2NTA1ODIsImV4cCI6MTY5MDY1MzU4Mn0.D3UUQpidgq6nPY78QARijbz4x1qQHWUulo7L6Njdy6c','BEARER',3),(203,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmckBnbWFpbC5jb20iLCJpYXQiOjE2OTA2NTE2ODAsImV4cCI6MTY5MDY1NDY4MH0.sAro7NBjASs8WU_qbwCZok2lMap5Bxymmdd6ppfQySg','BEARER',3),(204,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmckBnbWFpbC5jb20iLCJpYXQiOjE2OTA2NTE2OTQsImV4cCI6MTY5MDY1NDY5NH0.sKjs_IWPuQcXAsTySVlrrFvYwywcBt-zXgfCy2f4s8Q','BEARER',3),(205,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmckBnbWFpbC5jb20iLCJpYXQiOjE2OTA2NTE4OTcsImV4cCI6MTY5MDY1NDg5N30.apz_Tz_wLO3LH_uyf65pE0qm1_QYv8p3HertrFy-rXQ','BEARER',3),(206,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxOTEzMDA1N0BzdC5oY211YWYuZWR1LnZuIiwiaWF0IjoxNjkwNjUxOTIwLCJleHAiOjE2OTA2NTQ5MjB9.9VaTR1CwKynoweKk5TC2oATAfn0A65IgzcwWcHptGbQ','BEARER',152),(252,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmckBnbWFpbC5jb20iLCJpYXQiOjE2OTA2NTc4NjIsImV4cCI6MTY5MDY2MDg2Mn0.TRQr6MBqHl-e_2fKRyVh_Nk19AePZbVRCZxTOYRacJ8','BEARER',3),(302,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuZ3V5ZW5kdXkuMzA3MTlAZ21haWwuY29tIiwiaWF0IjoxNjkxMTYyNzA5LCJleHAiOjE2OTExNjU3MDl9.K7ljsdytpQErziYfEorL4nP0jZC0fSdSnpIvoUL4Eb0','BEARER',202),(303,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuZ3V5ZW5kdXkuMzA3MTlAZ21haWwuY29tIiwiaWF0IjoxNjkxMTYyNzEzLCJleHAiOjE2OTExNjU3MTN9.Qf67ztkL5DIbhO1zG2VxAkgABB_8U_O5asXUHPICsj0','BEARER',202),(304,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuZ3V5ZW5kdXkuMzA3MTlAZ21haWwuY29tIiwiaWF0IjoxNjkxMTYyODcxLCJleHAiOjE2OTExNjU4NzF9.Ens9Xe5KkyHRoA2HLItMBXVO2wpz1D90MtUeY2syN64','BEARER',202),(352,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmckBnbWFpbC5jb20iLCJpYXQiOjE2OTEyNDk4NjMsImV4cCI6MTY5MTI1Mjg2M30.M-RV5vi7omio89-VY9bzjth-msOzBTTh9paCZ1mA1A8','BEARER',3);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_seq`
--

DROP TABLE IF EXISTS `token_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_seq`
--

LOCK TABLES `token_seq` WRITE;
/*!40000 ALTER TABLE `token_seq` DISABLE KEYS */;
INSERT INTO `token_seq` VALUES (451);
/*!40000 ALTER TABLE `token_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `first_name` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2023-08-07  1:00:31
