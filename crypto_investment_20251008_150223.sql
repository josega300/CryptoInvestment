-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE TABLE "cache" ----------------------------------------
CREATE TABLE `cache`( 
	`key` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`value` MediumText CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`expiration` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `key` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "cache_locks" ----------------------------------
CREATE TABLE `cache_locks`( 
	`key` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`owner` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`expiration` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `key` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "failed_jobs" ----------------------------------
CREATE TABLE `failed_jobs`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`uuid` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`connection` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`queue` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`payload` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`exception` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`failed_at` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `failed_jobs_uuid_unique` UNIQUE( `uuid` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "job_batches" ----------------------------------
CREATE TABLE `job_batches`( 
	`id` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`total_jobs` Int( 0 ) NOT NULL,
	`pending_jobs` Int( 0 ) NOT NULL,
	`failed_jobs` Int( 0 ) NOT NULL,
	`failed_job_ids` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`options` MediumText CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`cancelled_at` Int( 0 ) NULL DEFAULT NULL,
	`created_at` Int( 0 ) NOT NULL,
	`finished_at` Int( 0 ) NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "jobs" -----------------------------------------
CREATE TABLE `jobs`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`queue` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`payload` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`attempts` TinyInt( 0 ) UNSIGNED NOT NULL,
	`reserved_at` Int( 0 ) UNSIGNED NULL DEFAULT NULL,
	`available_at` Int( 0 ) UNSIGNED NOT NULL,
	`created_at` Int( 0 ) UNSIGNED NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "migrations" -----------------------------------
CREATE TABLE `migrations`( 
	`id` Int( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`migration` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`batch` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- -------------------------------------------------------------


-- CREATE TABLE "password_reset_tokens" ------------------------
CREATE TABLE `password_reset_tokens`( 
	`email` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`token` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `email` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "personal_access_tokens" -----------------------
CREATE TABLE `personal_access_tokens`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`tokenable_type` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`tokenable_id` BigInt( 0 ) UNSIGNED NOT NULL,
	`name` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`token` VarChar( 64 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`abilities` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`last_used_at` Timestamp NULL DEFAULT NULL,
	`expires_at` Timestamp NULL DEFAULT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `personal_access_tokens_token_unique` UNIQUE( `token` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "sessions" -------------------------------------
CREATE TABLE `sessions`( 
	`id` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`user_id` BigInt( 0 ) UNSIGNED NULL DEFAULT NULL,
	`ip_address` VarChar( 45 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`user_agent` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`payload` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`last_activity` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "users" ----------------------------------------
CREATE TABLE `users`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`email` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`email_verified_at` Timestamp NULL DEFAULT NULL,
	`password` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`remember_token` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`created_at` Timestamp NULL DEFAULT NULL,
	`updated_at` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `users_email_unique` UNIQUE( `email` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "crypto_histories" -----------------------------
CREATE TABLE `crypto_histories`( 
	`id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
	`crypto_id` BigInt( 0 ) NOT NULL,
	`price` Decimal( 18, 2 ) NULL DEFAULT NULL,
	`date` Date NOT NULL,
	`created_at` Timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "cryptos" --------------------------------------
CREATE TABLE `cryptos`( 
	`id` BigInt( 0 ) NOT NULL,
	`symbol` VarChar( 10 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`name` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`price` Decimal( 18, 2 ) NULL DEFAULT NULL,
	`percent_change_24h` Decimal( 8, 2 ) NULL DEFAULT NULL,
	`volume_24h` BigInt( 0 ) NULL DEFAULT NULL,
	`created_at` Timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` Timestamp NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `symbol` UNIQUE( `symbol` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- Dump data of "cache" ------------------------------------
-- ---------------------------------------------------------


-- Dump data of "cache_locks" ------------------------------
-- ---------------------------------------------------------


-- Dump data of "failed_jobs" ------------------------------
-- ---------------------------------------------------------


-- Dump data of "job_batches" ------------------------------
-- ---------------------------------------------------------


-- Dump data of "jobs" -------------------------------------
-- ---------------------------------------------------------


-- Dump data of "migrations" -------------------------------
BEGIN;

INSERT INTO `migrations`(`id`,`migration`,`batch`) VALUES 
( '1', '0001_01_01_000000_create_users_table', '1' ),
( '2', '0001_01_01_000001_create_cache_table', '1' ),
( '3', '0001_01_01_000002_create_jobs_table', '1' ),
( '4', '2025_10_08_165332_create_personal_access_tokens_table', '2' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "password_reset_tokens" --------------------
-- ---------------------------------------------------------


-- Dump data of "personal_access_tokens" -------------------
-- ---------------------------------------------------------


-- Dump data of "sessions" ---------------------------------
BEGIN;

INSERT INTO `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) VALUES 
( 'ZQbISccVLBoyiVciDZqfKyXS39RYXI99GrdVtnc6', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXNEa1d5U3RyZFQ2cUNkbjhuMGppMXJFSEl3bTBiT2pDTHhhTThkdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', '1759940685' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "users" ------------------------------------
-- ---------------------------------------------------------


-- Dump data of "crypto_histories" -------------------------
BEGIN;

INSERT INTO `crypto_histories`(`id`,`crypto_id`,`price`,`date`,`created_at`) VALUES 
( '1', '1', '31000.00', '2025-10-01', '2025-10-08 13:18:43' ),
( '2', '1', '31500.00', '2025-10-02', '2025-10-08 13:18:43' ),
( '3', '1', '32000.00', '2025-10-03', '2025-10-08 13:18:43' ),
( '4', '1', '32500.00', '2025-10-04', '2025-10-08 13:18:43' ),
( '5', '1', '33000.00', '2025-10-05', '2025-10-08 13:18:43' ),
( '6', '1', '33200.00', '2025-10-06', '2025-10-08 13:18:43' ),
( '7', '1', '33500.00', '2025-10-07', '2025-10-08 13:18:43' ),
( '8', '2', '2000.00', '2025-10-01', '2025-10-08 13:18:43' ),
( '9', '2', '2100.00', '2025-10-02', '2025-10-08 13:18:43' ),
( '10', '2', '2150.00', '2025-10-03', '2025-10-08 13:18:43' ),
( '11', '2', '2200.00', '2025-10-04', '2025-10-08 13:18:43' ),
( '12', '2', '2250.00', '2025-10-05', '2025-10-08 13:18:43' ),
( '13', '2', '2225.00', '2025-10-06', '2025-10-08 13:18:43' ),
( '14', '2', '2300.00', '2025-10-07', '2025-10-08 13:18:43' ),
( '15', '3', '1.20', '2025-10-01', '2025-10-08 13:18:43' ),
( '16', '3', '1.25', '2025-10-02', '2025-10-08 13:18:43' ),
( '17', '3', '1.30', '2025-10-03', '2025-10-08 13:18:43' ),
( '18', '3', '1.32', '2025-10-04', '2025-10-08 13:18:43' ),
( '19', '3', '1.33', '2025-10-05', '2025-10-08 13:18:43' ),
( '20', '3', '1.34', '2025-10-06', '2025-10-08 13:18:43' ),
( '21', '3', '1.35', '2025-10-07', '2025-10-08 13:18:43' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "cryptos" ----------------------------------
BEGIN;

INSERT INTO `cryptos`(`id`,`symbol`,`name`,`price`,`percent_change_24h`,`volume_24h`,`created_at`,`updated_at`) VALUES 
( '1', 'BTC', 'Bitcoin', '33000.00', '2.50', '120000000', '2025-10-08 13:18:42', '2025-10-08 13:18:42' ),
( '2', 'ETH', 'Ethereum', '2200.00', '3.20', '90000000', '2025-10-08 13:18:42', '2025-10-08 13:18:42' ),
( '3', 'ADA', 'Cardano', '1.35', '-1.80', '50000000', '2025-10-08 13:18:42', '2025-10-08 13:18:42' );
COMMIT;
-- ---------------------------------------------------------


-- CREATE INDEX "jobs_queue_index" -----------------------------
CREATE INDEX `jobs_queue_index` USING BTREE ON `jobs`( `queue` );
-- -------------------------------------------------------------


-- CREATE INDEX "personal_access_tokens_expires_at_index" ------
CREATE INDEX `personal_access_tokens_expires_at_index` USING BTREE ON `personal_access_tokens`( `expires_at` );
-- -------------------------------------------------------------


-- CREATE INDEX "personal_access_tokens_tokenable_type_tokenable_id_index" 
CREATE INDEX `personal_access_tokens_tokenable_type_tokenable_id_index` USING BTREE ON `personal_access_tokens`( `tokenable_type`, `tokenable_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "sessions_last_activity_index" -----------------
CREATE INDEX `sessions_last_activity_index` USING BTREE ON `sessions`( `last_activity` );
-- -------------------------------------------------------------


-- CREATE INDEX "sessions_user_id_index" -----------------------
CREATE INDEX `sessions_user_id_index` USING BTREE ON `sessions`( `user_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "crypto_id" ------------------------------------
CREATE INDEX `crypto_id` USING BTREE ON `crypto_histories`( `crypto_id` );
-- -------------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


