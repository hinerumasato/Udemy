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
  `description` text,
  PRIMARY KEY (`id`),
  KEY `fk_courses_categories_idx` (`category_id`),
  KEY `fk_courses_levels1_idx` (`level_id`),
  CONSTRAINT `fk_courses_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_courses_levels1` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Hướng dẫn sử dụng Illutrator cho người mới bắt đầu',7,1,1,0,1200000,700000,NULL),(2,'Học Adobe Illustrator từ cơ bản đến nâng cao',8,2,1,0,1200000,600000,NULL),(3,'Khóa học Digital Paiting cơ bản cho người mới bắt đầu',4,3,1,0,2000000,1200000,NULL),(4,'Tiếng Nhật cơ bản',1,3,1,1,3000000,2400000,NULL),(5,'Tiếng Nhật nâng cao',1,2,1,1,6000000,5500000,NULL),(6,'Khoá học TOEIC 450 điểm dành cho người mới bắt đầu',1,1,1,0,600000,300000,NULL),(34,'Khóa học Lightroom - Blend màu và Retouch - Histogram là gì?',8,3,1,1,600000,300000,'<div class=\"container\">\r\n<div class=\"sec_tab\">\r\n<div class=\"rte product_getcontent\">\r\n<p>Lightroom l&agrave; phần mềm xử l&yacute; ảnh cực kỳ mạnh mẽ v&agrave; l&agrave; người anh em với phần mềm Adobe Photoshop, khả năng của Lightroom bao gồm những thế mạnh m&agrave; Photoshop kh&ocirc;ng c&oacute;, như: Quản l&yacute; h&igrave;nh ảnh, chỉnh ảnh nhanh bằng c&aacute;c thanh trượt v&agrave; đặc biệt l&agrave; c&aacute;ch n&oacute; hoạt động với m&agrave;u sắc l&agrave; trực quan hơn photoshop rất nhiều.</p>\r\n<p>Trong kh&oacute;a học n&agrave;y, ngo&agrave;i việc giới thiệu c&ocirc;ng cụ của Lightroom, m&igrave;nh chia sẻ rất nhiều cho anh em về kinh nghiệm, tư duy v&agrave; giải th&iacute;ch c&aacute;ch thức m&agrave; m&agrave;u sắc hoạt động. Nhằm gi&uacute;p anh em c&oacute; thể dễ d&agrave;ng thao t&aacute;c, tự th&acirc;n chỉnh sửa v&agrave; tự th&acirc;n s&aacute;ng tạo ra m&agrave;u sắc, blend m&agrave;u sao cho c&oacute; đủ đ&iacute;ch v&agrave; đạt hiệu quả cao nhất c&oacute; thể.</p>\r\n<p><strong>Nội dung&nbsp;kh&oacute;a học:</strong></p>\r\n<ul>\r\n<li>Giới thiệu tổng quan</li>\r\n<li>Hệ m&agrave;u RGB v&agrave; c&aacute;ch thức m&agrave;u sắc hoạt động</li>\r\n<li>Trọn vẹn th&ocirc;ng tin về Histogram v&agrave; c&aacute;ch ứng dụng</li>\r\n<li>Quản l&yacute; h&igrave;nh ảnh khoa học v&agrave; gọn g&agrave;ng</li>\r\n<li>C&aacute;c panel &amp; c&ocirc;ng cụ của Lightroom</li>\r\n<li>Sử dụng Lightroom để xử l&yacute; ảnh phong cảnh</li>\r\n<li>Sử dụng Lightroom để xử l&yacute; ảnh ch&acirc;n dung</li>\r\n<li>Blend m&agrave;u trong Lightroom</li>\r\n</ul>\r\n<h3>1, C&oacute; cần thiết phải retouch ảnh kh&ocirc;ng?<br>Một bức ảnh được chụp th&ocirc; c&oacute; thể c&oacute; bố cục tốt, nhưng &aacute;nh s&aacute;ng v&agrave; một v&agrave;i khuyết điểm vẫn khiến bức ảnh thiếu cuốn h&uacute;t, ấn tượng. Do đ&oacute; c&ocirc;ng cuộc retouch l&agrave; rất cần thiết m&agrave; bất k&igrave; nhiếp ảnh gia n&agrave;o cũng n&ecirc;n trang bị kiến thức cơ bản để blend v&agrave; retouch.<br>Đ&ocirc;i khi những bức ảnh tưởng như ho&agrave;n hảo lại mắc phải những lỗi kh&aacute;ch quan: xuất hiện những vật, nh&acirc;n vật kh&ocirc;ng mong muốn trong bức ảnh; bố cục, &aacute;nh s&aacute;ng rất đẹp nhưng da của chủ thể ch&iacute;nh chưa đẹp; độ tương phản chưa chuẩn. Hay những l&uacute;c bạn muốn l&agrave;m bức ảnh độc đ&aacute;o hơn bằng những hiệu ứng đặc biệt để nhấn mạnh trọng t&acirc;m v&agrave;o điều mong muốn, th&igrave; việc retouch sẽ gi&uacute;p &iacute;ch rất nhiều để cho ra t&aacute;c phẩm ưng &yacute; cuối c&ugrave;ng.<br>T&ugrave;y v&agrave;o khả năng, tay nghề của người thợ m&agrave; kết quả sẽ c&oacute; sự kh&aacute;c biệt kh&aacute; r&otilde; r&agrave;ng.</h3>\r\n<p>H&igrave;nh ảnh trước v&agrave; sau khi retouch</p>\r\n<h3>2, Những việc cần l&agrave;m khi retouch l&agrave; g&igrave;?<br>Như đ&atilde; n&oacute;i ở tr&ecirc;n, t&ugrave;y v&agrave;o mục đ&iacute;ch chỉnh sửa m&agrave; người retouch sẽ thực hiện một số c&ocirc;ng việc sau đ&acirc;y:</h3>\r\n<p>Căn chỉnh bố cục, g&oacute;c, khung h&igrave;nh. Crop ảnh, xoay h&igrave;nh sao cho đẹp mắt, dễ nh&igrave;n nhất.<br>Điều chỉnh &aacute;nh s&aacute;ng, độ tương phản, xem ảnh c&oacute; bị thiếu hay thừa s&aacute;ng, ngược nắng hay kh&ocirc;ng<br>Xử l&iacute; m&agrave;u sắc, ch&iacute;nh l&agrave; việc blend m&agrave;u, t&ugrave;y v&agrave;o concept m&agrave; điều chỉnh t&ocirc;ng m&agrave;u ph&ugrave; hợp, n&oacute;ng, lạnh, buồn, vui đều phụ thuộc rất nhiều v&agrave;o giai đoạn n&agrave;y.<br>L&agrave;m chủ thể ch&iacute;nh của bức ảnh thật nổi bật, loại bỏ c&aacute;c chi tiết thừa, l&agrave;m mờ hoặc những c&aacute;ch &ldquo;chế biến&rdquo; kh&aacute;c.<br>Chỉnh sửa da của nh&acirc;n vật, x&oacute;a mụn, l&agrave;m mịn, s&aacute;ng da. Lưu &yacute; cần chỉnh sửa thật tự nhi&ecirc;n chứ đừng để tr&ocirc;ng qu&aacute; &ldquo;lố&rdquo;.<br>Th&ecirc;m, gh&eacute;p hiệu ứng, phụ kiện v&agrave;o ảnh nếu cần thiết.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ddict_btn\" style=\"top: 982.2px; left: 734.8px;\"><img src=\"chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png\"></div>\r\n<div class=\"ddict_btn\" style=\"top: 188px; left: 732.65px;\"><img src=\"chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png\"></div>');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thumbnails`
