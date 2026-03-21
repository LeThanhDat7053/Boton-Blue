-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: archi_riorelax
-- ------------------------------------------------------
-- Server version	8.4.5

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'niOTTf2dJP2hYaXJg5O9eSVlbQydYAWG',1,'2025-06-10 10:38:16','2025-06-10 10:38:16','2025-06-10 10:38:16');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actor_id` bigint unsigned NOT NULL,
  `actor_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'General',0,'Sed est alias pariatur voluptates alias. Illo in nulla sit repudiandae. Velit ducimus assumenda nisi voluptatem eveniet ipsum. Autem voluptas corrupti cumque ab eum velit veniam.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2025-06-10 10:38:04','2025-06-10 10:38:04'),(2,'Hotel',0,'Molestiae libero incidunt quia voluptas iusto nostrum asperiores. Dolorum porro deserunt fugit dolor perferendis enim asperiores. Voluptas facilis architecto dolorem incidunt quam dolore.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-06-10 10:38:04','2025-06-10 10:38:04'),(3,'Booking',0,'Dolorem sunt tempore molestias ut. Quisquam perferendis omnis consequatur amet facere. Aut perspiciatis quod provident ipsum repellendus quia explicabo sunt.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-06-10 10:38:04','2025-06-10 10:38:04'),(4,'Resort',0,'Voluptas voluptate libero quia aliquam excepturi non adipisci tenetur. Maxime vero dolorum expedita. Laboriosam rerum repellat voluptas voluptatibus maxime libero.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-06-10 10:38:04','2025-06-10 10:38:04'),(5,'Travel',0,'Delectus quaerat qui tempora sint consequuntur voluptatem. Ea qui consequuntur eligendi qui explicabo eos voluptatem minima. Alias adipisci quia eveniet quasi dolor quod quasi.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-06-10 10:38:04','2025-06-10 10:38:04');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options`
--

DROP TABLE IF EXISTS `contact_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options`
--

LOCK TABLES `contact_custom_field_options` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options_translations`
--

DROP TABLE IF EXISTS `contact_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options_translations`
--

LOCK TABLES `contact_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields`
--

DROP TABLE IF EXISTS `contact_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields`
--

LOCK TABLES `contact_custom_fields` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields_translations`
--

DROP TABLE IF EXISTS `contact_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields_translations`
--

LOCK TABLES `contact_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'GENERAL INFORMATION',0,'published','2025-06-10 10:38:19','2025-06-10 10:38:19',NULL),(2,'ACCOMMODATIONS AND AMENITIES',1,'published','2025-06-10 10:38:19','2025-06-10 10:38:19',NULL),(3,'SPECIAL EVENTS',2,'published','2025-06-10 10:38:19','2025-06-10 10:38:19',NULL),(4,'SAFETY AND HEALTH',3,'published','2025-06-10 10:38:19','2025-06-10 10:38:19',NULL),(5,'EXPLORING',4,'published','2025-06-10 10:38:19','2025-06-10 10:38:19',NULL);
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'What sets Luxury Hotel apart from others area?','Our hotel stands out with its prime coastal location, captivating design that harmonizes with nature, impeccable service dedicated to fulfilling every guest’s desire, and an array of world-class amenities that redefine opulence and sophistication.',1,'published','2025-06-10 10:38:19','2025-06-10 10:38:19'),(2,'Are pets allowed at your hotel?','Unfortunately, as we strive to maintain an environment of tranquility and luxury for all our guests, we regret to inform you that we do not permit pets in our elegantly appointed rooms and meticulously designed public spaces.',2,'published','2025-06-10 10:38:19','2025-06-10 10:38:19'),(3,'Is there a service from airport to hotel?','Absolutely! For your convenience, we offer an exclusive airport shuttle service that can be arranged in advance. Our dedicated concierge team will be delighted to provide you with detailed information and assist with reservations.',1,'published','2025-06-10 10:38:19','2025-06-10 10:38:19'),(4,'What dining options are available at hotel?','Indulge in a culinary journey at our resort with a range of exquisite dining options. From elegantly crafted local and international cuisines to delightful specialty restaurants and inviting bars, every dining experience promises to tantalize your taste buds and elevate your stay to new heights of gastronomic pleasure.',2,'published','2025-06-10 10:38:19','2025-06-10 10:38:19'),(5,'Is there a spa and wellness center on-site?','Embrace holistic well-being at our luxurious on-site spa and wellness center. Immerse yourself in a world of serenity and rejuvenation with a diverse selection of treatments, therapies, and state-of-the-art facilities that cater to your body, mind, and soul.',2,'published','2025-06-10 10:38:19','2025-06-10 10:38:19'),(6,'Do you have family-friendly activities?','Families are warmly welcomed to our resort, where we have thoughtfully curated a range of family-friendly amenities and activities. From a dedicated kids’ club to a family pool and a host of engaging recreational options, we ensure a harmonious and enjoyable stay for guests of all ages.',2,'published','2025-06-10 10:38:19','2025-06-10 10:38:19'),(7,'How can I arrange special at resort?','Celebrate life’s most precious moments in the epitome of luxury and elegance. Our skilled event planning team is committed to orchestrating seamless and memorable celebrations, ensuring every detail is tailored to your vision. Contact our dedicated events department to embark on a journey of crafting extraordinary moments.',3,'published','2025-06-10 10:38:19','2025-06-10 10:38:19'),(8,'What safety measures do you have for guests?','Your well-being is our paramount concern. We have implemented stringent health and safety protocols to ensure a secure and comfortable environment for all our guests. These measures encompass enhanced cleaning procedures, social distancing guidelines, and a commitment to maintaining the highest standards of hygiene throughout the resort.',4,'published','2025-06-10 10:38:19','2025-06-10 10:38:19'),(9,'Can I cancel or modify my reservation?','Our reservation policies vary based on the rate type and specific booking conditions. We kindly advise reviewing the terms and details of your reservation or reaching out to our dedicated reservations team for personalized assistance regarding cancellations or modifications. Your comfort and satisfaction remain our utmost priority.',1,'published','2025-06-10 10:38:19','2025-06-10 10:38:19'),(10,'What activities are near your hotel?','Our hotel’s prime location offers easy access to a plethora of attractions. Explore the captivating Adriatic coastline, immerse yourself in historical landmarks, indulge in vibrant local culture, and embark on memorable excursions that our concierge team can readily assist in arranging.',5,'published','2025-06-10 10:38:19','2025-06-10 10:38:19');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Room','Immerse yourself in the epitome of comfort and luxury within our meticulously designed rooms. Each space is a sanctuary where sophistication meets functionality. From plush furnishings to panoramic views, every detail is crafted to ensure an unparalleled stay that leaves a lasting impression.',1,0,'galleries/1.png',1,'published','2025-06-10 10:38:16','2025-06-10 10:38:16'),(2,'Hall','Our event halls are more than spaces; they’re canvases for your imagination. With timeless design and versatile layouts, they’re perfect for weddings, conferences, and gatherings of all kinds. Equipped with state-of-the-art technology and impeccable service, our halls set the stage for unforgettable moments.',1,0,'galleries/2.png',1,'published','2025-06-10 10:38:16','2025-06-10 10:38:16'),(3,'Guardian','Our vigilant team takes your safety and comfort seriously. With unwavering dedication, our guardians ensure every corner of our hotel is secure, clean, and welcoming. From discreet housekeeping to attentive concierge services, their commitment ensures you experience nothing but the finest in hospitality. Your peace of mind is their top priority',1,0,'galleries/3.png',1,'published','2025-06-10 10:38:16','2025-06-10 10:38:16'),(4,'Hotel','Experience opulence redefined at Riorelax. Our meticulously designed rooms and suites offer breathtaking views, plush amenities, and a haven of tranquility. Immerse yourself in sumptuous comfort that sets the stage for an unforgettable stay.',1,0,'galleries/4.png',1,'published','2025-06-10 10:38:16','2025-06-10 10:38:16'),(5,'Event Hall','Celebrate life’s milestones in style with our exceptional event spaces. From weddings to corporate gatherings, our dedicated team crafts experiences that leave a lasting impression. Impeccable service, state-of-the-art facilities, and a picturesque backdrop ensure your event is nothing short of extraordinary.',1,0,'galleries/5.png',1,'published','2025-06-10 10:38:16','2025-06-10 10:38:16');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta`
--

DROP TABLE IF EXISTS `gallery_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
INSERT INTO `gallery_meta` VALUES (1,'[{\"img\":\"galleries\\/3.png\",\"description\":\"Voluptatem suscipit qui laudantium quo. Delectus ab ab sit sed animi. Incidunt culpa quis molestiae amet quisquam non.\"},{\"img\":\"galleries\\/4.png\",\"description\":\"Voluptatum et et vel nesciunt quod natus. Non fugiat optio eos officiis sint id. A eaque est omnis qui ea.\"},{\"img\":\"galleries\\/7.png\",\"description\":\"Ut quidem amet et. Voluptatibus earum voluptatum molestias incidunt non nemo. Iste eos laudantium qui reiciendis.\"},{\"img\":\"galleries\\/5.png\",\"description\":\"Officiis quia animi qui ab cupiditate. Accusantium tempora reprehenderit voluptas. Itaque modi qui sapiente cum.\"},{\"img\":\"galleries\\/1.png\",\"description\":\"Voluptate qui eos consequatur itaque magnam occaecati. Labore atque modi dolor omnis maxime eaque id numquam. Facilis minus molestias ratione et.\"},{\"img\":\"galleries\\/10.png\",\"description\":\"Distinctio ipsam beatae qui aut molestiae. Ea illum mollitia sed minus. Velit ut totam id atque.\"},{\"img\":\"galleries\\/2.png\",\"description\":\"Mollitia ut eos ratione in ut autem vero. Sint aut qui omnis voluptatem voluptas possimus sint. Perferendis sunt magni quae rerum.\"},{\"img\":\"galleries\\/6.png\",\"description\":\"Quibusdam mollitia veritatis architecto voluptatem amet. Similique vitae molestias natus. Rerum aperiam harum quis et aut qui dolorem ut.\"},{\"img\":\"galleries\\/8.png\",\"description\":\"Voluptas voluptate consectetur explicabo iste. Dolor temporibus quibusdam asperiores fugiat. Et ex quo et nam cumque id porro dolores.\"},{\"img\":\"galleries\\/9.png\",\"description\":\"Molestias rerum earum voluptates. Eum qui cum minima tempora est in quis. Eos ullam nemo ut nam. Et velit illo voluptatem sint ut facilis.\"}]',1,'Botble\\Gallery\\Models\\Gallery','2025-06-10 10:38:16','2025-06-10 10:38:16'),(2,'[{\"img\":\"galleries\\/8.png\",\"description\":\"Voluptas voluptate consectetur explicabo iste. Dolor temporibus quibusdam asperiores fugiat. Et ex quo et nam cumque id porro dolores.\"},{\"img\":\"galleries\\/6.png\",\"description\":\"Quibusdam mollitia veritatis architecto voluptatem amet. Similique vitae molestias natus. Rerum aperiam harum quis et aut qui dolorem ut.\"},{\"img\":\"galleries\\/1.png\",\"description\":\"Voluptate qui eos consequatur itaque magnam occaecati. Labore atque modi dolor omnis maxime eaque id numquam. Facilis minus molestias ratione et.\"},{\"img\":\"galleries\\/5.png\",\"description\":\"Officiis quia animi qui ab cupiditate. Accusantium tempora reprehenderit voluptas. Itaque modi qui sapiente cum.\"},{\"img\":\"galleries\\/10.png\",\"description\":\"Distinctio ipsam beatae qui aut molestiae. Ea illum mollitia sed minus. Velit ut totam id atque.\"},{\"img\":\"galleries\\/3.png\",\"description\":\"Voluptatem suscipit qui laudantium quo. Delectus ab ab sit sed animi. Incidunt culpa quis molestiae amet quisquam non.\"},{\"img\":\"galleries\\/4.png\",\"description\":\"Voluptatum et et vel nesciunt quod natus. Non fugiat optio eos officiis sint id. A eaque est omnis qui ea.\"},{\"img\":\"galleries\\/9.png\",\"description\":\"Molestias rerum earum voluptates. Eum qui cum minima tempora est in quis. Eos ullam nemo ut nam. Et velit illo voluptatem sint ut facilis.\"},{\"img\":\"galleries\\/2.png\",\"description\":\"Mollitia ut eos ratione in ut autem vero. Sint aut qui omnis voluptatem voluptas possimus sint. Perferendis sunt magni quae rerum.\"},{\"img\":\"galleries\\/7.png\",\"description\":\"Ut quidem amet et. Voluptatibus earum voluptatum molestias incidunt non nemo. Iste eos laudantium qui reiciendis.\"}]',2,'Botble\\Gallery\\Models\\Gallery','2025-06-10 10:38:16','2025-06-10 10:38:16'),(3,'[{\"img\":\"galleries\\/7.png\",\"description\":\"Ut quidem amet et. Voluptatibus earum voluptatum molestias incidunt non nemo. Iste eos laudantium qui reiciendis.\"},{\"img\":\"galleries\\/9.png\",\"description\":\"Molestias rerum earum voluptates. Eum qui cum minima tempora est in quis. Eos ullam nemo ut nam. Et velit illo voluptatem sint ut facilis.\"},{\"img\":\"galleries\\/4.png\",\"description\":\"Voluptatum et et vel nesciunt quod natus. Non fugiat optio eos officiis sint id. A eaque est omnis qui ea.\"},{\"img\":\"galleries\\/8.png\",\"description\":\"Voluptas voluptate consectetur explicabo iste. Dolor temporibus quibusdam asperiores fugiat. Et ex quo et nam cumque id porro dolores.\"},{\"img\":\"galleries\\/2.png\",\"description\":\"Mollitia ut eos ratione in ut autem vero. Sint aut qui omnis voluptatem voluptas possimus sint. Perferendis sunt magni quae rerum.\"},{\"img\":\"galleries\\/10.png\",\"description\":\"Distinctio ipsam beatae qui aut molestiae. Ea illum mollitia sed minus. Velit ut totam id atque.\"},{\"img\":\"galleries\\/6.png\",\"description\":\"Quibusdam mollitia veritatis architecto voluptatem amet. Similique vitae molestias natus. Rerum aperiam harum quis et aut qui dolorem ut.\"},{\"img\":\"galleries\\/5.png\",\"description\":\"Officiis quia animi qui ab cupiditate. Accusantium tempora reprehenderit voluptas. Itaque modi qui sapiente cum.\"},{\"img\":\"galleries\\/3.png\",\"description\":\"Voluptatem suscipit qui laudantium quo. Delectus ab ab sit sed animi. Incidunt culpa quis molestiae amet quisquam non.\"},{\"img\":\"galleries\\/1.png\",\"description\":\"Voluptate qui eos consequatur itaque magnam occaecati. Labore atque modi dolor omnis maxime eaque id numquam. Facilis minus molestias ratione et.\"}]',3,'Botble\\Gallery\\Models\\Gallery','2025-06-10 10:38:16','2025-06-10 10:38:16'),(4,'[{\"img\":\"galleries\\/6.png\",\"description\":\"Quibusdam mollitia veritatis architecto voluptatem amet. Similique vitae molestias natus. Rerum aperiam harum quis et aut qui dolorem ut.\"},{\"img\":\"galleries\\/5.png\",\"description\":\"Officiis quia animi qui ab cupiditate. Accusantium tempora reprehenderit voluptas. Itaque modi qui sapiente cum.\"},{\"img\":\"galleries\\/8.png\",\"description\":\"Voluptas voluptate consectetur explicabo iste. Dolor temporibus quibusdam asperiores fugiat. Et ex quo et nam cumque id porro dolores.\"},{\"img\":\"galleries\\/10.png\",\"description\":\"Distinctio ipsam beatae qui aut molestiae. Ea illum mollitia sed minus. Velit ut totam id atque.\"},{\"img\":\"galleries\\/1.png\",\"description\":\"Voluptate qui eos consequatur itaque magnam occaecati. Labore atque modi dolor omnis maxime eaque id numquam. Facilis minus molestias ratione et.\"},{\"img\":\"galleries\\/3.png\",\"description\":\"Voluptatem suscipit qui laudantium quo. Delectus ab ab sit sed animi. Incidunt culpa quis molestiae amet quisquam non.\"},{\"img\":\"galleries\\/7.png\",\"description\":\"Ut quidem amet et. Voluptatibus earum voluptatum molestias incidunt non nemo. Iste eos laudantium qui reiciendis.\"},{\"img\":\"galleries\\/2.png\",\"description\":\"Mollitia ut eos ratione in ut autem vero. Sint aut qui omnis voluptatem voluptas possimus sint. Perferendis sunt magni quae rerum.\"},{\"img\":\"galleries\\/9.png\",\"description\":\"Molestias rerum earum voluptates. Eum qui cum minima tempora est in quis. Eos ullam nemo ut nam. Et velit illo voluptatem sint ut facilis.\"},{\"img\":\"galleries\\/4.png\",\"description\":\"Voluptatum et et vel nesciunt quod natus. Non fugiat optio eos officiis sint id. A eaque est omnis qui ea.\"}]',4,'Botble\\Gallery\\Models\\Gallery','2025-06-10 10:38:16','2025-06-10 10:38:16'),(5,'[{\"img\":\"galleries\\/1.png\",\"description\":\"Voluptate qui eos consequatur itaque magnam occaecati. Labore atque modi dolor omnis maxime eaque id numquam. Facilis minus molestias ratione et.\"},{\"img\":\"galleries\\/10.png\",\"description\":\"Distinctio ipsam beatae qui aut molestiae. Ea illum mollitia sed minus. Velit ut totam id atque.\"},{\"img\":\"galleries\\/2.png\",\"description\":\"Mollitia ut eos ratione in ut autem vero. Sint aut qui omnis voluptatem voluptas possimus sint. Perferendis sunt magni quae rerum.\"},{\"img\":\"galleries\\/6.png\",\"description\":\"Quibusdam mollitia veritatis architecto voluptatem amet. Similique vitae molestias natus. Rerum aperiam harum quis et aut qui dolorem ut.\"},{\"img\":\"galleries\\/9.png\",\"description\":\"Molestias rerum earum voluptates. Eum qui cum minima tempora est in quis. Eos ullam nemo ut nam. Et velit illo voluptatem sint ut facilis.\"},{\"img\":\"galleries\\/4.png\",\"description\":\"Voluptatum et et vel nesciunt quod natus. Non fugiat optio eos officiis sint id. A eaque est omnis qui ea.\"},{\"img\":\"galleries\\/5.png\",\"description\":\"Officiis quia animi qui ab cupiditate. Accusantium tempora reprehenderit voluptas. Itaque modi qui sapiente cum.\"},{\"img\":\"galleries\\/7.png\",\"description\":\"Ut quidem amet et. Voluptatibus earum voluptatum molestias incidunt non nemo. Iste eos laudantium qui reiciendis.\"},{\"img\":\"galleries\\/3.png\",\"description\":\"Voluptatem suscipit qui laudantium quo. Delectus ab ab sit sed animi. Incidunt culpa quis molestiae amet quisquam non.\"},{\"img\":\"galleries\\/8.png\",\"description\":\"Voluptas voluptate consectetur explicabo iste. Dolor temporibus quibusdam asperiores fugiat. Et ex quo et nam cumque id porro dolores.\"}]',5,'Botble\\Gallery\\Models\\Gallery','2025-06-10 10:38:16','2025-06-10 10:38:16');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` bigint unsigned NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta_translations`
--

LOCK TABLES `gallery_meta_translations` WRITE;
/*!40000 ALTER TABLE `gallery_meta_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_meta_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_amenities`
--

DROP TABLE IF EXISTS `ht_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_amenities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_amenities`
--

LOCK TABLES `ht_amenities` WRITE;
/*!40000 ALTER TABLE `ht_amenities` DISABLE KEYS */;
INSERT INTO `ht_amenities` VALUES (1,'Air conditioner','fal fa-bath','published','2025-06-10 10:38:05','2025-06-10 10:38:05'),(2,'High speed WiFi','fal fa-wifi','published','2025-06-10 10:38:05','2025-06-10 10:38:05'),(3,'Strong Locker','fal fa-key','published','2025-06-10 10:38:05','2025-06-10 10:38:05'),(4,'Breakfast','fal fa-cut','published','2025-06-10 10:38:05','2025-06-10 10:38:05'),(5,'Kitchen','fal fa-guitar','published','2025-06-10 10:38:05','2025-06-10 10:38:05'),(6,'Smart Security','fal fa-lock','published','2025-06-10 10:38:05','2025-06-10 10:38:05'),(7,'Cleaning','fal fa-broom','published','2025-06-10 10:38:05','2025-06-10 10:38:05'),(8,'Shower','fal fa-shower','published','2025-06-10 10:38:05','2025-06-10 10:38:05'),(9,'24/7 Online Support','fal fa-headphones-alt','published','2025-06-10 10:38:05','2025-06-10 10:38:05'),(10,'Grocery','fal fa-shopping-basket','published','2025-06-10 10:38:05','2025-06-10 10:38:05'),(11,'Single bed','fal fa-bed','published','2025-06-10 10:38:05','2025-06-10 10:38:05'),(12,'Expert Team','fal fa-users','published','2025-06-10 10:38:05','2025-06-10 10:38:05'),(13,'Shop near','fal fa-shopping-cart','published','2025-06-10 10:38:05','2025-06-10 10:38:05'),(14,'Towels','fal fa-bus','published','2025-06-10 10:38:05','2025-06-10 10:38:05');
/*!40000 ALTER TABLE `ht_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_amenities_translations`
--

DROP TABLE IF EXISTS `ht_amenities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_amenities_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_amenities_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_amenities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_amenities_translations`
--

LOCK TABLES `ht_amenities_translations` WRITE;
/*!40000 ALTER TABLE `ht_amenities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_amenities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_booking_addresses`
--

DROP TABLE IF EXISTS `ht_booking_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_booking_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_booking_addresses`
--

LOCK TABLES `ht_booking_addresses` WRITE;
/*!40000 ALTER TABLE `ht_booking_addresses` DISABLE KEYS */;
INSERT INTO `ht_booking_addresses` VALUES (1,'Casimir','Funk','+1.754.567.5667','dstrosin@example.com','Moldova','Fannyland','Parisianfort','35699-7084','9632 Billie Expressway Suite 180\nRosarioborough, UT 35665-9603',1,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(2,'Marjolaine','Bernier','281-223-4818','oschumm@example.org','China','East Selena','Lake Roystad','13071','2274 Feest Park Apt. 302\nElbertmouth, NJ 77642-5919',2,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(3,'Sherwood','Gleichner','1-934-748-0153','kozey.bradly@example.net','Western Sahara','West Maximemouth','Mathiasside','66779','2401 Haag Freeway Apt. 213\nNikolausfurt, NY 13625',3,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(4,'Macy','Weissnat','+1-443-966-6107','qyundt@example.net','Philippines','Tristonland','Hansenshire','49456-1282','15271 Andreanne Stream\nHagenesborough, OH 81013',4,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(5,'Xander','Huel','(272) 843-3649','anderson.evan@example.org','Armenia','New Ken','West Berthamouth','82936','35301 Retha Port Suite 624\nWest Enrico, OH 39497-9975',5,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(6,'Trystan','Goyette','+1-702-626-0326','jconroy@example.net','Cote d\'Ivoire','Stantonbury','West Estefania','45316-3089','8248 Faustino Parkways\nCarterfurt, TX 55688',6,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(7,'Jarred','Hagenes','239-629-0034','halie58@example.com','Ghana','New Delbertview','East Alexysmouth','04160-9498','59664 Mossie Corners\nPort Evie, WY 19066',7,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(8,'Sheila','Larkin','1-928-953-7135','mittie10@example.net','Armenia','North Vincenzoview','Douglasshire','50046-7209','4084 Renner Throughway Suite 496\nWeimannbury, UT 93704',8,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(9,'Macy','Pfannerstill','+1.551.310.4816','barrows.macie@example.net','Philippines','Amyaberg','Katharinatown','52191','6121 Turner Ports Apt. 181\nPort Kelsifurt, IN 86924-4468',9,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(10,'Verlie','Kerluke','(618) 523-7693','charley95@example.net','Hong Kong','Port Krystinaland','Port Loma','49835','7958 Paolo Shore\nD\'Amoreville, MT 86834-7107',10,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(11,'Helen','Herman','+1.513.967.1990','wmayer@example.net','Reunion','Harberbury','Maybellfurt','22443-2993','5100 Modesto Place\nAmiyaborough, WY 96145',11,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(12,'Yasmine','Smith','(786) 303-9245','taya06@example.net','United Kingdom','Lake Constance','Roobport','05626','616 Schuppe Oval\nWeberborough, DC 22254-9155',12,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(13,'Laverna','Torp','(701) 502-4984','guillermo35@example.com','San Marino','New Helena','Nataliaside','79385','4310 Loyal Glens Suite 541\nSouth Pamela, GA 53368',13,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(14,'Jameson','Veum','+12154912528','hermann.emery@example.org','Cambodia','West Jamarcushaven','Sidbury','08455-3458','4662 Harvey Fort Apt. 419\nWesttown, CT 11062',14,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(15,'Michel','White','1-732-546-0609','greyson05@example.com','Austria','Ratkemouth','Coltside','27833-9503','45855 Kihn Cove Suite 728\nClaudberg, SD 15951-0092',15,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(16,'Christ','Franecki','+1 (269) 988-7056','ward.deven@example.org','Christmas Island','McKenzieport','Baumbachshire','49800','5835 Steve Branch Apt. 855\nWest Margarettberg, VT 65568-4625',16,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(17,'Euna','Emmerich','+1-559-668-2876','bbayer@example.org','Antarctica (the territory South of 60 deg S)','New Edd','Doyleside','64902-2574','86768 Ova Glen Apt. 416\nEast Marlenville, DC 80561-7193',17,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(18,'Keegan','Jakubowski','630.809.8006','walter.axel@example.net','Tuvalu','Bednarstad','Oberbrunnershire','56168-4410','108 Yasmeen Road\nPort Ashlynnburgh, AZ 53799-8716',18,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(19,'Bryce','Ortiz','1-270-878-9119','schulist.houston@example.org','Christmas Island','Port Orin','West Elliebury','56532','19337 Alicia Mountain Suite 688\nWest Nasir, CA 07483-9329',19,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(20,'Aglae','Schaefer','412-238-9570','crona.leonor@example.net','Cyprus','West Leann','West Connor','99518-9178','33853 Hessel Trail Apt. 820\nOlsonborough, HI 96590',20,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(21,'Maye','Hickle','(435) 952-4341','madeline.feeney@example.org','Romania','South Jamil','Streichbury','56633-2752','3189 Rosa Terrace Apt. 804\nBergeport, DC 61743-5310',21,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(22,'Iliana','Lockman','470-675-9697','javonte.goodwin@example.com','Mauritius','West Nickolas','Jovanyfort','44482-0888','61168 Margret Village Suite 328\nLeannonton, IL 61379',22,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(23,'Emil','Kovacek','+1-517-492-3523','wcronin@example.net','Sweden','Emardville','Gracieton','47005','376 Everette Stravenue\nOrtizview, IA 36343',23,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(24,'Caleb','Wisoky','678.868.9849','natalia85@example.net','Latvia','Gusikowskifort','Brandyfurt','06627-0608','4353 Jerde Lake\nMillieview, MN 21204-6963',24,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(25,'Myles','Lakin','(760) 821-5497','ptowne@example.org','Tajikistan','Lake Jordon','South Pattie','12642','9028 Ottilie Lakes Suite 910\nSouth Piercetown, NH 91108-0719',25,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(26,'Theresia','Considine','440.881.1888','rowland95@example.org','South Africa','Sigurdtown','Heathcoteshire','94458-8276','872 Meagan Extensions\nEast Catalina, SD 04642-4761',26,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(27,'Jermain','Skiles','534-689-5272','qkreiger@example.org','Vanuatu','Manleyfort','Kautzerview','91393','1403 Cronin Orchard\nWest Newton, IA 98860-0983',27,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(28,'Eulah','Parisian','+1-309-956-9096','carolyne.frami@example.com','Iraq','Nicolasfurt','South Ashtynport','26775','1259 Hermiston Light\nEast Melody, CA 94449',28,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(29,'Laury','Olson','+1 (832) 922-9000','rstehr@example.net','Algeria','East Edgarstad','East Leanne','22969','784 Mallory Hollow Suite 548\nEast Neha, MN 32521-7551',29,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(30,'Delbert','Schumm','+17143973980','trenton78@example.net','Tonga','Lake Luciemouth','North Chelsie','09051','683 Tyler Mission\nDiamondmouth, NM 90951-4328',30,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(31,'Marisa','Reynolds','1-812-638-0897','henri.koss@example.com','Greenland','North Keithfurt','South Justine','51992','236 August Manors Suite 022\nSouth Jenniferview, UT 53324',31,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(32,'Newell','Crist','+1.351.280.3200','luettgen.bradly@example.com','Ecuador','New Destinybury','Beierton','92240','3480 Ollie Mission Apt. 311\nSummermouth, OH 92600-0830',32,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(33,'Estelle','Bauch','541-931-7609','ruben46@example.org','Heard Island and McDonald Islands','Jonesville','East Dakota','76670-8728','9349 Marquis Ridges\nRoxanneport, MT 26901-3659',33,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(34,'Nedra','Kuvalis','240-257-9600','favian.shanahan@example.net','Myanmar','Cummerataberg','West Narcisoville','69713-8564','1848 Howell Walks\nRooseveltfurt, MT 10004',34,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(35,'Marcelle','Bauch','1-346-423-6405','fay.krajcik@example.org','Chile','New Jasperstad','Rennershire','60810-9408','615 Pamela Hill Suite 074\nBlockport, VA 46881',35,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(36,'Jennings','Trantow','484.767.2191','xsmitham@example.net','Congo','West Gideon','Maribelton','01454-3390','2596 Webster Ramp\nWest Erynport, AR 24624-0862',36,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(37,'Dena','Rosenbaum','+1-269-298-8978','kub.teresa@example.org','Cambodia','Adelafort','Lake Patience','71644-9761','965 Wiza Street\nPort Nathen, MI 87012',37,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(38,'Monserrat','O\'Connell','775.300.9588','rath.elna@example.net','Angola','Tanyamouth','Harberberg','03799-3235','448 Joannie Harbors Suite 163\nToyhaven, NE 54303',38,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(39,'Haylie','Kerluke','479-923-7562','hklocko@example.com','Sri Lanka','East Nevafort','Lake Maia','62547-1273','778 Barrows Mount Apt. 447\nSouth Adrianna, AL 58539-2086',39,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(40,'Daniela','Bins','1-716-643-8260','raynor.norwood@example.com','Nigeria','Ludwigmouth','Deckowborough','59440','27256 Spinka Club\nBoehmmouth, TX 51147',40,'2025-06-10 10:38:25','2025-06-10 10:38:25');
/*!40000 ALTER TABLE `ht_booking_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_booking_foods`
--

DROP TABLE IF EXISTS `ht_booking_foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_booking_foods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `food_id` bigint unsigned NOT NULL,
  `quantity` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ht_booking_foods_booking_id_food_id_unique` (`booking_id`,`food_id`),
  KEY `ht_booking_foods_booking_id_index` (`booking_id`),
  KEY `ht_booking_foods_food_id_index` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_booking_foods`
--

