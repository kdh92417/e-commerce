-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: ecommerce
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
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'admin@naver.com',0,1,1),(2,'adam@naver.com',0,1,2),(3,'james@naver.com',0,1,3),(4,'eden@naver.com',0,1,4);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Token',6,'add_token'),(22,'Can change Token',6,'change_token'),(23,'Can delete Token',6,'delete_token'),(24,'Can view Token',6,'view_token'),(25,'Can add token',7,'add_tokenproxy'),(26,'Can change token',7,'change_tokenproxy'),(27,'Can delete token',7,'delete_tokenproxy'),(28,'Can view token',7,'view_tokenproxy'),(29,'Can add social application',8,'add_socialapp'),(30,'Can change social application',8,'change_socialapp'),(31,'Can delete social application',8,'delete_socialapp'),(32,'Can view social application',8,'view_socialapp'),(33,'Can add social account',9,'add_socialaccount'),(34,'Can change social account',9,'change_socialaccount'),(35,'Can delete social account',9,'delete_socialaccount'),(36,'Can view social account',9,'view_socialaccount'),(37,'Can add social application token',10,'add_socialtoken'),(38,'Can change social application token',10,'change_socialtoken'),(39,'Can delete social application token',10,'delete_socialtoken'),(40,'Can view social application token',10,'view_socialtoken'),(41,'Can add email address',11,'add_emailaddress'),(42,'Can change email address',11,'change_emailaddress'),(43,'Can delete email address',11,'delete_emailaddress'),(44,'Can view email address',11,'view_emailaddress'),(45,'Can add email confirmation',12,'add_emailconfirmation'),(46,'Can change email confirmation',12,'change_emailconfirmation'),(47,'Can delete email confirmation',12,'delete_emailconfirmation'),(48,'Can view email confirmation',12,'view_emailconfirmation'),(49,'Can add category',13,'add_category'),(50,'Can change category',13,'change_category'),(51,'Can delete category',13,'delete_category'),(52,'Can view category',13,'view_category'),(53,'Can add like',14,'add_like'),(54,'Can change like',14,'change_like'),(55,'Can delete like',14,'delete_like'),(56,'Can view like',14,'view_like'),(57,'Can add product',15,'add_product'),(58,'Can change product',15,'change_product'),(59,'Can delete product',15,'delete_product'),(60,'Can view product',15,'view_product'),(61,'Can add product image',16,'add_productimage'),(62,'Can change product image',16,'change_productimage'),(63,'Can delete product image',16,'delete_productimage'),(64,'Can view product image',16,'view_productimage'),(65,'Can add product option',17,'add_productoption'),(66,'Can change product option',17,'change_productoption'),(67,'Can delete product option',17,'delete_productoption'),(68,'Can view product option',17,'view_productoption'),(69,'Can add product reply',18,'add_productreply'),(70,'Can change product reply',18,'change_productreply'),(71,'Can delete product reply',18,'delete_productreply'),(72,'Can view product reply',18,'view_productreply'),(73,'Can add tag',19,'add_tag'),(74,'Can change tag',19,'change_tag'),(75,'Can delete tag',19,'delete_tag'),(76,'Can view tag',19,'view_tag'),(77,'Can add product tag',20,'add_producttag'),(78,'Can change product tag',20,'change_producttag'),(79,'Can delete product tag',20,'delete_producttag'),(80,'Can view product tag',20,'view_producttag'),(81,'Can add product reply image',21,'add_productreplyimage'),(82,'Can change product reply image',21,'change_productreplyimage'),(83,'Can delete product reply image',21,'delete_productreplyimage'),(84,'Can view product reply image',21,'view_productreplyimage'),(85,'Can add user',22,'add_user'),(86,'Can change user',22,'change_user'),(87,'Can delete user',22,'delete_user'),(88,'Can view user',22,'view_user'),(89,'Can add cart',23,'add_cart'),(90,'Can change cart',23,'change_cart'),(91,'Can delete cart',23,'delete_cart'),(92,'Can view cart',23,'view_cart'),(93,'Can add order',24,'add_order'),(94,'Can change order',24,'change_order'),(95,'Can delete order',24,'delete_order'),(96,'Can view order',24,'view_order'),(97,'Can add order status',25,'add_orderstatus'),(98,'Can change order status',25,'change_orderstatus'),(99,'Can delete order status',25,'delete_orderstatus'),(100,'Can view order status',25,'view_orderstatus'),(101,'Can add order product',26,'add_orderproduct'),(102,'Can change order product',26,'change_orderproduct'),(103,'Can delete order product',26,'delete_orderproduct'),(104,'Can view order product',26,'view_orderproduct'),(105,'Can add payment',27,'add_payment'),(106,'Can change payment',27,'change_payment'),(107,'Can delete payment',27,'delete_payment'),(108,'Can view payment',27,'view_payment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'store'),(2,'play');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (11,'account','emailaddress'),(12,'account','emailconfirmation'),(1,'admin','logentry'),(9,'allauth','socialaccount'),(8,'allauth','socialapp'),(10,'allauth','socialtoken'),(3,'auth','group'),(2,'auth','permission'),(6,'authtoken','token'),(7,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(24,'order','order'),(26,'order','orderproduct'),(25,'order','orderstatus'),(27,'payment','payment'),(13,'product','category'),(14,'product','like'),(15,'product','product'),(16,'product','productimage'),(17,'product','productoption'),(18,'product','productreply'),(21,'product','productreplyimage'),(20,'product','producttag'),(19,'product','tag'),(5,'sessions','session'),(23,'user','cart'),(22,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'product','0001_initial','2022-09-14 19:01:53.662540'),(2,'contenttypes','0001_initial','2022-09-14 19:01:53.772716'),(3,'contenttypes','0002_remove_content_type_name','2022-09-14 19:01:53.837674'),(4,'auth','0001_initial','2022-09-14 19:01:54.061058'),(5,'auth','0002_alter_permission_name_max_length','2022-09-14 19:01:54.131112'),(6,'auth','0003_alter_user_email_max_length','2022-09-14 19:01:54.140082'),(7,'auth','0004_alter_user_username_opts','2022-09-14 19:01:54.150093'),(8,'auth','0005_alter_user_last_login_null','2022-09-14 19:01:54.159307'),(9,'auth','0006_require_contenttypes_0002','2022-09-14 19:01:54.164159'),(10,'auth','0007_alter_validators_add_error_messages','2022-09-14 19:01:54.176425'),(11,'auth','0008_alter_user_username_max_length','2022-09-14 19:01:54.190780'),(12,'auth','0009_alter_user_last_name_max_length','2022-09-14 19:01:54.206014'),(13,'auth','0010_alter_group_name_max_length','2022-09-14 19:01:54.227290'),(14,'auth','0011_update_proxy_permissions','2022-09-14 19:01:54.250075'),(15,'auth','0012_alter_user_first_name_max_length','2022-09-14 19:01:54.258358'),(16,'user','0001_initial','2022-09-14 19:01:54.728605'),(17,'account','0001_initial','2022-09-14 19:01:54.871967'),(18,'account','0002_email_max_length','2022-09-14 19:01:54.902174'),(19,'admin','0001_initial','2022-09-14 19:01:55.052939'),(20,'admin','0002_logentry_remove_auto_add','2022-09-14 19:01:55.065519'),(21,'admin','0003_logentry_add_action_flag_choices','2022-09-14 19:01:55.125847'),(22,'authtoken','0001_initial','2022-09-14 19:01:55.220688'),(23,'authtoken','0002_auto_20160226_1747','2022-09-14 19:01:55.267698'),(24,'authtoken','0003_tokenproxy','2022-09-14 19:01:55.273522'),(25,'order','0001_initial','2022-09-14 19:01:55.422139'),(26,'order','0002_initial','2022-09-14 19:01:55.480568'),(27,'order','0003_initial','2022-09-14 19:01:55.584444'),(28,'payment','0001_initial','2022-09-14 19:01:55.671669'),(29,'product','0002_initial','2022-09-14 19:01:56.087500'),(30,'sessions','0001_initial','2022-09-14 19:01:56.118743');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('fciaps4glm6awhhwtl5x867stb78dq7d','.eJxVjEEOwiAQRe_C2hAIM6W4dO8ZyAAzUjU0Ke3KeHdt0oVu_3vvv1Skba1x67zEqaizAnX63RLlB7cdlDu126zz3NZlSnpX9EG7vs6Fn5fD_Tuo1Ou3JkiexYzeIAUczCDGIbiRBC0jiPU-IBdjBYJPQcigzy5JgByAkdT7A85YN4s:1oYPEE:OXjdHh-3-DmPSYpEJC0MeXs_iP3ZeYKRDjJAJDCrDno','2022-09-28 19:02:46.748384'),('lc30ewu5m4zadc2d0j53z6434tyzenwx','.eJxVjEEOwiAQRe_C2pAySAGX7j0DGZhBqgaS0q6MdzckXej2v_f-WwTctxL2zmtYSFyEEqffLWJ6ch2AHljvTaZWt3WJcijyoF3eGvHrerh_BwV7GTUgxUh0Rg0-J-1MmlW27JxF5XG2Cb0DBKPYTxmA0ZC3MScyMBnS4vMFCck4lQ:1ocyBa:OHlTP6AVH1sVPQWHZBUwpuGCk88l1KYCBiN-ao2mkqg','2022-10-11 09:10:54.824211');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (1,'2022-09-14 19:08:29.500152','2022-09-14 19:09:05.098783',7,25000,4500,1,2,1),(2,'2022-09-14 19:08:29.518730','2022-09-14 19:09:05.104276',30,30000,7000,1,2,2),(3,'2022-09-14 19:08:29.522330','2022-09-14 19:09:05.106952',100,35000,10000,1,2,3),(4,'2022-09-14 19:08:43.720308','2022-09-14 19:09:12.828235',7,25000,4500,2,2,1),(5,'2022-09-14 19:08:43.722892','2022-09-14 19:09:12.833106',30,30000,7000,2,2,2),(6,'2022-09-14 19:08:43.727124','2022-09-14 19:09:12.835114',100,35000,10000,2,2,3),(7,'2022-09-14 19:09:20.293314','2022-09-14 19:09:20.293347',7,25000,4500,3,1,1),(8,'2022-09-14 19:09:20.295880','2022-09-14 19:09:20.295923',30,30000,7000,3,1,2),(9,'2022-09-14 19:09:20.300411','2022-09-14 19:09:20.300459',100,35000,10000,3,1,3),(10,'2022-09-25 16:26:02.717184','2022-09-25 16:26:02.717356',7,25000,4500,4,1,1),(11,'2022-09-25 16:26:02.725090','2022-09-25 16:26:02.725118',30,30000,7000,4,1,2),(12,'2022-09-25 16:26:02.727127','2022-09-25 16:26:02.727156',100,35000,10000,4,1,3);
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'주문완료'),(2,'결제완료'),(3,'배송준비중'),(4,'배송중');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2022-09-14 19:08:29.403685','강서구 강서로 19아길','33821','홍길동',4596500,'2022-09-14 19:08:29.403737','2022-09-14 19:08:29.523393',1),(2,'2022-09-14 19:08:43.717693','강서구 강서로 19아길','33821','홍길동',4596500,'2022-09-14 19:08:43.717755','2022-09-14 19:08:43.729463',1),(3,'2022-09-14 19:09:20.290851','강서구 강서로 19아길','33821','홍길동',4596500,'2022-09-14 19:09:20.290907','2022-09-14 19:09:20.301393',1),(4,'2022-09-25 16:26:02.701810','강서구 강서로 19아길','33821','홍길동',4596500,'2022-09-25 16:26:02.701917','2022-09-25 16:26:02.728198',4);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'CC',4596500,'2022-09-14 19:09:05.092227','PC',1),(2,'CC',4596500,'2022-09-14 19:09:12.823705','PC',2);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,'2022-09-14 19:05:53.605182','2022-09-14 19:05:53.605220','ecommerce.png',120373,1,'1/ecommerce_amlzMKu.png',1),(2,'2022-09-14 19:05:53.613301','2022-09-14 19:05:53.613331','스크린샷 2022-09-08 오전 10.15.59.png',101594,0,'1/스크린샷_2022-09-08_오전_10.15.59_0k6uegr.png',1),(3,'2022-09-14 19:05:53.657805','2022-09-14 19:05:53.657863','스크린샷 2022-09-07 오후 2.19.41.png',19418,0,'1/스크린샷_2022-09-07_오후_2.19.41_yRHxOxV.png',1),(4,'2022-09-14 19:05:53.662797','2022-09-14 19:05:53.662852','스크린샷 2022-09-06 오후 4.28.59.png',14954,0,'1/스크린샷_2022-09-06_오후_4.28.59_u8WNqE0.png',1),(5,'2022-09-14 19:06:44.212209','2022-09-14 19:06:44.212245','ecommerce.png',120373,1,'2/ecommerce_qbmSRW6.png',2),(6,'2022-09-14 19:06:44.218184','2022-09-14 19:06:44.218217','스크린샷 2022-09-08 오전 10.15.59.png',101594,0,'2/스크린샷_2022-09-08_오전_10.15.59_buWd2CW.png',2),(7,'2022-09-14 19:06:44.220021','2022-09-14 19:06:44.220049','스크린샷 2022-09-07 오후 2.19.41.png',19418,0,'2/스크린샷_2022-09-07_오후_2.19.41_7fkJ8qZ.png',2),(8,'2022-09-14 19:06:44.221755','2022-09-14 19:06:44.221783','스크린샷 2022-09-06 오후 4.28.59.png',14954,0,'2/스크린샷_2022-09-06_오후_4.28.59_AVBledC.png',2),(9,'2022-09-14 19:06:45.986901','2022-09-14 19:06:45.986928','ecommerce.png',120373,1,'3/ecommerce_OzQaSL5.png',3),(10,'2022-09-14 19:06:45.990664','2022-09-14 19:06:45.990695','스크린샷 2022-09-08 오전 10.15.59.png',101594,0,'3/스크린샷_2022-09-08_오전_10.15.59_1qOWQUV.png',3),(11,'2022-09-14 19:06:45.992433','2022-09-14 19:06:45.992462','스크린샷 2022-09-07 오후 2.19.41.png',19418,0,'3/스크린샷_2022-09-07_오후_2.19.41_jgC8mJQ.png',3),(12,'2022-09-14 19:06:45.994011','2022-09-14 19:06:45.994038','스크린샷 2022-09-06 오후 4.28.59.png',14954,0,'3/스크린샷_2022-09-06_오후_4.28.59_UrNN1ha.png',3),(13,'2022-09-15 11:11:59.823202','2022-09-15 11:11:59.823239','ecommerce.png',120373,1,'4/ecommerce.png',4),(14,'2022-09-15 11:11:59.828786','2022-09-15 11:11:59.828819','스크린샷 2022-09-08 오전 10.15.59.png',101594,0,'4/스크린샷_2022-09-08_오전_10.15.59_uzah6yO.png',4),(15,'2022-09-15 11:11:59.867502','2022-09-15 11:11:59.867587','스크린샷 2022-09-07 오후 2.19.41.png',19418,0,'4/스크린샷_2022-09-07_오후_2.19.41_MlLVcXh.png',4),(16,'2022-09-15 11:11:59.873858','2022-09-15 11:11:59.873912','스크린샷 2022-09-06 오후 4.28.59.png',14954,0,'4/스크린샷_2022-09-06_오후_4.28.59_qrePxZW.png',4),(17,'2022-09-27 09:11:12.367200','2022-09-27 09:11:12.367238','ecommerce.png',120373,1,'5/ecommerce_NnGoPgK.png',5),(18,'2022-09-27 09:11:12.372239','2022-09-27 09:11:12.372276','스크린샷 2022-09-08 오전 10.15.59.png',101594,0,'5/스크린샷_2022-09-08_오전_10.15.59_wYm7c5K.png',5),(19,'2022-09-27 09:11:12.375781','2022-09-27 09:11:12.375847','스크린샷 2022-09-07 오후 2.19.41.png',19418,0,'5/스크린샷_2022-09-07_오후_2.19.41_LJNr0iQ.png',5),(20,'2022-09-27 09:11:12.379252','2022-09-27 09:11:12.379281','스크린샷 2022-09-06 오후 4.28.59.png',14954,0,'5/스크린샷_2022-09-06_오후_4.28.59_LV6vpE8.png',5),(21,'2022-09-27 09:12:48.169721','2022-09-27 09:12:48.169753','ecommerce.png',120373,1,'6/ecommerce.png',6),(22,'2022-09-27 09:12:48.172563','2022-09-27 09:12:48.172598','스크린샷 2022-09-08 오전 10.15.59.png',101594,0,'6/스크린샷_2022-09-08_오전_10.15.59.png',6),(23,'2022-09-27 09:12:48.174372','2022-09-27 09:12:48.174408','스크린샷 2022-09-07 오후 2.19.41.png',19418,0,'6/스크린샷_2022-09-07_오후_2.19.41.png',6),(24,'2022-09-27 09:12:48.175959','2022-09-27 09:12:48.175990','스크린샷 2022-09-06 오후 4.28.59.png',14954,0,'6/스크린샷_2022-09-06_오후_4.28.59.png',6);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_options`
--

