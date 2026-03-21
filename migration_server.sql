-- =============================================================
-- SQL MIGRATION: Server DB Sync
-- Run on SERVER database (botonblue) to match local changes
-- Generated from comparing botonbluewebsite.sql vs botonblueupdate.sql
-- =============================================================

-- ----- A. ALTER EXISTING TABLES -----

-- A1. ht_rooms: Add vr360_url column (after images)
ALTER TABLE `ht_rooms`
  ADD COLUMN `vr360_url` varchar(500) DEFAULT NULL AFTER `images`;

-- A2. ht_rooms: Add external_rate_id column (after vr360_url)
ALTER TABLE `ht_rooms`
  ADD COLUMN `external_rate_id` varchar(50) DEFAULT NULL AFTER `vr360_url`;

-- A3. ht_rooms_translations: Add vr360_url column (after content)
ALTER TABLE `ht_rooms_translations`
  ADD COLUMN `vr360_url` varchar(500) DEFAULT NULL AFTER `content`;

-- A4. pages: Add custom_html column (after content)
ALTER TABLE `pages`
  ADD COLUMN `custom_html` longtext DEFAULT NULL AFTER `content`;

-- A5. pages_translations: Add custom_html column (after content)
ALTER TABLE `pages_translations`
  ADD COLUMN `custom_html` longtext DEFAULT NULL AFTER `content`;


-- ----- B. DROP TABLE -----

-- B1. Drop ht_room_reviews (no longer used)
DROP TABLE IF EXISTS `ht_room_reviews`;


-- ----- C. CREATE NEW TABLES (Product Module) -----

-- C1. ht_product_categories
CREATE TABLE IF NOT EXISTS `ht_product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `order` int(10) UNSIGNED DEFAULT 0,
  `status` varchar(60) DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- C2. ht_product_categories_translations
CREATE TABLE IF NOT EXISTS `ht_product_categories_translations` (
  `lang_code` varchar(20) NOT NULL,
  `ht_product_categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ht_product_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- C3. ht_products
CREATE TABLE IF NOT EXISTS `ht_products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `price` decimal(15,2) UNSIGNED DEFAULT 0.00,
  `original_price` decimal(15,2) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_sold` int(10) UNSIGNED DEFAULT 0,
  `is_featured` tinyint(3) UNSIGNED DEFAULT 0,
  `order` int(10) UNSIGNED DEFAULT 0,
  `status` varchar(60) DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `ht_products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `ht_product_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- C4. ht_products_translations
CREATE TABLE IF NOT EXISTS `ht_products_translations` (
  `lang_code` varchar(20) NOT NULL,
  `ht_products_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ht_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- C5. ht_product_orders
CREATE TABLE IF NOT EXISTS `ht_product_orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_number` varchar(60) NOT NULL,
  `customer_name` varchar(120) NOT NULL,
  `customer_email` varchar(120) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_note` text DEFAULT NULL,
  `total_amount` decimal(15,2) UNSIGNED DEFAULT 0.00,
  `status` varchar(60) DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- C6. ht_product_order_items
CREATE TABLE IF NOT EXISTS `ht_product_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(15,2) UNSIGNED DEFAULT 0.00,
  `quantity` int(10) UNSIGNED DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `ht_product_order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `ht_product_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ht_product_order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `ht_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ----- D. UPDATE SETTINGS (activated_plugins) -----

-- D1. Add "product" to activated_plugins list
UPDATE `settings`
SET `value` = REPLACE(`value`, '"botble-popup-chat-icon"]', '"botble-popup-chat-icon","product"]')
WHERE `key` = 'activated_plugins'
  AND `value` NOT LIKE '%"product"%';