LOCK TABLES `ht_booking_foods` WRITE;
/*!40000 ALTER TABLE `ht_booking_foods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_booking_foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_booking_rooms`
--

DROP TABLE IF EXISTS `ht_booking_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_booking_rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned DEFAULT NULL,
  `room_image` text COLLATE utf8mb4_unicode_ci,
  `room_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `number_of_rooms` int NOT NULL DEFAULT '1',
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_booking_rooms`
--

LOCK TABLES `ht_booking_rooms` WRITE;
/*!40000 ALTER TABLE `ht_booking_rooms` DISABLE KEYS */;
INSERT INTO `ht_booking_rooms` VALUES (1,1,1,'rooms/01.jpg','Luxury Hall Of Fame',134.00,NULL,1,'2025-05-27','2025-05-29','2025-06-10 10:38:22','2025-06-10 10:38:22'),(2,2,2,'rooms/02.jpg','Pendora Fame',171.00,NULL,1,'2025-05-28','2025-05-31','2025-06-10 10:38:22','2025-06-10 10:38:22'),(3,3,8,'rooms/02.jpg','President Room',199.00,NULL,3,'2025-05-29','2025-06-01','2025-06-10 10:38:22','2025-06-10 10:38:22'),(4,4,4,'rooms/04.jpg','Junior Suite',114.00,NULL,3,'2025-05-30','2025-06-01','2025-06-10 10:38:22','2025-06-10 10:38:22'),(5,5,3,'rooms/03.jpg','Pacific Room',187.00,NULL,1,'2025-05-31','2025-06-03','2025-06-10 10:38:22','2025-06-10 10:38:22'),(6,6,6,'rooms/06.jpg','Relax Suite',157.00,NULL,1,'2025-06-01','2025-06-03','2025-06-10 10:38:22','2025-06-10 10:38:22'),(7,7,8,'rooms/02.jpg','President Room',199.00,NULL,2,'2025-06-02','2025-06-06','2025-06-10 10:38:22','2025-06-10 10:38:22'),(8,8,7,'rooms/01.jpg','Luxury Suite',155.00,NULL,2,'2025-06-03','2025-06-05','2025-06-10 10:38:22','2025-06-10 10:38:22'),(9,9,8,'rooms/02.jpg','President Room',199.00,NULL,3,'2025-06-04','2025-06-07','2025-06-10 10:38:22','2025-06-10 10:38:22'),(10,10,8,'rooms/02.jpg','President Room',199.00,NULL,1,'2025-06-05','2025-06-09','2025-06-10 10:38:23','2025-06-10 10:38:23'),(11,11,8,'rooms/02.jpg','President Room',199.00,NULL,3,'2025-06-06','2025-06-08','2025-06-10 10:38:23','2025-06-10 10:38:23'),(12,12,6,'rooms/06.jpg','Relax Suite',157.00,NULL,1,'2025-06-07','2025-06-09','2025-06-10 10:38:23','2025-06-10 10:38:23'),(13,13,6,'rooms/06.jpg','Relax Suite',157.00,NULL,3,'2025-06-08','2025-06-11','2025-06-10 10:38:23','2025-06-10 10:38:23'),(14,14,4,'rooms/04.jpg','Junior Suite',114.00,NULL,1,'2025-06-09','2025-06-12','2025-06-10 10:38:23','2025-06-10 10:38:23'),(15,15,2,'rooms/02.jpg','Pendora Fame',171.00,NULL,1,'2025-06-10','2025-06-13','2025-06-10 10:38:23','2025-06-10 10:38:23'),(16,16,4,'rooms/04.jpg','Junior Suite',114.00,NULL,2,'2025-06-11','2025-06-13','2025-06-10 10:38:23','2025-06-10 10:38:23'),(17,17,4,'rooms/04.jpg','Junior Suite',114.00,NULL,2,'2025-06-12','2025-06-14','2025-06-10 10:38:23','2025-06-10 10:38:23'),(18,18,4,'rooms/04.jpg','Junior Suite',114.00,NULL,1,'2025-06-13','2025-06-16','2025-06-10 10:38:23','2025-06-10 10:38:23'),(19,19,5,'rooms/05.jpg','Family Suite',137.00,NULL,2,'2025-06-14','2025-06-17','2025-06-10 10:38:23','2025-06-10 10:38:23'),(20,20,3,'rooms/03.jpg','Pacific Room',187.00,NULL,2,'2025-06-15','2025-06-19','2025-06-10 10:38:24','2025-06-10 10:38:24'),(21,21,1,'rooms/01.jpg','Luxury Hall Of Fame',134.00,NULL,1,'2025-06-16','2025-06-19','2025-06-10 10:38:24','2025-06-10 10:38:24'),(22,22,3,'rooms/03.jpg','Pacific Room',187.00,NULL,2,'2025-06-17','2025-06-19','2025-06-10 10:38:24','2025-06-10 10:38:24'),(23,23,8,'rooms/02.jpg','President Room',199.00,NULL,1,'2025-06-18','2025-06-21','2025-06-10 10:38:24','2025-06-10 10:38:24'),(24,24,3,'rooms/03.jpg','Pacific Room',187.00,NULL,1,'2025-06-19','2025-06-23','2025-06-10 10:38:24','2025-06-10 10:38:24'),(25,25,6,'rooms/06.jpg','Relax Suite',157.00,NULL,3,'2025-06-20','2025-06-22','2025-06-10 10:38:24','2025-06-10 10:38:24'),(26,26,7,'rooms/01.jpg','Luxury Suite',155.00,NULL,3,'2025-06-21','2025-06-23','2025-06-10 10:38:24','2025-06-10 10:38:24'),(27,27,5,'rooms/05.jpg','Family Suite',137.00,NULL,3,'2025-06-22','2025-06-25','2025-06-10 10:38:24','2025-06-10 10:38:24'),(28,28,3,'rooms/03.jpg','Pacific Room',187.00,NULL,2,'2025-06-23','2025-06-26','2025-06-10 10:38:24','2025-06-10 10:38:24'),(29,29,1,'rooms/01.jpg','Luxury Hall Of Fame',134.00,NULL,2,'2025-06-24','2025-06-27','2025-06-10 10:38:24','2025-06-10 10:38:24'),(30,30,3,'rooms/03.jpg','Pacific Room',187.00,NULL,2,'2025-06-25','2025-06-28','2025-06-10 10:38:24','2025-06-10 10:38:24'),(31,31,7,'rooms/01.jpg','Luxury Suite',155.00,NULL,1,'2025-06-26','2025-06-30','2025-06-10 10:38:25','2025-06-10 10:38:25'),(32,32,4,'rooms/04.jpg','Junior Suite',114.00,NULL,3,'2025-06-27','2025-07-01','2025-06-10 10:38:25','2025-06-10 10:38:25'),(33,33,2,'rooms/02.jpg','Pendora Fame',171.00,NULL,2,'2025-06-28','2025-07-02','2025-06-10 10:38:25','2025-06-10 10:38:25'),(34,34,4,'rooms/04.jpg','Junior Suite',114.00,NULL,2,'2025-06-29','2025-07-03','2025-06-10 10:38:25','2025-06-10 10:38:25'),(35,35,3,'rooms/03.jpg','Pacific Room',187.00,NULL,2,'2025-06-30','2025-07-02','2025-06-10 10:38:25','2025-06-10 10:38:25'),(36,36,6,'rooms/06.jpg','Relax Suite',157.00,NULL,2,'2025-07-01','2025-07-03','2025-06-10 10:38:25','2025-06-10 10:38:25'),(37,37,1,'rooms/01.jpg','Luxury Hall Of Fame',134.00,NULL,3,'2025-07-02','2025-07-06','2025-06-10 10:38:25','2025-06-10 10:38:25'),(38,38,5,'rooms/05.jpg','Family Suite',137.00,NULL,1,'2025-07-03','2025-07-07','2025-06-10 10:38:25','2025-06-10 10:38:25'),(39,39,2,'rooms/02.jpg','Pendora Fame',171.00,NULL,2,'2025-07-04','2025-07-06','2025-06-10 10:38:25','2025-06-10 10:38:25'),(40,40,8,'rooms/02.jpg','President Room',199.00,NULL,1,'2025-07-05','2025-07-08','2025-06-10 10:38:25','2025-06-10 10:38:25');
/*!40000 ALTER TABLE `ht_booking_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_booking_services`
--

DROP TABLE IF EXISTS `ht_booking_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_booking_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` bigint unsigned NOT NULL,
  `service_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_booking_services`
--

LOCK TABLES `ht_booking_services` WRITE;
/*!40000 ALTER TABLE `ht_booking_services` DISABLE KEYS */;
INSERT INTO `ht_booking_services` VALUES (1,1,5),(2,2,1),(3,3,1),(4,4,1),(5,5,2),(6,6,5),(7,7,4),(8,8,2),(9,9,5),(10,10,6),(11,11,6),(12,12,6),(13,13,6),(14,14,6),(15,15,5),(16,16,3),(17,17,1),(18,18,4),(19,19,4),(20,20,6),(21,21,5),(22,22,6),(23,23,4),(24,24,1),(25,25,4),(26,26,3),(27,27,6),(28,28,6),(29,29,5),(30,30,4),(31,31,2),(32,32,3),(33,33,4),(34,34,4),(35,35,5),(36,36,2),(37,37,6),(38,38,6),(39,39,2),(40,40,2);
/*!40000 ALTER TABLE `ht_booking_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_bookings`
--

DROP TABLE IF EXISTS `ht_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `coupon_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `requests` text COLLATE utf8mb4_unicode_ci,
  `arrival_time` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_guests` int DEFAULT NULL,
  `number_of_children` int NOT NULL DEFAULT '0',
  `payment_id` bigint unsigned DEFAULT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `transaction_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ht_bookings_booking_number_unique` (`booking_number`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_bookings`
--

LOCK TABLES `ht_bookings` WRITE;
/*!40000 ALTER TABLE `ht_bookings` DISABLE KEYS */;
INSERT INTO `ht_bookings` VALUES (1,NULL,134.00,134.00,0.00,NULL,0.00,NULL,'A facilis tempore repudiandae omnis numquam autem.',NULL,3,0,1,3,'BibwSyea6zHzYupQjKqz','processing','2025-06-10 10:38:22','2025-06-10 10:38:22'),(2,NULL,171.00,171.00,0.00,NULL,0.00,NULL,'Ut quo dolorum reprehenderit est magnam id.',NULL,3,0,2,3,'ksFXYxqoAkJ8NoI45uMl','completed','2025-06-10 10:38:22','2025-06-10 10:38:22'),(3,NULL,597.00,597.00,0.00,NULL,0.00,NULL,'Quasi ea eius hic delectus temporibus.',NULL,6,0,3,8,'yrzmOunetEyTFUuLeLNt','pending','2025-06-10 10:38:22','2025-06-10 10:38:22'),(4,NULL,342.00,342.00,0.00,NULL,0.00,NULL,'Ea recusandae ex officia quasi.',NULL,9,0,4,4,'8Jd5BcOPDShCYkM3IjEp','pending','2025-06-10 10:38:22','2025-06-10 10:38:22'),(5,NULL,187.00,187.00,0.00,NULL,0.00,NULL,'Sit quasi iusto nulla hic suscipit.',NULL,1,0,5,7,'L5UkSX7uhs6tUB9wZ9gr','cancelled','2025-06-10 10:38:22','2025-06-10 10:38:22'),(6,NULL,157.00,157.00,0.00,NULL,0.00,NULL,'Voluptatem corrupti beatae fuga iste.',NULL,1,0,6,6,'SFJhq6BfGcSwNKE5LQrg','pending','2025-06-10 10:38:22','2025-06-10 10:38:22'),(7,NULL,398.00,398.00,0.00,NULL,0.00,NULL,'Qui magnam dicta at sapiente voluptas eos at.',NULL,2,0,7,9,'mlDzEmaoFiIiMpyT8y9n','cancelled','2025-06-10 10:38:22','2025-06-10 10:38:22'),(8,NULL,310.00,310.00,0.00,NULL,0.00,NULL,'Sunt ipsa perferendis quam eveniet et provident perspiciatis id.',NULL,6,0,8,2,'8GCd58ieSnHb0lkigbZ2','cancelled','2025-06-10 10:38:22','2025-06-10 10:38:22'),(9,NULL,597.00,597.00,0.00,NULL,0.00,NULL,'Sapiente nobis quo distinctio eaque.',NULL,3,0,9,3,'PhZkt7MYdOM0Q5rzCzYc','cancelled','2025-06-10 10:38:22','2025-06-10 10:38:22'),(10,NULL,199.00,199.00,0.00,NULL,0.00,NULL,'Eaque possimus perspiciatis tenetur alias laudantium amet.',NULL,1,0,10,9,'K9g8XXfrGQH4pvWUN0Gl','cancelled','2025-06-10 10:38:22','2025-06-10 10:38:23'),(11,NULL,597.00,597.00,0.00,NULL,0.00,NULL,'Voluptas dignissimos in repudiandae.',NULL,9,0,11,7,'79z3OBkuoos0QtAnSICN','completed','2025-06-10 10:38:23','2025-06-10 10:38:23'),(12,NULL,157.00,157.00,0.00,NULL,0.00,NULL,'Quos nulla voluptatem quis temporibus.',NULL,2,0,12,11,'MXvq14WcJHZvCxpklBx9','cancelled','2025-06-10 10:38:23','2025-06-10 10:38:23'),(13,NULL,471.00,471.00,0.00,NULL,0.00,NULL,'Ad fugiat aliquam odio voluptas.',NULL,6,0,13,1,'OkuDA9k3NwkGv0ECctsq','completed','2025-06-10 10:38:23','2025-06-10 10:38:23'),(14,NULL,114.00,114.00,0.00,NULL,0.00,NULL,'Aut assumenda qui amet nulla.',NULL,1,0,14,5,'BRlYQi76kPUck8vCWDhg','pending','2025-06-10 10:38:23','2025-06-10 10:38:23'),(15,NULL,171.00,171.00,0.00,NULL,0.00,NULL,'Nostrum similique quidem enim et temporibus.',NULL,1,0,15,10,'yTGFzlFI8X8tvUBzIqF6','pending','2025-06-10 10:38:23','2025-06-10 10:38:23'),(16,NULL,228.00,228.00,0.00,NULL,0.00,NULL,'Eos sapiente omnis ut odit dolorem nostrum.',NULL,6,0,16,2,'aanqbIiAaxXVzvqEZRP5','cancelled','2025-06-10 10:38:23','2025-06-10 10:38:23'),(17,NULL,228.00,228.00,0.00,NULL,0.00,NULL,'Assumenda asperiores provident culpa nam reiciendis voluptatem voluptate.',NULL,2,0,17,4,'3js9hf3AukBASskaiTM1','pending','2025-06-10 10:38:23','2025-06-10 10:38:23'),(18,NULL,114.00,114.00,0.00,NULL,0.00,NULL,'Reprehenderit sit nihil minima quis assumenda delectus.',NULL,1,0,18,5,'AkK7lnebJUsfdXl6YNqr','cancelled','2025-06-10 10:38:23','2025-06-10 10:38:23'),(19,NULL,274.00,274.00,0.00,NULL,0.00,NULL,'Consequuntur id quidem distinctio.',NULL,4,0,19,11,'SuWmf5LJGxO6767CCVT9','processing','2025-06-10 10:38:23','2025-06-10 10:38:23'),(20,NULL,374.00,374.00,0.00,NULL,0.00,NULL,'Minus nihil blanditiis maiores mollitia id voluptatum ut.',NULL,6,0,20,8,'Ynbyi0t6wlrzN6eD0XAQ','completed','2025-06-10 10:38:23','2025-06-10 10:38:24'),(21,NULL,134.00,134.00,0.00,NULL,0.00,NULL,'Voluptas sit facere et veritatis et blanditiis omnis et.',NULL,1,0,21,4,'MqhgIT30hEXbWu1rsYkW','cancelled','2025-06-10 10:38:24','2025-06-10 10:38:24'),(22,NULL,374.00,374.00,0.00,NULL,0.00,NULL,'Ut ex unde sit est consequatur veritatis et quam.',NULL,4,0,22,11,'j5qiUu1ROHX4JTG4q51K','cancelled','2025-06-10 10:38:24','2025-06-10 10:38:24'),(23,NULL,199.00,199.00,0.00,NULL,0.00,NULL,'Aut voluptas libero aut explicabo.',NULL,3,0,23,5,'Q4ZH8SjUx1LKO5vQPx29','completed','2025-06-10 10:38:24','2025-06-10 10:38:24'),(24,NULL,187.00,187.00,0.00,NULL,0.00,NULL,'Cupiditate sit vel delectus asperiores iste vel quibusdam.',NULL,3,0,24,2,'KHq7zwlUwmn81JC6w3Eb','pending','2025-06-10 10:38:24','2025-06-10 10:38:24'),(25,NULL,471.00,471.00,0.00,NULL,0.00,NULL,'Voluptatem dignissimos magnam occaecati porro vel voluptatem.',NULL,9,0,25,8,'a471GuEzq3qB4r3iD5Gu','completed','2025-06-10 10:38:24','2025-06-10 10:38:24'),(26,NULL,465.00,465.00,0.00,NULL,0.00,NULL,'Inventore pariatur laboriosam modi ex.',NULL,9,0,26,11,'sQLZ5xPADgajbvccs52q','completed','2025-06-10 10:38:24','2025-06-10 10:38:24'),(27,NULL,411.00,411.00,0.00,NULL,0.00,NULL,'Aperiam eos dolor suscipit consequatur sequi dolor.',NULL,6,0,27,7,'U0T0amKRvN5d5GQkIMup','processing','2025-06-10 10:38:24','2025-06-10 10:38:24'),(28,NULL,374.00,374.00,0.00,NULL,0.00,NULL,'Illo molestiae labore et odio rerum et explicabo.',NULL,2,0,28,3,'d9igzwXK8b1lquEdj1b1','processing','2025-06-10 10:38:24','2025-06-10 10:38:24'),(29,NULL,268.00,268.00,0.00,NULL,0.00,NULL,'Hic aspernatur veniam illum itaque dolorum nulla vel.',NULL,6,0,29,1,'noFV7t0oj5skjm3QrjZx','processing','2025-06-10 10:38:24','2025-06-10 10:38:24'),(30,NULL,374.00,374.00,0.00,NULL,0.00,NULL,'Architecto voluptates vel et pariatur.',NULL,2,0,30,6,'23kuWm0jYWaPtVFqNnEt','cancelled','2025-06-10 10:38:24','2025-06-10 10:38:24'),(31,NULL,155.00,155.00,0.00,NULL,0.00,NULL,'Ullam quasi recusandae eius aut aut.',NULL,2,0,31,3,'1kpVZ1TAL5MVpWIgQ932','pending','2025-06-10 10:38:25','2025-06-10 10:38:25'),(32,NULL,342.00,342.00,0.00,NULL,0.00,NULL,'Omnis aut eum ipsam soluta excepturi ut.',NULL,3,0,32,10,'rd40efCtCSMvqSmdMtD0','completed','2025-06-10 10:38:25','2025-06-10 10:38:25'),(33,NULL,342.00,342.00,0.00,NULL,0.00,NULL,'Nihil nostrum quod illo.',NULL,4,0,33,11,'0VjiMKqLFbqmm1qOesb3','pending','2025-06-10 10:38:25','2025-06-10 10:38:25'),(34,NULL,228.00,228.00,0.00,NULL,0.00,NULL,'Voluptas quasi dolor dolorem et.',NULL,6,0,34,10,'yPYoj9am6js9MLWucDbT','pending','2025-06-10 10:38:25','2025-06-10 10:38:25'),(35,NULL,374.00,374.00,0.00,NULL,0.00,NULL,'Repudiandae aspernatur est vitae velit provident odio saepe.',NULL,4,0,35,2,'gcnga9RCHvONYrTgTjnz','processing','2025-06-10 10:38:25','2025-06-10 10:38:25'),(36,NULL,314.00,314.00,0.00,NULL,0.00,NULL,'Est impedit dolorem occaecati nemo ipsa non molestias nisi.',NULL,6,0,36,7,'qDGhM0SYPjqBpCzKiq7p','pending','2025-06-10 10:38:25','2025-06-10 10:38:25'),(37,NULL,402.00,402.00,0.00,NULL,0.00,NULL,'Nihil tempore id voluptatum aut sit dolores.',NULL,6,0,37,1,'aV5znS8RyYu29htRa9fH','completed','2025-06-10 10:38:25','2025-06-10 10:38:25'),(38,NULL,137.00,137.00,0.00,NULL,0.00,NULL,'Et expedita quod quo neque aut voluptatibus.',NULL,3,0,38,5,'rYU4s6TEOEHPwpDjWN6X','processing','2025-06-10 10:38:25','2025-06-10 10:38:25'),(39,NULL,342.00,342.00,0.00,NULL,0.00,NULL,'Nulla consectetur tempora quia.',NULL,6,0,39,3,'XOEu2iTUOncLzNSwxvxo','processing','2025-06-10 10:38:25','2025-06-10 10:38:25'),(40,NULL,199.00,199.00,0.00,NULL,0.00,NULL,'Explicabo aliquam ut consequatur maiores.',NULL,3,0,40,2,'aqrx91CpURTcsEUBxuJN','cancelled','2025-06-10 10:38:25','2025-06-10 10:38:25');
/*!40000 ALTER TABLE `ht_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_coupons`
--

DROP TABLE IF EXISTS `ht_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ht_coupons_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_coupons`
--

LOCK TABLES `ht_coupons` WRITE;
/*!40000 ALTER TABLE `ht_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_currencies`
--

DROP TABLE IF EXISTS `ht_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_currencies`
--

LOCK TABLES `ht_currencies` WRITE;
/*!40000 ALTER TABLE `ht_currencies` DISABLE KEYS */;
INSERT INTO `ht_currencies` VALUES (1,'USD','$',1,2,0,1,1,'2025-06-10 10:38:04','2025-06-10 10:38:04'),(2,'EUR','€',0,2,1,0,0.91,'2025-06-10 10:38:04','2025-06-10 10:38:04'),(3,'VND','₫',0,0,2,0,23717.5,'2025-06-10 10:38:04','2025-06-10 10:38:04');
/*!40000 ALTER TABLE `ht_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_customer_password_resets`
--

DROP TABLE IF EXISTS `ht_customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_customer_password_resets`
--

LOCK TABLES `ht_customer_password_resets` WRITE;
/*!40000 ALTER TABLE `ht_customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_customers`
--

DROP TABLE IF EXISTS `ht_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ht_customers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_customers`
--

LOCK TABLES `ht_customers` WRITE;
/*!40000 ALTER TABLE `ht_customers` DISABLE KEYS */;
INSERT INTO `ht_customers` VALUES (1,'Dee','Cartwright','harvey.cornell@example.org','$2y$12$wTlthCqYX1G1oWHAceM79eg5PNF7MRPZKDLVheet..rCS11uK6Ah.','customers/1.jpg',NULL,'+18569736910',NULL,NULL,NULL,NULL,NULL,'2025-06-10 10:38:10','2025-06-10 10:38:10',NULL,NULL),(2,'Frederique','Ward','ernser.zola@example.com','$2y$12$DVhDdUakPZqp/1gh39w61uagHroYhwPD6WSKlHt105hZwF8FPoYB.','customers/2.jpg',NULL,'+16233651314',NULL,NULL,NULL,NULL,NULL,'2025-06-10 10:38:10','2025-06-10 10:38:10',NULL,NULL),(3,'Brett','Feeney','heidenreich.zackary@example.com','$2y$12$96M0y2NA9YdRjKQzNNjjOeUuEtvDbS4VJaWWVeen6j1TPyvBDLYTa','customers/3.jpg',NULL,'+19103939895',NULL,NULL,NULL,NULL,NULL,'2025-06-10 10:38:10','2025-06-10 10:38:10',NULL,NULL),(4,'Antonetta','Jacobson','ebert.kamren@example.net','$2y$12$uqcFhiQsyo6g4p8LUsb8t.GcM04Idmv1QrVkyVkQQNCeRc9.1jx1i','customers/4.jpg',NULL,'+18456053324',NULL,NULL,NULL,NULL,NULL,'2025-06-10 10:38:10','2025-06-10 10:38:10',NULL,NULL),(5,'Hollis','Greenfelder','tdaniel@example.net','$2y$12$pfD5pqC/fZiceKojqSmJ8OQCwNY0r4PC/1/oYuLLmapLHr9OFTmYm','customers/5.jpg',NULL,'+17405177831',NULL,NULL,NULL,NULL,NULL,'2025-06-10 10:38:10','2025-06-10 10:38:10',NULL,NULL),(6,'Heloise','Cummings','lvonrueden@example.com','$2y$12$QcH8BmZI2Rm6rWY0X9TLEOmtECNbZhmLjIcoYGN.c/e8WUaZl6Nia','customers/6.jpg',NULL,'+14844429500',NULL,NULL,NULL,NULL,NULL,'2025-06-10 10:38:10','2025-06-10 10:38:10',NULL,NULL),(7,'Filomena','Pollich','ylind@example.net','$2y$12$HUXuM4MFC70/wc3/W1Tsl.bICE0G9HVKwFrISkBr8.kj51h.pw8Pa','customers/7.jpg',NULL,'+15599802066',NULL,NULL,NULL,NULL,NULL,'2025-06-10 10:38:10','2025-06-10 10:38:10',NULL,NULL),(8,'Maegan','Maggio','ryan.pink@example.com','$2y$12$cRqdFwhIRfbVUwHo2tKj1.Vlo2UUqhQwZTtKtfhT.10SrKmW7VvpO','customers/8.jpg',NULL,'+12192352196',NULL,NULL,NULL,NULL,NULL,'2025-06-10 10:38:10','2025-06-10 10:38:10',NULL,NULL),(9,'Keven','Luettgen','marianne16@example.com','$2y$12$VzvM7q3jkeBqi3BNO2PjrOSwt3zSuR.JTKYyt9SSWUoaY3aFxSAHO','customers/9.jpg',NULL,'+16102509968',NULL,NULL,NULL,NULL,NULL,'2025-06-10 10:38:10','2025-06-10 10:38:10',NULL,NULL),(10,'Deshaun','Bruen','prohaska.evans@example.com','$2y$12$brTr7bO0TJnGzuoeu3VSb.b57msDZXdnT7fpLhWpobmVVFhwi7zd6','customers/10.jpg',NULL,'+18473000096',NULL,NULL,NULL,NULL,NULL,'2025-06-10 10:38:10','2025-06-10 10:38:10',NULL,NULL),(11,'Irma','Thompson','customer@archielite.com','$2y$12$geHuwJvFIiKjYjiYRd7DE.2e3Q1b/tTrxxfwSwPZHWNfcTD95YHl2','customers/6.jpg',NULL,'+15867586057',NULL,NULL,NULL,NULL,NULL,'2025-06-10 10:38:10','2025-06-10 10:38:10',NULL,NULL);
/*!40000 ALTER TABLE `ht_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_features`
--

DROP TABLE IF EXISTS `ht_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_features`
--

LOCK TABLES `ht_features` WRITE;
/*!40000 ALTER TABLE `ht_features` DISABLE KEYS */;
INSERT INTO `ht_features` VALUES (1,'Have High Rating','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-rating',1,'published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(2,'Quiet Hours','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-clock',1,'published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(3,'Best Locations','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-location-pin',1,'published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(4,'Free Cancellation','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-clock-1',0,'published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(5,'Payment Options','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-credit-card',0,'published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(6,'Special Offers','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','flaticon-discount',0,'published','2025-06-10 10:38:07','2025-06-10 10:38:07');
/*!40000 ALTER TABLE `ht_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_features_translations`
--

DROP TABLE IF EXISTS `ht_features_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_features_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_features_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_features_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_features_translations`
--

LOCK TABLES `ht_features_translations` WRITE;
/*!40000 ALTER TABLE `ht_features_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_features_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_food_types`
--

DROP TABLE IF EXISTS `ht_food_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_food_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_food_types`
--

LOCK TABLES `ht_food_types` WRITE;
/*!40000 ALTER TABLE `ht_food_types` DISABLE KEYS */;
INSERT INTO `ht_food_types` VALUES (1,'Chicken','flaticon-boiled','published','2025-06-10 10:38:06','2025-06-10 10:38:06'),(2,'Italian','flaticon-pizza','published','2025-06-10 10:38:06','2025-06-10 10:38:06'),(3,'Coffee','flaticon-coffee','published','2025-06-10 10:38:06','2025-06-10 10:38:06'),(4,'Bake Cake','flaticon-cake','published','2025-06-10 10:38:06','2025-06-10 10:38:06'),(5,'Cookies','flaticon-cookie','published','2025-06-10 10:38:06','2025-06-10 10:38:06'),(6,'Cocktail','flaticon-cocktail','published','2025-06-10 10:38:06','2025-06-10 10:38:06');
/*!40000 ALTER TABLE `ht_food_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_food_types_translations`
--

DROP TABLE IF EXISTS `ht_food_types_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_food_types_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_food_types_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ht_food_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_food_types_translations`
--

LOCK TABLES `ht_food_types_translations` WRITE;
/*!40000 ALTER TABLE `ht_food_types_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_food_types_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_foods`
--

DROP TABLE IF EXISTS `ht_foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_foods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `price` decimal(15,0) unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `food_type_id` bigint unsigned NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_foods`
--

LOCK TABLES `ht_foods` WRITE;
/*!40000 ALTER TABLE `ht_foods` DISABLE KEYS */;
INSERT INTO `ht_foods` VALUES (1,'Eggs &amp; Bacon','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,188,NULL,1,'foods/01.jpg','published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(2,'Tea or Coffee','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,199,NULL,1,'foods/02.jpg','published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(3,'Chia Oatmeal','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,187,NULL,1,'foods/03.jpg','published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(4,'Juice','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,139,NULL,1,'foods/04.jpg','published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(5,'Chia Oatmeal','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,195,NULL,2,'foods/05.jpg','published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(6,'Fruit Parfait','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,130,NULL,2,'foods/06.jpg','published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(7,'Marmalade Selection','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,168,NULL,3,'foods/07.jpg','published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(8,'Cheese Platen','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,155,NULL,4,'foods/08.jpg','published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(9,'Avocado Toast','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,119,NULL,5,'foods/09.jpg','published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(10,'Avocado Toast','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.',NULL,165,NULL,6,'foods/10.jpg','published','2025-06-10 10:38:07','2025-06-10 10:38:07');
/*!40000 ALTER TABLE `ht_foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_foods_translations`
--

DROP TABLE IF EXISTS `ht_foods_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_foods_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_foods_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_foods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_foods_translations`
--

LOCK TABLES `ht_foods_translations` WRITE;
/*!40000 ALTER TABLE `ht_foods_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_foods_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_ical_sync_logs`
--

DROP TABLE IF EXISTS `ht_ical_sync_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_ical_sync_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint unsigned NOT NULL,
  `calendar_id` bigint unsigned DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ht_ical_sync_logs_room_id_index` (`room_id`),
  KEY `ht_ical_sync_logs_calendar_id_index` (`calendar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_ical_sync_logs`
--

LOCK TABLES `ht_ical_sync_logs` WRITE;
/*!40000 ALTER TABLE `ht_ical_sync_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_ical_sync_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_invoice_items`
--

DROP TABLE IF EXISTS `ht_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_invoice_items`
--

LOCK TABLES `ht_invoice_items` WRITE;
/*!40000 ALTER TABLE `ht_invoice_items` DISABLE KEYS */;
INSERT INTO `ht_invoice_items` VALUES (1,1,'Luxury Hall Of Fame','',1,134.00,0.00,0.00,134.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(2,1,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(3,2,'Pendora Fame','',1,171.00,0.00,0.00,171.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(4,2,'Quality Room (extra service)','',1,100.00,0.00,0.00,100.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(5,3,'President Room','',1,199.00,0.00,0.00,199.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(6,3,'Quality Room (extra service)','',1,100.00,0.00,0.00,100.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(7,4,'Junior Suite','',1,114.00,0.00,0.00,114.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(8,4,'Quality Room (extra service)','',1,100.00,0.00,0.00,100.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(9,5,'Pacific Room','',1,187.00,0.00,0.00,187.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(10,5,'Privet Beach (extra service)','',1,30.00,0.00,0.00,30.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(11,6,'Relax Suite','',1,157.00,0.00,0.00,157.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(12,6,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(13,7,'President Room','',1,199.00,0.00,0.00,199.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(14,7,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(15,8,'Luxury Suite','',1,155.00,0.00,0.00,155.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(16,8,'Privet Beach (extra service)','',1,30.00,0.00,0.00,30.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(17,9,'President Room','',1,199.00,0.00,0.00,199.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(18,9,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(19,10,'President Room','',1,199.00,0.00,0.00,199.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(20,10,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(21,11,'President Room','',1,199.00,0.00,0.00,199.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(22,11,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(23,12,'Relax Suite','',1,157.00,0.00,0.00,157.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(24,12,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(25,13,'Relax Suite','',1,157.00,0.00,0.00,157.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(26,13,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(27,14,'Junior Suite','',1,114.00,0.00,0.00,114.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(28,14,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(29,15,'Pendora Fame','',1,171.00,0.00,0.00,171.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(30,15,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(31,16,'Junior Suite','',1,114.00,0.00,0.00,114.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(32,16,'Best Accommodation (extra service)','',1,50.00,0.00,0.00,50.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(33,17,'Junior Suite','',1,114.00,0.00,0.00,114.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(34,17,'Quality Room (extra service)','',1,100.00,0.00,0.00,100.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(35,18,'Junior Suite','',1,114.00,0.00,0.00,114.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(36,18,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(37,19,'Family Suite','',1,137.00,0.00,0.00,137.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(38,19,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(39,20,'Pacific Room','',1,187.00,0.00,0.00,187.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(40,20,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(41,21,'Luxury Hall Of Fame','',1,134.00,0.00,0.00,134.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(42,21,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(43,22,'Pacific Room','',1,187.00,0.00,0.00,187.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(44,22,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(45,23,'President Room','',1,199.00,0.00,0.00,199.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(46,23,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(47,24,'Pacific Room','',1,187.00,0.00,0.00,187.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(48,24,'Quality Room (extra service)','',1,100.00,0.00,0.00,100.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(49,25,'Relax Suite','',1,157.00,0.00,0.00,157.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(50,25,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(51,26,'Luxury Suite','',1,155.00,0.00,0.00,155.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(52,26,'Best Accommodation (extra service)','',1,50.00,0.00,0.00,50.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(53,27,'Family Suite','',1,137.00,0.00,0.00,137.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(54,27,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(55,28,'Pacific Room','',1,187.00,0.00,0.00,187.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(56,28,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(57,29,'Luxury Hall Of Fame','',1,134.00,0.00,0.00,134.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(58,29,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(59,30,'Pacific Room','',1,187.00,0.00,0.00,187.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(60,30,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(61,31,'Luxury Suite','',1,155.00,0.00,0.00,155.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(62,31,'Privet Beach (extra service)','',1,30.00,0.00,0.00,30.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(63,32,'Junior Suite','',1,114.00,0.00,0.00,114.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(64,32,'Best Accommodation (extra service)','',1,50.00,0.00,0.00,50.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(65,33,'Pendora Fame','',1,171.00,0.00,0.00,171.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(66,33,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(67,34,'Junior Suite','',1,114.00,0.00,0.00,114.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(68,34,'Wellness &amp; Spa (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(69,35,'Pacific Room','',1,187.00,0.00,0.00,187.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(70,35,'Restaurants &amp; Bars (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(71,36,'Relax Suite','',1,157.00,0.00,0.00,157.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(72,36,'Privet Beach (extra service)','',1,30.00,0.00,0.00,30.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(73,37,'Luxury Hall Of Fame','',1,134.00,0.00,0.00,134.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(74,37,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(75,38,'Family Suite','',1,137.00,0.00,0.00,137.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(76,38,'Special Offers (extra service)','',1,10.00,0.00,0.00,10.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(77,39,'Pendora Fame','',1,171.00,0.00,0.00,171.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(78,39,'Privet Beach (extra service)','',1,30.00,0.00,0.00,30.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(79,40,'President Room','',1,199.00,0.00,0.00,199.00,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(80,40,'Privet Beach (extra service)','',1,30.00,0.00,0.00,30.00,'2025-06-10 10:38:25','2025-06-10 10:38:25');
/*!40000 ALTER TABLE `ht_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_invoices`
--

DROP TABLE IF EXISTS `ht_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ht_invoices_code_unique` (`code`),
  KEY `ht_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `ht_invoices_payment_id_index` (`payment_id`),
  KEY `ht_invoices_status_index` (`status`),
  KEY `ht_invoices_customer_id_index` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_invoices`
--

LOCK TABLES `ht_invoices` WRITE;
/*!40000 ALTER TABLE `ht_invoices` DISABLE KEYS */;
INSERT INTO `ht_invoices` VALUES (1,3,'CasimirFunk','dstrosin@example.com','+1.754.567.5667','9632 Billie Expressway Suite 180\nRosarioborough, UT 35665-9603, Parisianfort, Fannyland, Moldova, 35699-7084, ','A facilis tempore repudiandae omnis numquam autem.',1,'Botble\\Hotel\\Models\\Booking',1,'INV-1',134.00,0.00,0.00,134.00,'canceled',NULL,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(2,3,'MarjolaineBernier','oschumm@example.org','281-223-4818','2274 Feest Park Apt. 302\nElbertmouth, NJ 77642-5919, Lake Roystad, East Selena, China, 13071, ','Ut quo dolorum reprehenderit est magnam id.',2,'Botble\\Hotel\\Models\\Booking',2,'INV-2',171.00,0.00,0.00,171.00,'canceled',NULL,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(3,8,'SherwoodGleichner','kozey.bradly@example.net','1-934-748-0153','2401 Haag Freeway Apt. 213\nNikolausfurt, NY 13625, Mathiasside, West Maximemouth, Western Sahara, 66779, ','Quasi ea eius hic delectus temporibus.',3,'Botble\\Hotel\\Models\\Booking',3,'INV-3',597.00,0.00,0.00,597.00,'canceled',NULL,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(4,4,'MacyWeissnat','qyundt@example.net','+1-443-966-6107','15271 Andreanne Stream\nHagenesborough, OH 81013, Hansenshire, Tristonland, Philippines, 49456-1282, ','Ea recusandae ex officia quasi.',4,'Botble\\Hotel\\Models\\Booking',4,'INV-4',342.00,0.00,0.00,342.00,'pending',NULL,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(5,7,'XanderHuel','anderson.evan@example.org','(272) 843-3649','35301 Retha Port Suite 624\nWest Enrico, OH 39497-9975, West Berthamouth, New Ken, Armenia, 82936, ','Sit quasi iusto nulla hic suscipit.',5,'Botble\\Hotel\\Models\\Booking',5,'INV-5',187.00,0.00,0.00,187.00,'canceled',NULL,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(6,6,'TrystanGoyette','jconroy@example.net','+1-702-626-0326','8248 Faustino Parkways\nCarterfurt, TX 55688, West Estefania, Stantonbury, Cote d\'Ivoire, 45316-3089, ','Voluptatem corrupti beatae fuga iste.',6,'Botble\\Hotel\\Models\\Booking',6,'INV-6',157.00,0.00,0.00,157.00,'completed','2025-06-10 10:38:22','2025-06-10 10:38:22','2025-06-10 10:38:22'),(7,9,'JarredHagenes','halie58@example.com','239-629-0034','59664 Mossie Corners\nPort Evie, WY 19066, East Alexysmouth, New Delbertview, Ghana, 04160-9498, ','Qui magnam dicta at sapiente voluptas eos at.',7,'Botble\\Hotel\\Models\\Booking',7,'INV-7',398.00,0.00,0.00,398.00,'canceled',NULL,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(8,2,'SheilaLarkin','mittie10@example.net','1-928-953-7135','4084 Renner Throughway Suite 496\nWeimannbury, UT 93704, Douglasshire, North Vincenzoview, Armenia, 50046-7209, ','Sunt ipsa perferendis quam eveniet et provident perspiciatis id.',8,'Botble\\Hotel\\Models\\Booking',8,'INV-8',310.00,0.00,0.00,310.00,'completed',NULL,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(9,3,'MacyPfannerstill','barrows.macie@example.net','+1.551.310.4816','6121 Turner Ports Apt. 181\nPort Kelsifurt, IN 86924-4468, Katharinatown, Amyaberg, Philippines, 52191, ','Sapiente nobis quo distinctio eaque.',9,'Botble\\Hotel\\Models\\Booking',9,'INV-9',597.00,0.00,0.00,597.00,'canceled',NULL,'2025-06-10 10:38:22','2025-06-10 10:38:22'),(10,9,'VerlieKerluke','charley95@example.net','(618) 523-7693','7958 Paolo Shore\nD\'Amoreville, MT 86834-7107, Port Loma, Port Krystinaland, Hong Kong, 49835, ','Eaque possimus perspiciatis tenetur alias laudantium amet.',10,'Botble\\Hotel\\Models\\Booking',10,'INV-10',199.00,0.00,0.00,199.00,'pending',NULL,'2025-06-10 10:38:22','2025-06-10 10:38:23'),(11,7,'HelenHerman','wmayer@example.net','+1.513.967.1990','5100 Modesto Place\nAmiyaborough, WY 96145, Maybellfurt, Harberbury, Reunion, 22443-2993, ','Voluptas dignissimos in repudiandae.',11,'Botble\\Hotel\\Models\\Booking',11,'INV-11',597.00,0.00,0.00,597.00,'canceled',NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(12,11,'YasmineSmith','taya06@example.net','(786) 303-9245','616 Schuppe Oval\nWeberborough, DC 22254-9155, Roobport, Lake Constance, United Kingdom, 05626, ','Quos nulla voluptatem quis temporibus.',12,'Botble\\Hotel\\Models\\Booking',12,'INV-12',157.00,0.00,0.00,157.00,'canceled',NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(13,1,'LavernaTorp','guillermo35@example.com','(701) 502-4984','4310 Loyal Glens Suite 541\nSouth Pamela, GA 53368, Nataliaside, New Helena, San Marino, 79385, ','Ad fugiat aliquam odio voluptas.',13,'Botble\\Hotel\\Models\\Booking',13,'INV-13',471.00,0.00,0.00,471.00,'completed',NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(14,5,'JamesonVeum','hermann.emery@example.org','+12154912528','4662 Harvey Fort Apt. 419\nWesttown, CT 11062, Sidbury, West Jamarcushaven, Cambodia, 08455-3458, ','Aut assumenda qui amet nulla.',14,'Botble\\Hotel\\Models\\Booking',14,'INV-14',114.00,0.00,0.00,114.00,'pending',NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(15,10,'MichelWhite','greyson05@example.com','1-732-546-0609','45855 Kihn Cove Suite 728\nClaudberg, SD 15951-0092, Coltside, Ratkemouth, Austria, 27833-9503, ','Nostrum similique quidem enim et temporibus.',15,'Botble\\Hotel\\Models\\Booking',15,'INV-15',171.00,0.00,0.00,171.00,'canceled',NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(16,2,'ChristFranecki','ward.deven@example.org','+1 (269) 988-7056','5835 Steve Branch Apt. 855\nWest Margarettberg, VT 65568-4625, Baumbachshire, McKenzieport, Christmas Island, 49800, ','Eos sapiente omnis ut odit dolorem nostrum.',16,'Botble\\Hotel\\Models\\Booking',16,'INV-16',228.00,0.00,0.00,228.00,'canceled',NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(17,4,'EunaEmmerich','bbayer@example.org','+1-559-668-2876','86768 Ova Glen Apt. 416\nEast Marlenville, DC 80561-7193, Doyleside, New Edd, Antarctica (the territory South of 60 deg S), 64902-2574, ','Assumenda asperiores provident culpa nam reiciendis voluptatem voluptate.',17,'Botble\\Hotel\\Models\\Booking',17,'INV-17',228.00,0.00,0.00,228.00,'canceled',NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(18,5,'KeeganJakubowski','walter.axel@example.net','630.809.8006','108 Yasmeen Road\nPort Ashlynnburgh, AZ 53799-8716, Oberbrunnershire, Bednarstad, Tuvalu, 56168-4410, ','Reprehenderit sit nihil minima quis assumenda delectus.',18,'Botble\\Hotel\\Models\\Booking',18,'INV-18',114.00,0.00,0.00,114.00,'canceled',NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(19,11,'BryceOrtiz','schulist.houston@example.org','1-270-878-9119','19337 Alicia Mountain Suite 688\nWest Nasir, CA 07483-9329, West Elliebury, Port Orin, Christmas Island, 56532, ','Consequuntur id quidem distinctio.',19,'Botble\\Hotel\\Models\\Booking',19,'INV-19',274.00,0.00,0.00,274.00,'canceled',NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23'),(20,8,'AglaeSchaefer','crona.leonor@example.net','412-238-9570','33853 Hessel Trail Apt. 820\nOlsonborough, HI 96590, West Connor, West Leann, Cyprus, 99518-9178, ','Minus nihil blanditiis maiores mollitia id voluptatum ut.',20,'Botble\\Hotel\\Models\\Booking',20,'INV-20',374.00,0.00,0.00,374.00,'canceled',NULL,'2025-06-10 10:38:23','2025-06-10 10:38:24'),(21,4,'MayeHickle','madeline.feeney@example.org','(435) 952-4341','3189 Rosa Terrace Apt. 804\nBergeport, DC 61743-5310, Streichbury, South Jamil, Romania, 56633-2752, ','Voluptas sit facere et veritatis et blanditiis omnis et.',21,'Botble\\Hotel\\Models\\Booking',21,'INV-21',134.00,0.00,0.00,134.00,'canceled',NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(22,11,'IlianaLockman','javonte.goodwin@example.com','470-675-9697','61168 Margret Village Suite 328\nLeannonton, IL 61379, Jovanyfort, West Nickolas, Mauritius, 44482-0888, ','Ut ex unde sit est consequatur veritatis et quam.',22,'Botble\\Hotel\\Models\\Booking',22,'INV-22',374.00,0.00,0.00,374.00,'canceled',NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(23,5,'EmilKovacek','wcronin@example.net','+1-517-492-3523','376 Everette Stravenue\nOrtizview, IA 36343, Gracieton, Emardville, Sweden, 47005, ','Aut voluptas libero aut explicabo.',23,'Botble\\Hotel\\Models\\Booking',23,'INV-23',199.00,0.00,0.00,199.00,'canceled',NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(24,2,'CalebWisoky','natalia85@example.net','678.868.9849','4353 Jerde Lake\nMillieview, MN 21204-6963, Brandyfurt, Gusikowskifort, Latvia, 06627-0608, ','Cupiditate sit vel delectus asperiores iste vel quibusdam.',24,'Botble\\Hotel\\Models\\Booking',24,'INV-24',187.00,0.00,0.00,187.00,'canceled',NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(25,8,'MylesLakin','ptowne@example.org','(760) 821-5497','9028 Ottilie Lakes Suite 910\nSouth Piercetown, NH 91108-0719, South Pattie, Lake Jordon, Tajikistan, 12642, ','Voluptatem dignissimos magnam occaecati porro vel voluptatem.',25,'Botble\\Hotel\\Models\\Booking',25,'INV-25',471.00,0.00,0.00,471.00,'canceled',NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(26,11,'TheresiaConsidine','rowland95@example.org','440.881.1888','872 Meagan Extensions\nEast Catalina, SD 04642-4761, Heathcoteshire, Sigurdtown, South Africa, 94458-8276, ','Inventore pariatur laboriosam modi ex.',26,'Botble\\Hotel\\Models\\Booking',26,'INV-26',465.00,0.00,0.00,465.00,'canceled',NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(27,7,'JermainSkiles','qkreiger@example.org','534-689-5272','1403 Cronin Orchard\nWest Newton, IA 98860-0983, Kautzerview, Manleyfort, Vanuatu, 91393, ','Aperiam eos dolor suscipit consequatur sequi dolor.',27,'Botble\\Hotel\\Models\\Booking',27,'INV-27',411.00,0.00,0.00,411.00,'canceled',NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(28,3,'EulahParisian','carolyne.frami@example.com','+1-309-956-9096','1259 Hermiston Light\nEast Melody, CA 94449, South Ashtynport, Nicolasfurt, Iraq, 26775, ','Illo molestiae labore et odio rerum et explicabo.',28,'Botble\\Hotel\\Models\\Booking',28,'INV-28',374.00,0.00,0.00,374.00,'pending',NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(29,1,'LauryOlson','rstehr@example.net','+1 (832) 922-9000','784 Mallory Hollow Suite 548\nEast Neha, MN 32521-7551, East Leanne, East Edgarstad, Algeria, 22969, ','Hic aspernatur veniam illum itaque dolorum nulla vel.',29,'Botble\\Hotel\\Models\\Booking',29,'INV-29',268.00,0.00,0.00,268.00,'pending',NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(30,6,'DelbertSchumm','trenton78@example.net','+17143973980','683 Tyler Mission\nDiamondmouth, NM 90951-4328, North Chelsie, Lake Luciemouth, Tonga, 09051, ','Architecto voluptates vel et pariatur.',30,'Botble\\Hotel\\Models\\Booking',30,'INV-30',374.00,0.00,0.00,374.00,'pending',NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24'),(31,3,'MarisaReynolds','henri.koss@example.com','1-812-638-0897','236 August Manors Suite 022\nSouth Jenniferview, UT 53324, South Justine, North Keithfurt, Greenland, 51992, ','Ullam quasi recusandae eius aut aut.',31,'Botble\\Hotel\\Models\\Booking',31,'INV-31',155.00,0.00,0.00,155.00,'canceled',NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(32,10,'NewellCrist','luettgen.bradly@example.com','+1.351.280.3200','3480 Ollie Mission Apt. 311\nSummermouth, OH 92600-0830, Beierton, New Destinybury, Ecuador, 92240, ','Omnis aut eum ipsam soluta excepturi ut.',32,'Botble\\Hotel\\Models\\Booking',32,'INV-32',342.00,0.00,0.00,342.00,'pending',NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(33,11,'EstelleBauch','ruben46@example.org','541-931-7609','9349 Marquis Ridges\nRoxanneport, MT 26901-3659, East Dakota, Jonesville, Heard Island and McDonald Islands, 76670-8728, ','Nihil nostrum quod illo.',33,'Botble\\Hotel\\Models\\Booking',33,'INV-33',342.00,0.00,0.00,342.00,'canceled',NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(34,10,'NedraKuvalis','favian.shanahan@example.net','240-257-9600','1848 Howell Walks\nRooseveltfurt, MT 10004, West Narcisoville, Cummerataberg, Myanmar, 69713-8564, ','Voluptas quasi dolor dolorem et.',34,'Botble\\Hotel\\Models\\Booking',34,'INV-34',228.00,0.00,0.00,228.00,'pending',NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(35,2,'MarcelleBauch','fay.krajcik@example.org','1-346-423-6405','615 Pamela Hill Suite 074\nBlockport, VA 46881, Rennershire, New Jasperstad, Chile, 60810-9408, ','Repudiandae aspernatur est vitae velit provident odio saepe.',35,'Botble\\Hotel\\Models\\Booking',35,'INV-35',374.00,0.00,0.00,374.00,'pending',NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(36,7,'JenningsTrantow','xsmitham@example.net','484.767.2191','2596 Webster Ramp\nWest Erynport, AR 24624-0862, Maribelton, West Gideon, Congo, 01454-3390, ','Est impedit dolorem occaecati nemo ipsa non molestias nisi.',36,'Botble\\Hotel\\Models\\Booking',36,'INV-36',314.00,0.00,0.00,314.00,'canceled',NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(37,1,'DenaRosenbaum','kub.teresa@example.org','+1-269-298-8978','965 Wiza Street\nPort Nathen, MI 87012, Lake Patience, Adelafort, Cambodia, 71644-9761, ','Nihil tempore id voluptatum aut sit dolores.',37,'Botble\\Hotel\\Models\\Booking',37,'INV-37',402.00,0.00,0.00,402.00,'canceled',NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(38,5,'MonserratO\'Connell','rath.elna@example.net','775.300.9588','448 Joannie Harbors Suite 163\nToyhaven, NE 54303, Harberberg, Tanyamouth, Angola, 03799-3235, ','Et expedita quod quo neque aut voluptatibus.',38,'Botble\\Hotel\\Models\\Booking',38,'INV-38',137.00,0.00,0.00,137.00,'canceled',NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(39,3,'HaylieKerluke','hklocko@example.com','479-923-7562','778 Barrows Mount Apt. 447\nSouth Adrianna, AL 58539-2086, Lake Maia, East Nevafort, Sri Lanka, 62547-1273, ','Nulla consectetur tempora quia.',39,'Botble\\Hotel\\Models\\Booking',39,'INV-39',342.00,0.00,0.00,342.00,'completed',NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25'),(40,2,'DanielaBins','raynor.norwood@example.com','1-716-643-8260','27256 Spinka Club\nBoehmmouth, TX 51147, Deckowborough, Ludwigmouth, Nigeria, 59440, ','Explicabo aliquam ut consequatur maiores.',40,'Botble\\Hotel\\Models\\Booking',40,'INV-40',199.00,0.00,0.00,199.00,'canceled',NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25');
/*!40000 ALTER TABLE `ht_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_places`
--

DROP TABLE IF EXISTS `ht_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_places` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_places`
--

LOCK TABLES `ht_places` WRITE;
/*!40000 ALTER TABLE `ht_places` DISABLE KEYS */;
INSERT INTO `ht_places` VALUES (1,'Duplex Restaurant','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/01.jpg','published','2025-06-10 10:38:11','2025-06-10 10:38:11'),(2,'Overnight Bars','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/02.jpg','published','2025-06-10 10:38:11','2025-06-10 10:38:11'),(3,'Beautiful Beach','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/03.jpg','published','2025-06-10 10:38:11','2025-06-10 10:38:11'),(4,'Beautiful Spa','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/04.jpg','published','2025-06-10 10:38:11','2025-06-10 10:38:11'),(5,'Duplex Golf','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/05.jpg','published','2025-06-10 10:38:11','2025-06-10 10:38:11'),(6,'Luxury Restaurant','1,500m | 21 min. Walk',NULL,'<div class=\"nearby-attractions\">\n    <div class=\"content-box\">\n        <h2>Explore the Nearby Attractions</h2>\n        <p>Indulge in the beauty and flavors of the local area, where breathtaking sights and delightful cuisine await you. Allow us to present an overview of the splendid attractions you can experience during your stay.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/01.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/02.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Relax at the Beach</h3>\n\n        <p>Unwind and soak in the serenity of the pristine beach just steps away from our hotel. The soft sand, gentle waves, and stunning horizon create an idyllic setting for you to rejuvenate your senses. Whether you\'re lounging under the sun or taking a leisurely stroll, the beach offers a tranquil escape from the daily hustle and bustle.</p>\n\n        <h3>Dine at the Finest Restaurant</h3>\n\n        <p>Embark on a culinary journey at the finest local restaurant that is a true gem in our neighborhood. Savor a diverse array of mouthwatering dishes meticulously crafted by skilled chefs. From delectable appetizers to sumptuous main courses and decadent desserts, every bite is a celebration of flavor and creativity. The cozy ambiance and attentive service enhance the overall dining experience.</p>\n\n        <p>Whether you\'re a food enthusiast or a nature lover, our hotel\'s location provides you with the best of both worlds. Immerse yourself in the captivating beauty of the beach and treat your taste buds to an unforgettable dining experience. Your stay with us is bound to be filled with wonderful memories that you\'ll cherish for years to come.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/places/03.jpg\" alt=\"RioRelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <p>For those seeking more adventure, a nearby scenic spot offers breathtaking views that will leave you in awe. The harmonious blend of nature\'s grandeur and artistic beauty makes this spot a perfect place to capture stunning photographs and create lasting memories.</p>\n\n        <p>Immerse yourself in the local culture, indulge in the delights of the area, and let your senses guide you as you explore the wonders just beyond our doorstep.</p>\n    </div>\n</div>\n','places/06.jpg','published','2025-06-10 10:38:11','2025-06-10 10:38:11');
/*!40000 ALTER TABLE `ht_places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_places_translations`
--

DROP TABLE IF EXISTS `ht_places_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_places_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_places_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_places_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_places_translations`
--

LOCK TABLES `ht_places_translations` WRITE;
/*!40000 ALTER TABLE `ht_places_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_places_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_calendars`
--

DROP TABLE IF EXISTS `ht_room_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_calendars` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_synced_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ht_room_calendars_room_id_index` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_calendars`
--

LOCK TABLES `ht_room_calendars` WRITE;
/*!40000 ALTER TABLE `ht_room_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_room_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_categories`
--

DROP TABLE IF EXISTS `ht_room_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_categories`
--

LOCK TABLES `ht_room_categories` WRITE;
/*!40000 ALTER TABLE `ht_room_categories` DISABLE KEYS */;
INSERT INTO `ht_room_categories` VALUES (1,'Luxury','published','2025-06-10 10:38:05','2025-06-10 10:38:05',0,1),(2,'Family','published','2025-06-10 10:38:05','2025-06-10 10:38:05',0,1),(3,'Double Bed','published','2025-06-10 10:38:05','2025-06-10 10:38:05',0,1),(4,'Relax','published','2025-06-10 10:38:05','2025-06-10 10:38:05',0,1);
/*!40000 ALTER TABLE `ht_room_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_categories_translations`
--

DROP TABLE IF EXISTS `ht_room_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_room_categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ht_room_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_categories_translations`
--

LOCK TABLES `ht_room_categories_translations` WRITE;
/*!40000 ALTER TABLE `ht_room_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_room_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_dates`
--

DROP TABLE IF EXISTS `ht_room_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_dates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint unsigned DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `value` decimal(15,2) DEFAULT NULL,
  `value_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `max_guests` tinyint DEFAULT NULL,
  `active` tinyint DEFAULT '0',
  `note_to_customer` text COLLATE utf8mb4_unicode_ci,
  `note_to_admin` text COLLATE utf8mb4_unicode_ci,
  `number_of_rooms` smallint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_dates`
--

LOCK TABLES `ht_room_dates` WRITE;
/*!40000 ALTER TABLE `ht_room_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_room_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_room_reviews`
--

DROP TABLE IF EXISTS `ht_room_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_room_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `room_id` int NOT NULL,
  `star` tinyint NOT NULL,
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_room_reviews`
--

LOCK TABLES `ht_room_reviews` WRITE;
/*!40000 ALTER TABLE `ht_room_reviews` DISABLE KEYS */;
INSERT INTO `ht_room_reviews` VALUES (1,9,7,5,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(2,9,1,5,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(3,10,3,4,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(4,5,1,4,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(5,8,1,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(6,8,4,4,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(7,4,3,5,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(8,7,1,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(9,5,5,5,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(10,5,1,4,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(11,6,1,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(12,3,7,5,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(13,2,1,5,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(14,1,7,5,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(15,8,3,4,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(16,1,8,4,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(17,8,7,5,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(18,6,3,4,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(19,6,3,4,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(20,5,2,4,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(21,1,2,4,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(22,1,6,4,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(23,9,7,5,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(24,2,2,4,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(25,10,2,4,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(26,4,6,4,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(27,11,6,5,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(28,9,5,4,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(29,10,8,5,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(30,2,6,4,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(31,4,8,4,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(32,3,5,4,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(33,8,1,4,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(34,5,8,4,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(35,11,8,5,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(36,7,4,4,'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(37,10,5,5,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(38,5,5,4,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(39,11,7,4,'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(40,3,7,5,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(41,9,4,5,'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(42,11,1,5,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(43,9,3,5,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(44,3,6,5,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(45,1,1,4,'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(46,3,1,4,'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(47,8,7,4,'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(48,5,8,4,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(49,7,8,4,'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25'),(50,5,2,4,'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.','approved','2025-06-10 10:38:25','2025-06-10 10:38:25');
/*!40000 ALTER TABLE `ht_room_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_rooms`
--

DROP TABLE IF EXISTS `ht_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(15,0) unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `number_of_rooms` int unsigned DEFAULT '0',
  `number_of_beds` int unsigned DEFAULT '0',
  `size` int unsigned DEFAULT '0',
  `max_adults` int DEFAULT '0',
  `max_children` int DEFAULT '0',
  `room_category_id` bigint unsigned DEFAULT NULL,
  `tax_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_rooms`
--

LOCK TABLES `ht_rooms` WRITE;
/*!40000 ALTER TABLE `ht_rooms` DISABLE KEYS */;
INSERT INTO `ht_rooms` VALUES (1,'Luxury Hall Of Fame','Our spacious room offers a cozy ambiance, modern amenities, and stunning city views.','<p>Understated seaside elegance, traditional grace, complemented by warm homely touches and pops of modern flair, Rest Detail Hotel Hua Hin\n    invites you to discover our exquisitely designed resort set in a peaceful enclave just out of Hua Hin town. A charming setting, spacious yet incredibly cozy rooms, luxurious two – four bedroom Pavilions with private swimming pools. Recreational facilities to help you relax, delicious local and European dishes delicately plated for you to taste, meticulously put together for you to have the perfect break.</p>\n<p>Experience tranquility by the shore. Our room offers a private balcony for mesmerizing sunsets, a king-sized bed with luxurious linens, a spa-inspired bathroom, and coastal-themed decor. Unwind to the sound of waves and relish in the ultimate seaside escape.</p>\n',0,'[\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',134,NULL,1,4,118,4,3,1,1,'published','2025-06-10 10:38:06','2025-06-10 10:38:06',0),(2,'Pendora Fame','Indulge in comfort with plush furnishings, a private balcony, and personalized service.','<p>Understated seaside elegance, traditional grace, complemented by warm homely touches and pops of modern flair, Rest Detail Hotel Hua Hin\n    invites you to discover our exquisitely designed resort set in a peaceful enclave just out of Hua Hin town. A charming setting, spacious yet incredibly cozy rooms, luxurious two – four bedroom Pavilions with private swimming pools. Recreational facilities to help you relax, delicious local and European dishes delicately plated for you to taste, meticulously put together for you to have the perfect break.</p>\n<p>Experience tranquility by the shore. Our room offers a private balcony for mesmerizing sunsets, a king-sized bed with luxurious linens, a spa-inspired bathroom, and coastal-themed decor. Unwind to the sound of waves and relish in the ultimate seaside escape.</p>\n',1,'[\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',171,NULL,7,2,126,2,3,1,1,'published','2025-06-10 10:38:06','2025-06-10 10:38:06',0),(3,'Pacific Room','Unwind in style amid soothing decor, a king-sized bed, and a rejuvenating rain shower.','<p>Understated seaside elegance, traditional grace, complemented by warm homely touches and pops of modern flair, Rest Detail Hotel Hua Hin\n    invites you to discover our exquisitely designed resort set in a peaceful enclave just out of Hua Hin town. A charming setting, spacious yet incredibly cozy rooms, luxurious two – four bedroom Pavilions with private swimming pools. Recreational facilities to help you relax, delicious local and European dishes delicately plated for you to taste, meticulously put together for you to have the perfect break.</p>\n<p>Experience tranquility by the shore. Our room offers a private balcony for mesmerizing sunsets, a king-sized bed with luxurious linens, a spa-inspired bathroom, and coastal-themed decor. Unwind to the sound of waves and relish in the ultimate seaside escape.</p>\n',1,'[\"rooms\\/03.jpg\",\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',187,NULL,1,4,186,4,3,1,1,'published','2025-06-10 10:38:06','2025-06-10 10:38:06',0),(4,'Junior Suite','Experience coastal charm in a room that overlooks the beach, complete with beach-inspired decor.','<p>Understated seaside elegance, traditional grace, complemented by warm homely touches and pops of modern flair, Rest Detail Hotel Hua Hin\n    invites you to discover our exquisitely designed resort set in a peaceful enclave just out of Hua Hin town. A charming setting, spacious yet incredibly cozy rooms, luxurious two – four bedroom Pavilions with private swimming pools. Recreational facilities to help you relax, delicious local and European dishes delicately plated for you to taste, meticulously put together for you to have the perfect break.</p>\n<p>Experience tranquility by the shore. Our room offers a private balcony for mesmerizing sunsets, a king-sized bed with luxurious linens, a spa-inspired bathroom, and coastal-themed decor. Unwind to the sound of waves and relish in the ultimate seaside escape.</p>\n',1,'[\"rooms\\/04.jpg\",\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',114,NULL,9,4,130,5,3,1,1,'published','2025-06-10 10:38:06','2025-06-10 10:38:06',0),(5,'Family Suite','Enjoy city living at its finest with contemporary design, high-end comforts, and easy access to attractions.','<p>Understated seaside elegance, traditional grace, complemented by warm homely touches and pops of modern flair, Rest Detail Hotel Hua Hin\n    invites you to discover our exquisitely designed resort set in a peaceful enclave just out of Hua Hin town. A charming setting, spacious yet incredibly cozy rooms, luxurious two – four bedroom Pavilions with private swimming pools. Recreational facilities to help you relax, delicious local and European dishes delicately plated for you to taste, meticulously put together for you to have the perfect break.</p>\n<p>Experience tranquility by the shore. Our room offers a private balcony for mesmerizing sunsets, a king-sized bed with luxurious linens, a spa-inspired bathroom, and coastal-themed decor. Unwind to the sound of waves and relish in the ultimate seaside escape.</p>\n',0,'[\"rooms\\/05.jpg\"]',137,NULL,5,1,127,2,1,1,1,'published','2025-06-10 10:38:06','2025-06-10 10:38:06',0),(6,'Relax Suite','A rustic escape featuring wooden accents, a fireplace, and large windows for panoramic views.','<p>Understated seaside elegance, traditional grace, complemented by warm homely touches and pops of modern flair, Rest Detail Hotel Hua Hin\n    invites you to discover our exquisitely designed resort set in a peaceful enclave just out of Hua Hin town. A charming setting, spacious yet incredibly cozy rooms, luxurious two – four bedroom Pavilions with private swimming pools. Recreational facilities to help you relax, delicious local and European dishes delicately plated for you to taste, meticulously put together for you to have the perfect break.</p>\n<p>Experience tranquility by the shore. Our room offers a private balcony for mesmerizing sunsets, a king-sized bed with luxurious linens, a spa-inspired bathroom, and coastal-themed decor. Unwind to the sound of waves and relish in the ultimate seaside escape.</p>\n',0,'[\"rooms\\/06.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/01.jpg\"]',157,NULL,5,1,116,3,1,4,1,'published','2025-06-10 10:38:06','2025-06-10 10:38:06',0),(7,'Luxury Suite','Ideal for families, this room boasts interconnected spaces, playful decor, and modern conveniences.','<p>Understated seaside elegance, traditional grace, complemented by warm homely touches and pops of modern flair, Rest Detail Hotel Hua Hin\n    invites you to discover our exquisitely designed resort set in a peaceful enclave just out of Hua Hin town. A charming setting, spacious yet incredibly cozy rooms, luxurious two – four bedroom Pavilions with private swimming pools. Recreational facilities to help you relax, delicious local and European dishes delicately plated for you to taste, meticulously put together for you to have the perfect break.</p>\n<p>Experience tranquility by the shore. Our room offers a private balcony for mesmerizing sunsets, a king-sized bed with luxurious linens, a spa-inspired bathroom, and coastal-themed decor. Unwind to the sound of waves and relish in the ultimate seaside escape.</p>\n',1,'[\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',155,NULL,1,2,180,4,2,4,1,'published','2025-06-10 10:38:06','2025-06-10 10:38:06',0),(8,'President Room','Ignite romance with a room designed for couples, featuring a four-poster bed and intimate lighting.','<p>Understated seaside elegance, traditional grace, complemented by warm homely touches and pops of modern flair, Rest Detail Hotel Hua Hin\n    invites you to discover our exquisitely designed resort set in a peaceful enclave just out of Hua Hin town. A charming setting, spacious yet incredibly cozy rooms, luxurious two – four bedroom Pavilions with private swimming pools. Recreational facilities to help you relax, delicious local and European dishes delicately plated for you to taste, meticulously put together for you to have the perfect break.</p>\n<p>Experience tranquility by the shore. Our room offers a private balcony for mesmerizing sunsets, a king-sized bed with luxurious linens, a spa-inspired bathroom, and coastal-themed decor. Unwind to the sound of waves and relish in the ultimate seaside escape.</p>\n',1,'[\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]',199,NULL,9,2,112,6,1,1,1,'published','2025-06-10 10:38:06','2025-06-10 10:38:06',0);
/*!40000 ALTER TABLE `ht_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_rooms_amenities`
--

DROP TABLE IF EXISTS `ht_rooms_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_rooms_amenities` (
  `amenity_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`amenity_id`,`room_id`),
  KEY `ht_rooms_amenities_amenity_id_index` (`amenity_id`),
  KEY `ht_rooms_amenities_room_id_index` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_rooms_amenities`
--

LOCK TABLES `ht_rooms_amenities` WRITE;
/*!40000 ALTER TABLE `ht_rooms_amenities` DISABLE KEYS */;
INSERT INTO `ht_rooms_amenities` VALUES (1,1,NULL,NULL),(1,2,NULL,NULL),(1,3,NULL,NULL),(1,5,NULL,NULL),(2,1,NULL,NULL),(2,2,NULL,NULL),(2,4,NULL,NULL),(2,5,NULL,NULL),(2,6,NULL,NULL),(2,7,NULL,NULL),(2,8,NULL,NULL),(3,1,NULL,NULL),(3,2,NULL,NULL),(3,5,NULL,NULL),(4,1,NULL,NULL),(4,2,NULL,NULL),(4,6,NULL,NULL),(4,7,NULL,NULL),(5,1,NULL,NULL),(5,2,NULL,NULL),(5,5,NULL,NULL),(5,7,NULL,NULL),(5,8,NULL,NULL),(6,1,NULL,NULL),(6,2,NULL,NULL),(6,4,NULL,NULL),(6,6,NULL,NULL),(7,1,NULL,NULL),(7,2,NULL,NULL),(7,4,NULL,NULL),(7,5,NULL,NULL),(7,6,NULL,NULL),(8,1,NULL,NULL),(8,6,NULL,NULL),(8,7,NULL,NULL),(8,8,NULL,NULL),(9,1,NULL,NULL),(9,2,NULL,NULL),(9,4,NULL,NULL),(9,6,NULL,NULL),(9,7,NULL,NULL),(9,8,NULL,NULL),(10,1,NULL,NULL),(10,2,NULL,NULL),(10,3,NULL,NULL),(11,1,NULL,NULL),(11,3,NULL,NULL),(11,5,NULL,NULL),(11,6,NULL,NULL),(11,7,NULL,NULL),(12,1,NULL,NULL),(12,3,NULL,NULL),(12,4,NULL,NULL),(12,5,NULL,NULL),(12,7,NULL,NULL),(12,8,NULL,NULL),(13,1,NULL,NULL),(13,2,NULL,NULL),(13,5,NULL,NULL),(13,6,NULL,NULL),(13,7,NULL,NULL),(14,2,NULL,NULL),(14,3,NULL,NULL),(14,4,NULL,NULL),(14,7,NULL,NULL);
/*!40000 ALTER TABLE `ht_rooms_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_rooms_translations`
--

DROP TABLE IF EXISTS `ht_rooms_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_rooms_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_rooms_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_rooms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_rooms_translations`
--

LOCK TABLES `ht_rooms_translations` WRITE;
/*!40000 ALTER TABLE `ht_rooms_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_rooms_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_services`
--

DROP TABLE IF EXISTS `ht_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `price` decimal(15,0) unsigned DEFAULT NULL,
  `price_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'once',
  `currency_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_services`
--

LOCK TABLES `ht_services` WRITE;
/*!40000 ALTER TABLE `ht_services` DISABLE KEYS */;
INSERT INTO `ht_services` VALUES (1,'Quality Room','Indulge in the epitome of comfort and style with our Quality Room. Immerse yourself in elegant furnishings, unwind in a plush bed, and enjoy modern amenities. From the private ensuite bathroom to the high-speed Wi-Fi, every detail is designed for your relaxation. Choose between city, garden, or pool views, and experience a retreat that embodies luxury and convenience.','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-3.png\" alt=\"Riorelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-2.png\" alt=\"Riorelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Why Choose This Service</h3>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <h3>We guarantee to deliver</h3>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-1.png\" alt=\"Riorelax\"></figure>\n                </div>\n            </div>\n        </div>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',100,'once',NULL,'amenities/icon-1.png','published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(2,'Privet Beach','Discover a world of exclusivity with our Private Beach Access service. Step onto a pristine shore reserved for our guests, where sun, sand, and waves meet ultimate tranquility. Lounge in comfortable beachside seating, enjoy dedicated service, and bask in the beauty of a secluded paradise.','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-3.png\" alt=\"Riorelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-2.png\" alt=\"Riorelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Why Choose This Service</h3>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <h3>We guarantee to deliver</h3>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-1.png\" alt=\"Riorelax\"></figure>\n                </div>\n            </div>\n        </div>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',30,'once',NULL,'amenities/icon-2.png','published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(3,'Best Accommodation','Experience the pinnacle of luxury with our Best Accommodation service. Immerse yourself in meticulously designed spaces that combine opulence and comfort. From elegant furnishings to cutting-edge amenities, every detail is curated to exceed your expectations.','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-3.png\" alt=\"Riorelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-2.png\" alt=\"Riorelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Why Choose This Service</h3>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <h3>We guarantee to deliver</h3>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-1.png\" alt=\"Riorelax\"></figure>\n                </div>\n            </div>\n        </div>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',50,'once',NULL,'amenities/icon-3.png','published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(4,'Wellness &amp; Spa','Embark on a journey of rejuvenation and self-care with our Wellness &amp; Spa service. Immerse yourself in a sanctuary of relaxation, where skilled therapists pamper you with a range of invigorating treatments.','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-3.png\" alt=\"Riorelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-2.png\" alt=\"Riorelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Why Choose This Service</h3>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <h3>We guarantee to deliver</h3>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-1.png\" alt=\"Riorelax\"></figure>\n                </div>\n            </div>\n        </div>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',10,'once',NULL,'amenities/icon-4.png','published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(5,'Restaurants &amp; Bars','Savor a world of flavors at our Restaurants &amp; Bars. Indulge in culinary delights crafted by talented chefs, offering a diverse range of cuisines to tantalize your taste buds. From elegant dining to vibrant social hubs, our venues provide a gastronomic journey paired with a selection of beverages that cater to every palate. .','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-3.png\" alt=\"Riorelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-2.png\" alt=\"Riorelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Why Choose This Service</h3>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <h3>We guarantee to deliver</h3>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-1.png\" alt=\"Riorelax\"></figure>\n                </div>\n            </div>\n        </div>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',10,'once',NULL,'amenities/icon-5.png','published','2025-06-10 10:38:07','2025-06-10 10:38:07'),(6,'Special Offers','Unlock unbeatable value with our Special Offers. Experience the luxury of Hotel at exceptional rates, whether you\'re planning a romantic getaway, a family vacation, or a business retreat. Our exclusive packages cater to every traveler\'s needs, providing an unforgettable stay enriched with added perks.','<div class=\"service-detail\">\n    <div class=\"content-box\">\n        <h2> We give the best Services </h2>\n        <p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p>\n\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-3.png\" alt=\"Riorelax\"></figure>\n                </div>\n                <div class=\"text-column col-xl-6 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-2.png\" alt=\"Riorelax\"></figure>\n                </div>\n            </div>\n        </div>\n\n        <h3>Why Choose This Service</h3>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely.</p>\n\n        <p>Complete account of the systems and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally.</p>\n        <h3>We guarantee to deliver</h3>\n        <p>Quam parturient mi amet curae augue varius laoreet vehicula non sem aliquet lectus justo litora fames estab phasellus risus ad sollicitudin magna Viverra diam pretium cursus curabitur parturient convallis hymenaeos suspendisse nibh facilisi purus penatibus habitasse mus orcine muscle adipiscing sapien aliquam nulla. Erat parturient auctor facilisis. Nisi cum fringilla hymenaeos ridiculus habitasses augue nullam fringilla. Taciti convallis. Vitae sapien nisi enim vis metus cras fusce lectus sed luctus quis Clas nisl blandit parturient molestie praesent nec</p>\n        <div class=\"two-column\">\n            <div class=\"row\">\n                <div class=\"image-column col-xl-12 col-lg-12 col-md-12\">\n                    <figure class=\"image\"><img src=\"http://localhost/storage/general/portfolio-1.png\" alt=\"Riorelax\"></figure>\n                </div>\n            </div>\n        </div>\n        <p>Phasellus hac phasellus consequat malesuada veler aliquam dictumst amet a phasellus lacinia integer curabitur duis. Urna taciti nisl torquent varius libero dui. Tempus magnis libero pulvinar purus pharetra justo sem curae duis eget tempus erat ornare. Consequat litora a blandit fermentum. Quam taciti site nascetur nunc litora quis tempor metus adipiscing ac quis sodales ultrices cubilia. Arcu in penatibus vestibulum diam. Curabitur platea quam fusce molestie venenatis platea ligula in aenean gravida dolor aptent nostra luctus rutrum morbi porttitor cursus</p>\n    </div>\n</div>\n',10,'once',NULL,'amenities/icon-6.png','published','2025-06-10 10:38:07','2025-06-10 10:38:07');
/*!40000 ALTER TABLE `ht_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_services_translations`
--

DROP TABLE IF EXISTS `ht_services_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_services_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ht_services_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ht_services_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_services_translations`
--

LOCK TABLES `ht_services_translations` WRITE;
/*!40000 ALTER TABLE `ht_services_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ht_services_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ht_taxes`
--

DROP TABLE IF EXISTS `ht_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ht_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ht_taxes`
--

LOCK TABLES `ht_taxes` WRITE;
/*!40000 ALTER TABLE `ht_taxes` DISABLE KEYS */;
INSERT INTO `ht_taxes` VALUES (1,'VAT',10,1,'published','2025-06-10 10:38:11','2025-06-10 10:38:11'),(2,'None',0,2,'published','2025-06-10 10:38:11','2025-06-10 10:38:11');
/*!40000 ALTER TABLE `ht_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','7b7941d57381c591f3484812d3b0df0a',1,'Botble\\Testimonial\\Models\\Testimonial'),(2,'en_US','2527cebfa414bcee0448b44551af0890',2,'Botble\\Testimonial\\Models\\Testimonial'),(3,'en_US','22f7a05df5ca907dcc74973b9671774a',3,'Botble\\Testimonial\\Models\\Testimonial'),(4,'en_US','549677d54ab64757d9e897f1e6ebcf11',4,'Botble\\Testimonial\\Models\\Testimonial'),(5,'en_US','98c2f143ed57b30647258929a0759929',5,'Botble\\Testimonial\\Models\\Testimonial'),(6,'en_US','1ec19285a1400749ade1aa97386aff58',6,'Botble\\Testimonial\\Models\\Testimonial'),(7,'en_US','7f62c892d310de8a73d0c9c7676e0da5',1,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(8,'en_US','0d01b31296c4a267c82e817fe282daa1',1,'Botble\\Menu\\Models\\MenuLocation'),(9,'en_US','468c2ee16bed8733e3d1964618367885',1,'Botble\\Menu\\Models\\Menu'),(10,'en_US','7c51c456a4c3a5a08c8d21b212cd89e4',2,'Botble\\Menu\\Models\\Menu'),(11,'en_US','1b9ba41494e2657ab38d3abaf3ebd83e',3,'Botble\\Menu\\Models\\Menu'),(12,'en_US','0c42fd90fe0c1115d116bfd707f49433',2,'Botble\\Menu\\Models\\MenuLocation'),(13,'en_US','f3e255da7fc08950904e8a9f48b4eef0',4,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'1','1',1,'image/jpeg',9803,'news/1.jpg','[]','2025-06-10 10:38:03','2025-06-10 10:38:03',NULL,'public'),(2,0,'2','2',1,'image/jpeg',9803,'news/2.jpg','[]','2025-06-10 10:38:03','2025-06-10 10:38:03',NULL,'public'),(3,0,'3','3',1,'image/jpeg',9803,'news/3.jpg','[]','2025-06-10 10:38:03','2025-06-10 10:38:03',NULL,'public'),(4,0,'4','4',1,'image/jpeg',9803,'news/4.jpg','[]','2025-06-10 10:38:03','2025-06-10 10:38:03',NULL,'public'),(5,0,'5','5',1,'image/jpeg',9803,'news/5.jpg','[]','2025-06-10 10:38:03','2025-06-10 10:38:03',NULL,'public'),(6,0,'6','6',1,'image/jpeg',9803,'news/6.jpg','[]','2025-06-10 10:38:03','2025-06-10 10:38:03',NULL,'public'),(7,0,'7','7',1,'image/jpeg',9803,'news/7.jpg','[]','2025-06-10 10:38:04','2025-06-10 10:38:04',NULL,'public'),(8,0,'8','8',1,'image/jpeg',9803,'news/8.jpg','[]','2025-06-10 10:38:04','2025-06-10 10:38:04',NULL,'public'),(9,0,'icon-1','icon-1',2,'image/png',4963,'amenities/icon-1.png','[]','2025-06-10 10:38:04','2025-06-10 10:38:04',NULL,'public'),(10,0,'icon-2','icon-2',2,'image/png',7875,'amenities/icon-2.png','[]','2025-06-10 10:38:04','2025-06-10 10:38:04',NULL,'public'),(11,0,'icon-3','icon-3',2,'image/png',3358,'amenities/icon-3.png','[]','2025-06-10 10:38:04','2025-06-10 10:38:04',NULL,'public'),(12,0,'icon-4','icon-4',2,'image/png',9266,'amenities/icon-4.png','[]','2025-06-10 10:38:05','2025-06-10 10:38:05',NULL,'public'),(13,0,'icon-5','icon-5',2,'image/png',6771,'amenities/icon-5.png','[]','2025-06-10 10:38:05','2025-06-10 10:38:05',NULL,'public'),(14,0,'icon-6','icon-6',2,'image/png',10671,'amenities/icon-6.png','[]','2025-06-10 10:38:05','2025-06-10 10:38:05',NULL,'public'),(15,0,'01','01',3,'image/jpeg',9803,'rooms/01.jpg','[]','2025-06-10 10:38:05','2025-06-10 10:38:05',NULL,'public'),(16,0,'02','02',3,'image/jpeg',9803,'rooms/02.jpg','[]','2025-06-10 10:38:05','2025-06-10 10:38:05',NULL,'public'),(17,0,'03','03',3,'image/jpeg',9803,'rooms/03.jpg','[]','2025-06-10 10:38:05','2025-06-10 10:38:05',NULL,'public'),(18,0,'04','04',3,'image/jpeg',9803,'rooms/04.jpg','[]','2025-06-10 10:38:06','2025-06-10 10:38:06',NULL,'public'),(19,0,'05','05',3,'image/jpeg',9803,'rooms/05.jpg','[]','2025-06-10 10:38:06','2025-06-10 10:38:06',NULL,'public'),(20,0,'06','06',3,'image/jpeg',9803,'rooms/06.jpg','[]','2025-06-10 10:38:06','2025-06-10 10:38:06',NULL,'public'),(21,0,'01','01',4,'image/jpeg',2100,'foods/01.jpg','[]','2025-06-10 10:38:06','2025-06-10 10:38:06',NULL,'public'),(22,0,'02','02',4,'image/jpeg',2100,'foods/02.jpg','[]','2025-06-10 10:38:06','2025-06-10 10:38:06',NULL,'public'),(23,0,'03','03',4,'image/jpeg',2100,'foods/03.jpg','[]','2025-06-10 10:38:06','2025-06-10 10:38:06',NULL,'public'),(24,0,'04','04',4,'image/jpeg',2100,'foods/04.jpg','[]','2025-06-10 10:38:07','2025-06-10 10:38:07',NULL,'public'),(25,0,'05','05',4,'image/jpeg',2100,'foods/05.jpg','[]','2025-06-10 10:38:07','2025-06-10 10:38:07',NULL,'public'),(26,0,'06','06',4,'image/jpeg',2100,'foods/06.jpg','[]','2025-06-10 10:38:07','2025-06-10 10:38:07',NULL,'public'),(27,0,'07','07',4,'image/jpeg',2100,'foods/07.jpg','[]','2025-06-10 10:38:07','2025-06-10 10:38:07',NULL,'public'),(28,0,'08','08',4,'image/jpeg',2100,'foods/08.jpg','[]','2025-06-10 10:38:07','2025-06-10 10:38:07',NULL,'public'),(29,0,'09','09',4,'image/jpeg',2100,'foods/09.jpg','[]','2025-06-10 10:38:07','2025-06-10 10:38:07',NULL,'public'),(30,0,'10','10',4,'image/jpeg',2100,'foods/10.jpg','[]','2025-06-10 10:38:07','2025-06-10 10:38:07',NULL,'public'),(31,0,'1','1',5,'image/jpeg',8581,'customers/1.jpg','[]','2025-06-10 10:38:07','2025-06-10 10:38:07',NULL,'public'),(32,0,'10','10',5,'image/jpeg',20004,'customers/10.jpg','[]','2025-06-10 10:38:08','2025-06-10 10:38:08',NULL,'public'),(33,0,'2','2',5,'image/jpeg',14257,'customers/2.jpg','[]','2025-06-10 10:38:08','2025-06-10 10:38:08',NULL,'public'),(34,0,'3','3',5,'image/jpeg',14702,'customers/3.jpg','[]','2025-06-10 10:38:08','2025-06-10 10:38:08',NULL,'public'),(35,0,'4','4',5,'image/jpeg',19699,'customers/4.jpg','[]','2025-06-10 10:38:08','2025-06-10 10:38:08',NULL,'public'),(36,0,'5','5',5,'image/jpeg',10260,'customers/5.jpg','[]','2025-06-10 10:38:08','2025-06-10 10:38:08',NULL,'public'),(37,0,'6','6',5,'image/jpeg',8476,'customers/6.jpg','[]','2025-06-10 10:38:08','2025-06-10 10:38:08',NULL,'public'),(38,0,'7','7',5,'image/jpeg',14388,'customers/7.jpg','[]','2025-06-10 10:38:08','2025-06-10 10:38:08',NULL,'public'),(39,0,'8','8',5,'image/jpeg',14340,'customers/8.jpg','[]','2025-06-10 10:38:08','2025-06-10 10:38:08',NULL,'public'),(40,0,'9','9',5,'image/jpeg',4396,'customers/9.jpg','[]','2025-06-10 10:38:08','2025-06-10 10:38:08',NULL,'public'),(41,0,'01','01',6,'image/jpeg',9803,'places/01.jpg','[]','2025-06-10 10:38:10','2025-06-10 10:38:10',NULL,'public'),(42,0,'02','02',6,'image/jpeg',9803,'places/02.jpg','[]','2025-06-10 10:38:10','2025-06-10 10:38:10',NULL,'public'),(43,0,'03','03',6,'image/jpeg',9803,'places/03.jpg','[]','2025-06-10 10:38:10','2025-06-10 10:38:10',NULL,'public'),(44,0,'04','04',6,'image/jpeg',9803,'places/04.jpg','[]','2025-06-10 10:38:10','2025-06-10 10:38:10',NULL,'public'),(45,0,'05','05',6,'image/jpeg',9803,'places/05.jpg','[]','2025-06-10 10:38:11','2025-06-10 10:38:11',NULL,'public'),(46,0,'06','06',6,'image/jpeg',9803,'places/06.jpg','[]','2025-06-10 10:38:11','2025-06-10 10:38:11',NULL,'public'),(47,0,'an-img-01','an-img-01',7,'image/png',20779,'backgrounds/an-img-01.png','[]','2025-06-10 10:38:11','2025-06-10 10:38:11',NULL,'public'),(48,0,'an-img-02','an-img-02',7,'image/png',6874,'backgrounds/an-img-02.png','[]','2025-06-10 10:38:11','2025-06-10 10:38:11',NULL,'public'),(49,0,'an-img-05','an-img-05',7,'image/png',10437,'backgrounds/an-img-05.png','[]','2025-06-10 10:38:11','2025-06-10 10:38:11',NULL,'public'),(50,0,'an-img-07','an-img-07',7,'image/png',7951,'backgrounds/an-img-07.png','[]','2025-06-10 10:38:11','2025-06-10 10:38:11',NULL,'public'),(51,0,'footer-bg','footer-bg',7,'image/png',179660,'backgrounds/footer-bg.png','[]','2025-06-10 10:38:11','2025-06-10 10:38:11',NULL,'public'),(52,0,'testimonial-bg','testimonial-bg',7,'image/png',422738,'backgrounds/testimonial-bg.png','[]','2025-06-10 10:38:12','2025-06-10 10:38:12',NULL,'public'),(53,0,'about_img_02','about_img_02',8,'image/png',10047,'services/about-img-02.png','[]','2025-06-10 10:38:12','2025-06-10 10:38:12',NULL,'public'),(54,0,'about_img_03','about_img_03',8,'image/png',7034,'services/about-img-03.png','[]','2025-06-10 10:38:12','2025-06-10 10:38:12',NULL,'public'),(55,0,'feature','feature',8,'image/png',15928,'services/feature.png','[]','2025-06-10 10:38:12','2025-06-10 10:38:12',NULL,'public'),(56,0,'icon-1','icon-1',8,'image/png',1169,'services/icon-1.png','[]','2025-06-10 10:38:13','2025-06-10 10:38:13',NULL,'public'),(57,0,'icon-2','icon-2',8,'image/png',1874,'services/icon-2.png','[]','2025-06-10 10:38:13','2025-06-10 10:38:13',NULL,'public'),(58,0,'icon-3','icon-3',8,'image/png',1972,'services/icon-3.png','[]','2025-06-10 10:38:13','2025-06-10 10:38:13',NULL,'public'),(59,0,'icon-4','icon-4',8,'image/png',1913,'services/icon-4.png','[]','2025-06-10 10:38:13','2025-06-10 10:38:13',NULL,'public'),(60,0,'icon-5','icon-5',8,'image/png',2893,'services/icon-5.png','[]','2025-06-10 10:38:13','2025-06-10 10:38:13',NULL,'public'),(61,0,'icon-6','icon-6',8,'image/png',2504,'services/icon-6.png','[]','2025-06-10 10:38:13','2025-06-10 10:38:13',NULL,'public'),(62,0,'skills-img','skills-img',8,'image/png',16333,'services/skills-img.png','[]','2025-06-10 10:38:13','2025-06-10 10:38:13',NULL,'public'),(63,0,'logo-1','logo-1',9,'image/png',757,'brands/logo-1.png','[]','2025-06-10 10:38:13','2025-06-10 10:38:13',NULL,'public'),(64,0,'logo-2','logo-2',9,'image/png',757,'brands/logo-2.png','[]','2025-06-10 10:38:13','2025-06-10 10:38:13',NULL,'public'),(65,0,'logo-3','logo-3',9,'image/png',757,'brands/logo-3.png','[]','2025-06-10 10:38:13','2025-06-10 10:38:13',NULL,'public'),(66,0,'logo-4','logo-4',9,'image/png',757,'brands/logo-4.png','[]','2025-06-10 10:38:14','2025-06-10 10:38:14',NULL,'public'),(67,0,'logo-5','logo-5',9,'image/png',757,'brands/logo-5.png','[]','2025-06-10 10:38:14','2025-06-10 10:38:14',NULL,'public'),(68,0,'logo-6','logo-6',9,'image/png',757,'brands/logo-6.png','[]','2025-06-10 10:38:14','2025-06-10 10:38:14',NULL,'public'),(69,0,'01','01',10,'image/png',2100,'testimonials/01.png','[]','2025-06-10 10:38:14','2025-06-10 10:38:14',NULL,'public'),(70,0,'02','02',10,'image/png',2100,'testimonials/02.png','[]','2025-06-10 10:38:14','2025-06-10 10:38:14',NULL,'public'),(71,0,'03','03',10,'image/png',2100,'testimonials/03.png','[]','2025-06-10 10:38:14','2025-06-10 10:38:14',NULL,'public'),(72,0,'04','04',10,'image/png',2100,'testimonials/04.png','[]','2025-06-10 10:38:14','2025-06-10 10:38:14',NULL,'public'),(73,0,'05','05',10,'image/png',2100,'testimonials/05.png','[]','2025-06-10 10:38:14','2025-06-10 10:38:14',NULL,'public'),(74,0,'06','06',10,'image/png',2100,'testimonials/06.png','[]','2025-06-10 10:38:15','2025-06-10 10:38:15',NULL,'public'),(75,0,'1','1',11,'image/png',7235,'galleries/1.png','[]','2025-06-10 10:38:15','2025-06-10 10:38:15',NULL,'public'),(76,0,'10','10',11,'image/png',7235,'galleries/10.png','[]','2025-06-10 10:38:15','2025-06-10 10:38:15',NULL,'public'),(77,0,'2','2',11,'image/png',7235,'galleries/2.png','[]','2025-06-10 10:38:15','2025-06-10 10:38:15',NULL,'public'),(78,0,'3','3',11,'image/png',7235,'galleries/3.png','[]','2025-06-10 10:38:15','2025-06-10 10:38:15',NULL,'public'),(79,0,'4','4',11,'image/png',7235,'galleries/4.png','[]','2025-06-10 10:38:15','2025-06-10 10:38:15',NULL,'public'),(80,0,'5','5',11,'image/png',7235,'galleries/5.png','[]','2025-06-10 10:38:15','2025-06-10 10:38:15',NULL,'public'),(81,0,'6','6',11,'image/png',7235,'galleries/6.png','[]','2025-06-10 10:38:16','2025-06-10 10:38:16',NULL,'public'),(82,0,'7','7',11,'image/png',7235,'galleries/7.png','[]','2025-06-10 10:38:16','2025-06-10 10:38:16',NULL,'public'),(83,0,'8','8',11,'image/png',7235,'galleries/8.png','[]','2025-06-10 10:38:16','2025-06-10 10:38:16',NULL,'public'),(84,0,'9','9',11,'image/png',7235,'galleries/9.png','[]','2025-06-10 10:38:16','2025-06-10 10:38:16',NULL,'public'),(85,0,'1','1',12,'image/jpeg',2100,'users/1.jpg','[]','2025-06-10 10:38:16','2025-06-10 10:38:16',NULL,'public'),(86,0,'404','404',13,'image/png',7719,'general/404.png','[]','2025-06-10 10:38:17','2025-06-10 10:38:17',NULL,'public'),(87,0,'booking-img','booking-img',13,'image/png',10558,'general/booking-img.png','[]','2025-06-10 10:38:17','2025-06-10 10:38:17',NULL,'public'),(88,0,'favicon','favicon',13,'image/png',6096,'general/favicon.png','[]','2025-06-10 10:38:17','2025-06-10 10:38:17',NULL,'public'),(89,0,'feature','feature',13,'image/png',15928,'general/feature.png','[]','2025-06-10 10:38:17','2025-06-10 10:38:17',NULL,'public'),(90,0,'logo-dark','logo-dark',13,'image/png',6494,'general/logo-dark.png','[]','2025-06-10 10:38:17','2025-06-10 10:38:17',NULL,'public'),(91,0,'logo','logo',13,'image/png',7533,'general/logo.png','[]','2025-06-10 10:38:17','2025-06-10 10:38:17',NULL,'public'),(92,0,'place-1','place-1',13,'image/jpeg',5575,'general/place-1.jpg','[]','2025-06-10 10:38:17','2025-06-10 10:38:17',NULL,'public'),(93,0,'place-2','place-2',13,'image/jpeg',5575,'general/place-2.jpg','[]','2025-06-10 10:38:17','2025-06-10 10:38:17',NULL,'public'),(94,0,'place-3','place-3',13,'image/jpeg',5575,'general/place-3.jpg','[]','2025-06-10 10:38:18','2025-06-10 10:38:18',NULL,'public'),(95,0,'portfolio-1','portfolio-1',13,'image/png',12879,'general/portfolio-1.png','[]','2025-06-10 10:38:18','2025-06-10 10:38:18',NULL,'public'),(96,0,'portfolio-2','portfolio-2',13,'image/png',6248,'general/portfolio-2.png','[]','2025-06-10 10:38:18','2025-06-10 10:38:18',NULL,'public'),(97,0,'portfolio-3','portfolio-3',13,'image/png',6248,'general/portfolio-3.png','[]','2025-06-10 10:38:18','2025-06-10 10:38:18',NULL,'public'),(98,0,'signature','signature',13,'image/png',825,'general/signature.png','[]','2025-06-10 10:38:18','2025-06-10 10:38:18',NULL,'public'),(99,0,'video-bg','video-bg',13,'image/png',18212,'general/video-bg.png','[]','2025-06-10 10:38:18','2025-06-10 10:38:18',NULL,'public'),(100,0,'slider-1','slider-1',14,'image/png',27228,'banners/slider-1.png','[]','2025-06-10 10:38:19','2025-06-10 10:38:19',NULL,'public'),(101,0,'slider-2','slider-2',14,'image/png',27228,'banners/slider-2.png','[]','2025-06-10 10:38:19','2025-06-10 10:38:19',NULL,'public'),(102,0,'1','1',15,'image/png',9086,'teams/1.png','[]','2025-06-10 10:38:19','2025-06-10 10:38:19',NULL,'public'),(103,0,'2','2',15,'image/png',9086,'teams/2.png','[]','2025-06-10 10:38:20','2025-06-10 10:38:20',NULL,'public'),(104,0,'3','3',15,'image/png',9086,'teams/3.png','[]','2025-06-10 10:38:20','2025-06-10 10:38:20',NULL,'public'),(105,0,'4','4',15,'image/png',9086,'teams/4.png','[]','2025-06-10 10:38:20','2025-06-10 10:38:20',NULL,'public'),(106,0,'5','5',15,'image/png',9086,'teams/5.png','[]','2025-06-10 10:38:20','2025-06-10 10:38:20',NULL,'public'),(107,0,'6','6',15,'image/png',9086,'teams/6.png','[]','2025-06-10 10:38:20','2025-06-10 10:38:20',NULL,'public'),(108,0,'7','7',15,'image/png',9086,'teams/7.png','[]','2025-06-10 10:38:20','2025-06-10 10:38:20',NULL,'public'),(109,0,'8','8',15,'image/png',9086,'teams/8.png','[]','2025-06-10 10:38:20','2025-06-10 10:38:20',NULL,'public'),(110,0,'img1','img1',15,'image/png',9086,'teams/img1.png','[]','2025-06-10 10:38:21','2025-06-10 10:38:21',NULL,'public'),(111,0,'img2','img2',15,'image/png',9086,'teams/img2.png','[]','2025-06-10 10:38:21','2025-06-10 10:38:21',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'news',NULL,'news',0,'2025-06-10 10:38:03','2025-06-10 10:38:03',NULL),(2,0,'amenities',NULL,'amenities',0,'2025-06-10 10:38:04','2025-06-10 10:38:04',NULL),(3,0,'rooms',NULL,'rooms',0,'2025-06-10 10:38:05','2025-06-10 10:38:05',NULL),(4,0,'foods',NULL,'foods',0,'2025-06-10 10:38:06','2025-06-10 10:38:06',NULL),(5,0,'customers',NULL,'customers',0,'2025-06-10 10:38:07','2025-06-10 10:38:07',NULL),(6,0,'places',NULL,'places',0,'2025-06-10 10:38:10','2025-06-10 10:38:10',NULL),(7,0,'backgrounds',NULL,'backgrounds',0,'2025-06-10 10:38:11','2025-06-10 10:38:11',NULL),(8,0,'services',NULL,'services',0,'2025-06-10 10:38:12','2025-06-10 10:38:12',NULL),(9,0,'brands',NULL,'brands',0,'2025-06-10 10:38:13','2025-06-10 10:38:13',NULL),(10,0,'testimonials',NULL,'testimonials',0,'2025-06-10 10:38:14','2025-06-10 10:38:14',NULL),(11,0,'galleries',NULL,'galleries',0,'2025-06-10 10:38:15','2025-06-10 10:38:15',NULL),(12,0,'users',NULL,'users',0,'2025-06-10 10:38:16','2025-06-10 10:38:16',NULL),(13,0,'general',NULL,'general',0,'2025-06-10 10:38:17','2025-06-10 10:38:17',NULL),(14,0,'banners',NULL,'banners',0,'2025-06-10 10:38:18','2025-06-10 10:38:18',NULL),(15,0,'teams',NULL,'teams',0,'2025-06-10 10:38:19','2025-06-10 10:38:19',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2025-06-10 10:38:21','2025-06-10 10:38:21'),(2,4,'sidebar-menu','2025-06-10 10:38:21','2025-06-10 10:38:21');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,1,'Botble\\Page\\Models\\Page','/',NULL,0,'Home',NULL,'_self',1,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(2,1,1,1,'Botble\\Page\\Models\\Page','/',NULL,0,'Home Page 01',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(3,1,1,2,'Botble\\Page\\Models\\Page','/home-page-02',NULL,1,'Home Page 02',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(4,1,1,3,'Botble\\Page\\Models\\Page','/home-page-side-menu',NULL,2,'Home Page Side Menu',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(5,1,1,4,'Botble\\Page\\Models\\Page','/home-page-full-menu',NULL,3,'Home Page Full Menu',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(6,1,0,NULL,NULL,'/rooms',NULL,1,'Our Rooms',NULL,'_self',1,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(7,1,6,NULL,NULL,'/rooms',NULL,0,'Our Rooms',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(8,1,6,NULL,NULL,'',NULL,1,'Room Details',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(9,1,0,NULL,NULL,'',NULL,2,'Pages',NULL,'_self',1,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(10,1,9,NULL,NULL,'/galleries',NULL,0,'Gallery',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(11,1,9,8,'Botble\\Page\\Models\\Page','/faq',NULL,1,'FAQ',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(12,1,9,9,'Botble\\Page\\Models\\Page','/team',NULL,2,'Team',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(13,1,9,NULL,NULL,'',NULL,3,'Team Details',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(14,1,9,6,'Botble\\Page\\Models\\Page','/services',NULL,4,'Services',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(15,1,9,NULL,NULL,'',NULL,5,'Service Details',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(16,1,9,0,'Botble\\Page\\Models\\Page',NULL,NULL,6,'Places',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(17,1,9,NULL,NULL,'',NULL,7,'Place Details',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(18,1,9,5,'Botble\\Page\\Models\\Page','/about-us',NULL,8,'About Us',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(19,1,9,11,'Botble\\Page\\Models\\Page','/contact-us',NULL,9,'Contact Us',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(20,1,0,10,'Botble\\Page\\Models\\Page','/blog',NULL,3,'Blog',NULL,'_self',1,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(21,1,20,10,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(22,1,20,NULL,NULL,'',NULL,1,'Blog Details',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(23,2,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(24,2,0,NULL,NULL,'/about-us',NULL,1,'About Us',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(25,2,0,6,'Botble\\Page\\Models\\Page','/services',NULL,2,'Services',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(26,2,0,11,'Botble\\Page\\Models\\Page','/contact-us',NULL,3,'Contact Us',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:22'),(27,2,0,10,'Botble\\Page\\Models\\Page','/blog',NULL,4,'Blog',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:22'),(28,3,0,8,'Botble\\Page\\Models\\Page','/faq',NULL,0,'FAQ',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:22'),(29,3,0,0,'Botble\\Page\\Models\\Page',NULL,NULL,1,'Support',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(30,3,0,12,'Botble\\Page\\Models\\Page','/privacy',NULL,2,'Privacy',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:22'),(31,3,0,13,'Botble\\Page\\Models\\Page','/term-and-conditions',NULL,3,'Term & Conditions',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:22'),(32,4,0,NULL,NULL,'/home',NULL,0,'Home',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(33,4,0,NULL,NULL,'/about-us',NULL,1,'About Us',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(34,4,0,NULL,NULL,'/services',NULL,2,'Services',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(35,4,0,NULL,NULL,'/pricing',NULL,3,'Pricing',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(36,4,0,NULL,NULL,'/team',NULL,4,'Team',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(37,4,0,NULL,NULL,'/gallery',NULL,5,'Gallery Study',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(38,4,0,NULL,NULL,'/blog',NULL,6,'Blog',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21'),(39,4,0,NULL,NULL,'/contact-us',NULL,7,'Contact',NULL,'_self',0,'2025-06-10 10:38:21','2025-06-10 10:38:21');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2025-06-10 10:38:21','2025-06-10 10:38:21'),(2,'Our Links','our-links','published','2025-06-10 10:38:21','2025-06-10 10:38:21'),(3,'Our Services','our-services','published','2025-06-10 10:38:21','2025-06-10 10:38:21'),(4,'Sidebar Menu','sidebar-menu','published','2025-06-10 10:38:21','2025-06-10 10:38:21');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'icon_image','[\"amenities\\/icon-5.png\"]',1,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(2,'description','[\"Quia hic quasi neque eum fuga amet dicta quidem. Exercitationem ut quae quaerat.\"]',1,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(3,'icon_image','[\"amenities\\/icon-4.png\"]',2,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(4,'description','[\"Cum minima necessitatibus eum consequatur. Cum et impedit velit aut omnis dolorum quam illo.\"]',2,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(5,'icon_image','[\"amenities\\/icon-5.png\"]',3,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(6,'description','[\"Atque earum iste ut laboriosam hic. Veritatis est molestias sit. Aut inventore voluptatem tenetur ad et velit ut.\"]',3,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(7,'icon_image','[\"amenities\\/icon-4.png\"]',4,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(8,'description','[\"Sint error aperiam nostrum vero saepe quia itaque. Sunt ipsam sint est blanditiis voluptatem animi.\"]',4,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(9,'icon_image','[\"amenities\\/icon-4.png\"]',5,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(10,'description','[\"Et suscipit recusandae ut. Ratione quaerat quae repellendus similique ratione molestiae. In et dicta sequi vero fuga.\"]',5,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(11,'icon_image','[\"amenities\\/icon-4.png\"]',6,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(12,'description','[\"Cum dolorum quis perferendis soluta rerum illo expedita. Quo corporis tempore est ut sit est optio sunt.\"]',6,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(13,'icon_image','[\"amenities\\/icon-2.png\"]',7,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(14,'description','[\"Itaque tempore voluptatem maxime quibusdam error. Molestias tempore architecto porro tempora deleniti aliquam adipisci.\"]',7,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(15,'icon_image','[\"amenities\\/icon-2.png\"]',8,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(16,'description','[\"Et voluptatem totam id dolorum reiciendis. Voluptatem soluta officia at. Dolorum laudantium aut et hic reprehenderit.\"]',8,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(17,'icon_image','[\"amenities\\/icon-5.png\"]',9,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(18,'description','[\"Autem earum quas et quia molestiae quaerat. Facere sint illo itaque et aut totam quia. Labore accusantium sit error.\"]',9,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(19,'icon_image','[\"amenities\\/icon-5.png\"]',10,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(20,'description','[\"Consequatur magni officia commodi recusandae tempora. Quia quae fugit ducimus nihil repellendus tempora iusto.\"]',10,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(21,'icon_image','[\"amenities\\/icon-3.png\"]',11,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(22,'description','[\"Ut dicta facilis in. Sint vel aut laudantium dolor vitae.\"]',11,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(23,'icon_image','[\"amenities\\/icon-1.png\"]',12,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(24,'description','[\"Eveniet optio est sit dolorem nostrum est. Voluptates qui ut molestiae nemo pariatur. Aspernatur nesciunt unde ipsam.\"]',12,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(25,'icon_image','[\"amenities\\/icon-1.png\"]',13,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(26,'description','[\"Quis voluptas sit culpa. Nulla aut beatae sit eius. Error repudiandae et vel.\"]',13,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(27,'icon_image','[\"amenities\\/icon-5.png\"]',14,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(28,'description','[\"Tempora ad est id sunt ipsa aperiam sequi. Voluptas sit tempora minus sit accusamus. Accusantium dicta eum et est.\"]',14,'Botble\\Hotel\\Models\\Amenity','2025-06-10 10:38:05','2025-06-10 10:38:05'),(29,'breadcrumb','[0]',1,'Botble\\Page\\Models\\Page','2025-06-10 10:38:14','2025-06-10 10:38:14'),(30,'breadcrumb','[0]',2,'Botble\\Page\\Models\\Page','2025-06-10 10:38:14','2025-06-10 10:38:14'),(31,'breadcrumb','[0]',3,'Botble\\Page\\Models\\Page','2025-06-10 10:38:14','2025-06-10 10:38:14'),(32,'breadcrumb','[0]',4,'Botble\\Page\\Models\\Page','2025-06-10 10:38:14','2025-06-10 10:38:14'),(33,'breadcrumb','[1]',5,'Botble\\Page\\Models\\Page','2025-06-10 10:38:14','2025-06-10 10:38:14'),(34,'breadcrumb','[1]',6,'Botble\\Page\\Models\\Page','2025-06-10 10:38:14','2025-06-10 10:38:14'),(35,'breadcrumb','[1]',7,'Botble\\Page\\Models\\Page','2025-06-10 10:38:14','2025-06-10 10:38:14'),(36,'breadcrumb','[1]',8,'Botble\\Page\\Models\\Page','2025-06-10 10:38:14','2025-06-10 10:38:14'),(37,'breadcrumb','[1]',9,'Botble\\Page\\Models\\Page','2025-06-10 10:38:14','2025-06-10 10:38:14'),(38,'breadcrumb','[1]',10,'Botble\\Page\\Models\\Page','2025-06-10 10:38:14','2025-06-10 10:38:14'),(39,'breadcrumb','[1]',11,'Botble\\Page\\Models\\Page','2025-06-10 10:38:14','2025-06-10 10:38:14'),(40,'breadcrumb','[1]',12,'Botble\\Page\\Models\\Page','2025-06-10 10:38:14','2025-06-10 10:38:14'),(41,'breadcrumb','[1]',13,'Botble\\Page\\Models\\Page','2025-06-10 10:38:14','2025-06-10 10:38:14'),(42,'display_name','[\"Rosalina William\"]',1,'Botble\\ACL\\Models\\User','2025-06-10 10:38:16','2025-06-10 10:38:16'),(43,'bio','[\"\\ud83d\\udd8b\\ufe0f Dedicated blog writer \\ud83d\\udcda | Crafting engaging content through the art of words. \\ud83c\\udf0d Passionate about exploring diverse topics and sharing insightful perspectives. \\ud83d\\ude80 Turning ideas into captivating stories. \\u2615 Coffee addict and creativity enthusiast. \\ud83c\\udfa8 Let\\u2019s embark on a journey of discovery through the magic of writing!\"]',1,'Botble\\ACL\\Models\\User','2025-06-10 10:38:16','2025-06-10 10:38:16'),(44,'facebook','[\"https:\\/\\/www.facebook.com\"]',1,'Botble\\ACL\\Models\\User','2025-06-10 10:38:16','2025-06-10 10:38:16'),(45,'twitter','[\"https:\\/\\/twitter.com\"]',1,'Botble\\ACL\\Models\\User','2025-06-10 10:38:16','2025-06-10 10:38:16'),(46,'instagram','[\"https:\\/\\/www.instagram.com\"]',1,'Botble\\ACL\\Models\\User','2025-06-10 10:38:16','2025-06-10 10:38:16'),(47,'behance','[\"https:\\/\\/www.behance.net\"]',1,'Botble\\ACL\\Models\\User','2025-06-10 10:38:16','2025-06-10 10:38:16'),(48,'linkedin','[\"https:\\/\\/www.linkedin.com\"]',1,'Botble\\ACL\\Models\\User','2025-06-10 10:38:16','2025-06-10 10:38:16'),(49,'button_primary_label','[\"Discover More \"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-06-10 10:38:19','2025-06-10 10:38:19'),(50,'button_primary_url','[\"\\/contact-us\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-06-10 10:38:19','2025-06-10 10:38:19'),(51,'button_play_label','[\"Intro video\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-06-10 10:38:19','2025-06-10 10:38:19'),(52,'youtube_url','[\"https:\\/\\/www.youtube.com\\/watch?v=v2qeqkKgw7U\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-06-10 10:38:19','2025-06-10 10:38:19'),(53,'button_primary_label','[\"Discover More \"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-06-10 10:38:19','2025-06-10 10:38:19'),(54,'button_primary_url','[\"\\/contact-us\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-06-10 10:38:19','2025-06-10 10:38:19'),(55,'button_play_label','[\"Intro video\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-06-10 10:38:19','2025-06-10 10:38:19'),(56,'youtube_url','[\"https:\\/\\/www.youtube.com\\/watch?v=v2qeqkKgw7U\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-06-10 10:38:19','2025-06-10 10:38:19');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'2013_04_09_032329_create_base_tables',1),(3,'2013_04_09_062329_create_revisions_table',1),(4,'2014_10_12_000000_create_users_table',1),(5,'2014_10_12_100000_create_password_reset_tokens_table',1),(6,'2016_06_10_230148_create_acl_tables',1),(7,'2016_06_14_230857_create_menus_table',1),(8,'2016_06_28_221418_create_pages_table',1),(9,'2016_10_05_074239_create_setting_table',1),(10,'2016_11_28_032840_create_dashboard_widget_tables',1),(11,'2016_12_16_084601_create_widgets_table',1),(12,'2017_05_09_070343_create_media_tables',1),(13,'2017_11_03_070450_create_slug_table',1),(14,'2019_01_05_053554_create_jobs_table',1),(15,'2019_08_19_000000_create_failed_jobs_table',1),(16,'2019_12_14_000001_create_personal_access_tokens_table',1),(17,'2021_08_05_134214_fix_social_link_theme_options',1),(18,'2022_04_20_100851_add_index_to_media_table',1),(19,'2022_04_20_101046_add_index_to_menu_table',1),(20,'2022_07_10_034813_move_lang_folder_to_root',1),(21,'2022_08_04_051940_add_missing_column_expires_at',1),(22,'2022_09_01_000001_create_admin_notifications_tables',1),(23,'2022_10_14_024629_drop_column_is_featured',1),(24,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(25,'2022_12_02_093615_update_slug_index_columns',1),(26,'2023_01_30_024431_add_alt_to_media_table',1),(27,'2023_02_16_042611_drop_table_password_resets',1),(28,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(29,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(30,'2023_08_21_090810_make_page_content_nullable',1),(31,'2023_09_14_021936_update_index_for_slugs_table',1),(32,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(33,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(34,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(35,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(36,'2024_07_07_091316_fix_column_url_in_menu_nodes_table',1),(37,'2024_07_12_100000_change_random_hash_for_media',1),(38,'2024_09_30_024515_create_sessions_table',1),(39,'2024_04_27_100730_improve_analytics_setting',2),(40,'2015_06_29_025744_create_audit_history',3),(41,'2023_11_14_033417_change_request_column_in_table_audit_histories',3),(42,'2025_05_05_000001_add_user_type_to_audit_histories_table',3),(43,'2015_06_18_033822_create_blog_table',4),(44,'2021_02_16_092633_remove_default_value_for_author_type',4),(45,'2021_12_03_030600_create_blog_translations',4),(46,'2022_04_19_113923_add_index_to_table_posts',4),(47,'2023_08_29_074620_make_column_author_id_nullable',4),(48,'2024_07_30_091615_fix_order_column_in_categories_table',4),(49,'2025_01_06_033807_add_default_value_for_categories_author_type',4),(50,'2016_06_17_091537_create_contacts_table',5),(51,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',5),(52,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',5),(53,'2024_03_25_000001_update_captcha_settings_for_contact',5),(54,'2024_04_19_063914_create_custom_fields_table',5),(55,'2018_07_09_221238_create_faq_table',6),(56,'2021_12_03_082134_create_faq_translations',6),(57,'2023_11_17_063408_add_description_column_to_faq_categories_table',6),(58,'2016_10_13_150201_create_galleries_table',7),(59,'2021_12_03_082953_create_gallery_translations',7),(60,'2022_04_30_034048_create_gallery_meta_translations_table',7),(61,'2023_08_29_075308_make_column_user_id_nullable',7),(62,'2020_09_02_033611_hotel_create_table',8),(63,'2021_06_25_084734_fix_theme_options',8),(64,'2021_08_18_011425_add_column_order_into_rooms',8),(65,'2021_08_25_153801_update_table_ht_room_categories',8),(66,'2021_08_29_031421_add_translations_tables_for_hotel',8),(67,'2023_04_09_083713_update_hotel_customers_table',8),(68,'2023_04_17_033111_add_booking_number_of_guests',8),(69,'2023_08_11_090349_add_column_password_customers_table',8),(70,'2023_08_14_090449_create_reset_password_table',8),(71,'2023_08_16_063152_update_ht_booking_room_table',8),(72,'2023_08_18_022454_add_new_field_to_ht_customers_table',8),(73,'2023_08_23_022361_create_ht_invoices_table',8),(74,'2023_08_23_041912_create_hotel_review_table',8),(75,'2023_08_23_443543_add_sub_total_to_booking_table',8),(76,'2023_08_23_904382_update_field_customer_id_to_invoice_table',8),(77,'2023_08_24_534892_add_fields_to_invoice_table',8),(78,'2023_08_24_745332_add_field_description_to_invoice_table',8),(79,'2023_08_25_061510_add_adjust_type_and_amount_column',8),(80,'2023_09_05_083354_create_ht_coupons_table',8),(81,'2023_09_06_062315_add_coupon_columns_to_booking_table',8),(82,'2023_10_18_024658_add_price_type_column_to_services_table',8),(83,'2023_10_24_014726_drop_unique_in_room_name',8),(84,'2024_06_10_000000_add_content_ht_services_translations',8),(85,'2024_07_11_052139_add_number_of_children_column_to_ht_bookings_table',8),(86,'2024_07_16_234051_add_booking_number_into_table_ht_bookings',8),(87,'2024_12_10_140304_fix_wrong_customer_account',8),(88,'2025_01_22_031331_add_field_content_for_ht_foods_table',8),(89,'2025_03_31_111809_create_ht_booking_foods',8),(90,'2025_05_16_000001_create_room_calendars_table',8),(91,'2025_05_16_000002_create_ical_sync_logs_table',8),(92,'2016_10_03_032336_create_languages_table',9),(93,'2023_09_14_022423_add_index_for_language_table',9),(94,'2021_10_25_021023_fix-priority-load-for-language-advanced',10),(95,'2021_12_03_075608_create_page_translations',10),(96,'2023_07_06_011444_create_slug_translations_table',10),(97,'2017_10_24_154832_create_newsletter_table',11),(98,'2024_03_25_000001_update_captcha_settings_for_newsletter',11),(99,'2017_05_18_080441_create_payment_tables',12),(100,'2021_03_27_144913_add_customer_type_into_table_payments',12),(101,'2021_05_24_034720_make_column_currency_nullable',12),(102,'2021_08_09_161302_add_metadata_column_to_payments_table',12),(103,'2021_10_19_020859_update_metadata_field',12),(104,'2022_06_28_151901_activate_paypal_stripe_plugin',12),(105,'2022_07_07_153354_update_charge_id_in_table_payments',12),(106,'2024_07_04_083133_create_payment_logs_table',12),(107,'2025_04_12_000003_add_payment_fee_to_payments_table',12),(108,'2025_05_22_000001_add_payment_fee_type_to_settings_table',12),(109,'2017_07_11_140018_create_simple_slider_table',13),(110,'2025_04_08_040931_create_social_logins_table',14),(111,'2022_11_02_092723_team_create_team_table',15),(112,'2023_08_11_094574_update_team_table',15),(113,'2023_11_30_085354_add_missing_description_to_team',15),(114,'2024_10_02_030027_add_more_columns_to_teams_translations_table',15),(115,'2018_07_09_214610_create_testimonial_table',16),(116,'2021_12_03_083642_create_testimonials_translations',16),(117,'2016_10_07_193005_create_translations_table',17),(118,'2023_12_12_105220_drop_translations_table',17);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Home Page 01','[simple-slider key=\"home-slider\"][/simple-slider][check-availability-form][/check-availability-form][about-us title=&quot;Most Safe &amp; Rated Hotel In London.&quot; subtitle=&quot;About Us&quot; description=&quot;At About Us, we take pride in offering the most secure and top-rated hotels in London. Your safety and comfort are our priorities, which is why our meticulous selection process ensures each hotel meets stringent quality standards. Whether you&rsquo;re visiting for business or leisure, trust us to provide you with a stay that combines the utmost security and exceptional service.&lt;br&gt; &lt;br&gt;Experience London like never before with our curated list of accommodations that boast prime locations and unmatched safety measures. From charming boutique hotels to Luxuryous city-center options, we&rsquo;ve done the groundwork to present you with a variety of choices that guarantee a worry-free stay. Choose About Us for a memorable trip enriched with both the allure of London.&quot; highlights=&quot;Discover the epitome of safe haven in our top-rated London hotels.; Immerse yourself in the heart of London&rsquo;s charm.; Experience the perfect blend of luxury and comfort.&quot; style=&quot;style-1&quot; button_label=&quot;DISCOVER MORE&quot; button_url=&quot;/about-us&quot; signature_image=&quot;general/signature.png&quot; signature_author=&quot;Vincent Smith&quot; top_left_image=&quot;services/about-img-02.png&quot; bottom_right_image=&quot;services/about-img-03.png&quot; floating_right_image=&quot;backgrounds/an-img-02.png&quot;][/about-us][featured-amenities title=\"The Hotel\" subtitle=\"Explore\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" background_color=\"#F7F5F1\" background_image=\"/backgrounds/an-img-01.png\" amenity_ids=\"1,2,3,4,5,6\"][/featured-amenities][featured-rooms title=\"Rooms & Suites\" subtitle=\"The Pleasure Of Luxury\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" room_ids=\"2,3,4,6,7\"][/featured-rooms][feature-area title=\"Pearl Of The Adriatic.\" subtitle=\"Luxury Hotel & Resort\" description=\"Vestibulum non ornare nunc. Maecenas a metus in est iaculis pretium. Aliquam ullamcorper nibh lacus, ac suscipit ipsum consequat porttitor.Aenean vehicula ligula eu rhoncus porttitor. Duis vel lacinia quam. Nunc rutrum porta ex, in imperdiet tortor feugiat at. Cras finibus laoreet felis et hendrerit. Integer ligula lorem, finibus vitae lorem at, egestas consectetur urna. Integer id ultricies elit. Maecenas sodales nibh, quis posuere felis. In commodo mi lectus venenatis metus eget fringilla. Suspendisse varius ante eget.\" image=\"general/feature.png\" background_image=\"backgrounds/an-img-02.png\" button_primary_label=\"Discover More\" button_primary_url=\"/contact-us\" background_color=\"#F7F5F1\"][/feature-area][pricing title=\"Extra Services\" subtitle=\"Best Prices\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel Cras finibus laoreet felis et hendrerit. Integer ligula lorem, finibus vitae lorem at, egestas consectetur urna. Integer id ultricies elit. Maecenas sodales nibh, quis posuere felis. In commodo mi lectus venenatis metus eget fringilla. Suspendisse varius ante eget.\" background_image_1=\"backgrounds/an-img-01.png\" background_image_2=\"backgrounds/an-img-02.png\" quantity=\"2\" title_1=\"Room cleaning\" description_1=\"Perfect for early-stage startups\" price_1=\"$39.99\" duration_1=\"Monthly\" feature_list_1=\"Hotel quis justo at lorem, Fusce sodales urna et tempus, Vestibulum blandit lorem quis\" button_label_1=\"Get Started\" button_url_1=\"/contact-us\" title_2=\"Drinks included\" description_2=\"Perfect for early-stage startups\" price_2=\"$59.99\" duration_2=\"Monthly\" feature_list_2=\"Hotel quis justo at lorem, Fusce sodales urna et tempus, Vestibulum blandit lorem quis\" button_label_2=\"Get Started \" button_url_2=\"/contact-us\"][/pricing][testimonials title=\"What Our Clients Says\" subtitle=\"Testimonial\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" background_image=\"/backgrounds/testimonial-bg.png\" testimonial_ids=\"1,2,3,5,6,4\"][/testimonials][booking-form title=\"Book A Room\" subtitle=\"Make Reservation\" image=\"general/booking-img.png\" background_image=\"backgrounds/an-img-01.png\" button_primary_label=\"Book Table Now\" button_primary_url=\"/contact-us\" style=\"style-2\"][/booking-form][intro-video title=\"Take A Tour Of Luxury\" youtube_url=\"https://www.youtube.com/watch?v=ldusxyoq0Y8\" background_image=\"general/video-bg.png\"][/intro-video][news title=\"Latest Blog & News\" subtitle=\"Our Blog\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" background_image=\"backgrounds/an-img-07.png\" type=\"featured\" limit=\"3\"][/news][brands background_color=\"#F7F5F1\" quantity=\"6\" name_1=\"Ersintat\" image_1=\"brands/logo-1.png\" link_1=\"https://ersintat.com\" name_2=\"Techradar\" image_2=\"brands/logo-2.png\" link_2=\"https://techradar.com\" name_3=\"Turbologo\" image_3=\"brands/logo-3.png\" link_3=\"https://turbologo.com\" name_4=\"Thepeer\" image_4=\"brands/logo-4.png\" link_4=\"https://thepeer.com\" name_5=\"Techi\" image_5=\"brands/logo-5.png\" link_5=\"http://techi.com\" name_6=\"Grapik\" image_6=\"brands/logo-6.png\" link_6=\"https://grapk.com\"][/brands]',1,NULL,'full-width',NULL,'published','2025-06-10 10:38:14','2025-06-10 10:38:14'),(2,'Home Page 02','[hero-banner-with-booking-form title=\"Enjoy A Luxury Experience\" description=\"Donec vitae libero non enim placerat eleifend aliquam erat volutpat. Curabitur diam ex, dapibus purus sapien, cursus sed nisl tristique, commodo gravida lectus non.\" background_image=\"banners/slider-2.png\" background_color=\"#101010\" button_label=\"VISIT OUR SHOP\" button_url=\"/rooms\" form_title=\"Book A Room\" form_button_label=\"Check Availability\" form_button_url=\"/contact-us\"][/hero-banner-with-booking-form][about-us title=&quot;Most Safe &amp; Rated Hotel In London.&quot; subtitle=&quot;About Us&quot; description=&quot;At About Us, we take pride in offering the most secure and top-rated hotels in London. Your safety and comfort are our priorities, which is why our meticulous selection process ensures each hotel meets stringent quality standards. Whether you&rsquo;re visiting for business or leisure, trust us to provide you with a stay that combines the utmost security and exceptional service.&lt;br&gt; &lt;br&gt;Experience London like never before with our curated list of accommodations that boast prime locations and unmatched safety measures. From charming boutique hotels to Luxuryous city-center options, we&rsquo;ve done the groundwork to present you with a variety of choices that guarantee a worry-free stay. Choose About Us for a memorable trip enriched with both the allure of London.&quot; highlights=&quot;Discover the epitome of safe haven in our top-rated London hotels.; Immerse yourself in the heart of London&rsquo;s charm.; Experience the perfect blend of luxury and comfort.&quot; style=&quot;style-1&quot; button_label=&quot;DISCOVER MORE&quot; button_url=&quot;/about-us&quot; signature_image=&quot;general/signature.png&quot; signature_author=&quot;Vincent Smith&quot; top_left_image=&quot;services/about-img-02.png&quot; bottom_right_image=&quot;services/about-img-03.png&quot; floating_right_image=&quot;backgrounds/an-img-02.png&quot;][/about-us][featured-amenities title=\"The Hotel\" subtitle=\"Explore\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" background_color=\"#F7F5F1\" background_image=\"/backgrounds/an-img-01.png\" amenity_ids=\"1,2,3,4,5,6\"][/featured-amenities][featured-rooms title=\"Rooms & Suites\" subtitle=\"The Pleasure Of Luxury\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" room_ids=\"2,3,4,6,7\"][/featured-rooms][feature-area title=\"Pearl Of The Adriatic.\" subtitle=\"Luxury Hotel & Resort\" description=\"Vestibulum non ornare nunc. Maecenas a metus in est iaculis pretium. Aliquam ullamcorper nibh lacus, ac suscipit ipsum consequat porttitor.Aenean vehicula ligula eu rhoncus porttitor. Duis vel lacinia quam. Nunc rutrum porta ex, in imperdiet tortor feugiat at. Cras finibus laoreet felis et hendrerit. Integer ligula lorem, finibus vitae lorem at, egestas consectetur urna. Integer id ultricies elit. Maecenas sodales nibh, quis posuere felis. In commodo mi lectus venenatis metus eget fringilla. Suspendisse varius ante eget.\" image=\"general/feature.png\" background_image=\"backgrounds/an-img-02.png\" button_primary_label=\"Discover More\" button_primary_url=\"/contact-us\" background_color=\"#F7F5F1\"][/feature-area][pricing title=\"Extra Services\" subtitle=\"Best Prices\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel Cras finibus laoreet felis et hendrerit. Integer ligula lorem, finibus vitae lorem at, egestas consectetur urna. Integer id ultricies elit. Maecenas sodales nibh, quis posuere felis. In commodo mi lectus venenatis metus eget fringilla. Suspendisse varius ante eget.\" background_image_1=\"backgrounds/an-img-01.png\" background_image_2=\"backgrounds/an-img-02.png\" quantity=\"2\" title_1=\"Room cleaning\" description_1=\"Perfect for early-stage startups\" price_1=\"$39.99\" duration_1=\"Monthly\" feature_list_1=\"Hotel quis justo at lorem, Fusce sodales urna et tempus, Vestibulum blandit lorem quis\" button_label_1=\"Get Started\" button_url_1=\"/contact-us\" title_2=\"Drinks included\" description_2=\"Perfect for early-stage startups\" price_2=\"$59.99\" duration_2=\"Monthly\" feature_list_2=\"Hotel quis justo at lorem, Fusce sodales urna et tempus, Vestibulum blandit lorem quis\" button_label_2=\"Get Started \" button_url_2=\"/contact-us\"][/pricing][testimonials title=\"What Our Clients Says\" subtitle=\"Testimonial\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" background_image=\"/backgrounds/testimonial-bg.png\" testimonial_ids=\"1,2,3,5,6,4\"][/testimonials][booking-form title=\"Book A Room\" subtitle=\"Make Reservation\" image=\"general/booking-img.png\" background_image=\"backgrounds/an-img-01.png\" button_primary_label=\"Book Table Now\" button_primary_url=\"/contact-us\" style=\"style-2\"][/booking-form][intro-video title=\"Take A Tour Of Luxury\" youtube_url=\"https://www.youtube.com/watch?v=ldusxyoq0Y8\" background_image=\"general/video-bg.png\"][/intro-video][news title=\"Latest Blog & News\" subtitle=\"Our Blog\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" background_image=\"backgrounds/an-img-07.png\" type=\"featured\" limit=\"3\"][/news][brands background_color=\"#F7F5F1\" quantity=\"6\" name_1=\"Ersintat\" image_1=\"brands/logo-1.png\" link_1=\"https://ersintat.com\" name_2=\"Techradar\" image_2=\"brands/logo-2.png\" link_2=\"https://techradar.com\" name_3=\"Turbologo\" image_3=\"brands/logo-3.png\" link_3=\"https://turbologo.com\" name_4=\"Thepeer\" image_4=\"brands/logo-4.png\" link_4=\"https://thepeer.com\" name_5=\"Techi\" image_5=\"brands/logo-5.png\" link_5=\"http://techi.com\" name_6=\"Grapik\" image_6=\"brands/logo-6.png\" link_6=\"https://grapk.com\"][/brands]',1,NULL,'full-width',NULL,'published','2025-06-10 10:38:14','2025-06-10 10:38:14'),(3,'Home Page Side Menu','[simple-slider key=\"home-slider\"][/simple-slider][check-availability-form][/check-availability-form][about-us title=&quot;Most Safe &amp; Rated Hotel In London.&quot; subtitle=&quot;About Us&quot; description=&quot;At About Us, we take pride in offering the most secure and top-rated hotels in London. Your safety and comfort are our priorities, which is why our meticulous selection process ensures each hotel meets stringent quality standards. Whether you&rsquo;re visiting for business or leisure, trust us to provide you with a stay that combines the utmost security and exceptional service.&lt;br&gt; &lt;br&gt;Experience London like never before with our curated list of accommodations that boast prime locations and unmatched safety measures. From charming boutique hotels to Luxuryous city-center options, we&rsquo;ve done the groundwork to present you with a variety of choices that guarantee a worry-free stay. Choose About Us for a memorable trip enriched with both the allure of London.&quot; highlights=&quot;Discover the epitome of safe haven in our top-rated London hotels.; Immerse yourself in the heart of London&rsquo;s charm.; Experience the perfect blend of luxury and comfort.&quot; style=&quot;style-1&quot; button_label=&quot;DISCOVER MORE&quot; button_url=&quot;/about-us&quot; signature_image=&quot;general/signature.png&quot; signature_author=&quot;Vincent Smith&quot; top_left_image=&quot;services/about-img-02.png&quot; bottom_right_image=&quot;services/about-img-03.png&quot; floating_right_image=&quot;backgrounds/an-img-02.png&quot;][/about-us][featured-amenities title=\"The Hotel\" subtitle=\"Explore\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" background_color=\"#F7F5F1\" background_image=\"/backgrounds/an-img-01.png\" amenity_ids=\"1,2,3,4,5,6\"][/featured-amenities][featured-rooms title=\"Rooms & Suites\" subtitle=\"The Pleasure Of Luxury\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" room_ids=\"2,3,4,6,7\"][/featured-rooms][feature-area title=\"Pearl Of The Adriatic.\" subtitle=\"Luxury Hotel & Resort\" description=\"Vestibulum non ornare nunc. Maecenas a metus in est iaculis pretium. Aliquam ullamcorper nibh lacus, ac suscipit ipsum consequat porttitor.Aenean vehicula ligula eu rhoncus porttitor. Duis vel lacinia quam. Nunc rutrum porta ex, in imperdiet tortor feugiat at. Cras finibus laoreet felis et hendrerit. Integer ligula lorem, finibus vitae lorem at, egestas consectetur urna. Integer id ultricies elit. Maecenas sodales nibh, quis posuere felis. In commodo mi lectus venenatis metus eget fringilla. Suspendisse varius ante eget.\" image=\"general/feature.png\" background_image=\"backgrounds/an-img-02.png\" button_primary_label=\"Discover More\" button_primary_url=\"/contact-us\" background_color=\"#F7F5F1\"][/feature-area][pricing title=\"Extra Services\" subtitle=\"Best Prices\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel Cras finibus laoreet felis et hendrerit. Integer ligula lorem, finibus vitae lorem at, egestas consectetur urna. Integer id ultricies elit. Maecenas sodales nibh, quis posuere felis. In commodo mi lectus venenatis metus eget fringilla. Suspendisse varius ante eget.\" background_image_1=\"backgrounds/an-img-01.png\" background_image_2=\"backgrounds/an-img-02.png\" quantity=\"2\" title_1=\"Room cleaning\" description_1=\"Perfect for early-stage startups\" price_1=\"$39.99\" duration_1=\"Monthly\" feature_list_1=\"Hotel quis justo at lorem, Fusce sodales urna et tempus, Vestibulum blandit lorem quis\" button_label_1=\"Get Started\" button_url_1=\"/contact-us\" title_2=\"Drinks included\" description_2=\"Perfect for early-stage startups\" price_2=\"$59.99\" duration_2=\"Monthly\" feature_list_2=\"Hotel quis justo at lorem, Fusce sodales urna et tempus, Vestibulum blandit lorem quis\" button_label_2=\"Get Started \" button_url_2=\"/contact-us\"][/pricing][testimonials title=\"What Our Clients Says\" subtitle=\"Testimonial\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" background_image=\"/backgrounds/testimonial-bg.png\" testimonial_ids=\"1,2,3,5,6,4\"][/testimonials][booking-form title=\"Book A Room\" subtitle=\"Make Reservation\" image=\"general/booking-img.png\" background_image=\"backgrounds/an-img-01.png\" button_primary_label=\"Book Table Now\" button_primary_url=\"/contact-us\" style=\"style-2\"][/booking-form][intro-video title=\"Take A Tour Of Luxury\" youtube_url=\"https://www.youtube.com/watch?v=ldusxyoq0Y8\" background_image=\"general/video-bg.png\"][/intro-video][news title=\"Latest Blog & News\" subtitle=\"Our Blog\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" background_image=\"backgrounds/an-img-07.png\" type=\"featured\" limit=\"3\"][/news][brands background_color=\"#F7F5F1\" quantity=\"6\" name_1=\"Ersintat\" image_1=\"brands/logo-1.png\" link_1=\"https://ersintat.com\" name_2=\"Techradar\" image_2=\"brands/logo-2.png\" link_2=\"https://techradar.com\" name_3=\"Turbologo\" image_3=\"brands/logo-3.png\" link_3=\"https://turbologo.com\" name_4=\"Thepeer\" image_4=\"brands/logo-4.png\" link_4=\"https://thepeer.com\" name_5=\"Techi\" image_5=\"brands/logo-5.png\" link_5=\"http://techi.com\" name_6=\"Grapik\" image_6=\"brands/logo-6.png\" link_6=\"https://grapk.com\"][/brands]',1,NULL,'side-menu',NULL,'published','2025-06-10 10:38:14','2025-06-10 10:38:14'),(4,'Home Page Full Menu','[simple-slider key=\"home-slider\"][/simple-slider][check-availability-form][/check-availability-form][featured-rooms title=\"Rooms & Suites\" subtitle=\"The Pleasure Of Luxury\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" room_ids=\"2,3,4,6,7\"][/featured-rooms][feature-area title=\"Pearl Of The Adriatic.\" subtitle=\"Luxury Hotel & Resort\" description=\"Vestibulum non ornare nunc. Maecenas a metus in est iaculis pretium. Aliquam ullamcorper nibh lacus, ac suscipit ipsum consequat porttitor.Aenean vehicula ligula eu rhoncus porttitor. Duis vel lacinia quam. Nunc rutrum porta ex, in imperdiet tortor feugiat at. Cras finibus laoreet felis et hendrerit. Integer ligula lorem, finibus vitae lorem at, egestas consectetur urna. Integer id ultricies elit. Maecenas sodales nibh, quis posuere felis. In commodo mi lectus venenatis metus eget fringilla. Suspendisse varius ante eget.\" image=\"general/feature.png\" background_image=\"backgrounds/an-img-02.png\" button_primary_label=\"Discover More\" button_primary_url=\"/contact-us\" background_color=\"#F7F5F1\"][/feature-area][about-us title=&quot;Most Safe &amp; Rated Hotel In London.&quot; subtitle=&quot;About Us&quot; description=&quot;At About Us, we take pride in offering the most secure and top-rated hotels in London. Your safety and comfort are our priorities, which is why our meticulous selection process ensures each hotel meets stringent quality standards. Whether you&rsquo;re visiting for business or leisure, trust us to provide you with a stay that combines the utmost security and exceptional service.&lt;br&gt; &lt;br&gt;Experience London like never before with our curated list of accommodations that boast prime locations and unmatched safety measures. From charming boutique hotels to Luxuryous city-center options, we&rsquo;ve done the groundwork to present you with a variety of choices that guarantee a worry-free stay. Choose About Us for a memorable trip enriched with both the allure of London.&quot; highlights=&quot;Discover the epitome of safe haven in our top-rated London hotels.; Immerse yourself in the heart of London&rsquo;s charm.; Experience the perfect blend of luxury and comfort.&quot; style=&quot;style-1&quot; button_label=&quot;DISCOVER MORE&quot; button_url=&quot;/about-us&quot; signature_image=&quot;general/signature.png&quot; signature_author=&quot;Vincent Smith&quot; top_left_image=&quot;services/about-img-02.png&quot; bottom_right_image=&quot;services/about-img-03.png&quot; floating_right_image=&quot;backgrounds/an-img-02.png&quot;][/about-us][featured-amenities title=\"The Hotel\" subtitle=\"Explore\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" background_color=\"#F7F5F1\" background_image=\"/backgrounds/an-img-01.png\" amenity_ids=\"1,2,3,4,5,6\"][/featured-amenities][pricing title=\"Extra Services\" subtitle=\"Best Prices\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel Cras finibus laoreet felis et hendrerit. Integer ligula lorem, finibus vitae lorem at, egestas consectetur urna. Integer id ultricies elit. Maecenas sodales nibh, quis posuere felis. In commodo mi lectus venenatis metus eget fringilla. Suspendisse varius ante eget.\" background_image_1=\"backgrounds/an-img-01.png\" background_image_2=\"backgrounds/an-img-02.png\" quantity=\"2\" title_1=\"Room cleaning\" description_1=\"Perfect for early-stage startups\" price_1=\"$39.99\" duration_1=\"Monthly\" feature_list_1=\"Hotel quis justo at lorem, Fusce sodales urna et tempus, Vestibulum blandit lorem quis\" button_label_1=\"Get Started\" button_url_1=\"/contact-us\" title_2=\"Drinks included\" description_2=\"Perfect for early-stage startups\" price_2=\"$59.99\" duration_2=\"Monthly\" feature_list_2=\"Hotel quis justo at lorem, Fusce sodales urna et tempus, Vestibulum blandit lorem quis\" button_label_2=\"Get Started \" button_url_2=\"/contact-us\"][/pricing][testimonials title=\"What Our Clients Says\" subtitle=\"Testimonial\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" background_image=\"/backgrounds/testimonial-bg.png\" testimonial_ids=\"1,2,3,5,6,4\"][/testimonials][booking-form title=\"Book A Room\" subtitle=\"Make Reservation\" image=\"general/booking-img.png\" background_image=\"backgrounds/an-img-01.png\" button_primary_label=\"Book Table Now\" button_primary_url=\"/contact-us\" style=\"style-2\"][/booking-form][intro-video title=\"Take A Tour Of Luxury\" youtube_url=\"https://www.youtube.com/watch?v=ldusxyoq0Y8\" background_image=\"general/video-bg.png\"][/intro-video][news title=\"Latest Blog & News\" subtitle=\"Our Blog\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" background_image=\"backgrounds/an-img-07.png\" type=\"featured\" limit=\"3\"][/news][brands background_color=\"#F7F5F1\" quantity=\"6\" name_1=\"Ersintat\" image_1=\"brands/logo-1.png\" link_1=\"https://ersintat.com\" name_2=\"Techradar\" image_2=\"brands/logo-2.png\" link_2=\"https://techradar.com\" name_3=\"Turbologo\" image_3=\"brands/logo-3.png\" link_3=\"https://turbologo.com\" name_4=\"Thepeer\" image_4=\"brands/logo-4.png\" link_4=\"https://thepeer.com\" name_5=\"Techi\" image_5=\"brands/logo-5.png\" link_5=\"http://techi.com\" name_6=\"Grapik\" image_6=\"brands/logo-6.png\" link_6=\"https://grapk.com\"][/brands]',1,NULL,'full-menu',NULL,'published','2025-06-10 10:38:14','2025-06-10 10:38:14'),(5,'About Us','[about-us title=&quot;Most Safe &amp; Rated Hotel In London.&quot; subtitle=&quot;About Us&quot; description=&quot;At About Us, we take pride in offering the most secure and top-rated hotels in London. Your safety and comfort are our priorities, which is why our meticulous selection process ensures each hotel meets stringent quality standards. Whether you&rsquo;re visiting for business or leisure, trust us to provide you with a stay that combines the utmost security and exceptional service.&lt;br&gt; &lt;br&gt;Experience London like never before with our curated list of accommodations that boast prime locations and unmatched safety measures. From charming boutique hotels to Luxuryous city-center options, we&rsquo;ve done the groundwork to present you with a variety of choices that guarantee a worry-free stay. Choose About Us for a memorable trip enriched with both the allure of London.&quot; highlights=&quot;Discover the epitome of safe haven in our top-rated London hotels.; Immerse yourself in the heart of London&rsquo;s charm.; Experience the perfect blend of luxury and comfort.&quot; style=&quot;style-2&quot; button_label=&quot;DISCOVER MORE&quot; button_url=&quot;/about-us&quot; signature_image=&quot;general/signature.png&quot; signature_author=&quot;Vincent Smith&quot; top_left_image=&quot;services/about-img-02.png&quot; bottom_right_image=&quot;services/about-img-03.png&quot; floating_right_image=&quot;backgrounds/an-img-02.png&quot;][/about-us][why-choose-us title=\"We Offer Wide Selection of Hotel\" subtitle=\"Rio We Use\" description=\"Explore a variety of handpicked hotels with Rio We Use. Your ideal stay is just a click away. Book now for an unforgettable experience.\" right_image=\"services/skills-img.png\" background_color=\"#291D16\" background_image=\"backgrounds/an-img-05.png\" quantity=\"3\" title_1=\"Quality Production\" percentage_1=\"80\" title_2=\"Maintenance Services\" percentage_2=\"90\" title_3=\"Product Management\" percentage_3=\"70\"][/why-choose-us][services title=&quot;Pearl Of The Adriatic.&quot; subtitle=&quot;Luxury Hotel &amp; Resort&quot; description=&quot;Indulge in the ultimate lavish escape at our Luxury Hotel &amp; Resort, renowned as the Pearl of the Adriatic. Immerse yourself in unparalleled elegance and breathtaking coastal beauty for an unforgettable retreat. &lt;br&gt;&lt;br&gt;Nestled along the stunning Adriatic coast, our Luxury Hotel &amp; Resort stands as a beacon of opulence and tranquility. With panoramic views of the sparkling waters and world-class amenities at your fingertips, every moment becomes a precious gem. Experience unrivaled hospitality and immerse yourself in the allure of the Pearl of the Adriatic.&quot; left_image=&quot;services/feature.png&quot; right_floating_image=&quot;backgrounds/an-img-02.png&quot; button_label=&quot;DISCOVER MORE&quot; button_url=&quot;/about-us&quot;][/services][news title=\"Latest Blog & News\" subtitle=\"Our Blog\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" background_image=\"backgrounds/an-img-07.png\" type=\"featured\" limit=\"3\"][/news][newsletter title=\"Get Best Offers On The Hotel\" subtitle=\"Newsletter\" description=\"With the subscription, enjoy your favourite Hotels without having to think about it\" background_color=\"#F7F5F1\" left_floating_image=\"backgrounds/an-img-07.png\"][/newsletter]',1,NULL,'full-width',NULL,'published','2025-06-10 10:38:14','2025-06-10 10:38:14'),(6,'Services','[service-list background_image=\"backgrounds/an-img-01.png\" limit=\"6\"][/service-list][feature-area title=\"Pearl Of The Adriatic.\" subtitle=\"Luxury Hotel & Resort\" description=\"Vestibulum non ornare nunc. Maecenas a metus in est iaculis pretium. Aliquam ullamcorper nibh lacus, ac suscipit ipsum consequat porttitor.Aenean vehicula ligula eu rhoncus porttitor. Duis vel lacinia quam. Nunc rutrum porta ex, in imperdiet tortor feugiat at. Cras finibus laoreet felis et hendrerit. Integer ligula lorem, finibus vitae lorem at, egestas consectetur urna. Integer id ultricies elit. Maecenas sodales nibh, quis posuere felis. In commodo mi lectus venenatis metus eget fringilla. Suspendisse varius ante eget.\" image=\"general/feature.png\" background_image=\"backgrounds/an-img-02.png\" button_primary_label=\"Discover More\" button_primary_url=\"/contact-us\" background_color=\"#F7F5F1\"][/feature-area][booking-form title=\"Book A Room\" subtitle=\"Make Reservation\" image=\"general/booking-img.png\" background_image=\"backgrounds/an-img-01.png\" button_primary_label=\"Book Table Now\" button_primary_url=\"/contact-us\" style=\"style-2\"][/booking-form][testimonials title=\"What Our Clients Says\" subtitle=\"Testimonial\" description=\"Proin consectetur non dolor vitae pulvinar. Pellentesque sollicitudin dolor eget neque viverra, sed interdum metus interdum. Cras lobortis pulvinar dolor, sit amet ullamcorper dolor iaculis vel\" background_image=\"/backgrounds/testimonial-bg.png\" testimonial_ids=\"1,2,3,5,6,4\"][/testimonials]',1,NULL,'full-width',NULL,'published','2025-06-10 10:38:14','2025-06-10 10:38:14'),(7,'Galleries','[galleries limit=\"10\"][/galleries]',1,NULL,'full-width',NULL,'published','2025-06-10 10:38:14','2025-06-10 10:38:14'),(8,'FAQ','[faqs category_ids=\"1,2,3,4,5\"][/faqs][newsletter title=\"Get Best Offers On The Hotel\" subtitle=\"Newsletter\" description=\"With the subscription, enjoy your favourite Hotels without having to think about it\" background_color=\"#F7F5F1\" left_floating_image=\"backgrounds/an-img-07.png\"][/newsletter][teams title=\"Best Expert Hotel\" subtitle=\"Our Team\" description=\"As a united team, we passionately craft your perfect stay, ensuring every detail reflects our commitment to exceptional hospitality.\" team_ids=\"1,2,3,4,5,6\"][/teams]',1,NULL,'full-width',NULL,'published','2025-06-10 10:38:14','2025-06-10 10:38:14'),(9,'Team','[teams team_ids=\"1,2,3,4,5,6,7,8\" style=\"style-2\"][/teams][why-choose-us title=\"We Offer Wide Selection of Hotel\" subtitle=\"Rio We Use\" description=\"Explore a variety of handpicked hotels with Rio We Use. Your ideal stay is just a click away. Book now for an unforgettable experience.\" right_image=\"services/skills-img.png\" background_color=\"#291D16\" background_image=\"backgrounds/an-img-05.png\" quantity=\"3\" title_1=\"Quality Production\" percentage_1=\"80\" title_2=\"Maintenance Services\" percentage_2=\"90\" title_3=\"Product Management\" percentage_3=\"70\"][/why-choose-us][newsletter title=\"Get Best Offers On The Hotel\" subtitle=\"Newsletter\" description=\"With the subscription, enjoy your favourite Hotels without having to think about it\" background_color=\"#F7F5F1\" left_floating_image=\"backgrounds/an-img-07.png\"][/newsletter]',1,NULL,'full-width',NULL,'published','2025-06-10 10:38:14','2025-06-10 10:38:14'),(10,'Blog','[blog-posts paginate=\"12\"][/blog-posts]',1,NULL,'blog-sidebar',NULL,'published','2025-06-10 10:38:14','2025-06-10 10:38:14'),(11,'Contact Us','[contact-form title=&quot;Get In Touch&quot; title_button=&quot;SUBMIT NOW&quot; address_icon=&quot;far fa-map&quot; address_label=&quot;Office Address&quot; address_detail=&quot;380 St Kilda Road, Melbourne &lt;br&gt;VIC 3004, Australia&quot; email_icon=&quot;far fa-envelope-open&quot; email_label=&quot;Message Us&quot; email_detail=&quot;support@example.com &lt;br&gt;info@example.com&quot; work_time_icon=&quot;far fa-clock&quot; work_time_label=&quot;Working Hours&quot; work_time_detail=&quot;Monday to Friday 09:00 to 18:30 &lt;br&gt;Saturday 15:30&quot; phone_icon=&quot;fa fa-phone&quot; phone_label=&quot;(+1) 123 456 78&quot; phone_detail=&quot; 24/7 Customer Service And Returns Support.&quot;][/contact-form][newsletter title=\"Get Best Offers On The Hotel\" subtitle=\"Newsletter\" description=\"With the subscription, enjoy your favourite Hotels without having to think about it\" background_color=\"#F7F5F1\" left_floating_image=\"backgrounds/an-img-07.png\"][/newsletter]',1,NULL,'full-width',NULL,'published','2025-06-10 10:38:14','2025-06-10 10:38:14'),(12,'Privacy','<div class=\"about-area5 about-p p-relative\">\n    <div class=\"container pt-60 pb-90\">\n        <div class=\"service-detail\">\n            <div class=\"content-box\">\n                <h2> Privacy Statement </h2>\n                <p>First things first – your privacy is important to us. That might be the kind of thing all these notices say, but we mean it. You place your trust in us by using us services and we value that trust. That means we’re committed to protecting and safeguarding your personal data. We act in our customers’ best interest and we are transparent about the processing of your personal data.</p>\n                <p>If you’ve used us before, you know that us services offers online travel-related services through our own websites and mobile apps, as well as other online platforms such as partners’ websites and social media. We’d like to point out that all the information you are about to read, generally applies to not one, not two, but all of these platforms.</p>\n                <p>If you’ve used us before, you know that us services offers online travel-related services through our own websites and mobile apps, as well as other online platforms such as partners’ websites and social media. We’d like to point out that all the information you are about to read, generally applies to not one, not two, but all of these platforms.</p>\n\n                <h2>Terms we use in this Privacy Statement</h2>\n                <p>\'Trip\' means the various different travel products and services that can be ordered, acquired, purchased, bought, paid, rented, provided, reserved, combined, or consummated by you from the Trip Provider.</p>\n                <p>\'Trip Provider\' means the provider of accommodation (e.g. hotel, motel, apartment, bed & breakfast, landlord), attractions (e.g. (theme) parks, museums, sightseeing tours), transportation provider (e.g. car rentals, cruises, rail, airport rides, coach tours, transfers), tour operators, travel insurances and any other travel or related product or service as from time to time available for Trip Reservation on the platform.</p>\n            </div>\n        </div>\n    </div>\n</div>\n',1,NULL,'full-width',NULL,'published','2025-06-10 10:38:14','2025-06-10 10:38:14'),(13,'Term and Conditions','<div class=\"about-area5 about-p p-relative\">\n    <div class=\"container pt-60 pb-90\">\n        <div class=\"service-detail\">\n            <div class=\"content-box\">\n                <h3>Definitions</h3>\n                <p>Some of the words you’ll see have very specific meanings, so please check out the ‘RioRelax dictionary’ at the end of these Terms.</p>\n\n                <h3>About these terms</h3>\n                <p>When you complete your Booking, you accept these Terms and any other terms that you’re provided with during the booking process.</p>\n                <p>The English version of these Terms is the original. If there’s any dispute about the Terms, or any mismatch between the Terms in English and in another language, the Terms as they appear in English will apply. (You can change the language at the top of this page.</p>\n\n                <h3>Our Platform</h3>\n                <p> We take reasonable care in providing our Platform, but we can’t guarantee that everything on it is accurate (we get information from the Service Providers). To the extent permitted by law, we can’t be held responsible for any errors, any interruptions, or any missing bits of information - although we will do everything we can to correct/fix them as soon as we can.</p>\n                <P>We will show you the offers that are available to you, in (what we think is) the right language for you. You can change to another language whenever you like.</P>\n\n                <h3>Prices</h3>\n                <p> When you make a Booking, you agree to pay the cost of the Travel Experience, including any charges and taxes that may apply.</p>\n                <p> Some of the prices you see may have been rounded to the nearest whole number. The price you pay will be based on the original, \'non-rounded\' price (although the actual difference will be tiny anyway).</p>\n            </div>\n        </div>\n    </div>\n</div>\n',1,NULL,'full-width',NULL,'published','2025-06-10 10:38:14','2025-06-10 10:38:14');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_logs`
--

DROP TABLE IF EXISTS `payment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `response` longtext COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_logs`
--

LOCK TABLES `payment_logs` WRITE;
/*!40000 ALTER TABLE `payment_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `payment_fee` decimal(15,2) DEFAULT '0.00',
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'USD',3,'ixHVuXmeyWaq9lVU7Ids','stripe',NULL,134.00,0.00,1,'failed','direct',3,NULL,NULL,'2025-06-10 10:38:22','2025-06-10 10:38:22','Botble\\Hotel\\Models\\Customer',NULL),(2,'USD',3,'UUl7VMQ7C38veGdonOtb','stripe',NULL,171.00,0.00,2,'fraud','direct',3,NULL,NULL,'2025-06-10 10:38:22','2025-06-10 10:38:22','Botble\\Hotel\\Models\\Customer',NULL),(3,'USD',8,'0TlKTn79xN4ZUpaAZOv8','sslcommerz',NULL,597.00,0.00,3,'fraud','direct',8,NULL,NULL,'2025-06-10 10:38:22','2025-06-10 10:38:22','Botble\\Hotel\\Models\\Customer',NULL),(4,'USD',4,'BT52Tzeeq9qAmZ3cJ5Ye','stripe',NULL,342.00,0.00,4,'pending','direct',4,NULL,NULL,'2025-06-10 10:38:22','2025-06-10 10:38:22','Botble\\Hotel\\Models\\Customer',NULL),(5,'USD',7,'gzzKkoLv2fw7NBRyoEK8','razorpay',NULL,187.00,0.00,5,'fraud','direct',7,NULL,NULL,'2025-06-10 10:38:22','2025-06-10 10:38:22','Botble\\Hotel\\Models\\Customer',NULL),(6,'USD',6,'np3SRX0f6gfBRa4FsmVN','razorpay',NULL,157.00,0.00,6,'completed','direct',6,NULL,NULL,'2025-06-10 10:38:22','2025-06-10 10:38:22','Botble\\Hotel\\Models\\Customer',NULL),(7,'USD',9,'vLHBcEkQooE1X2NoIQs6','paypal',NULL,398.00,0.00,7,'failed','direct',9,NULL,NULL,'2025-06-10 10:38:22','2025-06-10 10:38:22','Botble\\Hotel\\Models\\Customer',NULL),(8,'USD',2,'JEB3ns7Oxpy8liUUh2DE','razorpay',NULL,310.00,0.00,8,'canceled','direct',2,NULL,NULL,'2025-06-10 10:38:22','2025-06-10 10:38:22','Botble\\Hotel\\Models\\Customer',NULL),(9,'USD',3,'T7GhkInTK1tXRMJx91Vu','sslcommerz',NULL,597.00,0.00,9,'refunded','direct',3,NULL,NULL,'2025-06-10 10:38:22','2025-06-10 10:38:22','Botble\\Hotel\\Models\\Customer',NULL),(10,'USD',9,'cnGPXDDBK01vJ8xA5qZH','cod',NULL,199.00,0.00,10,'pending','direct',9,NULL,NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23','Botble\\Hotel\\Models\\Customer',NULL),(11,'USD',7,'3IS2uR3WtQqU568pa54p','bank_transfer',NULL,597.00,0.00,11,'fraud','direct',7,NULL,NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23','Botble\\Hotel\\Models\\Customer',NULL),(12,'USD',11,'0M1ZT92uX0NHWMatfMSg','stripe',NULL,157.00,0.00,12,'refunded','direct',11,NULL,NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23','Botble\\Hotel\\Models\\Customer',NULL),(13,'USD',1,'i0s1vetDOGOZEjYfQNu9','cod',NULL,471.00,0.00,13,'canceled','direct',1,NULL,NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23','Botble\\Hotel\\Models\\Customer',NULL),(14,'USD',5,'S7fHjTIu9bTXMTPsWLfi','razorpay',NULL,114.00,0.00,14,'pending','direct',5,NULL,NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23','Botble\\Hotel\\Models\\Customer',NULL),(15,'USD',10,'00x0MbjPwLRjlZFEiiIV','stripe',NULL,171.00,0.00,15,'refunded','direct',10,NULL,NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23','Botble\\Hotel\\Models\\Customer',NULL),(16,'USD',2,'NDBvw5Hr3W9XDD0gql2j','bank_transfer',NULL,228.00,0.00,16,'failed','direct',2,NULL,NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23','Botble\\Hotel\\Models\\Customer',NULL),(17,'USD',4,'6tNimwtSPyRayKqZCwd8','paystack',NULL,228.00,0.00,17,'failed','direct',4,NULL,NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23','Botble\\Hotel\\Models\\Customer',NULL),(18,'USD',5,'NzSRVrmWBVm5aRdHUaFp','paypal',NULL,114.00,0.00,18,'refunded','direct',5,NULL,NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23','Botble\\Hotel\\Models\\Customer',NULL),(19,'USD',11,'Do4lvmtS3IaHq9uJhOuc','paystack',NULL,274.00,0.00,19,'failed','direct',11,NULL,NULL,'2025-06-10 10:38:23','2025-06-10 10:38:23','Botble\\Hotel\\Models\\Customer',NULL),(20,'USD',8,'1BElUKR3lqZbIzD1eTfj','bank_transfer',NULL,374.00,0.00,20,'failed','direct',8,NULL,NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24','Botble\\Hotel\\Models\\Customer',NULL),(21,'USD',4,'FJRlahBDrTgh2ulfl80Y','paypal',NULL,134.00,0.00,21,'failed','direct',4,NULL,NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24','Botble\\Hotel\\Models\\Customer',NULL),(22,'USD',11,'6NhxSt0ywRcAY5i7l2fZ','stripe',NULL,374.00,0.00,22,'fraud','direct',11,NULL,NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24','Botble\\Hotel\\Models\\Customer',NULL),(23,'USD',5,'ibuJMfxHx3Yc4KNrck5D','sslcommerz',NULL,199.00,0.00,23,'refunded','direct',5,NULL,NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24','Botble\\Hotel\\Models\\Customer',NULL),(24,'USD',2,'4nnCAuGiQDQNvJ8ZlT9x','paystack',NULL,187.00,0.00,24,'failed','direct',2,NULL,NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24','Botble\\Hotel\\Models\\Customer',NULL),(25,'USD',8,'AH8CoaG9isP68KcDgMjY','sslcommerz',NULL,471.00,0.00,25,'refunded','direct',8,NULL,NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24','Botble\\Hotel\\Models\\Customer',NULL),(26,'USD',11,'AhPUgpoQegDoCMXXjKn8','cod',NULL,465.00,0.00,26,'failed','direct',11,NULL,NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24','Botble\\Hotel\\Models\\Customer',NULL),(27,'USD',7,'mVO4vjzlegVhaGTCxPKz','razorpay',NULL,411.00,0.00,27,'fraud','direct',7,NULL,NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24','Botble\\Hotel\\Models\\Customer',NULL),(28,'USD',3,'fjWIxc10NCMA7TIdAPm4','stripe',NULL,374.00,0.00,28,'pending','direct',3,NULL,NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24','Botble\\Hotel\\Models\\Customer',NULL),(29,'USD',1,'P9AxBxQXj2BZiBlZiflr','cod',NULL,268.00,0.00,29,'pending','direct',1,NULL,NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24','Botble\\Hotel\\Models\\Customer',NULL),(30,'USD',6,'MY5QfJQwp9BDUM3cs7SS','stripe',NULL,374.00,0.00,30,'pending','direct',6,NULL,NULL,'2025-06-10 10:38:24','2025-06-10 10:38:24','Botble\\Hotel\\Models\\Customer',NULL),(31,'USD',3,'QZxo31blnrJ2zuQ716EJ','paystack',NULL,155.00,0.00,31,'failed','direct',3,NULL,NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25','Botble\\Hotel\\Models\\Customer',NULL),(32,'USD',10,'QJPHOoXmA3JeJrzXpIyk','sslcommerz',NULL,342.00,0.00,32,'pending','direct',10,NULL,NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25','Botble\\Hotel\\Models\\Customer',NULL),(33,'USD',11,'HMcZxTQPsv1WQLm7uBJ9','paypal',NULL,342.00,0.00,33,'refunding','direct',11,NULL,NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25','Botble\\Hotel\\Models\\Customer',NULL),(34,'USD',10,'ImdlzQ1hQgduRRUZjYww','razorpay',NULL,228.00,0.00,34,'pending','direct',10,NULL,NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25','Botble\\Hotel\\Models\\Customer',NULL),(35,'USD',2,'srZreyjpFEjoMCKGS2Mv','razorpay',NULL,374.00,0.00,35,'pending','direct',2,NULL,NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25','Botble\\Hotel\\Models\\Customer',NULL),(36,'USD',7,'ReUdpOP9TmFInqzrcSNA','bank_transfer',NULL,314.00,0.00,36,'refunded','direct',7,NULL,NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25','Botble\\Hotel\\Models\\Customer',NULL),(37,'USD',1,'3uiwDfnYPWpFPvrtzl0i','paystack',NULL,402.00,0.00,37,'failed','direct',1,NULL,NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25','Botble\\Hotel\\Models\\Customer',NULL),(38,'USD',5,'qa7vT8o4OKfnbZAyWlbY','cod',NULL,137.00,0.00,38,'refunded','direct',5,NULL,NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25','Botble\\Hotel\\Models\\Customer',NULL),(39,'USD',3,'8JqNyHUdZ0GvbyM43Cq5','stripe',NULL,342.00,0.00,39,'canceled','direct',3,NULL,NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25','Botble\\Hotel\\Models\\Customer',NULL),(40,'USD',2,'nLoeE5dtAe3Rsl4yH19J','paypal',NULL,199.00,0.00,40,'failed','direct',2,NULL,NULL,'2025-06-10 10:38:25','2025-06-10 10:38:25','Botble\\Hotel\\Models\\Customer',NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,1),(3,1),(2,2),(3,2),(2,3),(4,3),(1,4),(3,4),(2,5),(3,5),(1,6),(3,6);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3),(1,4),(2,4),(3,4),(4,4),(5,4),(1,5),(2,5),(3,5),(4,5),(5,5),(1,6),(2,6),(3,6),(4,6),(5,6);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Each of our 8 double rooms has its own distinct.','Discover a world of unique comfort in our collection of 8 double rooms, each boasting its own distinct charm and character. Immerse yourself in a stay that caters to your individual preferences','<p>\n    At Riorelax, we believe in crafting memories that last a lifetime. Our blog series will unveil the array of experiences we offer, tailored to every kind of traveler. Whether you seek adventure, relaxation, romance, or exploration, our personalized activities and excursions ensure that your stay transcends the ordinary. Join us as we share stories of guests who\'ve embraced the luxury of choice and embarked on journeys that become cherished tales, all within the embrace of our extraordinary hotel.\n</p>\n<p>\n    Unlock the Gateway to Opulent Tranquility: Introducing Riorelax\n    Embark on a journey to unparalleled luxury and coastal elegance. Nestled along the Adriatic\'s pristine shoreline, Riorelax stands as a beacon of refined indulgence. Join us as we delve into the enchanting world of bespoke experiences, exquisite accommodations, and personalized service that defines our exceptional hotel. From captivating sea-view rooms to tantalizing gastronomic delights, spa sanctuaries, and curated adventures, our blog takes you behind the scenes of a retreat where every moment is a masterpiece. Uncover the essence of opulence, where your desires are our command and the Adriatic becomes your playground. Stay tuned for a symphony of elegance, artistry, and inspiration in our upcoming series.\n</p>\n<blockquote>\n    <footer>By Rosalina Pong</footer>\n    <h3>Viral dreamcatcher keytar typewriter, aest hetic offal umami. Aesthetic polaroid pug pitchfork post-ironic.</h3>\n</blockquote>\n<p>\n    Step into a realm where luxury is not just a word, but a way of life. Riorelax invites you to explore a world where opulence meets comfort in seamless harmony. Our blog series will unveil the heart and soul of our hotel, from the intricacies of our meticulous design to the intuitive service that anticipates your every need. Join us on a virtual tour that captures the essence of sophistication, a prelude to the unforgettable experience that awaits you at our shores.\n</p>\n<div class=\"details__content-img\">\n    <img src=\"http://localhost/storage/news/1.jpg\" alt=\"\" />\n</div>\n<p>\n    Prepare to tantalize your taste buds as we delve into the culinary symphony orchestrated by our skilled chefs. From gourmet creations that blend local flavors with international finesse to the art of crafting the perfect cocktail, our blog will be your guide to the exceptional dining journey that awaits. Join us in savoring the stories behind each dish, the dedication that goes into every creation, and the joy of experiencing food as an art form within our culinary haven.\n</p>\n<figure>\n    <img src=\"http://localhost/storage/news/2.jpg\" alt=\"\" />\n    <p>\n        At Riorelax, we believe in crafting memories that last a lifetime. Our blog series will unveil the array of experiences we offer, tailored to every kind of traveler. Whether you seek adventure, relaxation, romance, or exploration, our personalized activities and excursions ensure that your stay transcends the ordinary. Join us as we share stories of guests who\'ve embraced the luxury of choice and embarked on journeys that become cherished tales, all within the embrace of our extraordinary hotel.\n    </p>\n</figure>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/1.jpg',1707,NULL,'2025-06-10 10:38:04','2025-06-10 10:38:04'),(2,'Essential Qualities of Highly Successful Music','Delve into the secrets behind the music that resonates deeply with audiences worldwide. Uncover the essential qualities that elevate music from ordinary to extraordinary, as we explore.','<p>\n    At Riorelax, we believe in crafting memories that last a lifetime. Our blog series will unveil the array of experiences we offer, tailored to every kind of traveler. Whether you seek adventure, relaxation, romance, or exploration, our personalized activities and excursions ensure that your stay transcends the ordinary. Join us as we share stories of guests who\'ve embraced the luxury of choice and embarked on journeys that become cherished tales, all within the embrace of our extraordinary hotel.\n</p>\n<p>\n    Unlock the Gateway to Opulent Tranquility: Introducing Riorelax\n    Embark on a journey to unparalleled luxury and coastal elegance. Nestled along the Adriatic\'s pristine shoreline, Riorelax stands as a beacon of refined indulgence. Join us as we delve into the enchanting world of bespoke experiences, exquisite accommodations, and personalized service that defines our exceptional hotel. From captivating sea-view rooms to tantalizing gastronomic delights, spa sanctuaries, and curated adventures, our blog takes you behind the scenes of a retreat where every moment is a masterpiece. Uncover the essence of opulence, where your desires are our command and the Adriatic becomes your playground. Stay tuned for a symphony of elegance, artistry, and inspiration in our upcoming series.\n</p>\n<blockquote>\n    <footer>By Rosalina Pong</footer>\n    <h3>Viral dreamcatcher keytar typewriter, aest hetic offal umami. Aesthetic polaroid pug pitchfork post-ironic.</h3>\n</blockquote>\n<p>\n    Step into a realm where luxury is not just a word, but a way of life. Riorelax invites you to explore a world where opulence meets comfort in seamless harmony. Our blog series will unveil the heart and soul of our hotel, from the intricacies of our meticulous design to the intuitive service that anticipates your every need. Join us on a virtual tour that captures the essence of sophistication, a prelude to the unforgettable experience that awaits you at our shores.\n</p>\n<div class=\"details__content-img\">\n    <img src=\"http://localhost/storage/news/1.jpg\" alt=\"\" />\n</div>\n<p>\n    Prepare to tantalize your taste buds as we delve into the culinary symphony orchestrated by our skilled chefs. From gourmet creations that blend local flavors with international finesse to the art of crafting the perfect cocktail, our blog will be your guide to the exceptional dining journey that awaits. Join us in savoring the stories behind each dish, the dedication that goes into every creation, and the joy of experiencing food as an art form within our culinary haven.\n</p>\n<figure>\n    <img src=\"http://localhost/storage/news/2.jpg\" alt=\"\" />\n    <p>\n        At Riorelax, we believe in crafting memories that last a lifetime. Our blog series will unveil the array of experiences we offer, tailored to every kind of traveler. Whether you seek adventure, relaxation, romance, or exploration, our personalized activities and excursions ensure that your stay transcends the ordinary. Join us as we share stories of guests who\'ve embraced the luxury of choice and embarked on journeys that become cherished tales, all within the embrace of our extraordinary hotel.\n    </p>\n</figure>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/2.jpg',1159,NULL,'2025-06-10 10:38:04','2025-06-10 10:38:04'),(3,'9 Things I Love About Shaving My Head','Embark on a personal journey of self-discovery and empowerment as we delve into the unique experience of embracing a bald look. From newfound confidence to a simplified routine, explore the 9 things','<p>\n    At Riorelax, we believe in crafting memories that last a lifetime. Our blog series will unveil the array of experiences we offer, tailored to every kind of traveler. Whether you seek adventure, relaxation, romance, or exploration, our personalized activities and excursions ensure that your stay transcends the ordinary. Join us as we share stories of guests who\'ve embraced the luxury of choice and embarked on journeys that become cherished tales, all within the embrace of our extraordinary hotel.\n</p>\n<p>\n    Unlock the Gateway to Opulent Tranquility: Introducing Riorelax\n    Embark on a journey to unparalleled luxury and coastal elegance. Nestled along the Adriatic\'s pristine shoreline, Riorelax stands as a beacon of refined indulgence. Join us as we delve into the enchanting world of bespoke experiences, exquisite accommodations, and personalized service that defines our exceptional hotel. From captivating sea-view rooms to tantalizing gastronomic delights, spa sanctuaries, and curated adventures, our blog takes you behind the scenes of a retreat where every moment is a masterpiece. Uncover the essence of opulence, where your desires are our command and the Adriatic becomes your playground. Stay tuned for a symphony of elegance, artistry, and inspiration in our upcoming series.\n</p>\n<blockquote>\n    <footer>By Rosalina Pong</footer>\n    <h3>Viral dreamcatcher keytar typewriter, aest hetic offal umami. Aesthetic polaroid pug pitchfork post-ironic.</h3>\n</blockquote>\n<p>\n    Step into a realm where luxury is not just a word, but a way of life. Riorelax invites you to explore a world where opulence meets comfort in seamless harmony. Our blog series will unveil the heart and soul of our hotel, from the intricacies of our meticulous design to the intuitive service that anticipates your every need. Join us on a virtual tour that captures the essence of sophistication, a prelude to the unforgettable experience that awaits you at our shores.\n</p>\n<div class=\"details__content-img\">\n    <img src=\"http://localhost/storage/news/1.jpg\" alt=\"\" />\n</div>\n<p>\n    Prepare to tantalize your taste buds as we delve into the culinary symphony orchestrated by our skilled chefs. From gourmet creations that blend local flavors with international finesse to the art of crafting the perfect cocktail, our blog will be your guide to the exceptional dining journey that awaits. Join us in savoring the stories behind each dish, the dedication that goes into every creation, and the joy of experiencing food as an art form within our culinary haven.\n</p>\n<figure>\n    <img src=\"http://localhost/storage/news/2.jpg\" alt=\"\" />\n    <p>\n        At Riorelax, we believe in crafting memories that last a lifetime. Our blog series will unveil the array of experiences we offer, tailored to every kind of traveler. Whether you seek adventure, relaxation, romance, or exploration, our personalized activities and excursions ensure that your stay transcends the ordinary. Join us as we share stories of guests who\'ve embraced the luxury of choice and embarked on journeys that become cherished tales, all within the embrace of our extraordinary hotel.\n    </p>\n</figure>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/3.jpg',1101,NULL,'2025-06-10 10:38:04','2025-06-10 10:38:04'),(4,'Why Teamwork Really Makes The Dream Work','Unlock the power of collaboration and synergy in achieving your goals. In this exploration of the importance of teamwork, we delve into real-world examples and insights and how combining diverse skills.','<p>\n    At Riorelax, we believe in crafting memories that last a lifetime. Our blog series will unveil the array of experiences we offer, tailored to every kind of traveler. Whether you seek adventure, relaxation, romance, or exploration, our personalized activities and excursions ensure that your stay transcends the ordinary. Join us as we share stories of guests who\'ve embraced the luxury of choice and embarked on journeys that become cherished tales, all within the embrace of our extraordinary hotel.\n</p>\n<p>\n    Unlock the Gateway to Opulent Tranquility: Introducing Riorelax\n    Embark on a journey to unparalleled luxury and coastal elegance. Nestled along the Adriatic\'s pristine shoreline, Riorelax stands as a beacon of refined indulgence. Join us as we delve into the enchanting world of bespoke experiences, exquisite accommodations, and personalized service that defines our exceptional hotel. From captivating sea-view rooms to tantalizing gastronomic delights, spa sanctuaries, and curated adventures, our blog takes you behind the scenes of a retreat where every moment is a masterpiece. Uncover the essence of opulence, where your desires are our command and the Adriatic becomes your playground. Stay tuned for a symphony of elegance, artistry, and inspiration in our upcoming series.\n</p>\n<blockquote>\n    <footer>By Rosalina Pong</footer>\n    <h3>Viral dreamcatcher keytar typewriter, aest hetic offal umami. Aesthetic polaroid pug pitchfork post-ironic.</h3>\n</blockquote>\n<p>\n    Step into a realm where luxury is not just a word, but a way of life. Riorelax invites you to explore a world where opulence meets comfort in seamless harmony. Our blog series will unveil the heart and soul of our hotel, from the intricacies of our meticulous design to the intuitive service that anticipates your every need. Join us on a virtual tour that captures the essence of sophistication, a prelude to the unforgettable experience that awaits you at our shores.\n</p>\n<div class=\"details__content-img\">\n    <img src=\"http://localhost/storage/news/1.jpg\" alt=\"\" />\n</div>\n<p>\n    Prepare to tantalize your taste buds as we delve into the culinary symphony orchestrated by our skilled chefs. From gourmet creations that blend local flavors with international finesse to the art of crafting the perfect cocktail, our blog will be your guide to the exceptional dining journey that awaits. Join us in savoring the stories behind each dish, the dedication that goes into every creation, and the joy of experiencing food as an art form within our culinary haven.\n</p>\n<figure>\n    <img src=\"http://localhost/storage/news/2.jpg\" alt=\"\" />\n    <p>\n        At Riorelax, we believe in crafting memories that last a lifetime. Our blog series will unveil the array of experiences we offer, tailored to every kind of traveler. Whether you seek adventure, relaxation, romance, or exploration, our personalized activities and excursions ensure that your stay transcends the ordinary. Join us as we share stories of guests who\'ve embraced the luxury of choice and embarked on journeys that become cherished tales, all within the embrace of our extraordinary hotel.\n    </p>\n</figure>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/4.jpg',1845,NULL,'2025-06-10 10:38:04','2025-06-10 10:38:04'),(5,'The World Caters to Average People','Unveil the hidden truths behind success in a world that often values conformity. In a thought-provoking analysis, we examine why societal norms tend to cater to the average and breaking boundaries.','<p>\n    At Riorelax, we believe in crafting memories that last a lifetime. Our blog series will unveil the array of experiences we offer, tailored to every kind of traveler. Whether you seek adventure, relaxation, romance, or exploration, our personalized activities and excursions ensure that your stay transcends the ordinary. Join us as we share stories of guests who\'ve embraced the luxury of choice and embarked on journeys that become cherished tales, all within the embrace of our extraordinary hotel.\n</p>\n<p>\n    Unlock the Gateway to Opulent Tranquility: Introducing Riorelax\n    Embark on a journey to unparalleled luxury and coastal elegance. Nestled along the Adriatic\'s pristine shoreline, Riorelax stands as a beacon of refined indulgence. Join us as we delve into the enchanting world of bespoke experiences, exquisite accommodations, and personalized service that defines our exceptional hotel. From captivating sea-view rooms to tantalizing gastronomic delights, spa sanctuaries, and curated adventures, our blog takes you behind the scenes of a retreat where every moment is a masterpiece. Uncover the essence of opulence, where your desires are our command and the Adriatic becomes your playground. Stay tuned for a symphony of elegance, artistry, and inspiration in our upcoming series.\n</p>\n<blockquote>\n    <footer>By Rosalina Pong</footer>\n    <h3>Viral dreamcatcher keytar typewriter, aest hetic offal umami. Aesthetic polaroid pug pitchfork post-ironic.</h3>\n</blockquote>\n<p>\n    Step into a realm where luxury is not just a word, but a way of life. Riorelax invites you to explore a world where opulence meets comfort in seamless harmony. Our blog series will unveil the heart and soul of our hotel, from the intricacies of our meticulous design to the intuitive service that anticipates your every need. Join us on a virtual tour that captures the essence of sophistication, a prelude to the unforgettable experience that awaits you at our shores.\n</p>\n<div class=\"details__content-img\">\n    <img src=\"http://localhost/storage/news/1.jpg\" alt=\"\" />\n</div>\n<p>\n    Prepare to tantalize your taste buds as we delve into the culinary symphony orchestrated by our skilled chefs. From gourmet creations that blend local flavors with international finesse to the art of crafting the perfect cocktail, our blog will be your guide to the exceptional dining journey that awaits. Join us in savoring the stories behind each dish, the dedication that goes into every creation, and the joy of experiencing food as an art form within our culinary haven.\n</p>\n<figure>\n    <img src=\"http://localhost/storage/news/2.jpg\" alt=\"\" />\n    <p>\n        At Riorelax, we believe in crafting memories that last a lifetime. Our blog series will unveil the array of experiences we offer, tailored to every kind of traveler. Whether you seek adventure, relaxation, romance, or exploration, our personalized activities and excursions ensure that your stay transcends the ordinary. Join us as we share stories of guests who\'ve embraced the luxury of choice and embarked on journeys that become cherished tales, all within the embrace of our extraordinary hotel.\n    </p>\n</figure>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/5.jpg',880,NULL,'2025-06-10 10:38:04','2025-06-10 10:38:04'),(6,'The litigants on the screen are not actors','Take a behind-the-scenes look at the reality of courtroom dramas. Contrary to common assumptions, the litigants you see on the screen are not mere actors, but real people with compelling stories.','<p>\n    At Riorelax, we believe in crafting memories that last a lifetime. Our blog series will unveil the array of experiences we offer, tailored to every kind of traveler. Whether you seek adventure, relaxation, romance, or exploration, our personalized activities and excursions ensure that your stay transcends the ordinary. Join us as we share stories of guests who\'ve embraced the luxury of choice and embarked on journeys that become cherished tales, all within the embrace of our extraordinary hotel.\n</p>\n<p>\n    Unlock the Gateway to Opulent Tranquility: Introducing Riorelax\n    Embark on a journey to unparalleled luxury and coastal elegance. Nestled along the Adriatic\'s pristine shoreline, Riorelax stands as a beacon of refined indulgence. Join us as we delve into the enchanting world of bespoke experiences, exquisite accommodations, and personalized service that defines our exceptional hotel. From captivating sea-view rooms to tantalizing gastronomic delights, spa sanctuaries, and curated adventures, our blog takes you behind the scenes of a retreat where every moment is a masterpiece. Uncover the essence of opulence, where your desires are our command and the Adriatic becomes your playground. Stay tuned for a symphony of elegance, artistry, and inspiration in our upcoming series.\n</p>\n<blockquote>\n    <footer>By Rosalina Pong</footer>\n    <h3>Viral dreamcatcher keytar typewriter, aest hetic offal umami. Aesthetic polaroid pug pitchfork post-ironic.</h3>\n</blockquote>\n<p>\n    Step into a realm where luxury is not just a word, but a way of life. Riorelax invites you to explore a world where opulence meets comfort in seamless harmony. Our blog series will unveil the heart and soul of our hotel, from the intricacies of our meticulous design to the intuitive service that anticipates your every need. Join us on a virtual tour that captures the essence of sophistication, a prelude to the unforgettable experience that awaits you at our shores.\n</p>\n<div class=\"details__content-img\">\n    <img src=\"http://localhost/storage/news/1.jpg\" alt=\"\" />\n</div>\n<p>\n    Prepare to tantalize your taste buds as we delve into the culinary symphony orchestrated by our skilled chefs. From gourmet creations that blend local flavors with international finesse to the art of crafting the perfect cocktail, our blog will be your guide to the exceptional dining journey that awaits. Join us in savoring the stories behind each dish, the dedication that goes into every creation, and the joy of experiencing food as an art form within our culinary haven.\n</p>\n<figure>\n    <img src=\"http://localhost/storage/news/2.jpg\" alt=\"\" />\n    <p>\n        At Riorelax, we believe in crafting memories that last a lifetime. Our blog series will unveil the array of experiences we offer, tailored to every kind of traveler. Whether you seek adventure, relaxation, romance, or exploration, our personalized activities and excursions ensure that your stay transcends the ordinary. Join us as we share stories of guests who\'ve embraced the luxury of choice and embarked on journeys that become cherished tales, all within the embrace of our extraordinary hotel.\n    </p>\n</figure>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/6.jpg',2020,NULL,'2025-06-10 10:38:04','2025-06-10 10:38:04');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"sitemap.settings\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.custom-fields\":true,\"contact.settings\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"room.index\":true,\"room.create\":true,\"room.edit\":true,\"room.destroy\":true,\"amenity.index\":true,\"amenity.create\":true,\"amenity.edit\":true,\"amenity.destroy\":true,\"food.index\":true,\"food.create\":true,\"food.edit\":true,\"food.destroy\":true,\"food-type.index\":true,\"food-type.create\":true,\"food-type.edit\":true,\"food-type.destroy\":true,\"booking.index\":true,\"booking.edit\":true,\"booking.destroy\":true,\"invoices.index\":true,\"invoices.edit\":true,\"invoices.destroy\":true,\"booking.reports.index\":true,\"booking.calendar.index\":true,\"booking-address.index\":true,\"booking-address.create\":true,\"booking-address.edit\":true,\"booking-address.destroy\":true,\"booking-room.index\":true,\"booking-room.create\":true,\"booking-room.edit\":true,\"booking-room.destroy\":true,\"customer.index\":true,\"customer.create\":true,\"customer.edit\":true,\"customer.destroy\":true,\"room-category.index\":true,\"room-category.create\":true,\"room-category.edit\":true,\"room-category.destroy\":true,\"feature.index\":true,\"feature.create\":true,\"feature.edit\":true,\"feature.destroy\":true,\"service.index\":true,\"service.create\":true,\"service.edit\":true,\"service.destroy\":true,\"place.index\":true,\"place.create\":true,\"place.edit\":true,\"place.destroy\":true,\"tax.index\":true,\"tax.create\":true,\"tax.edit\":true,\"tax.destroy\":true,\"invoice.template\":true,\"coupons.index\":true,\"coupons.create\":true,\"coupons.edit\":true,\"coupons.destroy\":true,\"hotel.settings\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"translations.import\":true,\"translations.export\":true,\"property-translations.import\":true,\"property-translations.export\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"payments.logs\":true,\"payments.logs.show\":true,\"payments.logs.destroy\":true,\"simple-slider.index\":true,\"simple-slider.create\":true,\"simple-slider.edit\":true,\"simple-slider.destroy\":true,\"simple-slider-item.index\":true,\"simple-slider-item.create\":true,\"simple-slider-item.edit\":true,\"simple-slider-item.destroy\":true,\"simple-slider.settings\":true,\"social-login.settings\":true,\"team.index\":true,\"team.create\":true,\"team.edit\":true,\"team.destroy\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true,\"api.settings\":true,\"api.sanctum-token.index\":true,\"api.sanctum-token.create\":true,\"api.sanctum-token.destroy\":true}','Admin users role',1,1,1,'2025-06-10 10:38:16','2025-06-10 10:38:16');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'media_random_hash','340aedc5d1f1cac4ae4d1f885dea7635',NULL,'2025-06-10 10:38:19'),(2,'api_enabled','0',NULL,'2025-06-10 10:38:19'),(3,'analytics_dashboard_widgets','0','2025-06-10 10:38:00','2025-06-10 10:38:00'),(4,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"faq\",\"gallery\",\"hotel\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"simple-slider\",\"social-login\",\"sslcommerz\",\"stripe\",\"team\",\"testimonial\",\"translation\"]',NULL,'2025-06-10 10:38:19'),(5,'enable_recaptcha_botble_contact_forms_fronts_contact_form','1','2025-06-10 10:38:00','2025-06-10 10:38:00'),(6,'enable_recaptcha_botble_newsletter_forms_fronts_newsletter_form','1','2025-06-10 10:38:02','2025-06-10 10:38:02'),(7,'payment_cod_fee_type','fixed',NULL,'2025-06-10 10:38:19'),(8,'payment_bank_transfer_fee_type','fixed',NULL,'2025-06-10 10:38:19'),(9,'theme','riorelax',NULL,'2025-06-10 10:38:19'),(10,'show_admin_bar','1',NULL,'2025-06-10 10:38:19'),(11,'language_hide_default','1',NULL,'2025-06-10 10:38:19'),(13,'language_display','all',NULL,'2025-06-10 10:38:19'),(14,'language_hide_languages','[]',NULL,'2025-06-10 10:38:19'),(15,'language_switcher_display','dropdown',NULL,'2025-06-10 10:38:19'),(16,'admin_logo','general/logo.png',NULL,'2025-06-10 10:38:19'),(17,'admin_favicon','general/favicon.png',NULL,'2025-06-10 10:38:19'),(18,'permalink-botble-blog-models-post','news',NULL,'2025-06-10 10:38:19'),(19,'permalink-botble-blog-models-category','news',NULL,'2025-06-10 10:38:19'),(20,'payment_cod_status','1',NULL,'2025-06-10 10:38:19'),(21,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,'2025-06-10 10:38:19'),(22,'payment_bank_transfer_status','1',NULL,'2025-06-10 10:38:19'),(23,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,'2025-06-10 10:38:19'),(24,'payment_stripe_payment_type','stripe_checkout',NULL,'2025-06-10 10:38:19'),(25,'hotel_company_logo_for_invoicing','general/logo-dark.png',NULL,'2025-06-10 10:38:19'),(26,'hotel_company_address_for_invoicing','123, My Street, Kingston, New York',NULL,'2025-06-10 10:38:19'),(27,'hotel_company_email_for_invoicing','contact@archielite.com',NULL,'2025-06-10 10:38:19'),(28,'hotel_company_phone_for_invoicing','123456789',NULL,'2025-06-10 10:38:19'),(29,'hotel_enable_review_room','1',NULL,'2025-06-10 10:38:19'),(30,'hotel_reviews_per_page','10',NULL,'2025-06-10 10:38:19'),(31,'theme-riorelax-site_title','Hotel Riorelax',NULL,'2025-06-10 10:38:19'),(32,'theme-riorelax-copyright','©2025 Archi Elite JSC. All right reserved.',NULL,'2025-06-10 10:38:19'),(33,'theme-riorelax-primary_color','#644222',NULL,'2025-06-10 10:38:19'),(34,'theme-riorelax-secondary_color','#be9874',NULL,'2025-06-10 10:38:19'),(35,'theme-riorelax-input_border_color','#d7cfc8',NULL,'2025-06-10 10:38:19'),(36,'theme-riorelax-primary_color_hover','#2e1913',NULL,'2025-06-10 10:38:19'),(37,'theme-riorelax-button_text_color_hover','#101010',NULL,'2025-06-10 10:38:19'),(38,'theme-riorelax-primary_font','Roboto',NULL,'2025-06-10 10:38:19'),(39,'theme-riorelax-heading_font','Jost',NULL,'2025-06-10 10:38:19'),(40,'theme-riorelax-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,'2025-06-10 10:38:19'),(41,'theme-riorelax-cookie_consent_learn_more_url','/cookie-policy',NULL,'2025-06-10 10:38:19'),(42,'theme-riorelax-cookie_consent_learn_more_text','Cookie Policy',NULL,'2025-06-10 10:38:19'),(43,'theme-riorelax-homepage_id','1',NULL,'2025-06-10 10:38:19'),(44,'theme-riorelax-blog_page_id','10',NULL,'2025-06-10 10:38:19'),(45,'theme-riorelax-logo','general/logo.png',NULL,'2025-06-10 10:38:19'),(46,'theme-riorelax-favicon','general/favicon.png',NULL,'2025-06-10 10:38:19'),(47,'theme-riorelax-email','info@webmail.com',NULL,'2025-06-10 10:38:19'),(48,'theme-riorelax-address','14/A, Riorelax City, NYC',NULL,'2025-06-10 10:38:19'),(49,'theme-riorelax-hotline','+908 987 877 09',NULL,'2025-06-10 10:38:19'),(50,'theme-riorelax-preloader_enabled','no',NULL,'2025-06-10 10:38:19'),(51,'theme-riorelax-opening_hours','Mon - Fri: 9:00 - 19:00/ Closed on Weekends',NULL,'2025-06-10 10:38:19'),(52,'theme-riorelax-header_button_url','/contact-us',NULL,'2025-06-10 10:38:19'),(53,'theme-riorelax-header_button_label','Reservation',NULL,'2025-06-10 10:38:19'),(54,'theme-riorelax-background_footer','backgrounds/footer-bg.png',NULL,'2025-06-10 10:38:19'),(55,'theme-riorelax-galleries_limit_images','3',NULL,'2025-06-10 10:38:19'),(56,'theme-riorelax-hotel_rules','<ul><li>No smoking, parties or events.</li><li>Check-in time from 2 PM, check-out by 10 AM.</li><li>Time to time car parking</li><li>Download Our minimal app</li><li>Browse regular our website</li></ul>',NULL,'2025-06-10 10:38:19'),(57,'theme-riorelax-cancellation','<p>We’re pleased to offer a full refund of the booking amount for cancellations made <strong>14 days or more</strong> before the scheduled check-in date. This generous window provides you with the flexibility to adjust your plans without any financial repercussions.<p>',NULL,'2025-06-10 10:38:19'),(58,'theme-riorelax-authentication_login_background_image','general/booking-img.png',NULL,'2025-06-10 10:38:19'),(59,'theme-riorelax-authentication_register_background_image','general/booking-img.png',NULL,'2025-06-10 10:38:19'),(60,'theme-riorelax-authentication_forgot_password_background_image','general/booking-img.png',NULL,'2025-06-10 10:38:19'),(61,'theme-riorelax-authentication_reset_password_background_image','general/booking-img.png',NULL,'2025-06-10 10:38:19'),(62,'theme-riorelax-404_page_image','general/404.png',NULL,'2025-06-10 10:38:19'),(63,'theme-riorelax-social_links','[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"fab fa-facebook-f\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"fab fa-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"fab fa-twitter\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"social-icon\",\"value\":\"fab fa-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]',NULL,'2025-06-10 10:38:19'),(64,'simple_slider_using_assets','0',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_slider_items`
--

DROP TABLE IF EXISTS `simple_slider_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_slider_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `simple_slider_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_slider_items`
--

LOCK TABLES `simple_slider_items` WRITE;
/*!40000 ALTER TABLE `simple_slider_items` DISABLE KEYS */;
INSERT INTO `simple_slider_items` VALUES (1,1,'Enjoy A Luxury Experience','banners/slider-1.png','/contact-us','Donec vitae libero non enim placerat eleifend aliquam erat volutpat. Curabitur diam ex, dapibus purus sapien, cursus sed nisl tristique, commodo gravida lectus non.',1,'2025-06-10 10:38:19','2025-06-10 10:38:19'),(2,1,'Enjoy A Luxury Experience','banners/slider-2.png','/contact-us','Donec vitae libero non enim placerat eleifend aliquam erat volutpat. Curabitur diam ex, dapibus purus sapien, cursus sed nisl tristique, commodo gravida lectus non.',2,'2025-06-10 10:38:19','2025-06-10 10:38:19');
/*!40000 ALTER TABLE `simple_slider_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_sliders`
--

DROP TABLE IF EXISTS `simple_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_sliders`
--

LOCK TABLES `simple_sliders` WRITE;
/*!40000 ALTER TABLE `simple_sliders` DISABLE KEYS */;
INSERT INTO `simple_sliders` VALUES (1,'Home slider','home-slider','The main slider on homepage','published','2025-06-10 10:38:19','2025-06-10 10:38:19');
/*!40000 ALTER TABLE `simple_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'general',1,'Botble\\Blog\\Models\\Category','news','2025-06-10 10:38:04','2025-06-10 10:38:17'),(2,'hotel',2,'Botble\\Blog\\Models\\Category','news','2025-06-10 10:38:04','2025-06-10 10:38:17'),(3,'booking',3,'Botble\\Blog\\Models\\Category','news','2025-06-10 10:38:04','2025-06-10 10:38:17'),(4,'resort',4,'Botble\\Blog\\Models\\Category','news','2025-06-10 10:38:04','2025-06-10 10:38:17'),(5,'travel',5,'Botble\\Blog\\Models\\Category','news','2025-06-10 10:38:04','2025-06-10 10:38:17'),(6,'general',1,'Botble\\Blog\\Models\\Tag','tag','2025-06-10 10:38:04','2025-06-10 10:38:04'),(7,'hotel',2,'Botble\\Blog\\Models\\Tag','tag','2025-06-10 10:38:04','2025-06-10 10:38:04'),(8,'booking',3,'Botble\\Blog\\Models\\Tag','tag','2025-06-10 10:38:04','2025-06-10 10:38:04'),(9,'resort',4,'Botble\\Blog\\Models\\Tag','tag','2025-06-10 10:38:04','2025-06-10 10:38:04'),(10,'travel',5,'Botble\\Blog\\Models\\Tag','tag','2025-06-10 10:38:04','2025-06-10 10:38:04'),(11,'each-of-our-8-double-rooms-has-its-own-distinct',1,'Botble\\Blog\\Models\\Post','news','2025-06-10 10:38:04','2025-06-10 10:38:17'),(12,'essential-qualities-of-highly-successful-music',2,'Botble\\Blog\\Models\\Post','news','2025-06-10 10:38:04','2025-06-10 10:38:17'),(13,'9-things-i-love-about-shaving-my-head',3,'Botble\\Blog\\Models\\Post','news','2025-06-10 10:38:04','2025-06-10 10:38:17'),(14,'why-teamwork-really-makes-the-dream-work',4,'Botble\\Blog\\Models\\Post','news','2025-06-10 10:38:04','2025-06-10 10:38:17'),(15,'the-world-caters-to-average-people',5,'Botble\\Blog\\Models\\Post','news','2025-06-10 10:38:04','2025-06-10 10:38:17'),(16,'the-litigants-on-the-screen-are-not-actors',6,'Botble\\Blog\\Models\\Post','news','2025-06-10 10:38:04','2025-06-10 10:38:17'),(17,'luxury-hall-of-fame',1,'Botble\\Hotel\\Models\\Room','rooms','2025-06-10 10:38:06','2025-06-10 10:38:06'),(18,'pendora-fame',2,'Botble\\Hotel\\Models\\Room','rooms','2025-06-10 10:38:06','2025-06-10 10:38:06'),(19,'pacific-room',3,'Botble\\Hotel\\Models\\Room','rooms','2025-06-10 10:38:06','2025-06-10 10:38:06'),(20,'junior-suite',4,'Botble\\Hotel\\Models\\Room','rooms','2025-06-10 10:38:06','2025-06-10 10:38:06'),(21,'family-suite',5,'Botble\\Hotel\\Models\\Room','rooms','2025-06-10 10:38:06','2025-06-10 10:38:06'),(22,'relax-suite',6,'Botble\\Hotel\\Models\\Room','rooms','2025-06-10 10:38:06','2025-06-10 10:38:06'),(23,'luxury-suite',7,'Botble\\Hotel\\Models\\Room','rooms','2025-06-10 10:38:06','2025-06-10 10:38:06'),(24,'president-room',8,'Botble\\Hotel\\Models\\Room','rooms','2025-06-10 10:38:06','2025-06-10 10:38:06'),(25,'quality-room',1,'Botble\\Hotel\\Models\\Service','services','2025-06-10 10:38:07','2025-06-10 10:38:07'),(26,'privet-beach',2,'Botble\\Hotel\\Models\\Service','services','2025-06-10 10:38:07','2025-06-10 10:38:07'),(27,'best-accommodation',3,'Botble\\Hotel\\Models\\Service','services','2025-06-10 10:38:07','2025-06-10 10:38:07'),(28,'wellness-spa',4,'Botble\\Hotel\\Models\\Service','services','2025-06-10 10:38:07','2025-06-10 10:38:07'),(29,'restaurants-bars',5,'Botble\\Hotel\\Models\\Service','services','2025-06-10 10:38:07','2025-06-10 10:38:07'),(30,'special-offers',6,'Botble\\Hotel\\Models\\Service','services','2025-06-10 10:38:07','2025-06-10 10:38:07'),(31,'duplex-restaurant',1,'Botble\\Hotel\\Models\\Place','places','2025-06-10 10:38:11','2025-06-10 10:38:11'),(32,'overnight-bars',2,'Botble\\Hotel\\Models\\Place','places','2025-06-10 10:38:11','2025-06-10 10:38:11'),(33,'beautiful-beach',3,'Botble\\Hotel\\Models\\Place','places','2025-06-10 10:38:11','2025-06-10 10:38:11'),(34,'beautiful-spa',4,'Botble\\Hotel\\Models\\Place','places','2025-06-10 10:38:11','2025-06-10 10:38:11'),(35,'duplex-golf',5,'Botble\\Hotel\\Models\\Place','places','2025-06-10 10:38:11','2025-06-10 10:38:11'),(36,'luxury-restaurant',6,'Botble\\Hotel\\Models\\Place','places','2025-06-10 10:38:11','2025-06-10 10:38:11'),(37,'home-page-01',1,'Botble\\Page\\Models\\Page','','2025-06-10 10:38:14','2025-06-10 10:38:14'),(38,'home-page-02',2,'Botble\\Page\\Models\\Page','','2025-06-10 10:38:14','2025-06-10 10:38:14'),(39,'home-page-side-menu',3,'Botble\\Page\\Models\\Page','','2025-06-10 10:38:14','2025-06-10 10:38:14'),(40,'home-page-full-menu',4,'Botble\\Page\\Models\\Page','','2025-06-10 10:38:14','2025-06-10 10:38:14'),(41,'about-us',5,'Botble\\Page\\Models\\Page','','2025-06-10 10:38:14','2025-06-10 10:38:14'),(42,'services',6,'Botble\\Page\\Models\\Page','','2025-06-10 10:38:14','2025-06-10 10:38:14'),(43,'galleries',7,'Botble\\Page\\Models\\Page','','2025-06-10 10:38:14','2025-06-10 10:38:14'),(44,'faq',8,'Botble\\Page\\Models\\Page','','2025-06-10 10:38:14','2025-06-10 10:38:14'),(45,'team',9,'Botble\\Page\\Models\\Page','','2025-06-10 10:38:14','2025-06-10 10:38:14'),(46,'blog',10,'Botble\\Page\\Models\\Page','','2025-06-10 10:38:14','2025-06-10 10:38:14'),(47,'contact-us',11,'Botble\\Page\\Models\\Page','','2025-06-10 10:38:14','2025-06-10 10:38:14'),(48,'privacy',12,'Botble\\Page\\Models\\Page','','2025-06-10 10:38:14','2025-06-10 10:38:14'),(49,'term-and-conditions',13,'Botble\\Page\\Models\\Page','','2025-06-10 10:38:14','2025-06-10 10:38:14'),(50,'room',1,'Botble\\Gallery\\Models\\Gallery','galleries','2025-06-10 10:38:16','2025-06-10 10:38:16'),(51,'hall',2,'Botble\\Gallery\\Models\\Gallery','galleries','2025-06-10 10:38:16','2025-06-10 10:38:16'),(52,'guardian',3,'Botble\\Gallery\\Models\\Gallery','galleries','2025-06-10 10:38:16','2025-06-10 10:38:16'),(53,'hotel',4,'Botble\\Gallery\\Models\\Gallery','galleries','2025-06-10 10:38:16','2025-06-10 10:38:16'),(54,'event-hall',5,'Botble\\Gallery\\Models\\Gallery','galleries','2025-06-10 10:38:16','2025-06-10 10:38:16'),(55,'howard-holmes',1,'Botble\\Team\\Models\\Team','teams','2025-06-10 10:38:21','2025-06-10 10:38:21'),(56,'ella-thompson',2,'Botble\\Team\\Models\\Team','teams','2025-06-10 10:38:21','2025-06-10 10:38:21'),(57,'devon-lane',3,'Botble\\Team\\Models\\Team','teams','2025-06-10 10:38:21','2025-06-10 10:38:21'),(58,'kate-beckham',4,'Botble\\Team\\Models\\Team','teams','2025-06-10 10:38:21','2025-06-10 10:38:21'),(59,'vincent-cooper',5,'Botble\\Team\\Models\\Team','teams','2025-06-10 10:38:21','2025-06-10 10:38:21'),(60,'danielle-bryant',6,'Botble\\Team\\Models\\Team','teams','2025-06-10 10:38:21','2025-06-10 10:38:21'),(61,'kami-hope',7,'Botble\\Team\\Models\\Team','teams','2025-06-10 10:38:21','2025-06-10 10:38:21'),(62,'frankie-musk',8,'Botble\\Team\\Models\\Team','teams','2025-06-10 10:38:21','2025-06-10 10:38:21'),(63,'luxury',1,'Botble\\Hotel\\Models\\RoomCategory','room-categories','2025-06-10 10:38:26','2025-06-10 10:38:26'),(64,'family',2,'Botble\\Hotel\\Models\\RoomCategory','room-categories','2025-06-10 10:38:26','2025-06-10 10:38:26'),(65,'double-bed',3,'Botble\\Hotel\\Models\\RoomCategory','room-categories','2025-06-10 10:38:26','2025-06-10 10:38:26'),(66,'relax',4,'Botble\\Hotel\\Models\\RoomCategory','room-categories','2025-06-10 10:38:26','2025-06-10 10:38:26'),(67,'eggs-bacon',1,'Botble\\Hotel\\Models\\Food','foods','2025-06-10 10:38:26','2025-06-10 10:38:26'),(68,'tea-or-coffee',2,'Botble\\Hotel\\Models\\Food','foods','2025-06-10 10:38:26','2025-06-10 10:38:26'),(69,'chia-oatmeal',3,'Botble\\Hotel\\Models\\Food','foods','2025-06-10 10:38:26','2025-06-10 10:38:26'),(70,'juice',4,'Botble\\Hotel\\Models\\Food','foods','2025-06-10 10:38:26','2025-06-10 10:38:26'),(71,'chia-oatmeal',5,'Botble\\Hotel\\Models\\Food','foods','2025-06-10 10:38:26','2025-06-10 10:38:26'),(72,'fruit-parfait',6,'Botble\\Hotel\\Models\\Food','foods','2025-06-10 10:38:26','2025-06-10 10:38:26'),(73,'marmalade-selection',7,'Botble\\Hotel\\Models\\Food','foods','2025-06-10 10:38:26','2025-06-10 10:38:26'),(74,'cheese-platen',8,'Botble\\Hotel\\Models\\Food','foods','2025-06-10 10:38:26','2025-06-10 10:38:26'),(75,'avocado-toast',9,'Botble\\Hotel\\Models\\Food','foods','2025-06-10 10:38:26','2025-06-10 10:38:26'),(76,'avocado-toast',10,'Botble\\Hotel\\Models\\Food','foods','2025-06-10 10:38:26','2025-06-10 10:38:26');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_logins`
--

DROP TABLE IF EXISTS `social_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_logins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `refresh_token` text COLLATE utf8mb4_unicode_ci,
  `token_expires_at` timestamp NULL DEFAULT NULL,
  `provider_data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_logins_provider_provider_id_unique` (`provider`,`provider_id`),
  KEY `social_logins_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `social_logins_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_logins`
--

LOCK TABLES `social_logins` WRITE;
/*!40000 ALTER TABLE `social_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-06-10 10:38:04','2025-06-10 10:38:04'),(2,'Hotel',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-06-10 10:38:04','2025-06-10 10:38:04'),(3,'Booking',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-06-10 10:38:04','2025-06-10 10:38:04'),(4,'Resort',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-06-10 10:38:04','2025-06-10 10:38:04'),(5,'Travel',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-06-10 10:38:04','2025-06-10 10:38:04');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socials` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Howard Holmes','teams/1.png','General Manager','USA','{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/twitter.com\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\\/\"}','published','2025-06-10 10:38:21','2025-06-10 10:38:21','<p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p><p>Tempor nonummy metus lobortis. Sociis velit etiam, dapibus lectus vehicula pele llentesque cras pat fusce pharetra felis sapien varius Integer dis ads se purus sollicitudin dapibus et vivamus pharetra sit integer dictum in dise natoque an mus quis in. Facilisis inceptos nec, potenti nostra aenean lacinia varius semper ant nullam nulla primis placerat facilisis. Netus lorem rutrum arcu dignissim at sit morbi phasellus nascetur eget urna potenti cum vestibulum cras.</p><div>[user-profile image_1=\"teams/img1.png\" image_2=\"teams/img2.png\" quantity=\"3\" title_1=\"Design\" percentage_1=\"80\" title_2=\"Easy Manage\" percentage_2=\"90\" title_3=\"Project Organize\" percentage_3=\"70\"][/user-profile]</div>','12345678','howard@gmail.com','Cecilia Chapman711-2880 Nulla St.','https://example.com',NULL),(2,'Ella Thompson','teams/2.png','Bell Captain','Qatar','{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/twitter.com\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\\/\"}','published','2025-06-10 10:38:21','2025-06-10 10:38:21','<p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p><p>Tempor nonummy metus lobortis. Sociis velit etiam, dapibus lectus vehicula pele llentesque cras pat fusce pharetra felis sapien varius Integer dis ads se purus sollicitudin dapibus et vivamus pharetra sit integer dictum in dise natoque an mus quis in. Facilisis inceptos nec, potenti nostra aenean lacinia varius semper ant nullam nulla primis placerat facilisis. Netus lorem rutrum arcu dignissim at sit morbi phasellus nascetur eget urna potenti cum vestibulum cras.</p><div>[user-profile image_1=\"teams/img1.png\" image_2=\"teams/img2.png\" quantity=\"3\" title_1=\"Design\" percentage_1=\"80\" title_2=\"Easy Manage\" percentage_2=\"90\" title_3=\"Project Organize\" percentage_3=\"70\"][/user-profile]</div>','234324232','thompson@gmail.com','Cecilia Chapman711-2880 Nulla St.','https://example.com',NULL),(3,'Devon Lane','teams/3.png','Executive Chef','India','{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/twitter.com\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\\/\"}','published','2025-06-10 10:38:21','2025-06-10 10:38:21','<p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p><p>Tempor nonummy metus lobortis. Sociis velit etiam, dapibus lectus vehicula pele llentesque cras pat fusce pharetra felis sapien varius Integer dis ads se purus sollicitudin dapibus et vivamus pharetra sit integer dictum in dise natoque an mus quis in. Facilisis inceptos nec, potenti nostra aenean lacinia varius semper ant nullam nulla primis placerat facilisis. Netus lorem rutrum arcu dignissim at sit morbi phasellus nascetur eget urna potenti cum vestibulum cras.</p><div>[user-profile image_1=\"teams/img1.png\" image_2=\"teams/img2.png\" quantity=\"3\" title_1=\"Design\" percentage_1=\"80\" title_2=\"Easy Manage\" percentage_2=\"90\" title_3=\"Project Organize\" percentage_3=\"70\"][/user-profile]</div>','543324322','devon@gmail.com','Cecilia Chapman711-2880 Nulla St.','https://example.com',NULL),(4,'Kate Beckham','teams/4.png','Bartender','Thailand','{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/twitter.com\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\\/\"}','published','2025-06-10 10:38:21','2025-06-10 10:38:21','<p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p><p>Tempor nonummy metus lobortis. Sociis velit etiam, dapibus lectus vehicula pele llentesque cras pat fusce pharetra felis sapien varius Integer dis ads se purus sollicitudin dapibus et vivamus pharetra sit integer dictum in dise natoque an mus quis in. Facilisis inceptos nec, potenti nostra aenean lacinia varius semper ant nullam nulla primis placerat facilisis. Netus lorem rutrum arcu dignissim at sit morbi phasellus nascetur eget urna potenti cum vestibulum cras.</p><div>[user-profile image_1=\"teams/img1.png\" image_2=\"teams/img2.png\" quantity=\"3\" title_1=\"Design\" percentage_1=\"80\" title_2=\"Easy Manage\" percentage_2=\"90\" title_3=\"Project Organize\" percentage_3=\"70\"][/user-profile]</div>','234345432','beckham@gmail.com','Cecilia Chapman711-2880 Nulla St.','https://example.com',NULL),(5,'Vincent Cooper','teams/5.png','Driver','Poland','{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/twitter.com\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\\/\"}','published','2025-06-10 10:38:21','2025-06-10 10:38:21','<p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p><p>Tempor nonummy metus lobortis. Sociis velit etiam, dapibus lectus vehicula pele llentesque cras pat fusce pharetra felis sapien varius Integer dis ads se purus sollicitudin dapibus et vivamus pharetra sit integer dictum in dise natoque an mus quis in. Facilisis inceptos nec, potenti nostra aenean lacinia varius semper ant nullam nulla primis placerat facilisis. Netus lorem rutrum arcu dignissim at sit morbi phasellus nascetur eget urna potenti cum vestibulum cras.</p><div>[user-profile image_1=\"teams/img1.png\" image_2=\"teams/img2.png\" quantity=\"3\" title_1=\"Design\" percentage_1=\"80\" title_2=\"Easy Manage\" percentage_2=\"90\" title_3=\"Project Organize\" percentage_3=\"70\"][/user-profile]</div>','4324234221','cooper@gmail.com','Cecilia Chapman711-2880 Nulla St.','https://example.com',NULL),(6,'Danielle Bryant','teams/6.png','Event Coordinator','Finland','{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/twitter.com\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\\/\"}','published','2025-06-10 10:38:21','2025-06-10 10:38:21','<p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p><p>Tempor nonummy metus lobortis. Sociis velit etiam, dapibus lectus vehicula pele llentesque cras pat fusce pharetra felis sapien varius Integer dis ads se purus sollicitudin dapibus et vivamus pharetra sit integer dictum in dise natoque an mus quis in. Facilisis inceptos nec, potenti nostra aenean lacinia varius semper ant nullam nulla primis placerat facilisis. Netus lorem rutrum arcu dignissim at sit morbi phasellus nascetur eget urna potenti cum vestibulum cras.</p><div>[user-profile image_1=\"teams/img1.png\" image_2=\"teams/img2.png\" quantity=\"3\" title_1=\"Design\" percentage_1=\"80\" title_2=\"Easy Manage\" percentage_2=\"90\" title_3=\"Project Organize\" percentage_3=\"70\"][/user-profile]</div>','4234232321','danielle@gmail.com','Cecilia Chapman711-2880 Nulla St.','https://example.com',NULL),(7,'Kami Hope','teams/7.png','Event Coordinator','Thailand','{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/twitter.com\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\\/\"}','published','2025-06-10 10:38:21','2025-06-10 10:38:21','<p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p><p>Tempor nonummy metus lobortis. Sociis velit etiam, dapibus lectus vehicula pele llentesque cras pat fusce pharetra felis sapien varius Integer dis ads se purus sollicitudin dapibus et vivamus pharetra sit integer dictum in dise natoque an mus quis in. Facilisis inceptos nec, potenti nostra aenean lacinia varius semper ant nullam nulla primis placerat facilisis. Netus lorem rutrum arcu dignissim at sit morbi phasellus nascetur eget urna potenti cum vestibulum cras.</p><div>[user-profile image_1=\"teams/img1.png\" image_2=\"teams/img2.png\" quantity=\"3\" title_1=\"Design\" percentage_1=\"80\" title_2=\"Easy Manage\" percentage_2=\"90\" title_3=\"Project Organize\" percentage_3=\"70\"][/user-profile]</div>','123456781','hope@gmail.com','Cecilia Chapman711-2880 Bangkok St.','https://example.com',NULL),(8,'Frankie Musk','teams/8.png','Driver','USA','{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/twitter.com\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\\/\"}','published','2025-06-10 10:38:21','2025-06-10 10:38:21','<p>Pleasure and praising pain was born and I will give you a complete account of the systems, and expound the actually teachings of the great explorer of the truth, the master-builder of human uts happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally Nor who loves or pursues or desires to obtain pain of itself.</p><p>Tempor nonummy metus lobortis. Sociis velit etiam, dapibus lectus vehicula pele llentesque cras pat fusce pharetra felis sapien varius Integer dis ads se purus sollicitudin dapibus et vivamus pharetra sit integer dictum in dise natoque an mus quis in. Facilisis inceptos nec, potenti nostra aenean lacinia varius semper ant nullam nulla primis placerat facilisis. Netus lorem rutrum arcu dignissim at sit morbi phasellus nascetur eget urna potenti cum vestibulum cras.</p><div>[user-profile image_1=\"teams/img1.png\" image_2=\"teams/img2.png\" quantity=\"3\" title_1=\"Design\" percentage_1=\"80\" title_2=\"Easy Manage\" percentage_2=\"90\" title_3=\"Project Organize\" percentage_3=\"70\"][/user-profile]</div>','1323243242','frankie@gmail.com','Cecilia Chapman711-2880 Nulla St.','https://example.com',NULL);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_translations`
--

DROP TABLE IF EXISTS `teams_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teams_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`teams_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_translations`
--

LOCK TABLES `teams_translations` WRITE;
/*!40000 ALTER TABLE `teams_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Adam Williams','A true gem! Impeccable service, stunning views, and utmost comfort. Our stay was pure perfection. Planning our return!','testimonials/01.png','CEO Of Microsoft','published','2025-06-10 10:38:15','2025-06-10 10:38:15'),(2,'Retha Deowalim','Exceeded expectations in every way. Elegant rooms, delectable dining. Our stay was pure perfection. 5 stars!\"','testimonials/02.png','CEO Of Apple','published','2025-06-10 10:38:15','2025-06-10 10:38:15'),(3,'Sam J. Wasim','Paradise found. Serene ambiance, exceptional amenities, and warm hospitality. Already planning our return!','testimonials/03.png','Pio Founder','published','2025-06-10 10:38:15','2025-06-10 10:38:15'),(4,'Daniel Rodriguez','An exceptional experience from start to finish. The attention to detail, combined with breathtaking surroundings.','testimonials/04.png','VP Of Google','published','2025-06-10 10:38:15','2025-06-10 10:38:15'),(5,'Daniel Chang','A true haven for relaxation. Every aspect of our stay, from the luxurious rooms to the exquisite dining, was exceptional.','testimonials/05.png','Founder Of SpaceX','published','2025-06-10 10:38:15','2025-06-10 10:38:15'),(6,'Isabella Russo','Indulgence at its finest. The blend of modern luxury and natural beauty exceeded our expectations, was exceptional.','testimonials/06.png','Fashion Designer','published','2025-06-10 10:38:15','2025-06-10 10:38:15');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'nelle.nitzsche@strosin.org',NULL,'$2y$12$VUGKJ9rQglz6UQoZA2wR1ex3dTSUpXSN3yYSi2oradcy3ob.tGwEq',NULL,'2025-06-10 10:38:16','2025-06-10 10:38:16','Lia','Lockman','admin',85,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'ContactInformationMenuWidget','footer_sidebar','riorelax',0,'{\"phone_number\":\"1800-121-3637\",\"email\":\"info@example.com\",\"address\":\"1247\\/Plot No. 39, 15th Phase,\\nLHB Colony, Kanpur\"}','2025-06-10 10:38:18','2025-06-10 10:38:18'),(2,'CustomMenuWidget','footer_sidebar','riorelax',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Our Links\",\"menu_id\":\"our-links\"}','2025-06-10 10:38:18','2025-06-10 10:38:18'),(3,'CustomMenuWidget','footer_sidebar','riorelax',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Our Services\",\"menu_id\":\"our-services\"}','2025-06-10 10:38:18','2025-06-10 10:38:18'),(4,'NewsletterWidget','footer_sidebar','riorelax',3,'{\"id\":\"NewsletterWidget\",\"title\":\"Subscribe To Our Newsletter\"}','2025-06-10 10:38:18','2025-06-10 10:38:18'),(5,'BlogSearchWidget','blog_sidebar','riorelax',1,'{\"id\":\"BlogSearchWidget\",\"name\":\"Blog Search\"}','2025-06-10 10:38:18','2025-06-10 10:38:18'),(6,'BlogSocialsWidget','blog_sidebar','riorelax',2,'{\"id\":\"BlogSocialsWidget\",\"name\":\"Blog Socials\"}','2025-06-10 10:38:18','2025-06-10 10:38:18'),(7,'BlogCategoriesWidget','blog_sidebar','riorelax',3,'{\"id\":\"BlogCategoriesWidget\",\"name\":\"Blog Categories\"}','2025-06-10 10:38:18','2025-06-10 10:38:18'),(8,'BlogPostsWidget','blog_sidebar','riorelax',4,'{\"id\":\"BlogPostsWidget\",\"name\":\"Blog Posts\",\"type\":\"recent\",\"limit\":5}','2025-06-10 10:38:18','2025-06-10 10:38:18'),(9,'BlogTagsWidget','blog_sidebar','riorelax',5,'{\"id\":\"BlogTagsWidget\",\"name\":\"Blog Tags\"}','2025-06-10 10:38:18','2025-06-10 10:38:18'),(10,'RoomContactWidget','room_sidebar','riorelax',0,'{\"id\":\"RoomContactWidget\",\"title\":\"If You Need Any Help Contact Us\",\"phone\":\"917052101786\"}','2025-06-10 10:38:18','2025-06-10 10:38:18'),(11,'RoomContactWidget','service_sidebar','riorelax',0,'{\"id\":\"RoomContactWidget\",\"title\":\"If You Need Any Help Contact Us\",\"phone\":\"917052101786\"}','2025-06-10 10:38:18','2025-06-10 10:38:18'),(12,'CheckAvailabilityForm','rooms_sidebar','riorelax',0,'{\"title\":\"Booking form\",\"id\":\"CheckAvailabilityForm\"}','2025-06-10 10:38:18','2025-06-10 10:38:18');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-10 17:38:27
