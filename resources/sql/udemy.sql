-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: udemy
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `cart_details`
--

DROP TABLE IF EXISTS `cart_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `course_id` int NOT NULL,
  `amount` int DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cart_id` (`cart_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `cart_details_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  CONSTRAINT `cart_details_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_details`
--

LOCK TABLES `cart_details` WRITE;
/*!40000 ALTER TABLE `cart_details` DISABLE KEYS */;
INSERT INTO `cart_details` VALUES (17,2,56,1,'2024-01-19 18:48:19'),(18,2,57,1,'2024-01-19 18:48:46');
/*!40000 ALTER TABLE `cart_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (2,72,'2024-01-19 18:06:04'),(3,71,'2024-01-19 18:47:10'),(4,75,'2024-01-21 23:24:09');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Kỹ năng ngoại ngữ','/static/imgs/categories/168e71e0-8866-4c6c-852a-5d734f0e62a8.webpwebp','ky-nang-ngoai-ngu'),(2,'Phát triển bản thân','/static/imgs/categories/development.webp','self-development'),(3,'Sales, bán hàng','/static/imgs/categories/sales.webp','sales'),(4,'Phong cách sống','/static/imgs/categories/life.webp','life'),(5,'Thiết kế đồ hoạ','/static/imgs/categories/graphic.webp','graphics'),(6,'Tin học văn phòng','/static/imgs/categories/computer.webp','computer'),(7,'Công nghệ thông tin','/static/imgs/categories/it.webp','it'),(8,'Nhiếp ảnh, quay phim','/static/imgs/categories/09444649-b362-4c56-b647-bedb2177dd74.webp','nhiep-anh,-quay-phim'),(9,'Marketing','/static/imgs/categories/marketing.webp','marketing'),(10,'Kinh doanh khởi nghiệp','/static/imgs/categories/startup.webp','startup'),(11,'Sức khoẻ - Giới tính','/static/imgs/categories/health.webp','health'),(12,'Gia đình','/static/imgs/categories/family.webp','family');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_details`
--

DROP TABLE IF EXISTS `checkout_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkout_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL DEFAULT '1',
  `checkout_id` int NOT NULL,
  `course_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `checkout_id` (`checkout_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `checkout_details_ibfk_1` FOREIGN KEY (`checkout_id`) REFERENCES `checkouts` (`id`),
  CONSTRAINT `checkout_details_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_details`
--

LOCK TABLES `checkout_details` WRITE;
/*!40000 ALTER TABLE `checkout_details` DISABLE KEYS */;
INSERT INTO `checkout_details` VALUES (3,1,21,1,'2024-01-19 18:47:13'),(4,1,22,5,'2024-01-19 18:50:31'),(5,1,22,4,'2024-01-19 18:50:31'),(6,1,23,1,'2024-01-19 19:39:10'),(7,1,24,51,'2024-01-20 20:04:36'),(8,1,25,4,'2024-01-21 23:26:07'),(9,1,25,6,'2024-01-21 23:26:07'),(10,1,25,59,'2024-01-21 23:26:07'),(11,1,26,6,'2024-01-22 19:18:07'),(13,1,27,1,'2024-01-22 19:19:53'),(17,1,30,2,'2024-01-24 11:57:35');
/*!40000 ALTER TABLE `checkout_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkouts`
--

DROP TABLE IF EXISTS `checkouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `total_amount` double DEFAULT NULL,
  `discount` double DEFAULT '0',
  `payment_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cart_id` (`cart_id`),
  CONSTRAINT `checkouts_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkouts`
--

LOCK TABLES `checkouts` WRITE;
/*!40000 ALTER TABLE `checkouts` DISABLE KEYS */;
INSERT INTO `checkouts` VALUES (21,3,700000,0,'NOT PAID','2024-01-19 11:47:13'),(22,3,7900000,0,'PAID','2024-01-19 11:50:31'),(23,3,700000,0,'PAID','2024-01-19 12:39:10'),(24,3,80000,0,'PAID','2024-01-20 13:04:36'),(25,4,4300000,0,'NOT PAID','2024-01-21 16:26:07'),(26,3,900000,0,'NOT PAID','2024-01-22 12:18:07'),(27,3,6200000,0,'NOT PAID','2024-01-22 12:19:53'),(28,3,700000,0,'NOT PAID','2024-01-22 12:21:47'),(29,3,600000,0,'NOT PAID','2024-01-22 12:23:19'),(30,3,1200000,0,'PAID','2024-01-24 04:57:35');
/*!40000 ALTER TABLE `checkouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `category_id` int NOT NULL,
  `level_id` int NOT NULL,
  `new_course` tinyint NOT NULL DEFAULT '1',
  `popular_course` tinyint NOT NULL DEFAULT '0',
  `price` double DEFAULT NULL,
  `sale_price` double DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `teacher_id` int NOT NULL,
  `is_delete` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_courses_categories_idx` (`category_id`),
  KEY `fk_courses_levels1_idx` (`level_id`),
  CONSTRAINT `fk_courses_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_courses_levels1` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Hướng dẫn sử dụng Illutrator cho người mới bắt đầu',7,1,1,1,1200000,700000,'<p><span style=\"font-size: 14pt;\">Illustrator&nbsp;c&oacute; lẽ l&agrave; phần mềm đồ họa vector phổ biến nhất tr&ecirc;n thế giới, hầu hết c&aacute;c Designer tr&ecirc;n thế giới l&agrave;m về đồ họa đều sử dụng phần mềm n&agrave;y.</span></p>\r\n<p><span style=\"font-size: 14pt;\">C&oacute; thể n&oacute;i nếu bạn muốn gia nhập l&agrave;ng thiết kế đồ họa bạn buộc phải học v&agrave; th&agrave;nh thạo phần mềm n&agrave;y.</span></p>\r\n<p><span style=\"font-size: 14pt;\">Hầu như mọi c&ocirc;ng ty quảng c&aacute;o truyền th&ocirc;ng, in ấn, thiết kế web&hellip; ở Việt Nam đều sử dụng phần mềm n&agrave;y. V&agrave; khi tuyển dụng th&igrave; kỹ năng sử dụng th&agrave;nh thạo phần mềm thiết kế đồ họa chuy&ecirc;n nghiệp Illustrator l&agrave; một y&ecirc;u cầu bắt buộc của c&aacute;c nh&agrave; tuyển dụng.</span></p>\r\n<p><span style=\"font-size: 14pt;\">Gi&aacute;o tr&igrave;nh Illustrator l&agrave; t&agrave;i liệu hướng dẫn học Illustrator hữu &iacute;ch cho người mới bắt đầu</span></p>\r\n<p><span style=\"font-size: 14pt;\">Thời buổi c&ocirc;ng nghệ 4.0 như hiện nay th&igrave; c&oacute; rất nhiều c&aacute;c phương ph&aacute;p học tập như:</span></p>\r\n<ul>\r\n<li style=\"font-size: 14pt;\"><span style=\"font-size: 14pt;\">Học trực tiếp qua gi&aacute;o vi&ecirc;n bộ m&ocirc;n</span></li>\r\n<li style=\"font-size: 14pt;\"><span style=\"font-size: 14pt;\">Học online qua video</span></li>\r\n<li style=\"font-size: 14pt;\"><span style=\"font-size: 14pt;\">Học tr&ecirc;n Youtube</span></li>\r\n<li style=\"font-size: 14pt;\"><span style=\"font-size: 14pt;\">Học qua s&aacute;ch hướng dẫn&hellip;</span></li>\r\n</ul>\r\n<p><span style=\"font-size: 14pt;\">Cho d&ugrave; bạn đang theo học với h&igrave;nh thức n&agrave;o đi nữa th&igrave; việc kết hợp c&aacute;c h&igrave;nh thức đ&oacute; với bộ gi&aacute;o tr&igrave;nh m&ocirc;n học sẽ đem đến cho bạn hiệu quả cao trong việc học.</span></p>\r\n<p><span style=\"font-size: 14pt;\">V&igrave; t&iacute;nh chất của gi&aacute;o tr&igrave;nh l&agrave; b&aacute;m s&aacute;t chương tr&igrave;nh đ&agrave;o tạo, đảm bảo t&iacute;nh hệ thống, t&iacute;nh ứng dụng, t&iacute;nh cơ bản v&agrave; t&iacute;nh ch&iacute;nh x&aacute;c.</span></p>',1,0,'huong-dan-su-dung-illutrator-cho-nguoi-moi-bat-đau'),(2,'Học Adobe Illustrator từ cơ bản đến nâng cao',8,2,1,1,1200000,600000,'<div class=\"w-full text-token-text-primary\" data-testid=\"conversation-turn-5\">\r\n<div class=\"px-4 py-2 justify-center text-base md:gap-6 m-auto\">\r\n<div class=\"flex flex-1 text-base mx-auto gap-3 md:px-5 lg:px-1 xl:px-5 md:max-w-3xl lg:max-w-[40rem] xl:max-w-[48rem] group final-completion\">\r\n<div class=\"relative flex w-full flex-col lg:w-[calc(100%-115px)] agent-turn\">\r\n<div class=\"flex-col gap-1 md:gap-3\">\r\n<div class=\"flex flex-grow flex-col max-w-full\">\r\n<div class=\"min-h-[20px] text-message flex flex-col items-start gap-3 whitespace-pre-wrap break-words [.text-message+&amp;]:mt-5 overflow-x-auto\" data-message-author-role=\"assistant\" data-message-id=\"f62f6da8-541f-4a96-8f8a-7464830286eb\">\r\n<div class=\"markdown prose w-full break-words dark:prose-invert light\">\r\n<p><span style=\"font-size: 14pt;\">Ch&agrave;o mừng bạn đến với kho&aacute; học \"Học Adobe Illustrator từ Cơ Bản đến N&acirc;ng Cao\" - h&agrave;nh tr&igrave;nh học tập đầy hứng th&uacute; để kh&aacute;m ph&aacute; v&agrave; l&agrave;m chủ một trong những c&ocirc;ng cụ thiết kế đồ họa mạnh mẽ nhất.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Điểm nổi bật của kho&aacute; học:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Cơ Bản cho Người Mới Bắt Đầu: Bạn sẽ bắt đầu với những kiến thức cơ bản về giao diện, c&ocirc;ng cụ v&agrave; c&aacute;c kỹ thuật vẽ đơn giản.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Thiết Kế Vector Hiệu Quả: Học c&aacute;ch tạo ra những h&igrave;nh ảnh vector chất lượng cao, linh hoạt v&agrave; c&oacute; thể ph&oacute;ng to m&agrave; kh&ocirc;ng l&agrave;m mất chất lượng.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? L&agrave;m Việc với Text v&agrave; Typography: N&acirc;ng cao kỹ năng của bạn trong việc s&aacute;ng tạo với văn bản, font chữ v&agrave; kiểu chữ.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Hiểu R&otilde; về M&agrave;u Sắc v&agrave; Gradient: Học c&aacute;ch sử dụng m&agrave;u sắc v&agrave; gradient để tạo ra những t&aacute;c phẩm nghệ thuật số phong c&aacute;ch v&agrave; ấn tượng.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Quy Tr&igrave;nh L&agrave;m Việc Hiệu Quả: T&igrave;m hiểu c&aacute;ch tổ chức dự &aacute;n, sử dụng layers v&agrave; l&agrave;m thế n&agrave;o để l&agrave;m việc hiệu quả với c&aacute;c c&ocirc;ng cụ kh&aacute;c nhau của Illustrator.</span></p>\r\n<p><span style=\"font-size: 14pt;\">✨ Hiệu Ứng v&agrave; C&ocirc;ng Cụ N&acirc;ng Cao: Kh&aacute;m ph&aacute; c&aacute;c hiệu ứng đặc biệt, bộ lọc v&agrave; c&ocirc;ng cụ n&acirc;ng cao để tạo ra những t&aacute;c phẩm độc đ&aacute;o v&agrave; s&aacute;ng tạo.</span></p>\r\n<p><span style=\"font-size: 14pt;\">?&zwj;? Với sự hướng dẫn chi tiết của chuy&ecirc;n gia c&oacute; kinh nghiệm, bạn sẽ trải qua những b&agrave;i giảng thực h&agrave;nh v&agrave; dự &aacute;n thực tế để &aacute;p dụng kiến thức ngay lập tức.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Đừng bỏ lỡ cơ hội trở th&agrave;nh chuy&ecirc;n gia Illustrator. Đăng k&yacute; ngay để bắt đầu h&agrave;nh tr&igrave;nh s&aacute;ng tạo của bạn!</span></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>',1,0,'hoc-adobe-illustrator-tu-co-ban-đen-nang-cao'),(3,'Khóa học Digital Paiting cơ bản cho người mới bắt đầu',4,3,1,1,2000000,1200000,'',2,0,'khoa-hoc-digital-paiting-co-ban-cho-nguoi-moi-bat-đau'),(4,'Tiếng Nhật cơ bản',1,3,1,1,3000000,2400000,'<p><span style=\"font-size: 14pt;\">? Ch&agrave;o Mừng Bạn Đến Với H&agrave;nh Tr&igrave;nh Tiếng Nhật:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Học c&aacute;ch ph&aacute;t &acirc;m đ&uacute;ng v&agrave; cơ bản của chữ c&aacute;i v&agrave; &acirc;m tiết trong Tiếng Nhật. ? X&acirc;y dựng cơ sở vững chắc cho việc hiểu v&agrave; sử dụng ng&ocirc;n ngữ h&agrave;ng ng&agrave;y.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Giao Tiếp H&agrave;ng Ng&agrave;y:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Học c&aacute;ch tự giới thiệu v&agrave; tham gia trong c&aacute;c t&igrave;nh huống giao tiếp cơ bản. ? Hỏi đường, đặt đồ ăn v&agrave; thực h&agrave;nh c&aacute;c c&acirc;u hỏi h&agrave;ng ng&agrave;y.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? M&ocirc;i Trường v&agrave; H&agrave;ng Ng&agrave;y:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? M&ocirc; phỏng c&aacute;c t&igrave;nh huống trong cuộc sống h&agrave;ng ng&agrave;y như mua sắm, đi chợ v&agrave; gặp gỡ bạn b&egrave;. ? Học c&aacute;ch m&ocirc; tả m&ocirc;i trường xung quanh v&agrave; những người xung quanh.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Mua Sắm v&agrave; Giao Dịch:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Học từ vựng v&agrave; c&acirc;u tr&igrave;nh b&agrave;y li&ecirc;n quan đến mua sắm v&agrave; giao dịch h&agrave;ng ng&agrave;y. ? Thực h&agrave;nh tại c&aacute;c cửa h&agrave;ng v&agrave; thị trường Nhật Bản ảo.</span></p>\r\n<p><span style=\"font-size: 14pt;\">?&zwj;?&zwj;?&zwj;? Gia Đ&igrave;nh v&agrave; Bữa Ăn:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? M&ocirc; tả gia đ&igrave;nh v&agrave; c&aacute;c th&agrave;nh vi&ecirc;n trong gia đ&igrave;nh. ? Thực h&agrave;nh diễn đạt &yacute; với c&aacute;c c&acirc;u tr&igrave;nh b&agrave;y về bữa ăn h&agrave;ng ng&agrave;y.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Thời Gian v&agrave; Lịch Tr&igrave;nh:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Học c&aacute;ch đọc giờ, n&oacute;i về thời gian v&agrave; lịch tr&igrave;nh. ? Đặt lịch hẹn v&agrave; thực h&agrave;nh sử dụng th&igrave; qu&aacute; khứ v&agrave; hiện tại.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Tiếp X&uacute;c Với Văn H&oacute;a Nhật:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Giới thiệu về văn h&oacute;a Nhật Bản v&agrave; c&aacute;c truyền thống cơ bản. ? L&agrave;m quen với c&aacute;c lễ hội v&agrave; nghệ thuật truyền thống.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Đọc Hiểu Cơ Bản:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Học c&aacute;ch đọc hiểu c&aacute;c bản đơn giản như th&ocirc;ng b&aacute;o v&agrave; hướng dẫn. ? Đ&agrave;m thoại về nội dung cơ bản.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Luyện Nghe Hiểu Cơ Bản:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Ph&aacute;t triển khả năng nghe hiểu qua c&aacute;c b&agrave;i thoại v&agrave; đoạn hội thoại. ? Hiểu v&agrave; thực h&agrave;nh đối thoại h&agrave;ng ng&agrave;y.</span></p>\r\n<p><span style=\"font-size: 14pt;\">?&zwj;? Đối Tượng Học Vi&ecirc;n:</span></p>\r\n<p><span style=\"font-size: 14pt;\">?&zwj;? Những người mới học Tiếng Nhật hoặc muốn củng cố kiến thức cơ bản. ?&zwj;? Sinh vi&ecirc;n, người đi l&agrave;m, v&agrave; những người c&oacute; mong muốn kh&aacute;m ph&aacute; văn h&oacute;a Nhật Bản.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Y&ecirc;u Cầu Ti&ecirc;n Quyết:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Kh&ocirc;ng c&oacute; y&ecirc;u cầu ti&ecirc;n quyết. Ph&ugrave; hợp cho người mới bắt đầu.</span></p>',2,0,'tieng-nhat-co-ban'),(5,'Tiếng Nhật nâng cao',1,2,1,1,6000000,5500000,'<p><span style=\"font-size: 14pt;\">? Chinh Phục Tiếng Nhật Ở Cấp Độ N&acirc;ng Cao:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? N&acirc;ng cao khả năng giao tiếp v&agrave; hiểu biết s&acirc;u rộng trong Tiếng Nhật. ? Ph&aacute;t triển vững ngữ ph&aacute;p v&agrave; từ vựng th&ocirc;ng qua b&agrave;i học thực h&agrave;nh v&agrave; thảo luận.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Chạm Tay V&agrave;o Văn H&oacute;a Nhật Bản:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Hiểu r&otilde; hơn về văn h&oacute;a, lịch sử v&agrave; truyền thống Nhật Bản. ? Học c&aacute;ch sử dụng ng&ocirc;n ngữ ph&ugrave; hợp với ngữ cảnh văn h&oacute;a.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Đ&agrave;m Thoại Chuy&ecirc;n S&acirc;u:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Thực h&agrave;nh đ&agrave;m thoại h&agrave;ng ng&agrave;y v&agrave; c&aacute;c t&igrave;nh huống chuy&ecirc;n s&acirc;u. ? N&acirc;ng cao khả năng lắng nghe v&agrave; phản ứng nhanh nhạy trong c&aacute;c trao đổi phức tạp.</span></p>\r\n<p><span style=\"font-size: 14pt;\">✍ Viết Tiếng Nhật Hiệu Quả:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Học kỹ thuật viết từ vựng v&agrave; c&acirc;u tr&igrave;nh b&agrave;y phong c&aacute;ch ng&ocirc;n ngữ. ? Viết v&agrave; soạn thảo văn bản với độ ch&iacute;nh x&aacute;c v&agrave; sự s&aacute;ng tạo.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Thuyết Tr&igrave;nh v&agrave; Giao Tiếp C&ocirc;ng Việc:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Ph&aacute;t triển kỹ năng thuyết tr&igrave;nh v&agrave; giao tiếp hiệu quả trong m&ocirc;i trường c&ocirc;ng việc. ? Học c&aacute;ch thảo luận v&agrave; thuyết phục trong Tiếng Nhật.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Đọc Hiểu Văn Bản Phức Tạp:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Nắm bắt th&ocirc;ng tin từ văn bản chuy&ecirc;n s&acirc;u v&agrave; phức tạp. ? Đọc hiểu b&aacute;o c&aacute;o, văn bản kỹ thuật v&agrave; văn ph&ograve;ng.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Luyện Nghe Hiểu N&acirc;ng Cao:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? N&acirc;ng cao khả năng nghe hiểu qua c&aacute;c t&igrave;nh huống hội thoại phức tạp. ? Hiểu r&otilde; v&agrave; phản ứng linh hoạt trong giao tiếp h&agrave;ng ng&agrave;y.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Tiếp X&uacute;c Thực Tế:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Tổ chức c&aacute;c hoạt động thực tế để &aacute;p dụng kiến thức trong m&ocirc;i trường thực tế. ? Tương t&aacute;c với cộng đồng người học Tiếng Nhật.</span></p>\r\n<p><span style=\"font-size: 14pt;\">?&zwj;? Đối Tượng Học Vi&ecirc;n:</span></p>\r\n<p><span style=\"font-size: 14pt;\">?&zwj;? Những người học Tiếng Nhật ở cấp độ trung cấp muốn n&acirc;ng cao kỹ năng. ?&zwj;? Sinh vi&ecirc;n, nh&acirc;n vi&ecirc;n văn ph&ograve;ng v&agrave; những người quan t&acirc;m đến văn h&oacute;a Nhật Bản.</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Y&ecirc;u Cầu Ti&ecirc;n Quyết:</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Kiến thức cơ bản về ng&ocirc;n ngữ Tiếng Nhật hoặc đ&atilde; ho&agrave;n th&agrave;nh kh&oacute;a học Tiếng Nhật cơ bản.</span></p>\r\n<div class=\"ddict_btn\" style=\"top: 133px; left: 739.2px;\"><span style=\"font-size: 14pt;\"><img src=\"chrome-extension://cianljdimgjlpmjllcbahmpdnicglaap/logo/48.png\"></span></div>',1,0,'tieng-nhat-nang-cao'),(6,'Khoá học TOEIC 450 điểm dành cho người mới bắt đầu',1,1,1,1,600000,300000,'',2,0,'khoa-hoc-toeic-450-điem-danh-cho-nguoi-moi-bat-đau'),(47,'Khoá học lập trình web trên Udemy sử dụng Java Servlet',7,2,1,1,700000,400000,'<p>? Kh&aacute;m Ph&aacute; Sức Mạnh Của Java Servlet:</p>\r\n<p>? Lập tr&igrave;nh web mạnh mẽ v&agrave; hiệu quả với Java Servlet. ? X&acirc;y dựng ứng dụng web từ cơ bản đến n&acirc;ng cao.</p>\r\n<p>?️ C&agrave;i Đặt M&ocirc;i Trường Ph&aacute;t Triển:</p>\r\n<p>? Hướng dẫn c&agrave;i đặt IDE v&agrave; thiết lập m&ocirc;i trường ph&aacute;t triển nhanh ch&oacute;ng. ? Chuẩn bị m&aacute;y chủ web v&agrave; cơ sở dữ liệu.</p>\r\n<p>? Cơ Bản về Servlet v&agrave; HTTP:</p>\r\n<p>? Hiểu r&otilde; về chu kỳ cuộc sống của Servlet. ? Xử l&yacute; y&ecirc;u cầu v&agrave; phản hồi HTTP.</p>\r\n<p>? X&acirc;y Dựng Ứng Dụng Web Đơn Giản:</p>\r\n<p>? Tạo ứng dụng web nhỏ để thực h&agrave;nh xử l&yacute; biểu mẫu v&agrave; gửi dữ liệu.</p>\r\n<p>? Giao Tiếp với Cơ Sở Dữ Liệu:</p>\r\n<p>? Kết nối v&agrave; thao t&aacute;c dữ liệu với JDBC. ? Thực hiện c&aacute;c thao t&aacute;c CRUD tr&ecirc;n cơ sở dữ liệu.</p>\r\n<p>? Quản L&yacute; Phi&ecirc;n v&agrave; Cookies:</p>\r\n<p>? Sử dụng quản l&yacute; phi&ecirc;n để duy tr&igrave; trạng th&aacute;i. ? Lưu trữ th&ocirc;ng tin với Cookies.</p>\r\n<p>? Bảo Mật Trong Ứng Dụng Web:</p>\r\n<p>? &Aacute;p dụng biện ph&aacute;p bảo mật như SSL v&agrave; x&aacute;c thực người d&ugrave;ng. ? Đối ph&oacute; với c&aacute;c loại tấn c&ocirc;ng phổ biến.</p>\r\n<p>? Triển Khai Ứng Dụng:</p>\r\n<p>? Hướng dẫn triển khai ứng dụng tr&ecirc;n c&aacute;c m&aacute;y chủ web phổ biến. ? Tối ưu h&oacute;a hiệu suất v&agrave; bảo mật khi triển khai.</p>\r\n<p>?&zwj;? Đối Tượng Học Vi&ecirc;n:</p>\r\n<p>?&zwj;? Người muốn nắm vững lập tr&igrave;nh web với Java Servlet. ? Những sinh vi&ecirc;n v&agrave; nh&agrave; ph&aacute;t triển Java đam m&ecirc; web.</p>\r\n<p>? Y&ecirc;u Cầu Ti&ecirc;n Quyết:</p>\r\n<p>? Kiến thức cơ bản về Java v&agrave; lập tr&igrave;nh web.</p>\r\n<p>? Sẵn S&agrave;ng Bắt Đầu H&agrave;nh Tr&igrave;nh Lập Tr&igrave;nh Web!</p>',1,0,'khoa-hoc-lap-trinh-web-tren-udemy-su-dung-java-servlet'),(48,'Khóa học nấu ăn Á Âu - Lớp dạy nấu ăn Cơ Bản',12,1,1,1,800000,400000,'<p>Đ&acirc;y l&agrave; m&ocirc; tả</p>',1,0,'khoa-hoc-nau-an-a-au---lop-day-nau-an-co-ban'),(49,'Khóa Học Đàn Piano - Dạy Chơi Piano Cho Người Mới Bắt Đầu',4,1,1,1,1300000,900000,'<p>Đ&acirc;y l&agrave; m&ocirc; tả</p>',1,0,'khoa-hoc-đan-piano---day-choi-piano-cho-nguoi-moi-bat-đau'),(50,'Khoá học lập trình Laravel',7,2,1,1,1500000,1200000,'<p>Đ&acirc;y l&agrave; m&ocirc; tả</p>',1,0,'khoa-hoc-lap-trinh-laravel'),(51,'Khoá học Marketing căn bản',9,1,1,1,200000,80000,'<p><span style=\"font-size: 14pt;\">? Bạn muốn hiểu r&otilde; về nguy&ecirc;n l&yacute; cơ bản của Marketing v&agrave; &aacute;p dụng ch&uacute;ng v&agrave;o chiến lược kinh doanh của m&igrave;nh? H&atilde;y tham gia kho&aacute; học Marketing Căn Bản của ch&uacute;ng t&ocirc;i!</span></p>\r\n<p><span style=\"font-size: 14pt;\">? Những điều bạn sẽ học được:</span></p>\r\n<ul>\r\n<li style=\"font-size: 14pt;\"><span style=\"font-size: 14pt;\">Hiểu r&otilde; về cơ bản của Marketing v&agrave; tầm quan trọng của n&oacute; trong kinh doanh.</span></li>\r\n<li style=\"font-size: 14pt;\"><span style=\"font-size: 14pt;\">X&acirc;y dựng chiến lược tiếp thị hiệu quả v&agrave; ph&ugrave; hợp với mục ti&ecirc;u kinh doanh của bạn.</span></li>\r\n<li style=\"font-size: 14pt;\"><span style=\"font-size: 14pt;\">Nắm bắt c&aacute;c kh&aacute;i niệm quan trọng như t&igrave;m hiểu kh&aacute;ch h&agrave;ng, định danh thương hiệu, v&agrave; chiến lược quảng c&aacute;o.</span></li>\r\n<li style=\"font-size: 14pt;\"><span style=\"font-size: 14pt;\">&Aacute;p dụng c&aacute;c phương ph&aacute;p đo lường hiệu suất v&agrave; tối ưu h&oacute;a chiến lược tiếp thị.</span></li>\r\n</ul>\r\n<p><span style=\"font-size: 14pt;\">? Ai n&ecirc;n tham gia:</span></p>\r\n<ul>\r\n<li style=\"font-size: 14pt;\"><span style=\"font-size: 14pt;\">Doanh nh&acirc;n v&agrave; chủ doanh nghiệp muốn nắm vững c&aacute;c nguy&ecirc;n tắc cơ bản của Marketing.</span></li>\r\n<li style=\"font-size: 14pt;\"><span style=\"font-size: 14pt;\">Người quản l&yacute; tiếp thị v&agrave; những ai muốn cập nhật kiến thức của m&igrave;nh với xu hướng mới nhất.</span></li>\r\n<li style=\"font-size: 14pt;\"><span style=\"font-size: 14pt;\">Sinh vi&ecirc;n v&agrave; những người mới bắt đầu sự nghiệp trong lĩnh vực tiếp thị.</span></li>\r\n</ul>\r\n<p><span style=\"font-size: 14pt;\">? H&atilde;y đăng k&yacute; ngay để bắt đầu h&agrave;nh tr&igrave;nh của bạn trong thế giới phức tạp nhưng th&uacute; vị của Marketing!</span></p>',2,0,'khoa-hoc-marketing-can-ban'),(52,'Cách lên ý tưởng thiết kế logo chuyên nghiệp',5,2,1,1,500000,300000,'<p>Đ&acirc;y l&agrave; m&ocirc; tả</p>',3,0,'cach-len-y-tuong-thiet-ke-logo-chuyen-nghiep'),(53,'Khoá học thiết kế đồ hoạ chuyên nghiệp',5,2,1,1,2000000,1800000,'<p>? <strong>Học Thiết Kế Đồ Hoạ Chuy&ecirc;n Nghiệp: Chinh Phục Nghệ Thuật S&aacute;ng Tạo v&agrave; Kỹ Thuật Hiện Đại!</strong> ?</p>\r\n<p>Bạn muốn trải nghiệm thế giới đồ hoạ chuy&ecirc;n nghiệp v&agrave; kh&aacute;m ph&aacute; b&iacute; mật đằng sau c&aacute;c t&aacute;c phẩm nghệ thuật đỉnh cao? Kho&aacute; học Thiết Kế Đồ Hoạ Chuy&ecirc;n Nghiệp l&agrave; cầu nối giữa sự s&aacute;ng tạo v&agrave; kỹ thuật, gi&uacute;p bạn đạt đến đỉnh cao mới trong lĩnh vực nghệ thuật số.</p>\r\n<p>? <strong>Kh&aacute;m Ph&aacute; Thế Giới Đồ Hoạ:</strong> Bắt đầu h&agrave;nh tr&igrave;nh của bạn bằng c&aacute;ch kh&aacute;m ph&aacute; lịch sử v&agrave; xu hướng đồ hoạ từ qu&aacute; khứ đến hiện đại. T&igrave;m hiểu về c&aacute;c nền văn h&oacute;a v&agrave; nghệ sĩ nổi tiếng để hiểu r&otilde; hơn về sự ph&aacute;t triển v&agrave; đa dạng của ng&agrave;nh đồ hoạ.</p>\r\n<p>?️ <strong>N&acirc;ng Cao Kỹ Năng S&aacute;ng Tạo:</strong> Với hướng dẫn chi tiết từ những chuy&ecirc;n gia h&agrave;ng đầu, bạn sẽ học c&aacute;ch ph&aacute;t triển &yacute; tưởng, x&acirc;y dựng concept, v&agrave; biến ước mơ s&aacute;ng tạo th&agrave;nh hiện thực tr&ecirc;n m&agrave;n h&igrave;nh. Kh&aacute;m ph&aacute; c&aacute;ch tạo ra t&aacute;c phẩm độc đ&aacute;o v&agrave; s&aacute;ng tạo.</p>\r\n<p>?️ <strong>&Aacute;p Dụng C&ocirc;ng Nghệ Hiện Đại:</strong> Đ&agrave;o s&acirc;u v&agrave;o c&aacute;c c&ocirc;ng nghệ đồ hoạ ti&ecirc;n tiến như Adobe Creative Suite, 3D modeling, v&agrave; animation. Học c&aacute;ch sử dụng c&ocirc;ng cụ v&agrave; phần mềm h&agrave;ng đầu để tối ưu h&oacute;a quy tr&igrave;nh l&agrave;m việc v&agrave; tạo ra sản phẩm chất lượng cao.</p>\r\n<p>? <strong>Kết Nối Với Cộng Đồng Nghệ Sĩ:</strong> Tham gia v&agrave;o cộng đồng đồ hoạ đầy s&ocirc;i động, chia sẻ kinh nghiệm v&agrave; nhận phản hồi từ những người đồng nghiệp v&agrave; gi&aacute;o vi&ecirc;n c&oacute; kinh nghiệm. X&acirc;y dựng mối quan hệ v&agrave; mạng lưới để thăng tiến trong sự nghiệp của bạn.</p>\r\n<p>? <strong>Tự Tin Bước V&agrave;o Thị Trường Lao Động:</strong> Với sự hỗ trợ từ đội ngũ gi&aacute;o vi&ecirc;n chất lượng v&agrave; dự &aacute;n thực tế, bạn sẽ tự tin bước v&agrave;o thị trường lao động với bộ kỹ năng v&agrave; sự hiểu biết s&acirc;u sắc về ng&agrave;nh đồ hoạ.</p>\r\n<p>? <strong>Đăng K&yacute; Ngay Để Bắt Đầu H&agrave;nh Tr&igrave;nh Nghệ Thuật Của Bạn!</strong> ?</p>',3,0,'khoa-hoc-thiet-ke-đo-hoa-chuyen-nghiep'),(54,'Khóa học Adobe Photoshop cho người mới bắt đầu',5,1,1,1,1200000,900000,'<p>?️ <strong>Kh&oacute;a Học Adobe Photoshop Cho Người Mới Bắt Đầu: H&agrave;nh Tr&igrave;nh S&aacute;ng Tạo Với C&ocirc;ng Cụ Thiết Kế Mạnh Mẽ!</strong> ?</p>\r\n<p>Bạn đang t&igrave;m kiếm bước đầu l&yacute; tưởng v&agrave;o thế giới s&aacute;ng tạo của Adobe Photoshop? Kh&oacute;a học n&agrave;y kh&ocirc;ng chỉ l&agrave; c&aacute;nh cửa mở cho người mới bắt đầu m&agrave; c&ograve;n l&agrave; h&agrave;nh tr&igrave;nh chinh phục những c&ocirc;ng cụ thiết kế mạnh mẽ một c&aacute;ch dễ d&agrave;ng v&agrave; s&aacute;ng tạo.</p>\r\n<p>? <strong>Nền Tảng Cho Người Mới:</strong> Kh&aacute;m ph&aacute; cơ bản của Adobe Photoshop từ A đến Z - từ giao diện đến c&aacute;c c&ocirc;ng cụ quan trọng. Hướng dẫn chi tiết để bạn dễ d&agrave;ng tiếp cận v&agrave; l&agrave;m quen với m&ocirc;i trường l&agrave;m việc.</p>\r\n<p>? <strong>S&aacute;ng Tạo Với C&ocirc;ng Cụ Vẽ v&agrave; Chỉnh Sửa:</strong> Bằng c&aacute;ch hướng dẫn chi tiết về vẽ, l&agrave;m mịn v&agrave; điều chỉnh h&igrave;nh ảnh, bạn sẽ nắm bắt được c&aacute;ch tạo ra t&aacute;c phẩm nghệ thuật số độc đ&aacute;o v&agrave; chất lượng cao.</p>\r\n<p>? <strong>Xử L&yacute; Ảnh Chuy&ecirc;n S&acirc;u:</strong> T&igrave;m hiểu c&aacute;ch chỉnh sửa m&agrave;u sắc, c&acirc;n bằng &aacute;nh s&aacute;ng, v&agrave; loại bỏ c&aacute;c khuyết điểm để biến ảnh chụp của bạn th&agrave;nh t&aacute;c phẩm nghệ thuật chuy&ecirc;n nghiệp.</p>\r\n<p>? <strong>Tăng Cường Hiệu Suất với C&aacute;c Kỹ Thuật Ti&ecirc;n Tiến:</strong> Chinh phục c&aacute;c kỹ thuật n&acirc;ng cao như lớp, mask, v&agrave; c&aacute;c hiệu ứng đặc biệt để tạo ra h&igrave;nh ảnh động v&agrave; ấn tượng.</p>\r\n<p>? <strong>Cộng Đồng Học Tập v&agrave; Hỗ Trợ:</strong> Tham gia v&agrave;o cộng đồng học tập chia sẻ &yacute; kiến, gặp gỡ những người đồng h&agrave;nh, v&agrave; nhận sự hỗ trợ từ gi&aacute;o vi&ecirc;n c&oacute; kinh nghiệm.</p>\r\n<p>? <strong>Bước Đầu Để Trở Th&agrave;nh Chuy&ecirc;n Gia Photoshop:</strong> H&atilde;y chuẩn bị bước v&agrave;o thế giới chuy&ecirc;n nghiệp với kiến thức v&agrave; kỹ năng m&agrave; kh&oacute;a học n&agrave;y mang lại.</p>\r\n<p>? <strong>Đăng K&yacute; Ngay Để Bắt Đầu H&agrave;nh Tr&igrave;nh Nghệ Thuật Của Bạn!</strong> ?</p>',3,0,'khoa-hoc-adobe-photoshop-cho-nguoi-moi-bat-đau'),(55,'Khóa học Adobe Photoshop nâng cao',5,2,1,1,2000000,1500000,'<p>? <strong>Kh&oacute;a Học Adobe Photoshop N&acirc;ng Cao: Đỉnh Cao S&aacute;ng Tạo với C&ocirc;ng Cụ Thiết Kế Chuy&ecirc;n S&acirc;u!</strong> ?</p>\r\n<p>Bạn đ&atilde; c&oacute; kinh nghiệm với Adobe Photoshop v&agrave; muốn chinh phục những kh&iacute;a cạnh s&acirc;u sắc v&agrave; đầy th&aacute;ch thức của c&ocirc;ng cụ n&agrave;y? Kh&aacute;m ph&aacute; những khả năng mới, kỹ thuật ti&ecirc;n tiến, v&agrave; b&iacute; quyết s&aacute;ng tạo trong kh&oacute;a học n&acirc;ng cao n&agrave;y.</p>\r\n<p>? <strong>Kh&aacute;m Ph&aacute; Tận C&ugrave;ng C&ocirc;ng Cụ Photoshop:</strong> Nắm vững c&aacute;c t&iacute;nh năng v&agrave; c&ocirc;ng cụ n&acirc;ng cao của Adobe Photoshop, từ lớp v&agrave; mask đến c&aacute;c hiệu ứng v&agrave; bộ lọc ti&ecirc;n tiến. Đi s&acirc;u v&agrave;o sự linh hoạt v&agrave; sức mạnh của ứng dụng n&agrave;y.</p>\r\n<p>? <strong>S&aacute;ng Tạo Với Lớp v&agrave; Hiệu Ứng Đa Chiều:</strong> Học c&aacute;ch tạo ra hiệu ứng đa chiều v&agrave; sử dụng lớp một c&aacute;ch chuy&ecirc;n s&acirc;u, từ &aacute;nh s&aacute;ng đến chuyển động, để tạo ra t&aacute;c phẩm nghệ thuật số độc đ&aacute;o.</p>\r\n<p>? <strong>Chinh Phục Nghệ Thuật Retouching:</strong> T&igrave;m hiểu c&aacute;c kỹ thuật retouching chuy&ecirc;n nghiệp để biến c&aacute;c bức ảnh th&agrave;nh t&aacute;c phẩm nghệ thuật đẹp mắt v&agrave; tự tin.</p>\r\n<p>? <strong>Tối Ưu H&oacute;a Hiệu Suất v&agrave; Quy Tr&igrave;nh L&agrave;m Việc:</strong> Thực h&agrave;nh c&aacute;ch tối ưu h&oacute;a hiệu suất của bạn với c&aacute;c kỹ thuật l&agrave;m việc hiệu quả v&agrave; quản l&yacute; dự &aacute;n lớn. Học c&aacute;ch t&iacute;ch hợp Photoshop v&agrave;o quy tr&igrave;nh l&agrave;m việc của bạn một c&aacute;ch th&ocirc;ng minh.</p>\r\n<p>? <strong>Ph&acirc;n T&iacute;ch v&agrave; Đ&aacute;nh Gi&aacute; T&aacute;c Phẩm:</strong> Nhận phản hồi chuy&ecirc;n s&acirc;u từ gi&aacute;o vi&ecirc;n v&agrave; đồng học để ph&aacute;t triển khả năng ph&ecirc; duyệt t&aacute;c phẩm v&agrave; n&acirc;ng cao sự chuy&ecirc;n nghiệp của bạn.</p>\r\n<p>? <strong>Kết Nối Với Cộng Đồng Chuy&ecirc;n Gia:</strong> Tham gia v&agrave;o cộng đồng chia sẻ &yacute; kiến v&agrave; kinh nghiệm với những người s&aacute;ng tạo đồ hoạ h&agrave;ng đầu. X&acirc;y dựng mạng lưới quan hệ v&agrave; t&igrave;m kiếm cơ hội hợp t&aacute;c mới.</p>\r\n<p>? <strong>Bước Đi Tiếp Tới Sự Chuy&ecirc;n Nghiệp Với Adobe Photoshop!</strong> ?</p>',1,0,'khoa-hoc-adobe-photoshop-nang-cao'),(56,'Khóa học lập trình Java cơ bản',7,1,1,1,3000000,2800000,'<p>? <strong>Kh&oacute;a Học Lập Tr&igrave;nh Java: Kh&aacute;m Ph&aacute; Ng&ocirc;n Ngữ Mạnh Mẽ v&agrave; Ứng Dụng Rộng R&atilde;i!</strong> ?</p>\r\n<p>Bạn đang muốn kh&aacute;m ph&aacute; thế giới lập tr&igrave;nh với ng&ocirc;n ngữ Java, ng&ocirc;n ngữ mạnh mẽ v&agrave; được sử dụng rộng r&atilde;i trong ng&agrave;nh c&ocirc;ng nghiệp c&ocirc;ng nghệ? Kh&oacute;a học n&agrave;y sẽ dẫn dắt bạn từ cơ bản đến n&acirc;ng cao, gi&uacute;p bạn x&acirc;y dựng nền tảng vững chắc trong lập tr&igrave;nh Java.</p>\r\n<p>? <strong>Bắt Đầu Từ Cơ Bản:</strong> T&igrave;m hiểu về c&uacute; ph&aacute;p cơ bản của Java, kiểu dữ liệu, v&agrave; c&aacute;ch viết m&atilde;. Hướng dẫn từng bước để bạn dễ d&agrave;ng tiếp cận thế giới lập tr&igrave;nh.</p>\r\n<p>? <strong>Ứng Dụng Rộng R&atilde;i:</strong> Kh&aacute;m ph&aacute; c&aacute;c ứng dụng thực tế của Java trong ph&aacute;t triển ứng dụng di động, web, v&agrave; cả phần mềm m&aacute;y t&iacute;nh. Hiểu r&otilde; c&aacute;ch Java đ&oacute;ng vai tr&ograve; quan trọng trong việc x&acirc;y dựng c&aacute;c dự &aacute;n lớn v&agrave; phức tạp.</p>\r\n<p>? <strong>Xử L&yacute; Dữ Liệu v&agrave; Thuật To&aacute;n:</strong> Học c&aacute;ch sử dụng Java để xử l&yacute; dữ liệu v&agrave; triển khai c&aacute;c thuật to&aacute;n cơ bản. T&igrave;m hiểu c&aacute;ch tối ưu h&oacute;a m&atilde; nguồn để đảm bảo hiệu suất tốt nhất.</p>\r\n<p>?️ <strong>Ph&aacute;t Triển Ứng Dụng Java Hiện Đại:</strong> Dấn th&acirc;n v&agrave;o thế giới Java hiện đại với Spring Framework v&agrave; JavaFX. X&acirc;y dựng ứng dụng mạnh mẽ với c&aacute;c c&ocirc;ng nghệ h&agrave;ng đầu trong ng&agrave;nh.</p>\r\n<p>? <strong>Tham Gia Cộng Đồng Lập Tr&igrave;nh:</strong> Kết nối với cộng đồng lập tr&igrave;nh Java đầy năng động, chia sẻ kinh nghiệm v&agrave; nhận hỗ trợ từ những chuy&ecirc;n gia gi&agrave;u kinh nghiệm.</p>\r\n<p>? <strong>Bước Đầu Cho Sự Nghiệp Lập Tr&igrave;nh Java:</strong> Tự tin bước v&agrave;o thị trường lao động với kiến thức s&acirc;u sắc về Java v&agrave; khả năng ứng dụng linh hoạt trong c&aacute;c dự &aacute;n thực tế.</p>\r\n<p>? <strong>Đăng K&yacute; Ngay Để Bắt Đầu H&agrave;nh Tr&igrave;nh Lập Tr&igrave;nh Java Của Bạn!</strong> ?</p>',1,0,'khoa-hoc-lap-trinh-java-co-ban'),(57,'Khóa học lập trình C++ cơ bản',7,1,1,1,2000000,1600000,'<p>? <strong>Kh&oacute;a Học Lập Tr&igrave;nh C++: Chinh Phục Ng&ocirc;n Ngữ Mạnh Mẽ v&agrave; Ứng Dụng Đa Dạng!</strong> ?</p>\r\n<p>Bạn đang t&igrave;m kiếm kh&oacute;a học để th&acirc;m nhập s&acirc;u v&agrave;o thế giới lập tr&igrave;nh C++, ng&ocirc;n ngữ mạnh mẽ v&agrave; linh hoạt? Kh&aacute;m ph&aacute; c&ugrave;ng ch&uacute;ng t&ocirc;i từ cơ bản đến n&acirc;ng cao, v&agrave; x&acirc;y dựng kỹ năng lập tr&igrave;nh vững chắc với C++.</p>\r\n<p>? <strong>Kiến Thức Cơ Bản V&agrave; C&uacute; Ph&aacute;p:</strong> Bắt đầu h&agrave;nh tr&igrave;nh của bạn với C++ từ những kiến thức cơ bản nhất, hiểu r&otilde; về c&uacute; ph&aacute;p v&agrave; quy tắc lập tr&igrave;nh. Hướng dẫn chi tiết gi&uacute;p bạn thoải m&aacute;i với ng&ocirc;n ngữ n&agrave;y.</p>\r\n<p>? <strong>Ph&aacute;t Triển Ứng Dụng Đa Nhiệm:</strong> Kh&aacute;m ph&aacute; sức mạnh của C++ trong ph&aacute;t triển ứng dụng đa nhiệm v&agrave; đa nền tảng. X&acirc;y dựng kiến thức để tạo ra c&aacute;c ứng dụng linh hoạt v&agrave; hiệu quả.</p>\r\n<p>? <strong>T&igrave;m Hiểu Về Cấu Tr&uacute;c Dữ Liệu v&agrave; Thuật To&aacute;n:</strong> N&acirc;ng cao khả năng giải quyết vấn đề của bạn bằng c&aacute;ch thức hiểu vững về cấu tr&uacute;c dữ liệu v&agrave; thuật to&aacute;n trong C++. &Aacute;p dụng ch&uacute;ng v&agrave;o c&aacute;c dự &aacute;n thực tế.</p>\r\n<p>? <strong>Ứng Dụng C++ Trong Ph&aacute;t Triển Game:</strong> Dấn th&acirc;n v&agrave;o thế giới ph&aacute;t triển game với C++. T&igrave;m hiểu c&aacute;ch x&acirc;y dựng m&atilde; nguồn chất lượng cao v&agrave; tối ưu h&oacute;a hiệu suất cho trải nghiệm game tốt nhất.</p>\r\n<p>?️ <strong>Tối Ưu H&oacute;a Hiệu Suất v&agrave; M&atilde; Nguồn:</strong> Học c&aacute;ch tối ưu h&oacute;a m&atilde; nguồn v&agrave; l&agrave;m việc hiệu quả với C++. Hiểu r&otilde; về c&aacute;c kỹ thuật tối ưu để đảm bảo ứng dụng chạy mượt m&agrave; v&agrave; hiệu quả.</p>\r\n<p>? <strong>Tham Gia Cộng Đồng Lập Tr&igrave;nh C++:</strong> Kết nối với cộng đồng lập tr&igrave;nh C++ đầy năng động, chia sẻ kiến thức v&agrave; nhận hỗ trợ từ những chuy&ecirc;n gia c&oacute; kinh nghiệm.</p>\r\n<p>? <strong>Bước Đầu Cho Sự Nghiệp Lập Tr&igrave;nh C++:</strong> Sẵn s&agrave;ng bước v&agrave;o thị trường lao động với kiến thức s&acirc;u sắc v&agrave; kỹ năng lập tr&igrave;nh mạnh mẽ trong C++.</p>\r\n<p>? <strong>Đăng K&yacute; Ngay Để Kh&aacute;m Ph&aacute; Sức Mạnh của Lập Tr&igrave;nh C++!</strong> ?</p>',1,0,'khoa-hoc-lap-trinh-c++-co-ban'),(58,'Khóa học chụp ảnh',8,3,1,1,1000000,700000,'<p>? <strong>Kh&oacute;a Học Chụp Ảnh: Nắm Bắt Nghệ Thuật v&agrave; Kỹ Thuật, Biến &Yacute; Tưởng Th&agrave;nh H&igrave;nh Ảnh Sống Động!</strong> ?</p>\r\n<p>Kh&aacute;m ph&aacute; v&agrave; ph&aacute;t triển t&agrave;i năng chụp ảnh của bạn với kh&oacute;a học n&agrave;y, nơi bạn sẽ được hướng dẫn từ cơ bản đến n&acirc;ng cao, gi&uacute;p bạn tạo ra những bức ảnh đẹp v&agrave; &yacute; nghĩa.</p>\r\n<p>? <strong>Nền Tảng Cơ Bản Về M&aacute;y Ảnh:</strong> Bắt đầu h&agrave;nh tr&igrave;nh của bạn với việc hiểu r&otilde; về m&aacute;y ảnh, c&aacute;c chế độ v&agrave; thiết lập cơ bản. Học c&aacute;ch sử dụng c&ocirc;ng cụ để kiểm so&aacute;t &aacute;nh s&aacute;ng v&agrave; g&oacute;c chụp.</p>\r\n<p>? <strong>Hiểu Biết Về &Aacute;nh S&aacute;ng v&agrave; M&agrave;u Sắc:</strong> Nắm bắt b&iacute; quyết của &aacute;nh s&aacute;ng v&agrave; m&agrave;u sắc trong nhiếp ảnh. Học c&aacute;ch tận dụng &aacute;nh s&aacute;ng tự nhi&ecirc;n v&agrave; s&aacute;ng tạo n&ecirc;n c&aacute;c hiệu ứng m&agrave;u sắc độc đ&aacute;o.</p>\r\n<p>? <strong>Kỹ Thuật Chụp Ảnh N&acirc;ng Cao:</strong> Ph&aacute;t triển kỹ thuật chụp ảnh của bạn với hướng dẫn về độ s&acirc;u trường ảnh, tốc độ m&agrave;n trập, v&agrave; khẩu độ. Tạo ra những bức ảnh nghệ thuật với sự chuy&ecirc;n nghiệp.</p>\r\n<p>?️ <strong>S&aacute;ng Tạo Với Chỉnh Sửa Ảnh:</strong> Kh&aacute;m ph&aacute; thế giới chỉnh sửa ảnh để tối ưu h&oacute;a v&agrave; tạo ra ảnh độc đ&aacute;o. Học c&aacute;ch sử dụng c&aacute;c c&ocirc;ng cụ chỉnh sửa để thể hiện &yacute; tưởng của bạn một c&aacute;ch ho&agrave;n hảo.</p>\r\n<p>?&zwj;?&zwj;? <strong>Chụp Ảnh Nh&oacute;m v&agrave; Sự Kiện:</strong> Chinh phục nghệ thuật chụp ảnh nh&oacute;m v&agrave; sự kiện, từ h&igrave;nh ảnh gia đ&igrave;nh đến cảnh quay lớn. Học c&aacute;ch tạo ra kỷ niệm đẹp qua ống k&iacute;nh của bạn.</p>\r\n<p>? <strong>Chia Sẻ v&agrave; Kết Nối Trong Cộng Đồng Nhiếp Ảnh:</strong> Tham gia v&agrave;o cộng đồng nhiếp ảnh, chia sẻ &yacute; kiến v&agrave; nhận phản hồi từ những người đồng nghiệp. Kết nối v&agrave; học hỏi từ những người y&ecirc;u th&iacute;ch nhiếp ảnh giống bạn.</p>\r\n<p>? <strong>Hướng Dẫn Bước Đầu V&agrave;o Nghề Nghiệp Nhiếp Ảnh:</strong> Sẵn s&agrave;ng bước v&agrave;o sự nghiệp với kiến thức s&acirc;u sắc v&agrave; tay nghề chụp ảnh m&agrave; bạn đ&atilde; ph&aacute;t triển qua kh&oacute;a học n&agrave;y.</p>\r\n<p>? <strong>Đăng K&yacute; Ngay Để Mở C&aacute;nh Cửa Cho Nghệ Thuật Chụp Ảnh!</strong> ?</p>',2,0,'khoa-hoc-chup-anh'),(59,'Khóa học IELTS  từ 0 đến 6.5 cho người mới bắt đầu ',1,3,1,1,2000000,1600000,'<p>? <strong>Kh&oacute;a Học IELTS Từ 0 Đến 6.5: H&agrave;nh Tr&igrave;nh Năng Động Tạo Nền Tảng Vững Cho Bạn!</strong> ?</p>\r\n<p>Bạn l&agrave; người mới bắt đầu với IELTS v&agrave; muốn đạt được điểm 6.5 một c&aacute;ch tự tin? Kh&aacute;m ph&aacute; kh&oacute;a học n&agrave;y, nơi bạn sẽ được hướng dẫn từ cơ bản đến n&acirc;ng cao, đồng h&agrave;nh với bạn tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục kỳ thi quan trọng n&agrave;y.</p>\r\n<p>? <strong>Nền Tảng Ng&ocirc;n Ngữ Cơ Bản:</strong> Bắt đầu với cơ bản ng&ocirc;n ngữ v&agrave; ngữ ph&aacute;p cần thiết cho cả bốn kỹ năng: Nghe, Đọc, Viết v&agrave; N&oacute;i. Hướng dẫn chi tiết để bạn dễ d&agrave;ng tiếp cận v&agrave; hiểu r&otilde;.</p>\r\n<p>? <strong>Ph&aacute;t Triển Kỹ Năng Nghe Hiệu Quả:</strong> Học c&aacute;ch nghe v&agrave; hiểu r&otilde; nội dung qua c&aacute;c b&agrave;i nghe đa dạng. Tăng cường từ vựng v&agrave; chiến lược để đối mặt với c&aacute;c th&aacute;ch thức trong phần thi Nghe.</p>\r\n<p>? <strong>Chiến Thắng Phần Đọc Của Bạn:</strong> T&igrave;m hiểu c&aacute;ch đọc hiệu quả v&agrave; n&acirc;ng cao khả năng t&igrave;m kiếm th&ocirc;ng tin. Ph&aacute;t triển chiến lược đọc nhanh v&agrave; hiểu b&agrave;i đọc đa dạng.</p>\r\n<p>? <strong>Viết Essay Đạt Điểm Cao:</strong> Hướng dẫn chi tiết về c&aacute;ch viết essay c&oacute; cấu tr&uacute;c v&agrave; logic, từ lựa chọn &yacute; tưởng đến c&aacute;ch triển khai &yacute; v&agrave; sử dụng từ vựng một c&aacute;ch linh hoạt.</p>\r\n<p>?️ <strong>N&oacute;i Một C&aacute;ch Tự Tin:</strong> Phương ph&aacute;p huấn luyện n&oacute;i, từ c&aacute;ch ph&aacute;t &acirc;m đến c&aacute;ch x&acirc;y dựng c&acirc;u chuyện. Học c&aacute;ch n&oacute;i một c&aacute;ch tự tin v&agrave; s&aacute;ng tạo trong phần thi N&oacute;i.</p>\r\n<p>? <strong>Chia Sẻ Kinh Nghiệm v&agrave; Phản Hồi:</strong> Kết nối với cộng đồng học vi&ecirc;n, chia sẻ kinh nghiệm v&agrave; nhận phản hồi từ gi&aacute;o vi&ecirc;n v&agrave; đồng học để n&acirc;ng cao khả năng của bạn.</p>\r\n<p>? <strong>Bước Đi Tự Tin Tới Kỳ Thi IELTS:</strong> Với sự hỗ trợ từ gi&aacute;o vi&ecirc;n v&agrave; t&agrave;i liệu chất lượng, bạn sẽ sẵn s&agrave;ng đối mặt với kỳ thi IELTS v&agrave; hướng tới mục ti&ecirc;u điểm 6.5.</p>\r\n<p>? <strong>Đăng K&yacute; Ngay Để Bắt Đầu H&agrave;nh Tr&igrave;nh IELTS Của Bạn!</strong> ?</p>',3,0,'khoa-hoc-ielts--tu-0-đen-6.5-cho-nguoi-moi-bat-đau'),(60,'Khóa học dạy nấu ăn và chăm sóc sức khỏe gia đình',12,3,1,1,2500000,2000000,'<p>? <strong>Kh&oacute;a Học Dạy Nấu Ăn v&agrave; Chăm S&oacute;c Sức Khỏe Gia Đ&igrave;nh: Học Nấu Ăn Ngon, Dinh Dưỡng v&agrave; Quản l&yacute; Sức Khỏe Một C&aacute;ch Chuy&ecirc;n Nghiệp!</strong> ?</p>\r\n<p>Kh&aacute;m ph&aacute; cuộc phi&ecirc;u lưu ẩm thực v&agrave; chăm s&oacute;c sức khỏe gia đ&igrave;nh với kh&oacute;a học n&agrave;y. Từ những b&iacute; quyết nấu ăn ngon miệng đến chiến lược quản l&yacute; sức khỏe, bạn sẽ được hướng dẫn để tạo ra một m&ocirc;i trường gia đ&igrave;nh khỏe mạnh v&agrave; hạnh ph&uacute;c.</p>\r\n<p>? <strong>Nấu Ăn Đa Dạng v&agrave; S&aacute;ng Tạo:</strong> Học c&aacute;ch nấu ăn từ cơ bản đến n&acirc;ng cao, với c&aacute;c c&ocirc;ng thức độc đ&aacute;o v&agrave; b&iacute; quyết chế biến thực phẩm để tạo ra bữa ăn ngon mắt v&agrave; dinh dưỡng.</p>\r\n<p>? <strong>Dinh Dưỡng Gia Đ&igrave;nh Đầy Đủ:</strong> T&igrave;m hiểu về dinh dưỡng v&agrave; c&aacute;ch tạo ra c&aacute;c bữa ăn c&acirc;n đối cho cả gia đ&igrave;nh. Bạn sẽ được hướng dẫn về việc lựa chọn nguy&ecirc;n liệu, chuẩn bị thực phẩm, v&agrave; kiểm so&aacute;t khẩu phần.</p>\r\n<p>?️ <strong>Chăm S&oacute;c Sức Khỏe Gia Đ&igrave;nh:</strong> Kh&aacute;m ph&aacute; c&aacute;ch t&iacute;ch hợp hoạt động thể chất v&agrave;o lịch tr&igrave;nh gia đ&igrave;nh. Học c&aacute;ch quản l&yacute; stress v&agrave; tạo ra m&ocirc;i trường sống t&iacute;ch cực cho t&igrave;nh thần v&agrave; t&acirc;m hồn.</p>\r\n<p>?&zwj;?&zwj;?&zwj;? <strong>Tạo Cộng Đồng Sức Khỏe Gia Đ&igrave;nh:</strong> Tham gia v&agrave;o cộng đồng học vi&ecirc;n, chia sẻ kinh nghiệm v&agrave; học hỏi từ những người đồng h&agrave;nh. X&acirc;y dựng mạng lưới hỗ trợ để hỗ trợ v&agrave; tạo ra một cộng đồng sức khỏe gia đ&igrave;nh mạnh mẽ.</p>\r\n<p>? <strong>Ẩm Thực Gia Đ&igrave;nh Thế Kỷ 21:</strong> Học c&aacute;ch tận dụng c&ocirc;ng nghệ để quản l&yacute; thời gian, mua sắm thực phẩm th&ocirc;ng minh v&agrave; sử dụng ứng dụng hữu &iacute;ch để theo d&otilde;i sức khỏe gia đ&igrave;nh.</p>\r\n<p>? <strong>Bước Đầu Cho Cuộc H&agrave;nh Tr&igrave;nh Sức Khỏe Gia Đ&igrave;nh:</strong> Với sự hỗ trợ từ gi&aacute;o vi&ecirc;n v&agrave; chuy&ecirc;n gia dinh dưỡng, bạn sẽ c&oacute; được kiến thức v&agrave; kỹ năng cần thiết để tạo ra một gia đ&igrave;nh khỏe mạnh v&agrave; hạnh ph&uacute;c.</p>\r\n<p>? <strong>Đăng K&yacute; Ngay Để Bắt Đầu H&agrave;nh Tr&igrave;nh Ẩm Thực v&agrave; Sức Khỏe Gia Đ&igrave;nh Của Bạn!</strong> ?️</p>',2,0,'khoa-hoc-day-nau-an-va-cham-soc-suc-khoe-gia-đinh'),(61,'Khóa học office (Excel - Word - Power Point)',6,3,1,1,2000000,1700000,'<p>?️ <strong>Kh&oacute;a Học Office (Excel - Word - PowerPoint): Chinh Phục Nghệ Thuật Văn Ph&ograve;ng v&agrave; N&acirc;ng Cao Hiệu Suất C&ocirc;ng Việc!</strong> ?</p>\r\n<p>Kh&aacute;m ph&aacute; b&iacute; quyết sử dụng Microsoft Office một c&aacute;ch chuy&ecirc;n nghiệp v&agrave; hiệu quả với kh&oacute;a học n&agrave;y. Từ Excel cho đến Word v&agrave; PowerPoint, bạn sẽ được hướng dẫn chi tiết để nắm vững c&aacute;c kỹ năng cần thiết trong c&ocirc;ng việc văn ph&ograve;ng.</p>\r\n<p>? <strong>Excel - Nền Tảng Quản L&yacute; Dữ Liệu:</strong> Học c&aacute;ch sử dụng Excel để tổ chức, ph&acirc;n t&iacute;ch dữ liệu v&agrave; x&acirc;y dựng bảng t&iacute;nh th&ocirc;ng minh. T&igrave;m hiểu về c&aacute;c c&ocirc;ng cụ v&agrave; h&agrave;m cơ bản đến n&acirc;ng cao để l&agrave;m việc một c&aacute;ch hiệu quả.</p>\r\n<p>? <strong>Word - S&aacute;ng Tạo T&agrave;i Liệu Chuy&ecirc;n Nghiệp:</strong> Kh&aacute;m ph&aacute; b&iacute; quyết tạo ra văn bản chuy&ecirc;n nghiệp với Word. Học c&aacute;ch sắp xếp v&agrave; định dạng văn bản, sử dụng c&aacute;c t&iacute;nh năng linh hoạt để tạo ra t&agrave;i liệu đa dạng v&agrave; chất lượng cao.</p>\r\n<p>?️ <strong>PowerPoint - Tạo Ra B&agrave;i Tr&igrave;nh B&agrave;y Ấn Tượng:</strong> Dấn th&acirc;n v&agrave;o thế giới thiết kế slide với PowerPoint. Học c&aacute;ch tr&igrave;nh b&agrave;y th&ocirc;ng tin một c&aacute;ch s&aacute;ng tạo v&agrave; thuyết phục, sử dụng hiệu ứng v&agrave; đồ họa để l&agrave;m nổi bật b&agrave;i thuyết tr&igrave;nh của bạn.</p>\r\n<p>? <strong>Chia Sẻ Kiến Thức v&agrave; Mối Quan Hệ Chuy&ecirc;n Nghiệp:</strong> Kết nối với cộng đồng học vi&ecirc;n, chia sẻ mẹo v&agrave; kinh nghiệm với những người đồng h&agrave;nh. Học hỏi từ những người giỏi Office để n&acirc;ng cao kỹ năng của bạn.</p>\r\n<p>? <strong>N&acirc;ng Cao Hiệu Suất C&ocirc;ng Việc Văn Ph&ograve;ng:</strong> Với sự trợ gi&uacute;p từ gi&aacute;o vi&ecirc;n c&oacute; kinh nghiệm, bạn sẽ trở th&agrave;nh chuy&ecirc;n gia về Microsoft Office v&agrave; c&oacute; thể &aacute;p dụng ngay kỹ năng mới v&agrave;o c&ocirc;ng việc h&agrave;ng ng&agrave;y.</p>\r\n<p>? <strong>Đăng K&yacute; Ngay Để Trở Th&agrave;nh Chuy&ecirc;n Gia Văn Ph&ograve;ng!</strong> ?</p>',1,0,'khoa-hoc-office-(excel---word---power-point)'),(62,'Khóa học phong cách sống tối ưu',4,1,1,1,1000000,600000,'<p>? <strong>Kh&oacute;a Học \"Phong C&aacute;ch Sống Tối Ưu\": Học C&aacute;ch Tạo Ra Cuộc Sống Đầy &Yacute; Nghĩa v&agrave; Hạnh Ph&uacute;c!</strong> ?</p>\r\n<p>Kh&aacute;m ph&aacute; v&agrave; chinh phục nghệ thuật sống một c&aacute;ch chất lượng v&agrave; tối ưu với kh&oacute;a học n&agrave;y. Từ quản l&yacute; thời gian đến ph&aacute;t triển t&acirc;m hồn, bạn sẽ được hướng dẫn để x&acirc;y dựng phong c&aacute;ch sống mang lại sự c&acirc;n bằng v&agrave; niềm vui.</p>\r\n<p>?️ <strong>Quản L&yacute; Thời Gian Hiệu Quả:</strong> Học c&aacute;ch ưu ti&ecirc;n c&ocirc;ng việc v&agrave; giải quyết stress th&ocirc;ng qua kỹ thuật quản l&yacute; thời gian, gi&uacute;p bạn c&oacute; thời gian cho cả c&ocirc;ng việc v&agrave; giải tr&iacute;.</p>\r\n<p>? <strong>Ph&aacute;t Triển T&acirc;m Hồn v&agrave; Tinh Thần:</strong> Kh&aacute;m ph&aacute; c&aacute;c kỹ thuật thiền v&agrave; tập trung để gi&uacute;p bạn duy tr&igrave; trạng th&aacute;i t&acirc;m l&yacute; t&iacute;ch cực v&agrave; l&agrave;nh mạnh. Học c&aacute;ch x&acirc;y dựng t&acirc;m hồn mạnh mẽ trong cuộc sống hối hả.</p>\r\n<p>? <strong>Chăm S&oacute;c Sức Khỏe To&agrave;n Diện:</strong> T&igrave;m hiểu c&aacute;ch duy tr&igrave; một lối sống l&agrave;nh mạnh từ chế độ ăn uống c&acirc;n đối đến việc thực hiện b&agrave;i tập thể dục đ&uacute;ng c&aacute;ch. X&acirc;y dựng th&oacute;i quen để bảo vệ sức khỏe của bạn.</p>\r\n<p>? <strong>Tạo N&ecirc;n M&ocirc;i Trường Sống H&agrave;i H&ograve;a:</strong> Hướng dẫn c&aacute;ch tạo ra một kh&ocirc;ng gian sống sạch sẽ, thoải m&aacute;i v&agrave; đầy &yacute; nghĩa. Kh&aacute;m ph&aacute; nghệ thuật của việc sắp xếp v&agrave; tối giản h&oacute;a cuộc sống.</p>\r\n<p>? <strong>X&acirc;y Dựng Mối Quan Hệ X&atilde; Hội v&agrave; Gia Đ&igrave;nh:</strong> Chia sẻ c&aacute;ch tạo ra mối quan hệ ch&acirc;n th&agrave;nh v&agrave; &yacute; nghĩa, cả trong gia đ&igrave;nh v&agrave; x&atilde; hội. Học c&aacute;ch giữ g&igrave;n v&agrave; ph&aacute;t triển mối quan hệ một c&aacute;ch t&iacute;ch cực.</p>\r\n<p>? <strong>Ph&aacute;t triển Sự Nghiệp v&agrave; Năng Lực C&aacute; Nh&acirc;n:</strong> Học c&aacute;ch đặt mục ti&ecirc;u v&agrave; ph&aacute;t triển kỹ năng c&aacute; nh&acirc;n để đạt được sự th&agrave;nh c&ocirc;ng trong sự nghiệp v&agrave; cuộc sống.</p>\r\n<p>? <strong>Bước Đi Tới Phong C&aacute;ch Sống Tối Ưu:</strong> Với sự hỗ trợ từ gi&aacute;o vi&ecirc;n v&agrave; chuy&ecirc;n gia, bạn sẽ c&oacute; cơ hội tối ưu h&oacute;a cuộc sống của m&igrave;nh v&agrave; tạo ra một phong c&aacute;ch sống mang lại sự hạnh ph&uacute;c v&agrave; &yacute; nghĩa. ?</p>',3,0,'khoa-hoc-phong-cach-song-toi-uu'),(63,'Khóa học nghệ thuật bán hàng hiệu quả',3,1,1,1,2100000,1900000,'<p>? <strong>Kh&oacute;a Học \"Nghệ Thuật B&aacute;n H&agrave;ng Hiệu Quả\": Chinh Phục Thị Trường v&agrave; X&acirc;y Dựng Sự Nghiệp B&aacute;n H&agrave;ng Th&agrave;nh C&ocirc;ng!</strong> ?</p>\r\n<p>Kh&aacute;m ph&aacute; b&iacute; quyết v&agrave; chiến lược trong lĩnh vực b&aacute;n h&agrave;ng với kh&oacute;a học n&agrave;y, nơi bạn sẽ được hướng dẫn từ những kỹ năng cơ bản đến những chiến lược n&acirc;ng cao, gi&uacute;p bạn trở th&agrave;nh một chuy&ecirc;n gia b&aacute;n h&agrave;ng đ&aacute;ng ch&uacute; &yacute;.</p>\r\n<p>? <strong>Hiểu R&otilde; Kh&aacute;ch H&agrave;ng v&agrave; Nhu Cầu Thị Trường:</strong> Học c&aacute;ch ph&acirc;n t&iacute;ch thị trường, nắm bắt nhu cầu của kh&aacute;ch h&agrave;ng v&agrave; x&acirc;y dựng chiến lược b&aacute;n h&agrave;ng ph&ugrave; hợp với đối tượng mục ti&ecirc;u.</p>\r\n<p>? <strong>Kỹ Năng Giao Tiếp v&agrave; Thuyết Phục:</strong> Ph&aacute;t triển kỹ năng giao tiếp mạnh mẽ v&agrave; khả năng thuyết phục để tạo ra ấn tượng t&iacute;ch cực v&agrave; tăng cường khả năng b&aacute;n h&agrave;ng.</p>\r\n<p>? <strong>Quản L&yacute; Quan Hệ Kh&aacute;ch H&agrave;ng (CRM):</strong> T&igrave;m hiểu c&aacute;ch sử dụng c&aacute;c hệ thống CRM để quản l&yacute; th&ocirc;ng tin kh&aacute;ch h&agrave;ng, x&acirc;y dựng mối quan hệ v&agrave; tăng cường trải nghiệm mua sắm.</p>\r\n<p>? <strong>B&aacute;n H&agrave;ng Trực Tuyến v&agrave; Quảng C&aacute;o Số:</strong> Kh&aacute;m ph&aacute; c&aacute;ch kinh doanh trực tuyến v&agrave; sử dụng c&aacute;c chiến lược quảng c&aacute;o số để tiếp cận đối tượng mục ti&ecirc;u hiệu quả.</p>\r\n<p>? <strong>X&acirc;y Dựng Mối Quan Hệ B&aacute;n H&agrave;ng Bền Vững:</strong> Học c&aacute;ch x&acirc;y dựng mối quan hệ l&acirc;u d&agrave;i với kh&aacute;ch h&agrave;ng v&agrave; đối t&aacute;c. T&igrave;m hiểu c&aacute;ch duy tr&igrave; v&agrave; ph&aacute;t triển danh tiếng t&iacute;ch cực trong ng&agrave;nh.</p>\r\n<p>? <strong>Chiến Lược B&aacute;n H&agrave;ng v&agrave; Đ&agrave;m Ph&aacute;n Hiệu Quả:</strong> Ph&acirc;n t&iacute;ch chiến lược b&aacute;n h&agrave;ng, từ x&aacute;c định gi&aacute; đến đ&agrave;m ph&aacute;n. Học c&aacute;ch đối mặt v&agrave; giải quyết th&aacute;ch thức trong qu&aacute; tr&igrave;nh b&aacute;n h&agrave;ng.</p>\r\n<p>? <strong>Bước Đi Tới Sự Nghiệp B&aacute;n H&agrave;ng Th&agrave;nh C&ocirc;ng:</strong> Với sự hỗ trợ từ gi&aacute;o vi&ecirc;n v&agrave; chuy&ecirc;n gia c&oacute; kinh nghiệm, bạn sẽ trang bị những kỹ năng v&agrave; chiến lược cần thiết để đạt được sự th&agrave;nh c&ocirc;ng trong lĩnh vực b&aacute;n h&agrave;ng. ?</p>',2,0,'khoa-hoc-nghe-thuat-ban-hang-hieu-qua'),(64,'Khoá học lập trình sdjkfhjksh wsiodufa',1,1,1,1,1500000,1200000,'<p>sdfsdfsdfsdf</p>',1,1,'khoa-hoc-lap-trinh-sdjkfhjksh-wsiodufa');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_loves`
--

DROP TABLE IF EXISTS `courses_loves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_loves` (
  `course_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`course_id`,`user_id`),
  KEY `fk_courses_has_users_users1_idx` (`user_id`),
  KEY `fk_courses_has_users_courses1_idx` (`course_id`),
  CONSTRAINT `fk_courses_has_users_courses1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `fk_courses_has_users_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_loves`
--

LOCK TABLES `courses_loves` WRITE;
/*!40000 ALTER TABLE `courses_loves` DISABLE KEYS */;
INSERT INTO `courses_loves` VALUES (4,71),(5,71);
/*!40000 ALTER TABLE `courses_loves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `special_news` tinyint NOT NULL,
  `content` text,
  `img_url` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (5,'Chuyện đi chơi','Trần Thắng Lợi','2024-01-24 21:31:11',1,'<p>sdfsdfsdfsdf</p>','/static/imgs/news/6f028151-df41-4862-9295-632f9ba47d36.png','chuyen-đi-choi');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reset_passwords`
--

DROP TABLE IF EXISTS `reset_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reset_passwords` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `remember_token` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reset_passwords_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reset_passwords`
--

LOCK TABLES `reset_passwords` WRITE;
/*!40000 ALTER TABLE `reset_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `reset_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rate_amount` int NOT NULL DEFAULT '5',
  `content` text NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,5,'Đây là một trang web hữu ích cho những bạn nào muốn mua khoá học online chất lượng',71,'2024-01-24 17:12:56'),(9,4,'Đây là một trang web tuyệt vời dành cho những người vừa học vừa làm, nếu số lượng giảng viên và khoá học đa dạng hơn chắc chắn sẽ được 5 sao',76,'2024-01-24 19:44:14'),(14,5,'Thật sự rất ổn',77,'2024-01-24 22:34:08');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Lê Phi Hùng','/static/imgs/teachers/75646f84-24ce-4a0c-830a-ea394aaef6c8.png',10),(2,'Huỳnh Ngọc Thanh','/static/imgs/teachers/teacher_1.webp',1),(3,'Nguyễn Quang Duy','/static/imgs/teachers/5ebaf953-d8d1-4898-8acd-2e6b5c941fba.jpg',5),(4,'Hannah Phạm','/static/imgs/teachers/85d3555f-b7e4-4f06-93a2-329db40782db.jpg',10);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thumbnails`
--

DROP TABLE IF EXISTS `thumbnails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thumbnails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_thumbnails_courses1_idx` (`course_id`),
  CONSTRAINT `fk_thumbnails_courses1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=760 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thumbnails`
--

LOCK TABLES `thumbnails` WRITE;
/*!40000 ALTER TABLE `thumbnails` DISABLE KEYS */;
INSERT INTO `thumbnails` VALUES (576,'/static/imgs/courses/3bf6ad12-0581-49cc-b774-58fa10bfae60.jpg',50),(577,'/static/imgs/courses/4fad90f9-b5c3-4653-8c8a-203316ecb77d.jpg',49),(603,'/static/imgs/courses/dc1d18f6-5a5c-4b0c-b4a3-5dba526a0533.jpg',1),(604,'/static/imgs/courses/d9eb2153-e765-49db-9955-21addf5ee690.jpg',1),(605,'/static/imgs/courses/62cc24a4-85e8-483e-9da6-d9d0f67fd10a.jpg',1),(606,'/static/imgs/courses/d5d283cf-bfbd-43af-992d-f1e78beea1e3.jpg',1),(607,'/static/imgs/courses/4e71044b-5957-45ad-ab7c-701999985650.webp',1),(608,'/static/imgs/courses/235b6846-075c-4f82-a93a-c360f3c5c241.jpg',48),(609,'/static/imgs/courses/3a9778f2-ca69-4ae0-8802-ec294269bf32.jpg',48),(610,'/static/imgs/courses/460b5527-e5c4-4bf0-82a9-fc85defa1c41.jpg',48),(611,'/static/imgs/courses/4c3d8647-b94f-47f2-8b15-ffd2b9592cc1.jpg',48),(612,'/static/imgs/courses/7ff56d45-a007-4566-ac7e-9a037376229a.png',52),(613,'/static/imgs/courses/61524e05-3fe3-4e94-8e16-2aad0fb8110b.jpg',52),(614,'/static/imgs/courses/ef199b6e-5009-4ba9-95a9-e31434188c18.jpg',52),(615,'/static/imgs/courses/8f2d9a80-f02b-4555-b4c6-b0d1f436820b.jpg',52),(620,'/static/imgs/courses/9e4746dc-bcd0-490c-bc76-a647533c5d34.jpg',51),(621,'/static/imgs/courses/c0107b13-c611-445f-8dec-8aea490dfb27.jpg',51),(622,'/static/imgs/courses/faa330b8-3cda-4a3d-bfcc-d578b68d2a51.jpg',51),(623,'/static/imgs/courses/f22a6020-7c3d-4176-ac24-1281f5199dce.jpg',51),(626,'/static/imgs/courses/b878ffbc-2580-4387-8c5a-448f319f373e.jpg',53),(627,'/static/imgs/courses/a83dce88-2207-44ec-b91e-97e4800b7e25.jpg',53),(628,'/static/imgs/courses/56c5307f-ec7c-40b8-81ea-6c6729ec05a7.jpg',53),(629,'/static/imgs/courses/a6e5e5da-2b51-4f3c-ade1-43a6e5e042bb.jpg',53),(630,'/static/imgs/courses/20f60381-f7a0-4949-b751-aec4a02ef7f5.jpg',54),(631,'/static/imgs/courses/69cfbef1-7c1e-44ec-96f8-75295b35212c.jpg',54),(632,'/static/imgs/courses/d66f50a8-e044-476b-8165-71a29db27051.jpg',54),(633,'/static/imgs/courses/5feec346-5974-454b-b229-17cd6338d69b.jpg',54),(634,'/static/imgs/courses/dc24b37f-394a-4fee-b3f7-d998b5e39df9.png',54),(688,'/static/imgs/courses/9240d419-c249-420a-a599-7ac3dcdb00b5.jpg',55),(689,'/static/imgs/courses/154b7b26-5db8-4d07-a877-14c6b19d613f.jpg',55),(690,'/static/imgs/courses/17cc67e8-25c3-4da5-a151-31131943c333.jpg',55),(691,'/static/imgs/courses/4e670752-b81e-461a-bb58-8ac6c8eb856a.jpg',55),(692,'/static/imgs/courses/653a2093-fb3a-4539-92f2-c2aaaa61d99f.jpg',56),(693,'/static/imgs/courses/9894c58b-6bc4-4f02-b5dc-cb7fa148dd3d.jpg',56),(694,'/static/imgs/courses/26da4c2c-9cc4-49b7-9a29-c27d69b50761.jpg',56),(695,'/static/imgs/courses/5e61d46e-9c76-4d93-89c8-0c63d5769731.jpg',56),(696,'/static/imgs/courses/3c194571-490d-4822-a4df-ee1e517945d3.jpg',57),(697,'/static/imgs/courses/79716a41-f9cb-486e-ac8f-1347b3deaf41.jpg',57),(698,'/static/imgs/courses/77448889-d20b-47bb-b8da-494d5c95434a.jpg',57),(699,'/static/imgs/courses/9ca8142c-813f-4ef3-8ff0-7184ec457e1c.jpg',57),(700,'/static/imgs/courses/1a13862e-f14f-42fd-8542-01e919893758.jpg',58),(701,'/static/imgs/courses/db4f1c2e-a279-4cef-83f5-ce47ed55fd9b.jpg',58),(702,'/static/imgs/courses/47187ceb-561e-4b77-8952-20bd4c0c174e.jpg',58),(703,'/static/imgs/courses/3f019af7-14e7-48a3-876b-2685fc4e509e.jpg',58),(704,'/static/imgs/courses/732ecefe-1296-48ed-843b-155926f5c763.jpg',58),(705,'/static/imgs/courses/6f028151-df41-4862-9295-632f9ba47d36.png',59),(706,'/static/imgs/courses/86c09881-5262-49a4-b967-2bf174253ce9.jpg',59),(707,'/static/imgs/courses/febb80ad-0ac7-4554-863c-eb2c4dcab801.png',59),(708,'/static/imgs/courses/5988d13e-60bf-495f-8cd7-63c437443421.png',59),(709,'/static/imgs/courses/cf568a84-d921-4d5b-98ed-eaf7bdda7ad4.jpg',59),(710,'/static/imgs/courses/d7ec8800-0732-4ea2-b29f-a750e50e3b53.jpg',60),(711,'/static/imgs/courses/08f70a2c-f0de-419e-b078-3921da536c93.jpg',60),(712,'/static/imgs/courses/c6b4695e-6c89-4189-ae7d-0f7f07b177ec.jpg',60),(713,'/static/imgs/courses/c9ae94b5-2923-4686-83e2-6562f6ecb7c4.jpg',60),(714,'/static/imgs/courses/c60e6261-5810-4397-b015-da7bdf0edd5c.jpg',61),(715,'/static/imgs/courses/f11e7907-a181-46ae-90c7-6707e73a5be3.jpg',61),(716,'/static/imgs/courses/e2cfbbab-f965-4195-b5e7-020c96640029.jpg',61),(717,'/static/imgs/courses/d278381c-50f2-4d63-a536-2909c67c2951.jpg',61),(718,'/static/imgs/courses/be9645fd-db99-4082-ab48-0bbe4a912ae4.jpg',62),(719,'/static/imgs/courses/d1341269-7abe-4dac-8be2-5a0d1d84766b.jpg',62),(720,'/static/imgs/courses/7224cf2d-be5e-41ad-9ea9-c26edb562600.jpg',62),(721,'/static/imgs/courses/fd48e003-11f3-4035-b7df-33860a134f10.jpg',62),(722,'/static/imgs/courses/f8dc5c26-aaf6-4954-83e3-55318b2ea252.jpg',63),(723,'/static/imgs/courses/5a609f84-5048-44f5-8898-7da67cbd1ed3.jpg',63),(724,'/static/imgs/courses/80ba860b-1447-457f-b491-b365bf7e7bbd.jpg',63),(725,'/static/imgs/courses/bc1d9dec-3430-4c44-8818-d5e0e6fbb83d.jpg',63),(726,'/static/imgs/courses/b5ec2296-8891-42c0-b6ee-3631ff51b713.png',64),(727,'/static/imgs/courses/1dd054c4-3114-4825-ae32-6fef972bdf91.png',64),(728,'/static/imgs/courses/cd3a7c62-1f19-4a6b-b852-0731f13bf0ac.png',64),(729,'/static/imgs/courses/607a18c6-ba4f-4204-a4e6-32e7fc4da6c5.png',64),(730,'/static/imgs/courses/f0a387c4-ab35-48e7-97df-92c610634dc0.png',64),(741,'/static/imgs/courses/fbc9ce31-6837-4daf-94d8-67eae772542d.webp',2),(744,'/static/imgs/courses/c497fb39-2b18-46dd-b6b9-989e1fa88c00.jpg',47),(745,'/static/imgs/courses/ea349f3d-ae6f-4781-a206-d25ef30b79b6.jpg',47),(746,'/static/imgs/courses/8dca3ac4-db1f-469b-a1c3-ee8ad04e5296.jpg',47),(747,'/static/imgs/courses/6bbea6b1-e3d7-4348-b3d9-3b2cbd46c8c1.jpg',47),(748,'/static/imgs/courses/e441f270-ff5a-4569-ae9c-16c501dc47f2.jpg',47),(753,'/static/imgs/courses/bfea5874-c0df-44f9-bcd3-16ccc775dd43.jpg',5),(754,'/static/imgs/courses/baea5e43-3dbf-46aa-a966-2fa21280a2cf.jpg',5),(755,'/static/imgs/courses/54c90a6d-048f-45d7-8da6-a1df7493e82d.png',4),(756,'/static/imgs/courses/f79d50e0-9b0b-4ee9-a007-d43142551cea.jpg',4),(757,'/static/imgs/courses/0ccca4a7-5acf-4854-8955-63890214918a.png',6),(759,'/static/imgs/courses/34672808-e2a3-49a2-b9cd-69c65531a674.webp',3);
/*!40000 ALTER TABLE `thumbnails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` char(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `login_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'normal',
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email_verified` tinyint NOT NULL DEFAULT '0',
  `role` char(10) NOT NULL DEFAULT 'USER',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (71,'thangloitran406@gmail.com','21ef487d28f42cafb042c7238aeffdeda10097fc99af808d248ddd306b1066e6',NULL,NULL,'Trần','Thắng Lợi','0879603547','normal',NULL,1,'ADMIN'),(72,'thangloitran406@gmail.com',NULL,NULL,NULL,'Trần','Thắng Lợi',NULL,'google','https://lh3.googleusercontent.com/a/ACg8ocLm9Btb9ZOrs-Ol2B2ZUtH7JaTLlaNMPLbIGQhVJJNeqw=s96-c',1,'USER'),(75,'hoanghaivan456@gmail.com','21ef487d28f42cafb042c7238aeffdeda10097fc99af808d248ddd306b1066e6',NULL,NULL,'Hoàng','Hải Vân','0772973324','normal',NULL,1,'USER'),(76,'21130263@st.hcmuaf.edu.vn','21ef487d28f42cafb042c7238aeffdeda10097fc99af808d248ddd306b1066e6',NULL,NULL,'Sinh Viên','Nông Lâm','0382910483','normal',NULL,1,'USER'),(77,'thangloitran0908@gmail.com',NULL,NULL,NULL,'Thang Loi','Tran',NULL,'facebook','https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.30497-1/84628273_176159830277856_972693363922829312_n.jpg?stp=c15.0.50.50a_cp0_dst-jpg_p50x50',1,'USER');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_emails`
--

DROP TABLE IF EXISTS `verify_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verify_emails` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `user_id` int NOT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `expires` int NOT NULL DEFAULT '180',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `verify_emails_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_emails`
--

LOCK TABLES `verify_emails` WRITE;
/*!40000 ALTER TABLE `verify_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_emails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-24 23:04:59