--

LOCK TABLES `thumbnails` WRITE;
/*!40000 ALTER TABLE `thumbnails` DISABLE KEYS */;
INSERT INTO `thumbnails` VALUES (1,'/static/imgs/courses/course_1.webp',1),(2,'/static/imgs/courses/course_2.webp',2),(3,'/static/imgs/courses/course_3.webp',3),(4,'/static/imgs/courses/course_5.png',4),(5,'/static/imgs/courses/course_6.jepg',5),(6,'/static/imgs/courses/course_7.png',6),(32,'/static/imgs/courses/8.webp',34),(33,'/static/imgs/courses/13212.webp',34),(34,'/static/imgs/courses/312312.webp',34),(35,'/static/imgs/courses/adobe-photoshop-cc-phan-mem-thiet-ke-do-hoa-chinh-sua-3-800x600-621f6f4f-52d5-464c-a517-5ba982b96b89.webp',34),(36,'/static/imgs/courses/background-7bf11e04-e3f7-48fc-b45a-31a858bf020b.webp',34),(37,'/static/imgs/courses/trung-tam-dao-tao-photoshop-online-chat-luong-tai-ha-noi-1.webp',34);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (27,'thangloitran406@gmail.com','$2a$12$j89iqreIGeopfe.K6vITeu1.gUv6Q518/x5pxV2gdJKY3JhcmUmG.',NULL,NULL,'Trần','Thắng Lợi','0879603547','normal',NULL,0),(28,'thangloitran406@gmail.com',NULL,NULL,NULL,'Trần','Thắng Lợi',NULL,'google','https://lh3.googleusercontent.com/a/ACg8ocLm9Btb9ZOrs-Ol2B2ZUtH7JaTLlaNMPLbIGQhVJJNeqw=s96-c',1),(29,'test@gmail.com','$2a$12$IJKwc/jtMKmKo9ceoQqYkOnrlAvcsP554NFh8TmzSkq9fZqDJghUC',NULL,NULL,'Nguyễn','Văn A','0123456789','normal',NULL,0),(30,'thangloitran0908@gmail.com',NULL,NULL,NULL,'Thang Loi','Tran',NULL,'facebook','https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.30497-1/84628273_176159830277856_972693363922829312_n.jpg?stp=c15.0.50.50a_cp0_dst-jpg_p50x50',1),(31,'hoanghaivan456@gmail.com',NULL,NULL,NULL,'Hoàng Hải','Vân',NULL,'google','https://lh3.googleusercontent.com/a/ACg8ocJ3h5AJ2CXm9Kgf3iU6pC0BmhAtCaheTGmCr1Z90wYp=s96-c',1);
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

-- Dump completed on 2023-10-16 23:33:24
