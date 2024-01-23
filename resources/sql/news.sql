-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: udemy
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `created_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `special_news` tinyint NOT NULL,
  `content` text,
  `img_url` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (2,'Kinh nghiệm thiết kế website mà bạn nên biết ít nhất 1 lần trong đời','Nguyễn Ngọc Dũng','27/04/2022',1,'<p><strong>1. Dễ di chuyển, dễ đọc</strong></p>\r\n<p>Một hệ thống di chuyển r&otilde; r&agrave;ng, trực quan gi&uacute;p kh&aacute;ch h&agrave;ng c&oacute; thể t&igrave;m kiếm th&ocirc;ng tin dễ d&agrave;ng nhất v&agrave; h&agrave;i l&ograve;ng nhất. Những li&ecirc;n kết ở đầu trang/ cuối trang sẽ được hiển thị dễ d&agrave;ng v&agrave; gi&uacute;p người d&ugrave;ng c&oacute; c&aacute;i nh&igrave;n bao qu&aacute;t, tiện lợi khi sử dụng. Tỉ lệ li&ecirc;n kết tốt nhất l&agrave;&nbsp; 2-3 chổ c&oacute; li&ecirc;n kết trong một trang.</p>\r\n<p><strong>2. Tạo c&aacute;c khoảng trắng</strong></p>\r\n<p>Một trang web với to&agrave;n chữ l&agrave; chữ sẽ hạn chế v&agrave; l&agrave;m rối mắt người d&ugrave;ng từ đ&oacute; th&ocirc;ng tin m&agrave; bạn muốn truyền đạt đến người d&ugrave;ng cũng bị hạn chế. H&atilde;y tạo ra một số kh&ocirc;ng gian trắng. Việc n&agrave;y sẽ gi&uacute;p cho người d&ugrave;ng đỡ rối mắt&nbsp; giản con mắt v&agrave; l&agrave; một c&ocirc;ng cụ để ph&acirc;n chia nội dung thể hiện những nội dung qua trọng.</p>\r\n<p><strong>3. Hướng đến người d&ugrave;ng</strong><br>Mỗi trang web đều c&oacute; những đối tượng kh&aacute;c nhau, c&aacute; nh&acirc;n ho&aacute; trang ho&aacute; theo nh&oacute;m đối tượng kh&aacute;ch h&agrave;ng ch&iacute;nh l&agrave; c&aacute;ch l&agrave;m cho người d&ugrave;ng thoải m&aacute;i thả th&iacute;ch lướt v&agrave; sử dụng web của bạn.</p>\r\n<p><strong>4.Sắp xếp theo nh&oacute;m</strong></p>\r\n<p>Những nội dung li&ecirc;n nhau n&ecirc;n để gần nhau để bảo đảm sao cho th&ocirc;ng tin được t&igrave;m thấy một c&aacute;ch dễ d&agrave;ng. H&atilde;y đặt những th&ocirc;ng tin quan trọng ngang nhau c&ugrave;ng một trang. N&oacute; sẽ gi&uacute;p nguời d&ugrave;ng theo d&otilde;i th&ocirc;ng tin trực quan hơn, dễ hơn.</p>\r\n<p><strong>5. Nhất qu&aacute;n</strong></p>\r\n<p>Những phần tử giống nhau phải c&oacute; c&ugrave;ng tham số thiết kế như nhau: định dạng, ảnh, m&agrave;u nền, c&aacute;ch bố tr&iacute;&hellip;. Chỉ n&ecirc;n d&ugrave;ng 2-4 kiểu m&agrave;u v&agrave; font cho một trang web.</p>\r\n<p><strong>6. Tin tức nhanh</strong></p>\r\n<p>Mục tin tức nhanh ch&iacute;nh l&agrave; điểm quan trọng thu h&uacute;t sự quay lại thường xuy&ecirc;n của người d&ugrave;ng. N&ecirc;n cập nhật phần n&agrave;y mỗi ng&agrave;y để duy tr&igrave; độ thăm viếng website của bạn.</p>\r\n<p><strong>7. Nhanh, nhỏ</strong></p>\r\n<p>Tốc độ tải nhanh, dung lượng ảnh nhỏ sẽ gi&uacute;p trang web của bạn tải nhanh hơn v&agrave; đ&acirc;y l&agrave; điều tuyệt vời khi bạn kh&ocirc;ng bắt kh&aacute;ch h&agrave;ng phải đợi chờ.</p>\r\n<p><strong>8. Dễ truy nhập</strong></p>\r\n<p>Mỗi người d&ugrave;ng th&igrave; c&oacute; một tr&igrave;nh duyệt kh&aacute;c nhau, một hệ điều h&agrave;nh kh&aacute;c nhau n&ecirc;n h&atilde;y x&acirc;y dựng website của bạn đ&aacute;p ứng được tr&ecirc;n mọi tr&igrave;nh duyệt.</p>\r\n<p><strong>9. Nguy&ecirc;n tắc nhấp 3 lần</strong></p>\r\n<p>Mỗi th&ocirc;ng tin của trang web phải đến với kh&aacute;ch h&agrave;ng kh&ocirc;ng qu&aacute; ba lần nhắp chuột. C&ograve;n với c&aacute;c th&ocirc;ng tin khẩn hay c&aacute;c biểu mẫu dăng k&iacute; th&igrave; chỉ một lần.</p>\r\n<p><strong>10. X&acirc;y dựng sơ đồ site</strong></p>\r\n<p>Khi site qu&aacute; lớn th&igrave; việc t&igrave;m kiếm th&ocirc;ng tin quả l&agrave; rất kh&oacute; khăn. Bạn n&ecirc;n x&acirc;y dựng trang sơ đồ site để c&oacute; thể tới mọi ng&otilde; ng&aacute;ch trong site. Trang n&agrave;y cần g&igrave;? Kh&ocirc;ng cần đẹp m&agrave; cần t&iacute;nh năng động của n&oacute;, n&oacute; phải tải xuống nhanh nhất.</p>','/static/imgs/news/','kinh-nghiem-thiet-ke-website-ma-ban-nen-biet-it-nhat-1-lan-trong-đoi');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-24  0:15:02
