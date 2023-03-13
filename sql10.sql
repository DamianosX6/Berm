-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mom
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_customuser'),(22,'Can change user',6,'change_customuser'),(23,'Can delete user',6,'delete_customuser'),(24,'Can view user',6,'view_customuser'),(25,'Can add item',7,'add_item'),(26,'Can change item',7,'change_item'),(27,'Can delete item',7,'delete_item'),(28,'Can view item',7,'view_item'),(29,'Can add up1',8,'add_up1'),(30,'Can change up1',8,'change_up1'),(31,'Can delete up1',8,'delete_up1'),(32,'Can view up1',8,'view_up1'),(33,'Can add order item',9,'add_orderitem'),(34,'Can change order item',9,'change_orderitem'),(35,'Can delete order item',9,'delete_orderitem'),(36,'Can view order item',9,'view_orderitem'),(37,'Can add order',10,'add_order'),(38,'Can change order',10,'change_order'),(39,'Can delete order',10,'delete_order'),(40,'Can view order',10,'view_order'),(41,'Can add site',11,'add_site'),(42,'Can change site',11,'change_site'),(43,'Can delete site',11,'delete_site'),(44,'Can view site',11,'view_site');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_customuser`
--

DROP TABLE IF EXISTS `core_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_customuser` (
  `sick_id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `user_id` char(32) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `c_tel` varchar(30) NOT NULL,
  `zip` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` time(6) NOT NULL,
  PRIMARY KEY (`sick_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_customuser`
--

LOCK TABLES `core_customuser` WRITE;
/*!40000 ALTER TABLE `core_customuser` DISABLE KEYS */;
INSERT INTO `core_customuser` VALUES (1,'pbkdf2_sha256$320000$JaOzq91GsOQpjHpvKgVGVo$ylCmC0iSeGuSpeCrFKzho+gcBlyQP/2hsnaI8N2nWtw=','asd','asd','2022-10-24 08:29:38.107189','d75da19bda394f2787309fdea9c99f5a','admin','admin@admin.com','asd','asd','asd',1,1,1,'12:33:52.841637'),(2,'pbkdf2_sha256$320000$PFRoZLjMb0zZLbQDbzCeru$Gh8MA/At37geT5kVht04eHwmIENFkkw4P00xWBsP1Sg=','Yiksawas','SuayPiSuay','2022-10-24 08:31:30.965735','7bea2af29f3242208d9f2e9c2d50ce7e','YikT800','few@gmail.com','800','T800','skynet',1,0,0,'12:42:06.782403'),(4,'pbkdf2_sha256$320000$RAujcR0zcazdH9IZhPNFvB$Q01pQTfala6+LF3OMgMoQdOS+s7Z/3znAakL1Lz3HSs=','wasun','sanghai','2022-10-25 05:39:29.813424','baddd4c55a004bbd93392cee9d9d153f','boom','bom@gmail.com','1234567890','40000','Skynet',1,0,0,'12:39:40.481831');
/*!40000 ALTER TABLE `core_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_customuser_groups`
--

DROP TABLE IF EXISTS `core_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_customuser_groups_customuser_id_group_id_7990e9c6_uniq` (`customuser_id`,`group_id`),
  KEY `core_customuser_groups_group_id_301aeff4_fk_auth_group_id` (`group_id`),
  CONSTRAINT `core_customuser_grou_customuser_id_976bc4d7_fk_core_cust` FOREIGN KEY (`customuser_id`) REFERENCES `core_customuser` (`sick_id`),
  CONSTRAINT `core_customuser_groups_group_id_301aeff4_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_customuser_groups`
--

LOCK TABLES `core_customuser_groups` WRITE;
/*!40000 ALTER TABLE `core_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_customuser_user_permissions`
--

DROP TABLE IF EXISTS `core_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_customuser_user_per_customuser_id_permission_49ea742a_uniq` (`customuser_id`,`permission_id`),
  KEY `core_customuser_user_permission_id_80ceaab9_fk_auth_perm` (`permission_id`),
  CONSTRAINT `core_customuser_user_customuser_id_ebd2ce6c_fk_core_cust` FOREIGN KEY (`customuser_id`) REFERENCES `core_customuser` (`sick_id`),
  CONSTRAINT `core_customuser_user_permission_id_80ceaab9_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_customuser_user_permissions`
--

LOCK TABLES `core_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `core_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_item`
--

DROP TABLE IF EXISTS `core_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `price` double NOT NULL,
  `category` varchar(2) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `p_pic` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_item_slug_07f502d0` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_item`
--

LOCK TABLES `core_item` WRITE;
/*!40000 ALTER TABLE `core_item` DISABLE KEYS */;
INSERT INTO `core_item` VALUES (4,'Fender Paramount PO-220E Orchestra',31500,'AG','4','Updated bracing pattern\r\nSolid spruce or mahogany top; solid mahogany back and sides\r\nNew Fender/Fishman® Sonitone Plus pickup with piezo and transducer\r\nSnowflake inlays\r\nBlack or Tiger Stripe pickguard\r\nIncludes hardshell case','images/4.PNG'),(5,'Ibanez VC50NJP',5040,'AG','5','body shape Grand Concert\r\ntop Spruce top \r\nback & sides Agathis back & Agathis sides\r\nneck Nyatoh','images/5.PNG'),(6,'Ibanez RG421HPAM',25560,'G','6','บอดี้ทำจากไม้เอ็นยาโต้\r\nปะหน้าด้วยไม้แอช\r\nคอทำจากไม้เมเปิ้ลผ่านการอบ\r\nทำทรงคอ Wizard III\r\nฟิงเกอร์บอร์ดทำจากไม้เมเปิ้ลผ่านการอบ\r\nอินเลย์ลายจุด','images/6.PNG'),(7,'Gibson Les Paul Tribute',43200,'G','7','บอดี้ทรง Les Paul แบบ Solid-body\r\nไม้ส่วนบอดี้เป็นไม้มะฮอกกานี น้ำหนักเบาแบบโมเดิร์น\r\nไม้หน้าเป็นไม้เมเปิ้ล\r\nเคลือบบอดี้แบบด้าน\r\nคอทำจากไม้มะฮอกกานี ทรงคอ Slim','images/7.PNG'),(8,'Schecter S-II Platinum',20000,'G','8','บอดี้ทำจากไม้มะฮอกกานี\r\nคอทำจากไม้เมเปิ้ล 3 ชิ้น\r\nฟิงเกอร์บอร์ดทำจากไม้อีโบนี่ อินเลย์ Platinum ‘Tempest’','images/8.PNG'),(9,'Gusta GPR-07',8550,'G','9','ลูกบิดชุบโครเมี่ยม\r\nคอมะฮอกกานี\r\nทรงคอ Modern C\r\nฟิงเกอร์บอร์ดโรสวู้ด\r\nRadius 13.8 นิ้ว','images/9.PNG'),(10,'Schecter Synyster Standard A7X',29600,'G','10','บอดี้ทำจากไม้มะฮอกกานี\r\nคอทำจากไม้เมเปิ้ล\r\nเชื่อมคอแบบ Bolt-on หรือใช้น็อต\r\nความยาวช่วงสาย 25.5 นิ้ว\r\nฟิงเกอร์บอร์ดทำจากไม้โรสวู้ด','images/10.PNG'),(11,'Nux MG-300',3960,'AP','11','DPS รุ่นใหม่ 32 bit, 24bit 48kHz AD/DA\r\n เทคตโนโลยีสำหรับ Modeling ขั้นสูง\r\n เครื่อง Drum พร้อม  Phrase Looper\r\n ระบบซอฟแวร์ปรับแต่งเสียง เอาใจเหล่า Tone Edior\r\n Computer Recording Interface\r\n IR Cabintet Simulation\r\n 72 Presets','images/11.PNG'),(12,'Mooer GE100',0,'AP','12','สินค้าพิเศษ ราคาหน้าร้าน','images/12.PNG'),(13,'Marshall MG15',6400,'AP','13','วัยรุ่นชอบ','images/13.PNG'),(15,'Bullet BT-45R',5900,'AP','15','กำลังไฟปกติ 45 วัตต์\r\nกำลังไฟสูงสุด 80 วัตต์\r\nดอกลำโพงแบบ Woofer ขนาด 10 นิ้ว\r\nดอกลำโพงแบบ Tweeter ขนาด 3 นิ้ว',''),(17,'T800',14000,'G','skynet1','เล่นแล้วหล่อ','images/10_I2qHx3p.PNG'),(18,'t900',500,'G','skynet123','ตัวตึงBIS','images/7_V9JA7Vv.PNG');
/*!40000 ALTER TABLE `core_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_order`
--

DROP TABLE IF EXISTS `core_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `start_date` datetime(6) NOT NULL,
  `orderead_date` datetime(6) NOT NULL,
  `orderead` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_order_user_id_b03bbffd_fk_core_customuser_sick_id` (`user_id`),
  CONSTRAINT `core_order_user_id_b03bbffd_fk_core_customuser_sick_id` FOREIGN KEY (`user_id`) REFERENCES `core_customuser` (`sick_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_order`
--

LOCK TABLES `core_order` WRITE;
/*!40000 ALTER TABLE `core_order` DISABLE KEYS */;
INSERT INTO `core_order` VALUES (8,'2022-10-25 02:24:25.067013','2022-10-25 02:24:25.065016',1,2),(9,'2022-10-25 02:26:57.845343','2022-10-25 02:26:57.843343',1,2),(10,'2022-10-25 02:28:45.694982','2022-10-25 02:28:45.693788',1,2),(11,'2022-10-25 03:43:46.090326','2022-10-25 03:43:46.090326',1,2),(12,'2022-10-25 03:44:24.145803','2022-10-25 03:44:24.145803',1,2),(13,'2022-10-25 03:45:29.829075','2022-10-25 03:45:29.829075',1,2),(14,'2022-10-25 04:59:12.595427','2022-10-25 04:59:12.595427',1,2),(15,'2022-10-25 05:42:18.499298','2022-10-25 05:42:18.499298',1,2);
/*!40000 ALTER TABLE `core_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_order_items`
--

DROP TABLE IF EXISTS `core_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `orderitem_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_order_items_order_id_orderitem_id_f9cea05f_uniq` (`order_id`,`orderitem_id`),
  KEY `core_order_items_orderitem_id_e44f86b6_fk_core_orderitem_id` (`orderitem_id`),
  CONSTRAINT `core_order_items_order_id_c5dde6c1_fk_core_order_id` FOREIGN KEY (`order_id`) REFERENCES `core_order` (`id`),
  CONSTRAINT `core_order_items_orderitem_id_e44f86b6_fk_core_orderitem_id` FOREIGN KEY (`orderitem_id`) REFERENCES `core_orderitem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_order_items`
--

LOCK TABLES `core_order_items` WRITE;
/*!40000 ALTER TABLE `core_order_items` DISABLE KEYS */;
INSERT INTO `core_order_items` VALUES (41,10,41),(47,14,46),(48,15,47);
/*!40000 ALTER TABLE `core_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_orderitem`
--

DROP TABLE IF EXISTS `core_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `orderead` tinyint(1) NOT NULL,
  `status` varchar(1) NOT NULL,
  `item_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_orderitem_item_id_3b7d0c2e_fk_core_item_id` (`item_id`),
  KEY `core_orderitem_user_id_323fe695_fk_core_customuser_sick_id` (`user_id`),
  CONSTRAINT `core_orderitem_item_id_3b7d0c2e_fk_core_item_id` FOREIGN KEY (`item_id`) REFERENCES `core_item` (`id`),
  CONSTRAINT `core_orderitem_user_id_323fe695_fk_core_customuser_sick_id` FOREIGN KEY (`user_id`) REFERENCES `core_customuser` (`sick_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_orderitem`
--

LOCK TABLES `core_orderitem` WRITE;
/*!40000 ALTER TABLE `core_orderitem` DISABLE KEYS */;
INSERT INTO `core_orderitem` VALUES (41,1,1,'C',15,2),(46,1,1,'P',6,2),(47,1,1,'',4,2);
/*!40000 ALTER TABLE `core_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_up1`
--

DROP TABLE IF EXISTS `core_up1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_up1` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `start_date` datetime(6) NOT NULL,
  `image_pic` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_up1`
--

LOCK TABLES `core_up1` WRITE;
/*!40000 ALTER TABLE `core_up1` DISABLE KEYS */;
INSERT INTO `core_up1` VALUES (6,'2022-10-25 02:25:40.856768','images/310798157_407046241434278_8981877670174196679_n_c0XAcS7_gXnjazZ.jpg'),(7,'2022-10-25 02:27:15.936108','images/310798157_407046241434278_8981877670174196679_n_c0XAcS7_7UYmCgm.jpg'),(8,'2022-10-25 02:41:40.358251','images/310798157_407046241434278_8981877670174196679_n_c0XAcS7_Ca6WrHj.jpg'),(9,'2022-10-25 05:31:20.682523','images/310798157_407046241434278_8981877670174196679_n_c0XAcS7_YIjs87T.jpg');
/*!40000 ALTER TABLE `core_up1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_up1_user`
--

DROP TABLE IF EXISTS `core_up1_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_up1_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `up1_id` bigint NOT NULL,
  `customuser_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_up1_user_up1_id_customuser_id_04adfa48_uniq` (`up1_id`,`customuser_id`),
  KEY `core_up1_user_customuser_id_d89ef935_fk_core_customuser_sick_id` (`customuser_id`),
  CONSTRAINT `core_up1_user_customuser_id_d89ef935_fk_core_customuser_sick_id` FOREIGN KEY (`customuser_id`) REFERENCES `core_customuser` (`sick_id`),
  CONSTRAINT `core_up1_user_up1_id_d7ce6bec_fk_core_up1_id` FOREIGN KEY (`up1_id`) REFERENCES `core_up1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_up1_user`
--

LOCK TABLES `core_up1_user` WRITE;
/*!40000 ALTER TABLE `core_up1_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_up1_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_core_customuser_sick_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_core_customuser_sick_id` FOREIGN KEY (`user_id`) REFERENCES `core_customuser` (`sick_id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-10-24 08:37:41.251750','1','Taylor GS Mini Rosewood',1,'[{\"added\": {}}]',7,1),(2,'2022-10-24 08:38:41.873625','2','Taylor Academy 10',1,'[{\"added\": {}}]',7,1),(3,'2022-10-24 08:43:11.423471','3','Fender CD-60S',1,'[{\"added\": {}}]',7,1),(4,'2022-10-24 08:44:42.509883','4','Fender Paramount PO-220E Orchestra',1,'[{\"added\": {}}]',7,1),(5,'2022-10-24 08:45:33.145620','5','Ibanez VC50NJP',1,'[{\"added\": {}}]',7,1),(6,'2022-10-24 08:46:15.675452','6','Ibanez RG421HPAM',1,'[{\"added\": {}}]',7,1),(7,'2022-10-24 09:27:34.893235','7','Gibson Les Paul Tribute',1,'[{\"added\": {}}]',7,1),(8,'2022-10-24 09:28:36.177978','8','Schecter S-II Platinum',1,'[{\"added\": {}}]',7,1),(9,'2022-10-24 09:29:20.531089','9','Gusta GPR-07',1,'[{\"added\": {}}]',7,1),(10,'2022-10-24 09:30:02.939246','10','Schecter Synyster Standard A7X',1,'[{\"added\": {}}]',7,1),(11,'2022-10-24 09:30:48.481370','11','Nux MG-300',1,'[{\"added\": {}}]',7,1),(12,'2022-10-24 09:31:40.358621','12','Mooer GE100',1,'[{\"added\": {}}]',7,1),(13,'2022-10-24 09:32:46.256588','13','Marshall MG15',1,'[{\"added\": {}}]',7,1),(14,'2022-10-24 09:33:31.801315','14','Peavey MAX',1,'[{\"added\": {}}]',7,1),(15,'2022-10-24 09:34:09.101569','15','Bullet BT-45R',1,'[{\"added\": {}}]',7,1),(16,'2022-10-24 10:21:50.873052','16','1 of Bullet BT-45R from Yik ',3,'',9,1),(17,'2022-10-24 10:21:50.876051','15','1 of Peavey MAX from Yik ',3,'',9,1),(18,'2022-10-24 10:21:50.878052','14','1 of Marshall MG15 from Yik ',3,'',9,1),(19,'2022-10-24 10:21:50.881035','13','1 of Mooer GE100 from Yik ',3,'',9,1),(20,'2022-10-24 10:21:50.882884','12','1 of Nux MG-300 from Yik ',3,'',9,1),(21,'2022-10-24 10:21:50.884884','11','1 of Schecter Synyster Standard A7X from Yik ',3,'',9,1),(22,'2022-10-24 10:21:50.886882','10','1 of Gusta GPR-07 from Yik ',3,'',9,1),(23,'2022-10-24 10:21:50.888354','9','1 of Schecter S-II Platinum from Yik ',3,'',9,1),(24,'2022-10-24 10:21:50.890267','8','1 of Gibson Les Paul Tribute from Yik ',3,'',9,1),(25,'2022-10-24 10:21:50.891267','7','1 of Ibanez RG421HPAM from Yik ',3,'',9,1),(26,'2022-10-24 10:21:50.893460','6','1 of Ibanez VC50NJP from Yik ',3,'',9,1),(27,'2022-10-24 10:21:50.895458','5','1 of Fender Paramount PO-220E Orchestra from Yik ',3,'',9,1),(28,'2022-10-24 10:21:50.897460','4','1 of Fender CD-60S from Yik ',3,'',9,1),(29,'2022-10-24 10:21:50.899459','3','1 of Taylor Academy 10 from Yik ',3,'',9,1),(30,'2022-10-24 10:21:50.901458','2','1 of Taylor GS Mini Rosewood from Yik ',3,'',9,1),(31,'2022-10-24 10:21:50.903232','1','2 of Taylor GS Mini Rosewood from Yik ',3,'',9,1),(32,'2022-10-24 12:15:38.085422','1','Taylor GS Mini Rosewood',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',7,1),(33,'2022-10-24 12:15:46.845679','2','Taylor Academy 10',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',7,1),(34,'2022-10-24 12:15:54.662015','3','Fender CD-60S',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',7,1),(35,'2022-10-24 12:16:02.363995','5','Ibanez VC50NJP',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',7,1),(36,'2022-10-24 12:34:14.571034','35','2 of Ibanez RG421HPAM from Yik ',3,'',9,1),(37,'2022-10-24 12:34:14.575754','34','1 of Ibanez VC50NJP from Yik ',3,'',9,1),(38,'2022-10-24 12:34:14.576755','33','1 of Fender Paramount PO-220E Orchestra from Yik ',3,'',9,1),(39,'2022-10-24 12:34:14.578754','32','1 of Fender CD-60S from Yik ',3,'',9,1),(40,'2022-10-24 12:34:14.580755','31','1 of Taylor Academy 10 from Yik ',3,'',9,1),(41,'2022-10-24 12:34:14.583755','30','2 of Taylor GS Mini Rosewood from Yik ',3,'',9,1),(42,'2022-10-24 12:34:14.585755','29','1 of Taylor Academy 10 from Yik ',3,'',9,1),(43,'2022-10-24 12:34:14.587755','28','1 of Bullet BT-45R from Yik ',3,'',9,1),(44,'2022-10-24 12:34:14.588755','27','1 of Ibanez RG421HPAM from Yik ',3,'',9,1),(45,'2022-10-24 12:34:14.590755','26','1 of Fender Paramount PO-220E Orchestra from Yik ',3,'',9,1),(46,'2022-10-24 12:34:14.593386','25','1 of Gibson Les Paul Tribute from Yik ',3,'',9,1),(47,'2022-10-24 12:34:14.594384','24','1 of Taylor Academy 10 from Yik ',3,'',9,1),(48,'2022-10-24 12:34:14.596385','23','3 of Taylor GS Mini Rosewood from Yik ',3,'',9,1),(49,'2022-10-24 12:34:14.597384','22','1 of Mooer GE100 from Yik ',3,'',9,1),(50,'2022-10-24 12:34:14.599385','21','1 of Fender Paramount PO-220E Orchestra from Yik ',3,'',9,1),(51,'2022-10-24 12:34:14.602384','20','1 of Ibanez RG421HPAM from Yik ',3,'',9,1),(52,'2022-10-24 12:34:14.604384','19','1 of Taylor Academy 10 from Yik ',3,'',9,1),(53,'2022-10-24 12:34:14.606384','18','1 of Taylor GS Mini Rosewood from Yik ',3,'',9,1),(54,'2022-10-24 12:34:14.607386','17','1 of Ibanez RG421HPAM from Yik ',3,'',9,1),(55,'2022-10-24 12:34:23.537188','7','Yik',3,'',10,1),(56,'2022-10-24 12:34:23.540188','6','Yik',3,'',10,1),(57,'2022-10-24 12:34:23.544054','5','Yik',3,'',10,1),(58,'2022-10-24 12:34:23.546055','4','Yik',3,'',10,1),(59,'2022-10-24 12:34:23.548054','3','Yik',3,'',10,1),(60,'2022-10-24 12:34:23.551056','2','Yik',3,'',10,1),(61,'2022-10-24 12:34:23.554255','1','Yik',3,'',10,1),(62,'2022-10-24 12:34:31.720858','5','up1 object (5)',3,'',8,1),(63,'2022-10-24 12:34:31.724855','4','up1 object (4)',3,'',8,1),(64,'2022-10-24 12:34:31.727858','3','up1 object (3)',3,'',8,1),(65,'2022-10-24 12:34:31.730099','2','up1 object (2)',3,'',8,1),(66,'2022-10-24 12:34:31.733093','1','up1 object (1)',3,'',8,1),(67,'2022-10-25 02:40:12.525953','15','Bullet BT-45R',2,'[{\"changed\": {\"fields\": [\"P pic\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(6,'core','customuser'),(7,'core','item'),(10,'core','order'),(9,'core','orderitem'),(8,'core','up1'),(5,'sessions','session'),(11,'sites','site');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-10-24 08:27:47.936709'),(2,'contenttypes','0002_remove_content_type_name','2022-10-24 08:27:47.997714'),(3,'auth','0001_initial','2022-10-24 08:27:48.191729'),(4,'auth','0002_alter_permission_name_max_length','2022-10-24 08:27:48.247732'),(5,'auth','0003_alter_user_email_max_length','2022-10-24 08:27:48.255734'),(6,'auth','0004_alter_user_username_opts','2022-10-24 08:27:48.265732'),(7,'auth','0005_alter_user_last_login_null','2022-10-24 08:27:48.275735'),(8,'auth','0006_require_contenttypes_0002','2022-10-24 08:27:48.280734'),(9,'auth','0007_alter_validators_add_error_messages','2022-10-24 08:27:48.288737'),(10,'auth','0008_alter_user_username_max_length','2022-10-24 08:27:48.298739'),(11,'auth','0009_alter_user_last_name_max_length','2022-10-24 08:27:48.309739'),(12,'auth','0010_alter_group_name_max_length','2022-10-24 08:27:48.367741'),(13,'auth','0011_update_proxy_permissions','2022-10-24 08:27:48.380743'),(14,'auth','0012_alter_user_first_name_max_length','2022-10-24 08:27:48.389745'),(15,'core','0001_initial','2022-10-24 08:27:49.150800'),(16,'admin','0001_initial','2022-10-24 08:27:49.271808'),(17,'admin','0002_logentry_remove_auto_add','2022-10-24 08:27:49.287809'),(18,'admin','0003_logentry_add_action_flag_choices','2022-10-24 08:27:49.303810'),(19,'core','0002_remove_up1_user','2022-10-24 08:27:49.336814'),(20,'core','0003_up1_user','2022-10-24 08:27:49.497825'),(21,'core','0004_remove_up1_user_up1_user','2022-10-24 08:27:49.629834'),(22,'core','0005_remove_up1_user_up1_user','2022-10-24 08:27:49.851852'),(23,'sessions','0001_initial','2022-10-24 08:27:49.891854'),(24,'sites','0001_initial','2022-10-24 08:27:49.909857'),(25,'sites','0002_alter_domain_unique','2022-10-24 08:27:49.933859');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9xnesehhatlcm1vygatn80iawpksjt30','.eJxVjEsOAiEQBe_C2hCg5efSvWcgDTQyaiAZZlbGuxuSWej2VdV7s4D7VsM-aA1LZhem2Ol3i5ie1CbID2z3zlNv27pEPhV-0MFvPdPrerh_BxVHnTWR9dlpIOeV0cIJpQsJ460FB1YYROnOxoAEQGXRK-GjlTGhMEUWYJ8vtaU2jw:1omwa2:5Ig9GPv2asDpVOcsdGG3YdXCeu_pdLjtsvnVwQKvtjA','2022-11-07 12:29:22.927517'),('j9eqmbd5o9wt5cbkvp44bqsko99eczf4','.eJxVjEsOAiEQRO_C2pDwB5fuPQPphkZGDSTDzMp4dyWZha4qqfeqXizCvtW4D1rjktmZSXb67RDSg9oE-Q7t1nnqbVsX5FPhBx382jM9L4f7d1Bh1O9aaW3IWAwKweQiqThCE1BIUSw4kAFmSvAI4EzyykNINpA2WKRQ7P0B-A84aw:1onChS:44riTdkyeDyqI_gNpgOkMZMmUsd4Ysh8Yv2PdoxRI-w','2022-11-08 05:42:06.782403');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mom'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-25 16:56:33
