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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
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
  `description` text,
  `teacher_id` int NOT NULL,
  `is_delete` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_courses_categories_idx` (`category_id`),
  KEY `fk_courses_levels1_idx` (`level_id`),
  CONSTRAINT `fk_courses_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_courses_levels1` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Hướng dẫn sử dụng Illutrator cho người mới bắt đầu',7,1,1,0,1200000,700000,NULL,1,0),(2,'Học Adobe Illustrator từ cơ bản đến nâng cao',8,2,1,0,1200000,600000,NULL,1,0),(3,'Khóa học Digital Paiting cơ bản cho người mới bắt đầu',4,3,1,0,2000000,1200000,NULL,1,0),(4,'Tiếng Nhật cơ bản',1,3,1,1,3000000,2400000,NULL,1,0),(5,'Tiếng Nhật nâng cao',1,2,1,1,6000000,5500000,NULL,1,0),(6,'Khoá học TOEIC 450 điểm dành cho người mới bắt đầu',1,1,1,0,600000,300000,NULL,1,0),(47,'Khoá học lập trình web trên Udemy sử dụng Java Servlet',7,2,0,0,700000,400000,'<p>Đ&acirc;y l&agrave; m&ocirc; tả</p>',1,0),(48,'Khóa học nấu ăn Á Âu - Lớp dạy nấu ăn Cơ Bản',12,1,1,1,800000,400000,'<p>Đ&acirc;y l&agrave; m&ocirc; tả</p>',1,0),(49,'Khóa Học Đàn Piano - Dạy Chơi Piano Cho Người Mới Bắt Đầu',4,1,1,1,1300000,900000,'<p>Đ&acirc;y l&agrave; m&ocirc; tả</p>',1,0),(50,'Khoá học lập trình Laravel',7,2,1,1,1500000,1200000,'<p>Đ&acirc;y l&agrave; m&ocirc; tả</p>',1,0);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
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
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
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
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `author` text NOT NULL,
  `created_date` date NOT NULL,
  `special_news` tinyint NOT NULL,
  `content` text NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Kinh nghiệm thiết kế website mà bạn nên biết ít nhất 1 lần trong đời','Nguyễn Ngọc Dũng','2023-12-03',1,'1. Dễ di chuyển, dễ đọc\n\nMột hệ thống di chuyển rõ ràng, trực quan giúp khách hàng có thể tìm kiếm thông tin dễ dàng nhất và hài lòng nhất. Những liên kết ở đầu trang/ cuối trang sẽ được hiển thị dễ dàng và giúp người dùng có cái nhìn bao quát, tiện lợi khi sử dụng. Tỉ lệ liên kết tốt nhất là  2-3 chổ có liên kết trong một trang.\n\n2. Tạo các khoảng trắng\n\nMột trang web với toàn chữ là chữ sẽ hạn chế và làm rối mắt người dùng từ đó thông tin mà bạn muốn truyền đạt đến người dùng cũng bị hạn chế. Hãy tạo ra một số không gian trắng. Việc này sẽ giúp cho người dùng đỡ rối mắt  giản con mắt và là một công cụ để phân chia nội dung thể hiện những nội dung qua trọng.\n\n3. Hướng đến người dùng\nMỗi trang web đều có những đối tượng khác nhau, cá nhân hoá trang hoá theo nhóm đối tượng khách hàng chính là cách làm cho người dùng thoải mái thả thích lướt và sử dụng web của bạn.\n\n4.Sắp xếp theo nhóm\n\nNhững nội dung liên nhau nên để gần nhau để bảo đảm sao cho thông tin được tìm thấy một cách dễ dàng. Hãy đặt những thông tin quan trọng ngang nhau cùng một trang. Nó sẽ giúp nguời dùng theo dõi thông tin trực quan hơn, dễ hơn.\n\n5. Nhất quán\n\nNhững phần tử giống nhau phải có cùng tham số thiết kế như nhau: định dạng, ảnh, màu nền, cách bố trí…. Chỉ nên dùng 2-4 kiểu màu và font cho một trang web.\n\n6. Tin tức nhanh\n\nMục tin tức nhanh chính là điểm quan trọng thu hút sự quay lại thường xuyên của người dùng. Nên cập nhật phần này mỗi ngày để duy trì độ thăm viếng website của bạn.\n\n7. Nhanh, nhỏ\n\nTốc độ tải nhanh, dung lượng ảnh nhỏ sẽ giúp trang web của bạn tải nhanh hơn và đây là điều tuyệt vời khi bạn không bắt khách hàng phải đợi chờ.\n\n8. Dễ truy nhập\n\nMỗi người dùng thì có một trình duyệt khác nhau, một hệ điều hành khác nhau nên hãy xây dựng website của bạn đáp ứng được trên mọi trình duyệt.\n\n9. Nguyên tắc nhấp 3 lần\n\nMỗi thông tin của trang web phải đến với khách hàng không quá ba lần nhắp chuột. Còn với các thông tin khẩn hay các biểu mẫu dăng kí thì chỉ một lần.\n\n10. Xây dựng sơ đồ site\n\nKhi site quá lớn thì việc tìm kiếm thông tin quả là rất khó khăn. Bạn nên xây dựng trang sơ đồ site để có thể tới mọi ngõ ngách trong site. Trang này cần gì? Không cần đẹp mà cần tính năng động của nó, nó phải tải xuống nhanh nhất.',NULL),(2,'Vì sao nên chọn học thiết kế đồ họa','Nguyễn Ngọc Dũng','2023-12-03',1,'Nếu bạn đang cân nhắc, phân vân tìm câu trả lời cho câu hỏi “Liệu mình có nên học thiết kế đồ hoạ không?” thì hôm nay chúng tôi xin chia sẻ với bạn 5 điểm cộng mà bạn nên nói “Nên học thiết kế đồ hoạ”\n\nVì sao nên học thiết kế đồ hoạ?\nNhu cầu xã hội phát triển, số lương các ấn phẩm thiết kế đồ hoạ tăng chóng mặt, nhu cầu tuyển dụng cao ngất ngưởng, mức lương không phải dạng vừa….\n\n1. Tỉ lệ thất nghiệp hầu như là không có.\nCó thể bạn không tin bởi ngoài ngành CNTT được tung hô về độ khát nhân sự trên khắp các mặt báo, phương tiện truyền thông thì thiết kế đồ hoạ cũng đang xếp sau CNTT không là bao. Các dịch vụ, tiếp thị sản phẩm phát triển kéo theo nhu cầu thiết kế các ấn phẩm truyền thông càng nhiều. Sự thành công của sản phẩm/dịch vụ gắn liền với sự trau chuốt trong những ấn phẩm truyền thông. Chính vì điều đó mà các doanh nghiệp luôn luôn tạo ra những đặc ân để thu hút và xây dựng đội ngũ thiết kế của mình lớn mạnh.\n\n2. Thời gian làm việc linh hoạt\nNếu bạn được ấn định 8 tiếng làm việc/ngày và đa số là ngồi bàn giấy văn phòng thì nghề thiết kế đồ hoạ lại khác. Bởi đặc tính yêu cầu về nghệ thuật,cảm hứng nên những nhà thiết kế đồ hoạ không bắt buộc phải luôn có mặt ở văn phòng theo khung giờ cứng nhắc mà họ có thể thoả sức thả trí tưởng tượng của mình trong những không gian khác nhau: nhà, khách sạn, resort, quán cà phê, ngọn núi nào đó,…miễn là họ hoàn thành đúng tiến độ và yêu cầu của khách hàng.\n\n3. Nhiều lựa chọn nghề nghiệp\nCó thể nói ngành thiết kế đồ hoạ là ngành có nhiều lựa chọn nghề nghiệp nhất với bạn có thể làm trong nhiều mảng khác nhau theo sở thích và gu thẩm mỹ của mình như sau:\n\nChuyên viên thiết kế đồ họa\nChuyên viên xử lý ảnh\nChuyên viên thiết kế Web\nChuyên viên thiết kế quảng cáo, truyền thông\n4. Mức lương không hề thấp\nKhông phải nói quá về mức lương của một người làm thiết kế đồ hoạ. Mức lương ra trường đã giao động từ 7-9 triệu/tháng – điều mà không phải ngành nghề nào cũng có được. Ngoài công việc chính họ lại còn có thể nhận thêm nhiều dự án để làm cá nhân/nhóm. Tức là ở mức độ mới ra trường thì một nhân viên thiết kế đồ hoạ đã đi trước rất nhiều bước về thu nhập và cơ hội nghề nghiệp so với các ngành khác.\n\n5. Học phí học thiết kế đồ hoạ lại ở mức tầm trung\nNếu bạn nghĩ chỉ có thể học Đại học/Cao đẳng chuyên ngành Thiết kế đồ hoạ thì bạn mới có thể theo và làm được trong ngành này thì bạn nên bỏ ngay suy nghĩ ấy đi. Bởi, học Cao đẳng/Đại học bạn còn học thêm các môn phụ và việc học tập trung vào chuyên ngành chỉ còn lại tầm phân nửa. Thay vì học Cao đẳng/Đại học thì bạn có thể tiết kiệm thời gian và tiền bạc bằng các khoá học ngắn hạn. Học các khoá học ngắn hạn thì có thể làm việc tại các công ty lớn?\n\nXin trả lời là có. Nhà tuyển dụng cần gì ở bạn?\n\nNăng lực thiết kế – điều mà các trường/trung tâm có thể đào tạo cho bạn theo những cách khác nhau\nThái độ – điều bạn được gia đình, nhà trường, xã hội dạy bảo bao nhiêu năm\nMay mắn – điều này tuỳ thuộc từng cá nhân theo tâm linh và cả tình hình mối quan hệ thực tế.\nTức là việc học chương trình tại các trường không mấy ảnh hưởng đến kết quả bạn đậu/rớt ở một công ty mà nó phụ thuộc vào 3 yếu tố mình kể trên.\n\nVậy tóm lại là tuỳ theo định hướng bản thân/gia đình, tài chính, thời gian mà bạn có thể lựa chọn nhiều chương trình đào tạo khác nhau. Nếu bạn muốn tiết kiệm tiền, thời gian và được giới thiệu việc làm thì học tại trung tâm là lựa chọn phù hợp.',NULL),(3,'Thiết kế Website - nghề hái ra tiền chưa bao giờ hết HOT','Nguyễn Ngọc Dũng','2023-12-03',1,'Ngày nay, Thiết kế website ngày càng đóng vai trò quan trọng, Wesite đang trở thành một phần quan trọng trong hoạt động của nhiều doanh nghiệp, tổ chức, cá nhân. Website đáp ứng mọi nhu cầu của người dùng từ giới thiệu thông tin, quảng bá sản phẩm đến trao đổi, mua bán hay giải trí. Vì thế, đây là phương tiện truyền thông cho sản phẩm hiệu quả, tin cậy và ít tốn kém nhất hiện nay. Thông qua  website, doanh nghiệp có thể nhận được luồng thông tin phản hồi từ khách hàng về sản phẩm, dịch vụ của mình để đáp ứng tốt nhất thị hiếu, nhu cầu của người tiêu dùng.\n\nHiểu được điều đó, nhiều bạn trẻ đã quyết định dấn thân chinh phục mảnh đất màu mỡ này, đặc biệt là các bạn trẻ ưa thích sự sáng tạo, , muốn khám phá cái mới, chinh phục bản thân.\n\nThiết kế web (web designer) là một công việc hái ra tiền và tăng trưởng mạnh mẽ trong những năm qua.\n\nMỗi ngày trên thế giới có khoảng 200 triệu người truy cập vào các website.  Mức độ tăng trưởng của ngành thiết kế web đang ở mức  khoảng trên 30% và được dự báo sẽ còn tiếp tục tăng. Điều này khiến nhu cầu nhân sự ngành thiết kế website sẽ tiếp tục nóng trong thời gian tới.\n\nNghề Thiết kế web làm gì?\n\nNgười thiết kế website tạo ra trang web có bố cục hài hòa, ấn tượng và đồ họa chất lượng cao để truyền đạt thông điệp hiệu quả đến đối tượng khách hàng hoặc công chúng mục tiêu của doanh nghiệp. Họ phát triển, duy trì các trang web và hoạt động của máy chủ để đảm bảo website hoạt động ổn định. Bên cạnh đó, để website trở nên nổi bật, cần có giao diện đẹp mắt và cần thường xuyên được cải tiến, tối ưu sao cho hiệu quả nhất.\n\nNgười Thiết kế web cần tố chất gì?\n\nMột Web designer trước hết cần phải là một cá nhân nghệ thuật và có khả năng sáng tạo. Bố cục và đồ họa trên trang web phải được sắp xếp một cách hợp lý, đồng bộ, bắt mắt và thu hút được sự chú ý của khách hàng.\n\nNgoài ra, họ cũng cần phải là người tỉ mỉ và có tính kiên trì cao. Để tạo ra được một trang web yêu cầu người thiết kế phải chú ý đến từng chi tiết và phải đảm bảo rằng website của họ đáp ứng được các nhu cầu của khách hàng.  Đôi khi, họ cũng cần phải chấp nhận những bỏ qua những cá tính của mình, thay đổi lại toàn bộ thiết kế theo yêu cầu của khách hàng.\n\nNgoài ra, để thiết kế website, web designer phải học sử dụng thành thạo các công cụ web hay HTML, tiêu chuẩn web, ứng dụng phần mềm, nắm chắc nguyên tắc thiết kế cơ bản, quản lý nội dung trang web, hình ảnh, JavaScript, mã hóa…\n\nThu nhập của nghề Thiết kế web\n\nThiết kế website đang có những bước đi nhanh đến chóng mặt, hứa hẹn cơ hội việc làm với thu nhập hấp dẫn cho web designer nhiệt huyết và năng động.  Các sinh viên có thể đảm nhiệm các công việc như thiết kế đồ họa, biên tập viên đồ họa kỹ thuật số, thiết kế giảng dạy, tại các cơ quan quảng cáo, công ty tiếp thịhoặc phòng ban thông tin truyền thông của các doanh nghiệp.\n\nKhi đã có nhiều kinh nghiệm, web designer hoàn toàn tự do và linh hoạt trong công việc của mình, thậm chí có thể làm tại nhà mà không cần phải di chuyển. Mức lương trung bình dao động khoảng 50.000 USD/năm đến 85.000 USD/năm+ Ngoài ra, có thể bổ sung các cơ hội việc làm đến từ các công ty, tập đoàn trong nước.\n\nTóm lại, thiết kế web đang là nghề hấp dẫn mà các bạn trẻ có thể theo đổi để có được nghề nghiệp ổn định với mức thu nhập cao.',NULL),(5,'Nghề thiết kế web chuyên nghiệp','Nguyễn Ngọc Dũng','2023-12-03',1,'Nghề thiết kế web, nghe rất quen thuộc và hấp dẫn, nhưng không phải nhiều người có thể hiểu được chính xác thiết kế web là làm gì và cần kỹ năng gì để thành công với nghề nghiệp này.\n\nTrong khuôn khổ bài viết này chúng tôi sẽ phân tích những vấn đề nêu trên với hy vọng giúp bạn có được cái nhìn sâu hơn về nghề này cũng như cơ hội mà nó mang lại.\n\nNghề hấp dẫn, có nhu cầu cao, mức lương tốt\nTrong xu thế ngày nay, mọi thứ đều online từ thông tin doanh nghiệp, hỗ trợ khách hàng, mua, bán, tìm kiếm thông tin, tư vấn sức khỏe, nấu ăn, làm bánh, trò chuyện cá nhân v.v.. Do đó, các trang web, dịch vụ web, ứng dụng web ngày càng nở rộ.\n\nSự xuất hiện nhiều ứng dụng, dịch vụ web cũng tạo ra sự cạnh tranh khốc liệt giữa các website, ứng dụng web với nhau. Trang web nào có giao diện đẹp hơn, trải nghiệm người dùng tốt hơn sẽ thu hút được người dùng. Từ đó khái niệm UI/UX ra đời và ngày càng trở nên quan trọng trong quá trình phát triển các trang web, ứng dụng web.\n\nĐể đáp ứng được các yêu cầu đó, cần một lượng lớn các nhà thiết kế, phát triển ứng dụng web chuyên nghiệp. Vì vậy, các bạn thiết kế web có kỹ năng được săn đón và chào mời với mức lương cao.\nNhững kỹ năng cần có của một Web Designer\nTùy theo qui mô, phân công công việc của mỗi công ty mà bạn có thể đảm nhiệm một hoặc nhiều vai trò kể trên. Qua quá trình nghiên cứu các nhu cầu tuyển dụng tại Diễn đàn việc làm thiết kế Đà Nẵng chúng tôi liệt kê các yêu cầu cụ thể cho các vai trò như sau:\n\nUI/UX Designer:\nYêu cầu có kinh nghiệm thiết kế, sử dụng ứng dụng web\nCó kiến thức về mặt phân tích, tiếp cận xử lý thông tin từ người dùng\nAm hiểu về công nghệ trong xây dựng hệ thống web\nCó khả năng tư vấn làm việc với khách hàng\nĐã từng qua các vị trí Graphic Design\nGraphic Designer:\nYêu cầu có kiến thức về thiết kế đồ họa\nSử dụng thành thạo Adobe Illustrator, Photoshop\nWeb Developer:\nYêu cầu biết về HTML, CSS, JavaScript\nBiết một trong các ngôn ngữ lập trình web như PHP, Java …\nBiết về WordPress là một ưu tiên\nCopywriter:\nCó kiến thức về Marketing\nCó kỹ năng viết bài\nAm hiểu về sản phẩm, khách hàng ..\nCó kiến thức về SEO\nTùy theo nhu cầu công việc, qui mô môi công ty có những yêu cầu khác nhau cho vị trí Web Designer. Tuy nhiên, qua thống kê, phân tích các yêu cầu tuyển dụng, chúng tôi nhân thấy có một số yêu cầu cơ bản như sau cho vị trí Web Designer:\n\nCó kiến thức về UI/UX\nCó kinh nghiệm sử dụng các công cụ như Adobe Illustrator, Photoshop, Adobe XD\nCó kỹ năng về HTML, CSS, JavaScript\nBiết một ngôn ngữ lập trình web là ưu tiên\nBiết WordPress là ưu tiên',NULL),(6,'Phân biệt các hệ màu trong thiết kế đồ họa','Nguyễn Ngọc Dũng','2023-12-03',0,'Đến với bài tìm hiểu về hệ màu trong thiết kế đồ hoạ, Idesign sẽ giới thiệu và phân biệt cho các bạn 3 hệ màu: CYMK, RGB và PANTONE.\n\nHệ màu CYMK\nCMYK là một mô hình màu trong đó tất cả các màu được mô tả như là một hỗn hợp của các quá trình hòa trộn của bốn màu sắc. CMYK là mô hình màu tiêu chuẩn được sử dụng trong in offset cho các tài liệu đầy đủ màu sắc. Vì in ấn sử dụng các loại mực của bốn màu cơ bản, nó thường được gọi là in bốn màu.\n\nNguyên lý làm việc của CMYK là trên cơ sở hấp thụ ánh sáng. Màu mà chúng ta nhìn thấy là từ phần của ánh sáng không bị hấp thụ. Trong CMYK hồng sẫm cộng với vàng sẽ cho màu đỏ, cánh sen cộng với xanh lơ cho màu xanh lam, xanh lơ cộng với vàng sinh ra màu xanh lá cây và tổ hợp của các màu xanh lơ, cánh sen và vàng tạo ra màu đen.\n\n \n\nC – Cyan là màu lục lam\n\nM – Magenta là màu đỏ tươi (màu hồng đỏ),\n\nY – Yellow là màu vàng\n\nK – Keyline/Black là màu đen\n\nHệ màu RGB\nHệ màu RGB là từ viết tắt trong tiếng Anh và có nghĩa :\n\nR: Red (màu đỏ)\n\nG: Green (màu xanh lá cây)\n\nB: (blue (màu xanh lam)\nĐây là ba màu gốc trong các mô hình ánh sáng bổ sung. Từ ba màu cơ bản này từ cách thay đổi tỉ lệ giữa các màu RGB để tạo ra vô số các màu sắc khác nhau và cách tổng hợp từ 3 màu RGB này gọi là màu cộng ( các màu sinh ra từ 03 màu này sẽ sáng hơn màu gốc – additive color ).\n\nHệ màu RGB là chế độ hiển thị màu sắc tự nhiên của màn hình CRT, màn hình LCD và màn hình plasma. Máy ảnh và máy quét cũng có thể sử dụng chế độ RGB. Hệ màu RGB là hệ màu là tốt nhất cho thiết kế : thiết kế website, hình ảnh kỹ thuật số, thiết kế các tài liệu quảng cáo trực tuyến,…\nMàu Pantone được xác định là một loạt các con số thay vì tên (ngoại trừ với màu sắc sử dụng trong thời trang), do đó bạn sẽ nghe các tham chiếu PANTONE 2985 C thay vì màu xanh da trời.\n\nMàu Pantone là màu pha, hay màu thứ 5. Nói một cách dễ hiểu hơn, màu Pantone là màu được nhà sản xuất pha sẵn, khác với việc nhà in pha trộn các màu CMYK là 4 màu cơ bản trong in ấn để tạo ra những màu chúng ta mong muốn. Màu Pantone có sắc độ tươi tắn rất nổi bật, làm tăng tính thẩm mỹ cho sản phẩm in ấn. Khi đặt cạnh những ấn phẩm in ấn được in offset với 4 màu cơ bản, sắc độ của màu Pantone bao giờ cũng nổi bật hơn hẳn.\n\nĐể chọn đúng màu chúng ta cần, có thể đối chiếu màu trên bảng màu Pantone (Pantone Color Chart), bảng màu này khá đắt tiền so với các Color Chart thông thường. Trong các phần mềm đồ họa như AI, Photoshop, Corel Craw… đều có cho phép đổ màu Pantone. Để in bằng màu Pantone, bạn có thể đưa màu Pantone vào những chỗ bạn cần trên layout thiết kế, và làm việc với nhà in để đưa ra yêu cầu về in màu Pantone.\n\nVới bài phân tích về 3 hệ màu trên, chúng tôi hy vọng bạn sẽ được cung cấp đầy đủ thông tin và biết được cách tạo màu trong các tác phẩm thiết kế đồ hoạ.',NULL),(7,'JavaScript là gì? Internet có thể tồn tại mà không có JavaScript hay không?','Nguyễn Ngọc Dũng','2023-12-03',0,'JavaScript đã trở thành một điều gì đó gần như là hiển nhiên, khi mọi người đều sử dụng nó. Khi bạn dùng Facebook, bạn sử dụng JavaScript. Khi bạn viết một tweet bạn sử dụng JavaScript. Thật vậy, khi bạn xem nội dung trên Quản Trị Mạng, bạn cũng đang sử dụng JavaScript. Đây chỉ là một trong số rất ít những trang web sử dụng JavaScript.\n\nJavaScript là gì?\nJavaScript là một ngôn ngữ lập trình được sử dụng để tạo ra những trang web tương tác. Nó được tích hợp và nhúng trong HTML. JavaScript cho phép kiểm soát các hành vi của trang web tốt hơn so với khi chỉ có một mình HTML. JavaScript kết hợp vào HTML, chạy trên Windows, Macintosh và các hệ thống hỗ trợ Netscape khác.\n\nLịch sử hình thành và phát triển của JavaScript\nBan đầu, Web không hề thú bị như bây giờ.\n\nTrở lại thời kỳ đó, chỉ có HTML, các trang web không có gì khác ngoài từ, liên kết và hình ảnh. Không có tính linh động, không thú vị, mọi thứ hoàn toàn là tĩnh. Internet phải \"tiến hóa\". Và do đó, vào năm 1995, tại văn phòng của Netscape, JavaScript đã ra đời.\n\nHồi đó, cuộc cạnh tranh giữa hai trình duyệt là Navigator của Netscape và Internet Explorer của Microsoft diễn ra rất quyết liệt. Cả hai công ty đã nhìn thấy tiềm năng to lớn của Internet và cố gắng để tạo ra trình duyệt web, biến nó trở thành xu hướng chủ đạo.\n\nNetscape muốn tạo ra một ngôn ngữ lập trình vừa dễ hiểu đối với những người mới bắt đầu, vừa cho phép nhà phát triển có thể kiểm soát nhiều hơn những gì xảy ra trong cửa sổ trình duyệt.\n\nJavaScript trở thành ngôn ngữ lập trình\nĐược phát triển trong 10 ngày bởi Brendan Eich (mặc dù rất ngắn ngủi, nhưng vị này sau đó đã trở thành lãnh đạo của Mozilla), nó cho phép các nhà phát triển viết code theo nhiều kiểu khác nhau (hướng chức năng, hướng mệnh lệnh và hướng đối tượng) bằng một ngôn ngữ gần giống với các ngôn ngữ phổ biến khác ngày nay, như Java, C++ hay C.\n\nMặc dù có tên tương tự, nhưng cần phải nhấn mạnh rằng, JavaScript không liên quan gì đến ngôn ngữ lập trình Java được phát triển bởi Sun Microsystems. Thật vậy, nó ban đầu được gọi là LiveScript (tên nội bộ là Mocha), trước khi được đổi tên để tận dụng sự thành công và phổ biến của Java.\n\nCần lưu ý rằng, JavaScript không phải là ngôn ngữ lập trình web đầu tiên. Một trình duyệt web trước đây được gọi là ViolaWWW, chứa một ngôn ngữ kịch bản thô sơ và là tiền thân của CSS. Tuy nhiên, nó không bao giờ bắt kịp và ngôn ngữ kịch bản của nó không bao giờ thực sự trở thành một tiêu chuẩn.\n\nMột năm sau khi JavaScript được phát hành, Microsoft đã chuyển nó sang Internet Explorer. Trong những năm tiếp theo, JavaScript trở thành một phần thiết yếu khi xây dựng web và nó được tìm thấy trên hầu hết các trang web, được hỗ trợ bởi hầu hết các trình duyệt web.\n\nJavaScript cũng thành công hơn nữa khi trở thành ngôn ngữ cho việc phát triển trang web, ứng dụng và điện thoại. Chúng ta sẽ nói về điều này sau, trước hết sẽ đi xem xét một trong những dự án Web JavaScript quan trọng nhất là jQuery.\n\nJQuery\nJavaScript được xây dựng với mục đích không làm khó những lập trình viên không chuyên. Nhưng dù vậy, nó vẫn đi kèm với những thách thức nhất định dành cho những lập trình viên nhà nghề.\n\nCó lẽ vấn đề lớn nhất là bản chất đa nền tảng của web. Có vô số các trình duyệt được sử dụng như Chrome, Firefox, Internet Explorer, Opera, Safari,... Mỗi cái thông dịch JavaScript theo những cách thức khác nhau và có mức độ hỗ trợ khác nhau đối với các tính năng nhất định của ngôn ngữ lập trình.\n\nĐiều này có nghĩa là các nhà phát triển phải viết code phức tạp hơn nhiều chỉ để đảm bảo trang web của họ hoạt động trên tất cả các phiên bản của tất cả các trình duyệt phổ biến.\n\nĐó là lý do mà jQuery ra đời.\n\nĐược giới thiệu vào năm 2006 bởi John Resig, JQuery đã làm thay đổi cơ bản cách mọi người viết code Javascript bằng cách chuẩn hóa và đơn giản hóa các tương tác, hiệu ứng động trên trình duyệt. Lần đầu tiên, các nhà phát triển có thể viết code một lần và có phương pháp chắc chắn để nó sẽ làm việc trên tất cả các trình duyệt.\n\nĐặc biệt, jQuery còn giúp đơn giản hóa việc viết code JavaScript bằng cách thay thế các khía cạnh bất tiện, dài dòng và nguyên bản của JavaScript bằng một cái gì đó tinh tế và thanh lịch hơn.\n\nNode.js\nJavaScript có thể phát triển bên ngoài trình duyệt web, bằng chứng chính là Node.js.\n\nĐược khởi tạo vào năm 2009, Node.js là một bộ công cụ miễn phí, mã nguồn mở, đa nền tảng cho việc tạo ra những ứng dụng liên quan đến máy chủ, có hiệu suất cao, chẳng hạn như ứng dụng và máy chủ web. Trong những năm sau đó, nó đã được hàng ngàn nhà lập trình, công ty chấp nhận, bao gồm cả Groupon, LinkedIn và PayPal.\n\nĐiều làm cho Node.js trở nên đặc biệt chính là tốc độ của nó và cộng đồng các nhà phát triển rộng lớn, những người tạo nên code và mô-đun.\n\nĐằng sau Node.js chính là engine Google V8, cũng là sức mạnh của trình duyệt Google Chrome. Đây là một trong những yếu tố thúc đẩy sự thành công của Node.js, vì nó cho phép thông dịch code JavaScript với tốc độ chóng mặt.\n\nNgoài ra còn có hàng ngàn mô-đun Node.js được tạo ra từ cộng đồng các nhà phát triển, giúp mở rộng chức năng của Node.js. Những gói mô-đun này được phân phối bởi NPM hoặc Node Package Manager. Đây là một ứng dụng có giao diện dòng lệnh, miễn phí, được kết hợp hoàn hảo với runtime của Node.js, cho phép bạn tích hợp các thư viện JavaScript của bên thứ ba vào code của mình.\n\nNode.js cũng có thể được sử dujngn với các dự án Internest of Thingss với Tessel, một bảng giống như Arduino, chạy trên JavaScript.\n\nPhát triển ứng dụng cho điện thoại di động\nỨng dụng cho thiết bị di động là một thị trường béo bở. Chỉ cần nhìn vào Nick D\'Aloisio, người tạo ra ứng dụng Summly và được Yahoo mua lại với giá 30 triệu USD khi cậu ấy chỉ mới 17 tuổi. Hay như Rovio, với trò chơi Angry Birds đã tạo ra một thương hiệu trị giá nhiều triệu USD,...\n\nNếu bạn có ý tưởng tuyệt vời nào về ứng dụng di động hãy yên tâm rằng có thể tạo ra nó bằng JavaScript.\n\nAndroid, iOS, Blackberry, Windows Phone đều hỗ trợ xây dựng ứng dụng gốc bằng JavaScript, có thể được phân phối trên các cửa hàng ứng dụng chính thức của từng hệ điều hành, giống như bất cứ thứ gì được xây dựng bằng Java cho Android hoặc Swift cho iOS.\n\nCác ứng dụng di động được viết bằng JavaScript nói chung dễ phát triển hơn và có thể đánh bại các ứng dụng gốc (native app) nhờ vào chỉ số hiệu suất.\n\nNhưng thường thì, trong thế giới JavaScript, có những lựa chọn thay thế của bên thứ ba giúp cho việc viết ứng dụng di động nhanh và dễ dàng hơn nhiều. Chúng bao gồm PhoneGap, Titanium, Sencha, Ionic, tất cả đều cho phép viết ứng dụng một lần và đảm bảo nó sẽ hoạt động trên nhiều nền tảng di động khác nhau.',NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Lê Phi Hùng',NULL,10);
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
  `img` varchar(255) DEFAULT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_thumbnails_courses1_idx` (`course_id`),
  CONSTRAINT `fk_thumbnails_courses1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thumbnails`
