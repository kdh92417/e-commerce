-- MySQL dump 10.13  Distrib 8.0.29, for macos12.4 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ecommerce`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ecommerce`;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_users_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'admin@naver.com',0,1,1),(2,'adam@naver.com',0,1,2),(3,'james@naver.com',0,1,3),(4,'eden@naver.com',0,1,4);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Token',6,'add_token'),(22,'Can change Token',6,'change_token'),(23,'Can delete Token',6,'delete_token'),(24,'Can view Token',6,'view_token'),(25,'Can add token',7,'add_tokenproxy'),(26,'Can change token',7,'change_tokenproxy'),(27,'Can delete token',7,'delete_tokenproxy'),(28,'Can view token',7,'view_tokenproxy'),(29,'Can add social application',8,'add_socialapp'),(30,'Can change social application',8,'change_socialapp'),(31,'Can delete social application',8,'delete_socialapp'),(32,'Can view social application',8,'view_socialapp'),(33,'Can add social account',9,'add_socialaccount'),(34,'Can change social account',9,'change_socialaccount'),(35,'Can delete social account',9,'delete_socialaccount'),(36,'Can view social account',9,'view_socialaccount'),(37,'Can add social application token',10,'add_socialtoken'),(38,'Can change social application token',10,'change_socialtoken'),(39,'Can delete social application token',10,'delete_socialtoken'),(40,'Can view social application token',10,'view_socialtoken'),(41,'Can add email address',11,'add_emailaddress'),(42,'Can change email address',11,'change_emailaddress'),(43,'Can delete email address',11,'delete_emailaddress'),(44,'Can view email address',11,'view_emailaddress'),(45,'Can add email confirmation',12,'add_emailconfirmation'),(46,'Can change email confirmation',12,'change_emailconfirmation'),(47,'Can delete email confirmation',12,'delete_emailconfirmation'),(48,'Can view email confirmation',12,'view_emailconfirmation'),(49,'Can add category',13,'add_category'),(50,'Can change category',13,'change_category'),(51,'Can delete category',13,'delete_category'),(52,'Can view category',13,'view_category'),(53,'Can add like',14,'add_like'),(54,'Can change like',14,'change_like'),(55,'Can delete like',14,'delete_like'),(56,'Can view like',14,'view_like'),(57,'Can add product',15,'add_product'),(58,'Can change product',15,'change_product'),(59,'Can delete product',15,'delete_product'),(60,'Can view product',15,'view_product'),(61,'Can add product image',16,'add_productimage'),(62,'Can change product image',16,'change_productimage'),(63,'Can delete product image',16,'delete_productimage'),(64,'Can view product image',16,'view_productimage'),(65,'Can add product option',17,'add_productoption'),(66,'Can change product option',17,'change_productoption'),(67,'Can delete product option',17,'delete_productoption'),(68,'Can view product option',17,'view_productoption'),(69,'Can add product reply',18,'add_productreply'),(70,'Can change product reply',18,'change_productreply'),(71,'Can delete product reply',18,'delete_productreply'),(72,'Can view product reply',18,'view_productreply'),(73,'Can add tag',19,'add_tag'),(74,'Can change tag',19,'change_tag'),(75,'Can delete tag',19,'delete_tag'),(76,'Can view tag',19,'view_tag'),(77,'Can add product tag',20,'add_producttag'),(78,'Can change product tag',20,'change_producttag'),(79,'Can delete product tag',20,'delete_producttag'),(80,'Can view product tag',20,'view_producttag'),(81,'Can add product reply image',21,'add_productreplyimage'),(82,'Can change product reply image',21,'change_productreplyimage'),(83,'Can delete product reply image',21,'delete_productreplyimage'),(84,'Can view product reply image',21,'view_productreplyimage'),(85,'Can add user',22,'add_user'),(86,'Can change user',22,'change_user'),(87,'Can delete user',22,'delete_user'),(88,'Can view user',22,'view_user'),(89,'Can add cart',23,'add_cart'),(90,'Can change cart',23,'change_cart'),(91,'Can delete cart',23,'delete_cart'),(92,'Can view cart',23,'view_cart'),(93,'Can add order',24,'add_order'),(94,'Can change order',24,'change_order'),(95,'Can delete order',24,'delete_order'),(96,'Can view order',24,'view_order'),(97,'Can add order status',25,'add_orderstatus'),(98,'Can change order status',25,'change_orderstatus'),(99,'Can delete order status',25,'delete_orderstatus'),(100,'Can view order status',25,'view_orderstatus'),(101,'Can add order product',26,'add_orderproduct'),(102,'Can change order product',26,'change_orderproduct'),(103,'Can delete order product',26,'delete_orderproduct'),(104,'Can view order product',26,'view_orderproduct'),(105,'Can add payment',27,'add_payment'),(106,'Can change payment',27,'change_payment'),(107,'Can delete payment',27,'delete_payment'),(108,'Can view payment',27,'view_payment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `product_price` int NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_02913eac_fk_products_id` (`product_id`),
  KEY `carts_user_id_3a9d1785_fk_users_id` (`user_id`),
  CONSTRAINT `carts_product_id_02913eac_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `carts_user_id_3a9d1785_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'store'),(2,'play');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (11,'account','emailaddress'),(12,'account','emailconfirmation'),(1,'admin','logentry'),(9,'allauth','socialaccount'),(8,'allauth','socialapp'),(10,'allauth','socialtoken'),(3,'auth','group'),(2,'auth','permission'),(6,'authtoken','token'),(7,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(24,'order','order'),(26,'order','orderproduct'),(25,'order','orderstatus'),(27,'payment','payment'),(13,'product','category'),(14,'product','like'),(15,'product','product'),(16,'product','productimage'),(17,'product','productoption'),(18,'product','productreply'),(21,'product','productreplyimage'),(20,'product','producttag'),(19,'product','tag'),(5,'sessions','session'),(23,'user','cart'),(22,'user','user');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'product','0001_initial','2022-09-14 19:01:53.662540'),(2,'contenttypes','0001_initial','2022-09-14 19:01:53.772716'),(3,'contenttypes','0002_remove_content_type_name','2022-09-14 19:01:53.837674'),(4,'auth','0001_initial','2022-09-14 19:01:54.061058'),(5,'auth','0002_alter_permission_name_max_length','2022-09-14 19:01:54.131112'),(6,'auth','0003_alter_user_email_max_length','2022-09-14 19:01:54.140082'),(7,'auth','0004_alter_user_username_opts','2022-09-14 19:01:54.150093'),(8,'auth','0005_alter_user_last_login_null','2022-09-14 19:01:54.159307'),(9,'auth','0006_require_contenttypes_0002','2022-09-14 19:01:54.164159'),(10,'auth','0007_alter_validators_add_error_messages','2022-09-14 19:01:54.176425'),(11,'auth','0008_alter_user_username_max_length','2022-09-14 19:01:54.190780'),(12,'auth','0009_alter_user_last_name_max_length','2022-09-14 19:01:54.206014'),(13,'auth','0010_alter_group_name_max_length','2022-09-14 19:01:54.227290'),(14,'auth','0011_update_proxy_permissions','2022-09-14 19:01:54.250075'),(15,'auth','0012_alter_user_first_name_max_length','2022-09-14 19:01:54.258358'),(16,'user','0001_initial','2022-09-14 19:01:54.728605'),(17,'account','0001_initial','2022-09-14 19:01:54.871967'),(18,'account','0002_email_max_length','2022-09-14 19:01:54.902174'),(19,'admin','0001_initial','2022-09-14 19:01:55.052939'),(20,'admin','0002_logentry_remove_auto_add','2022-09-14 19:01:55.065519'),(21,'admin','0003_logentry_add_action_flag_choices','2022-09-14 19:01:55.125847'),(22,'authtoken','0001_initial','2022-09-14 19:01:55.220688'),(23,'authtoken','0002_auto_20160226_1747','2022-09-14 19:01:55.267698'),(24,'authtoken','0003_tokenproxy','2022-09-14 19:01:55.273522'),(25,'order','0001_initial','2022-09-14 19:01:55.422139'),(26,'order','0002_initial','2022-09-14 19:01:55.480568'),(27,'order','0003_initial','2022-09-14 19:01:55.584444'),(28,'payment','0001_initial','2022-09-14 19:01:55.671669'),(29,'product','0002_initial','2022-09-14 19:01:56.087500'),(30,'sessions','0001_initial','2022-09-14 19:01:56.118743');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('fciaps4glm6awhhwtl5x867stb78dq7d','.eJxVjEEOwiAQRe_C2hAIM6W4dO8ZyAAzUjU0Ke3KeHdt0oVu_3vvv1Skba1x67zEqaizAnX63RLlB7cdlDu126zz3NZlSnpX9EG7vs6Fn5fD_Tuo1Ou3JkiexYzeIAUczCDGIbiRBC0jiPU-IBdjBYJPQcigzy5JgByAkdT7A85YN4s:1oYPEE:OXjdHh-3-DmPSYpEJC0MeXs_iP3ZeYKRDjJAJDCrDno','2022-09-28 19:02:46.748384');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_product_id_7f73cfa5_fk_products_id` (`product_id`),
  KEY `likes_user_id_0899754c_fk_users_id` (`user_id`),
  CONSTRAINT `likes_product_id_7f73cfa5_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `likes_user_id_0899754c_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `product_quantity` int NOT NULL,
  `order_product_price` int NOT NULL,
  `delivery_fee` int NOT NULL,
  `order_id` bigint NOT NULL,
  `order_status_id` bigint DEFAULT NULL,
  `product_option_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_products_order_id_b5077dc2_fk_orders_id` (`order_id`),
  KEY `order_products_order_status_id_fd84f0b4_fk_order_status_id` (`order_status_id`),
  KEY `order_products_product_option_id_c0bd074b_fk_product_options_id` (`product_option_id`),
  CONSTRAINT `order_products_order_id_b5077dc2_fk_orders_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_products_order_status_id_fd84f0b4_fk_order_status_id` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`),
  CONSTRAINT `order_products_product_option_id_c0bd074b_fk_product_options_id` FOREIGN KEY (`product_option_id`) REFERENCES `product_options` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (1,'2022-09-14 19:08:29.500152','2022-09-14 19:09:05.098783',7,25000,4500,1,2,1),(2,'2022-09-14 19:08:29.518730','2022-09-14 19:09:05.104276',30,30000,7000,1,2,2),(3,'2022-09-14 19:08:29.522330','2022-09-14 19:09:05.106952',100,35000,10000,1,2,3),(4,'2022-09-14 19:08:43.720308','2022-09-14 19:09:12.828235',7,25000,4500,2,2,1),(5,'2022-09-14 19:08:43.722892','2022-09-14 19:09:12.833106',30,30000,7000,2,2,2),(6,'2022-09-14 19:08:43.727124','2022-09-14 19:09:12.835114',100,35000,10000,2,2,3),(7,'2022-09-14 19:09:20.293314','2022-09-14 19:09:20.293347',7,25000,4500,3,1,1),(8,'2022-09-14 19:09:20.295880','2022-09-14 19:09:20.295923',30,30000,7000,3,1,2),(9,'2022-09-14 19:09:20.300411','2022-09-14 19:09:20.300459',100,35000,10000,3,1,3);
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'주문완료'),(2,'결제완료'),(3,'배송준비중'),(4,'배송중');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime(6) NOT NULL,
  `address` varchar(300) NOT NULL,
  `postal_code` varchar(45) NOT NULL,
  `receiver_name` varchar(45) NOT NULL,
  `total_amount` int NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_7e2523fb_fk_users_id` (`user_id`),
  CONSTRAINT `orders_user_id_7e2523fb_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2022-09-14 19:08:29.403685','강서구 강서로 19아길','33821','홍길동',4596500,'2022-09-14 19:08:29.403737','2022-09-14 19:08:29.523393',1),(2,'2022-09-14 19:08:43.717693','강서구 강서로 19아길','33821','홍길동',4596500,'2022-09-14 19:08:43.717755','2022-09-14 19:08:43.729463',1),(3,'2022-09-14 19:09:20.290851','강서구 강서로 19아길','33821','홍길동',4596500,'2022-09-14 19:09:20.290907','2022-09-14 19:09:20.301393',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(2) NOT NULL,
  `payment_total_amount` int NOT NULL,
  `payment_date` datetime(6) NOT NULL,
  `payment_status` varchar(2) DEFAULT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_order_id_6086ad70_fk_orders_id` (`order_id`),
  CONSTRAINT `payments_order_id_6086ad70_fk_orders_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'CC',4596500,'2022-09-14 19:09:05.092227','PC',1),(2,'CC',4596500,'2022-09-14 19:09:12.823705','PC',2);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `origin_name` varchar(300) NOT NULL,
  `file_size` int NOT NULL,
  `is_thumbnail` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_28ebf5f0_fk_products_id` (`product_id`),
  CONSTRAINT `product_images_product_id_28ebf5f0_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,'2022-09-14 19:05:53.605182','2022-09-14 19:05:53.605220','ecommerce.png',120373,1,'1/ecommerce_amlzMKu.png',1),(2,'2022-09-14 19:05:53.613301','2022-09-14 19:05:53.613331','스크린샷 2022-09-08 오전 10.15.59.png',101594,0,'1/스크린샷_2022-09-08_오전_10.15.59_0k6uegr.png',1),(3,'2022-09-14 19:05:53.657805','2022-09-14 19:05:53.657863','스크린샷 2022-09-07 오후 2.19.41.png',19418,0,'1/스크린샷_2022-09-07_오후_2.19.41_yRHxOxV.png',1),(4,'2022-09-14 19:05:53.662797','2022-09-14 19:05:53.662852','스크린샷 2022-09-06 오후 4.28.59.png',14954,0,'1/스크린샷_2022-09-06_오후_4.28.59_u8WNqE0.png',1),(5,'2022-09-14 19:06:44.212209','2022-09-14 19:06:44.212245','ecommerce.png',120373,1,'2/ecommerce_qbmSRW6.png',2),(6,'2022-09-14 19:06:44.218184','2022-09-14 19:06:44.218217','스크린샷 2022-09-08 오전 10.15.59.png',101594,0,'2/스크린샷_2022-09-08_오전_10.15.59_buWd2CW.png',2),(7,'2022-09-14 19:06:44.220021','2022-09-14 19:06:44.220049','스크린샷 2022-09-07 오후 2.19.41.png',19418,0,'2/스크린샷_2022-09-07_오후_2.19.41_7fkJ8qZ.png',2),(8,'2022-09-14 19:06:44.221755','2022-09-14 19:06:44.221783','스크린샷 2022-09-06 오후 4.28.59.png',14954,0,'2/스크린샷_2022-09-06_오후_4.28.59_AVBledC.png',2),(9,'2022-09-14 19:06:45.986901','2022-09-14 19:06:45.986928','ecommerce.png',120373,1,'3/ecommerce_OzQaSL5.png',3),(10,'2022-09-14 19:06:45.990664','2022-09-14 19:06:45.990695','스크린샷 2022-09-08 오전 10.15.59.png',101594,0,'3/스크린샷_2022-09-08_오전_10.15.59_1qOWQUV.png',3),(11,'2022-09-14 19:06:45.992433','2022-09-14 19:06:45.992462','스크린샷 2022-09-07 오후 2.19.41.png',19418,0,'3/스크린샷_2022-09-07_오후_2.19.41_jgC8mJQ.png',3),(12,'2022-09-14 19:06:45.994011','2022-09-14 19:06:45.994038','스크린샷 2022-09-06 오후 4.28.59.png',14954,0,'3/스크린샷_2022-09-06_오후_4.28.59_UrNN1ha.png',3);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_options`