LOCK TABLES `product_options` WRITE;
/*!40000 ALTER TABLE `product_options` DISABLE KEYS */;
INSERT INTO `product_options` VALUES (1,'기본',0,NULL,NULL,1),(2,'중',5000,NULL,NULL,1),(3,'대',10000,NULL,NULL,1);
/*!40000 ALTER TABLE `product_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_replies`
--

LOCK TABLES `product_replies` WRITE;
/*!40000 ALTER TABLE `product_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_reply_images`
--

LOCK TABLES `product_reply_images` WRITE;
/*!40000 ALTER TABLE `product_reply_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reply_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_tags`
--

LOCK TABLES `product_tags` WRITE;
/*!40000 ALTER TABLE `product_tags` DISABLE KEYS */;
INSERT INTO `product_tags` VALUES (1,1,1),(2,1,3),(3,2,1),(4,2,2),(5,3,1),(6,3,2),(7,4,1),(8,4,2),(9,5,1),(10,5,2),(11,6,1),(12,6,2);
/*!40000 ALTER TABLE `product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'2022-09-14 19:05:53.599796','2022-09-14 19:05:53.599864','구기자 발효 수제 고추장 1kg, 2kg',70000,25000,100,'국내산 청양 콩으로 만들어 더욱 맛있고 건강한 수제 고추장\n\n엄마의 마음으로 건강한 재료들을 엄선하고 준비하여 정성으로 담았습니다.',0,1),(2,'2022-09-14 19:06:44.211011','2022-09-14 19:06:44.211044','테스트 상품 2',50000,25000,100,'국내산 청양 콩으로 만들어 더욱 맛있고 건강한 수제 고추장\n\n엄마의 마음으로 건강한 재료들을 엄선하고 준비하여 정성으로 담았습니다.',0,1),(3,'2022-09-14 19:06:45.985964','2022-09-14 19:06:45.985996','테스트 상품 2',50000,25000,100,'국내산 청양 콩으로 만들어 더욱 맛있고 건강한 수제 고추장\n\n엄마의 마음으로 건강한 재료들을 엄선하고 준비하여 정성으로 담았습니다.',0,1),(4,'2022-09-15 11:11:59.810823','2022-09-15 11:11:59.810900','테스트 상품 2',50000,25000,100,'국내산 청양 콩으로 만들어 더욱 맛있고 건강한 수제 고추장\n\n엄마의 마음으로 건강한 재료들을 엄선하고 준비하여 정성으로 담았습니다.',0,1),(5,'2022-09-27 09:11:12.363624','2022-09-27 09:11:12.363662','테스트 상품 2',50000,25000,100,'국내산 청양 콩으로 만들어 더욱 맛있고 건강한 수제 고추장\n\n엄마의 마음으로 건강한 재료들을 엄선하고 준비하여 정성으로 담았습니다.',0,1),(6,'2022-09-27 09:12:48.166557','2022-09-27 09:12:48.166711','테스트 상품 2',50000,25000,100,'국내산 청양 콩으로 만들어 더욱 맛있고 건강한 수제 고추장\n\n엄마의 마음으로 건강한 재료들을 엄선하고 준비하여 정성으로 담았습니다.',0,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'BEST'),(2,'MD'),(3,'SOLD_OUT');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'pbkdf2_sha256$390000$6v6nP54Z3VgqrspwTTwDMb$l7jPZMDGLLRyyVgZUXnH2BdyraRp0csbgTxiGl37s7o=','2022-09-27 09:10:54.816314',0,'2022-09-14 19:02:17.222542','2022-09-14 19:02:17.222577',NULL,'admin@naver.com',1),(2,'pbkdf2_sha256$390000$YSEcW0RFlZNzlqWXM0Yjlm$43w+YbzwwzjGyd7IKOkL/SPuciUP+UHwIusgaw+efg4=','2022-09-24 23:14:45.131414',0,'2022-09-14 19:02:33.166905','2022-09-14 19:02:33.166951',NULL,'adam@naver.com',0),(3,'pbkdf2_sha256$390000$SpRSkyPj1S4rYracN0HDwh$TmRZCY+9Zsiz+92+2X68OomYLEwV2hicdOJkN53odwo=','2022-09-25 16:19:29.544927',0,'2022-09-14 19:02:38.643217','2022-09-14 19:02:38.643265',NULL,'james@naver.com',0),(4,'pbkdf2_sha256$390000$eXWuJAlRrbjlumzKaQ6rfI$gdI/BMfp2gbQUrIwO5UNGfTxLw8dKG+lLIPmHdoRtvg=','2022-09-27 09:10:45.141149',0,'2022-09-14 19:02:46.723188','2022-09-14 19:02:46.723220',NULL,'eden@naver.com',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2022-09-27 15:26:10
