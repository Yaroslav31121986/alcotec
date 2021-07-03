-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               8.0.19 - MySQL Community Server - GPL
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных alcotec
CREATE DATABASE IF NOT EXISTS `alcotec` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `alcotec`;

-- Дамп структуры для таблица alcotec.catalog
CREATE TABLE IF NOT EXISTS `catalog` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_brand` int NOT NULL,
  `id_category` int NOT NULL,
  `id_awailability` int NOT NULL,
  `price` double(8,2) NOT NULL,
  `id_currency` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы alcotec.catalog: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` (`id`, `name`, `id_brand`, `id_category`, `id_awailability`, `price`, `id_currency`) VALUES
	(35105, 'KSEG 7 XSA', 80, 210, 3, 12285.00, 4),
	(35106, 'KSET 61 E 2', 80, 210, 3, 4875.00, 4),
	(35107, 'KSG 70 HE', 80, 210, 3, 6955.00, 4),
	(35108, 'KTS 75 SE 2', 80, 210, 3, 40040.00, 4),
	(35109, 'FAS 841 JHBLMA', 4, 211, 2, 210.00, 6),
	(35110, 'ESC 643 BCSC', 9, 12, 2, 220.00, 6),
	(35111, NULL, 1, 264, 2, 0.00, 6);
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;

-- Дамп структуры для таблица alcotec.catalog_currencies
CREATE TABLE IF NOT EXISTS `catalog_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы alcotec.catalog_currencies: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `catalog_currencies` DISABLE KEYS */;
INSERT INTO `catalog_currencies` (`id`, `name`, `title`, `short_name`, `rate`) VALUES
	(4, 'Гривна', 'грн.', 'uah', 1.00),
	(5, 'Доллар', '$', 'usd', 26.90),
	(6, 'Евро', '&#8364;', 'eur', 29.05);
/*!40000 ALTER TABLE `catalog_currencies` ENABLE KEYS */;

-- Дамп структуры для таблица alcotec.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы alcotec.migrations: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(5, '2021_07_03_120203_create_catalog_table', 1),
	(6, '2021_07_03_120252_create_catalog_currencies_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
