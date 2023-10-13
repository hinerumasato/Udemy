-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: udemy
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Kỹ năng ngoại ngữ','/static/imgs/categories/language.webp','language'),(2,'Phát triển bản thân','/static/imgs/categories/development.webp','self-development'),(3,'Sales, bán hàng','/static/imgs/categories/sales.webp','sales'),(4,'Phong cách sống','/static/imgs/categories/life.webp','life'),(5,'Thiết kế đồ hoạ','/static/imgs/categories/graphic.webp','graphics'),(6,'Tin học văn phòng','/static/imgs/categories/computer.webp','computer'),(7,'Công nghệ thông tin','/static/imgs/categories/it.webp','it'),(8,'Nhiếp ảnh, quay phim','/static/imgs/categories/video.webp','camera'),(9,'Marketing','/static/imgs/categories/marketing.webp','marketing'),(10,'Kinh doanh khởi nghiệp','/static/imgs/categories/startup.webp','startup'),(11,'Sức khoẻ - Giới tính','/static/imgs/categories/health.webp','health'),(12,'Gia đình','/static/imgs/categories/family.webp','family');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `new_course` tinyint(4) NOT NULL DEFAULT '1',
  `popular_course` tinyint(4) NOT NULL DEFAULT '0',
  `price` double DEFAULT NULL,
  `sale_price` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_courses_categories_idx` (`category_id`),
  KEY `fk_courses_levels1_idx` (`level_id`),
  CONSTRAINT `fk_courses_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_courses_levels1` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Hướng dẫn sử dụng Illutrator cho người mới bắt đầu',7,1,1,0,1200000,700000),(2,'Học Adobe Illustrator từ cơ bản đến nâng cao',8,2,1,0,1200000,600000),(3,'Khóa học Digital Paiting cơ bản cho người mới bắt đầu',4,3,1,0,2000000,1200000),(4,'Tiếng Nhật cơ bản',1,3,1,1,3000000,2400000),(5,'Tiếng Nhật nâng cao',1,2,1,1,6000000,5500000),(6,'Khoá học TOEIC 450 điểm dành cho người mới bắt đầu',1,1,1,0,600000,300000);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'Cơ Bản','ez'),(2,'Nâng cao','hard'),(3,'Mọi cấp độ','every');
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thumbnails`
--

DROP TABLE IF EXISTS `thumbnails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `thumbnails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_thumbnails_courses1_idx` (`course_id`),
  CONSTRAINT `fk_thumbnails_courses1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thumbnails`
--

LOCK TABLES `thumbnails` WRITE;
/*!40000 ALTER TABLE `thumbnails` DISABLE KEYS */;
INSERT INTO `thumbnails` VALUES (1,'/static/imgs/courses/course_1.webp',1),(2,'/static/imgs/courses/course_2.webp',2),(3,'/static/imgs/courses/course_3.webp',3),(4,'/static/imgs/courses/course_5.png',4),(5,'/static/imgs/courses/course_6.jepg',5),(6,'/static/imgs/courses/course_7.png',6);
/*!40000 ALTER TABLE `thumbnails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` char(12) DEFAULT NULL,
  `login_type` varchar(10) DEFAULT 'normal',
  `avatar` varchar(255) DEFAULT NULL,
  `email_verified` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (27,'thangloitran406@gmail.com','$2a$12$j89iqreIGeopfe.K6vITeu1.gUv6Q518/x5pxV2gdJKY3JhcmUmG.',NULL,NULL,'Trần','Thắng Lợi','0879603547','normal',NULL,0),(28,'thangloitran406@gmail.com',NULL,NULL,NULL,'Trần','Thắng Lợi',NULL,'google','https://lh3.googleusercontent.com/a/ACg8ocLm9Btb9ZOrs-Ol2B2ZUtH7JaTLlaNMPLbIGQhVJJNeqw=s96-c',1),(29,'test@gmail.com','$2a$12$IJKwc/jtMKmKo9ceoQqYkOnrlAvcsP554NFh8TmzSkq9fZqDJghUC',NULL,NULL,'Nguyễn','Văn A','0123456789','normal',NULL,0);
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

-- Dump completed on 2023-10-14  0:13:07