--

DROP TABLE IF EXISTS `product_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `extra_option_price` int NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_options_product_id_5452622a_fk_products_id` (`product_id`),
  CONSTRAINT `product_options_product_id_5452622a_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_options`
--

LOCK TABLES `product_options` WRITE;
/*!40000 ALTER TABLE `product_options` DISABLE KEYS */;
INSERT INTO `product_options` VALUES (1,'기본',0,NULL,NULL,1),(2,'중',5000,NULL,NULL,1),(3,'대',10000,NULL,NULL,1);
/*!40000 ALTER TABLE `product_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_replies`
--

DROP TABLE IF EXISTS `product_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_replies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `content` longtext NOT NULL,
  `ref_reply` int DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  `order` int NOT NULL,
  `depth` int NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_replies_product_id_ce78015f_fk_products_id` (`product_id`),
  KEY `product_replies_user_id_2ae5994a_fk_users_id` (`user_id`),
  CONSTRAINT `product_replies_product_id_ce78015f_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_replies_user_id_2ae5994a_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_replies`
--

LOCK TABLES `product_replies` WRITE;
/*!40000 ALTER TABLE `product_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reply_images`
--

DROP TABLE IF EXISTS `product_reply_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_reply_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `origin_name` varchar(300) NOT NULL,
  `file_size` int NOT NULL,
  `product_reply_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reply_images_product_reply_id_a8932ff3_fk_product_r` (`product_reply_id`),
  CONSTRAINT `product_reply_images_product_reply_id_a8932ff3_fk_product_r` FOREIGN KEY (`product_reply_id`) REFERENCES `product_replies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reply_images`
--

LOCK TABLES `product_reply_images` WRITE;
/*!40000 ALTER TABLE `product_reply_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reply_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tags`
--

DROP TABLE IF EXISTS `product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_tags_product_id_138ace6f_fk_products_id` (`product_id`),
  KEY `product_tags_tag_id_dd3a8625_fk_tags_id` (`tag_id`),
  CONSTRAINT `product_tags_product_id_138ace6f_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_tags_tag_id_dd3a8625_fk_tags_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tags`
--

LOCK TABLES `product_tags` WRITE;
/*!40000 ALTER TABLE `product_tags` DISABLE KEYS */;
INSERT INTO `product_tags` VALUES (1,1,1),(2,1,3),(3,2,1),(4,2,2),(5,3,1),(6,3,2);
/*!40000 ALTER TABLE `product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `discounted_price` int DEFAULT NULL,
  `stock` int NOT NULL,
  `description` longtext,
  `like_count` int NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_a7a3a156_fk_categories_id` (`category_id`),
  CONSTRAINT `products_category_id_a7a3a156_fk_categories_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'2022-09-14 19:05:53.599796','2022-09-14 19:05:53.599864','구기자 발효 수제 고추장 1kg, 2kg',70000,25000,100,'국내산 청양 콩으로 만들어 더욱 맛있고 건강한 수제 고추장\n\n엄마의 마음으로 건강한 재료들을 엄선하고 준비하여 정성으로 담았습니다.',0,1),(2,'2022-09-14 19:06:44.211011','2022-09-14 19:06:44.211044','테스트 상품 2',50000,25000,100,'국내산 청양 콩으로 만들어 더욱 맛있고 건강한 수제 고추장\n\n엄마의 마음으로 건강한 재료들을 엄선하고 준비하여 정성으로 담았습니다.',0,1),(3,'2022-09-14 19:06:45.985964','2022-09-14 19:06:45.985996','테스트 상품 2',50000,25000,100,'국내산 청양 콩으로 만들어 더욱 맛있고 건강한 수제 고추장\n\n엄마의 마음으로 건강한 재료들을 엄선하고 준비하여 정성으로 담았습니다.',0,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'BEST'),(2,'MD'),(3,'SOLD_OUT');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'pbkdf2_sha256$390000$6v6nP54Z3VgqrspwTTwDMb$l7jPZMDGLLRyyVgZUXnH2BdyraRp0csbgTxiGl37s7o=','2022-09-14 19:02:17.285718',0,'2022-09-14 19:02:17.222542','2022-09-14 19:02:17.222577',NULL,'admin@naver.com',1),(2,'pbkdf2_sha256$390000$YSEcW0RFlZNzlqWXM0Yjlm$43w+YbzwwzjGyd7IKOkL/SPuciUP+UHwIusgaw+efg4=','2022-09-14 19:02:33.199978',0,'2022-09-14 19:02:33.166905','2022-09-14 19:02:33.166951',NULL,'adam@naver.com',0),(3,'pbkdf2_sha256$390000$SpRSkyPj1S4rYracN0HDwh$TmRZCY+9Zsiz+92+2X68OomYLEwV2hicdOJkN53odwo=','2022-09-14 19:02:38.664206',0,'2022-09-14 19:02:38.643217','2022-09-14 19:02:38.643265',NULL,'james@naver.com',0),(4,'pbkdf2_sha256$390000$eXWuJAlRrbjlumzKaQ6rfI$gdI/BMfp2gbQUrIwO5UNGfTxLw8dKG+lLIPmHdoRtvg=','2022-09-14 19:02:46.738140',0,'2022-09-14 19:02:46.723188','2022-09-14 19:02:46.723220',NULL,'eden@naver.com',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_user_id_group_id_fc7788e8_uniq` (`user_id`,`group_id`),
  KEY `users_groups_group_id_2f3517aa_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_groups_group_id_2f3517aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_groups_user_id_f500bee5_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_permissions`
--

DROP TABLE IF EXISTS `users_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_permissions_user_id_permission_id_3b86cbdf_uniq` (`user_id`,`permission_id`),
  KEY `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_permissions_user_id_92473840_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_permissions`
--

LOCK TABLES `users_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-14 19:13:09