--

LOCK TABLES `thumbnails` WRITE;
/*!40000 ALTER TABLE `thumbnails` DISABLE KEYS */;
INSERT INTO `thumbnails` VALUES (1,'/static/imgs/courses/course_1.webp',1),(2,'/static/imgs/courses/course_2.webp',2),(3,'/static/imgs/courses/course_3.webp',3),(4,'/static/imgs/courses/course_5.png',4),(5,'/static/imgs/courses/course_6.jepg',5),(6,'/static/imgs/courses/course_7.png',6),(507,'/static/imgs/courses/R.jpg',47),(508,'/static/imgs/courses/R (1).jpg',48),(509,'/static/imgs/courses/OIP.jpg',49),(510,'/static/imgs/courses/OIP (1).jpg',50);
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
  `username` varchar(255) NOT NULL,
  `password` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` char(12) DEFAULT NULL,
  `login_type` varchar(10) DEFAULT 'normal',
  `avatar` varchar(255) DEFAULT NULL,
  `email_verified` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (71,'thangloitran406@gmail.com','21ef487d28f42cafb042c7238aeffdeda10097fc99af808d248ddd306b1066e6',NULL,NULL,'Trần','Thắng Lợi','0879603547','normal',NULL,1);
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
  `remember_token` varchar(255) NOT NULL,
  `expires` int NOT NULL DEFAULT '180',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `verify_emails_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3;
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

-- Dump completed on 2024-01-02 19:14:16
