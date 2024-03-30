failed to get console mode for stdout: The handle is invalid.
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: refugio_balu
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address_reference` text,
  `city` varchar(255) DEFAULT NULL,
  `colony` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `exterior_number` varchar(255) DEFAULT NULL,
  `interior_number` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `home_specification_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_k4f2u8np94mj9nqd5lmugixve` (`home_specification_id`),
  UNIQUE KEY `UK_p624vxq0vboah4lfpj88fq8gt` (`user_id`),
  CONSTRAINT `FK1fa36y2oqhao3wgg2rw1pi459` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKf8rxalg5adm099osgv15jrl0w` FOREIGN KEY (`home_specification_id`) REFERENCES `home_specifications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adoption_requests`
--

DROP TABLE IF EXISTS `adoption_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoption_requests` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `images` json NOT NULL,
  `pet_id` bigint DEFAULT NULL,
  `status_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `additional_information` varchar(255) NOT NULL,
  `place_of_residence` json NOT NULL,
  `previous_experience` json NOT NULL,
  `reasons_for_adoption` json NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnbrvxfu9ncpliue6x29ohsyno` (`pet_id`),
  KEY `FKim3gjig7dqg8epxdm9xp6ulil` (`status_id`),
  KEY `FKk0y3j8ydm8gr4pfhujbsxi62l` (`user_id`),
  CONSTRAINT `FKim3gjig7dqg8epxdm9xp6ulil` FOREIGN KEY (`status_id`) REFERENCES `statusses` (`id`),
  CONSTRAINT `FKk0y3j8ydm8gr4pfhujbsxi62l` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKnbrvxfu9ncpliue6x29ohsyno` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoption_requests`
--

LOCK TABLES `adoption_requests` WRITE;
/*!40000 ALTER TABLE `adoption_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `adoption_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(255) DEFAULT NULL,
  `image` text,
  `name` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_pets`
--

DROP TABLE IF EXISTS `favorite_pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_pets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pet_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKielw5pct4vf1bdhmimxpfqoj1` (`pet_id`),
  KEY `FKj67k5dfgj4nhpv99t1ys69yxa` (`user_id`),
  CONSTRAINT `FKielw5pct4vf1bdhmimxpfqoj1` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`),
  CONSTRAINT `FKj67k5dfgj4nhpv99t1ys69yxa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_pets`
--

LOCK TABLES `favorite_pets` WRITE;
/*!40000 ALTER TABLE `favorite_pets` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_images`
--

DROP TABLE IF EXISTS `home_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` text,
  `home_specification_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_a4swccgtdv0l6s7b6f5m43fm5` (`home_specification_id`),
  CONSTRAINT `FKn1d94r1qtgijg7ythmogh6n30` FOREIGN KEY (`home_specification_id`) REFERENCES `home_specifications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_images`
--

LOCK TABLES `home_images` WRITE;
/*!40000 ALTER TABLE `home_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_specifications`
--

DROP TABLE IF EXISTS `home_specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_specifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `number_of_residents` int NOT NULL,
  `outdoor_area` tinyint(1) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_specifications`
--

LOCK TABLES `home_specifications` WRITE;
/*!40000 ALTER TABLE `home_specifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `message` varchar(255) NOT NULL,
  `table_affected` varchar(255) NOT NULL,
  `type` enum('INSERT','UPDATE','DELETE','LOGIN','BLOCK','FAILED_LOGIN','UNBLOCK') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_records`
--

DROP TABLE IF EXISTS `medical_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_records` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `allergies` text,
  `dewormed` bit(1) NOT NULL,
  `diseases` text,
  `microchip` bit(1) NOT NULL,
  `observations` varchar(250) DEFAULT NULL,
  `sterilized` bit(1) NOT NULL,
  `vaccinated` bit(1) NOT NULL,
  `pet_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jt55cwsa1u1us3aqctpg9u94` (`pet_id`),
  CONSTRAINT `FKojfodeedei8la4yhl5wfo99iy` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_records`
--

LOCK TABLES `medical_records` WRITE;
/*!40000 ALTER TABLE `medical_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `medical_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `profile_picture` longtext,
  `secondary_email` varchar(255) DEFAULT NULL,
  `secondary_phone_number` varchar(255) DEFAULT NULL,
  `sur_name` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_av66guy6x8qkjf1npcjm8de25` (`user_id`),
  CONSTRAINT `FKmdhygj3uwkwcfqns9mu1htoi5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_comments`
--

DROP TABLE IF EXISTS `pet_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment` varchar(500) NOT NULL,
  `pet_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3tolosh1e07rksj1p8lntpnpf` (`pet_id`),
  KEY `FK5gatkk3kgd3gisrpxvtfu94ci` (`user_id`),
  CONSTRAINT `FK3tolosh1e07rksj1p8lntpnpf` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`),
  CONSTRAINT `FK5gatkk3kgd3gisrpxvtfu94ci` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_comments`
--

LOCK TABLES `pet_comments` WRITE;
/*!40000 ALTER TABLE `pet_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_images`
--

DROP TABLE IF EXISTS `pet_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` text,
  `pet_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKauwhaty3q9lfuoyy6018bs17n` (`pet_id`),
  CONSTRAINT `FKauwhaty3q9lfuoyy6018bs17n` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_images`
--

LOCK TABLES `pet_images` WRITE;
/*!40000 ALTER TABLE `pet_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `age` int NOT NULL,
  `age_unit` enum('MONTHS','YEARS') NOT NULL,
  `breed` varchar(50) NOT NULL,
  `characteristics` text NOT NULL,
  `description` varchar(500) NOT NULL,
  `gender` enum('MALE','FEMALE') NOT NULL,
  `life_stage` enum('PUPPY','YOUNG','ADULT','SENIOR') NOT NULL,
  `main_image` text NOT NULL,
  `name` varchar(50) NOT NULL,
  `weight` double NOT NULL,
  `weight_unit` enum('KILOGRAMS','GRAMS','POUNDS') NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `user_moderator_id` bigint DEFAULT NULL,
  `user_owner_id` bigint DEFAULT NULL,
  `status_id` bigint DEFAULT NULL,
  `size` enum('SMALL','MEDIUM','BIG') NOT NULL,
  `special_cares` text,
  PRIMARY KEY (`id`),
  KEY `FKgi0rstxkais4tjx5kvx0jgsv0` (`category_id`),
  KEY `FKh73klx491eg5341syig0tv5aq` (`user_moderator_id`),
  KEY `FK8fw31l5ffjh5xr3h7tf74yqa6` (`user_owner_id`),
  KEY `FK8i3il9kcxf24yjahl3j9ivtjs` (`status_id`),
  CONSTRAINT `FK8fw31l5ffjh5xr3h7tf74yqa6` FOREIGN KEY (`user_owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK8i3il9kcxf24yjahl3j9ivtjs` FOREIGN KEY (`status_id`) REFERENCES `statusses` (`id`),
  CONSTRAINT `FKgi0rstxkais4tjx5kvx0jgsv0` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FKh73klx491eg5341syig0tv5aq` FOREIGN KEY (`user_moderator_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ofx66keruapi6vyqpv6f2or37` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (2,'ADMIN'),(1,'GENERAL'),(3,'MOD');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusses`
--

DROP TABLE IF EXISTS `statusses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statusses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4bfbn70tk5pqfoo2rsw9hfdkk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusses`
--

LOCK TABLES `statusses` WRITE;
/*!40000 ALTER TABLE `statusses` DISABLE KEYS */;
INSERT INTO `statusses` VALUES (1,'ADOPTED'),(5,'APPROVED'),(3,'APRROVED'),(6,'CLOSED'),(4,'IN_REVISION'),(2,'PENDING');
/*!40000 ALTER TABLE `statusses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activation_code` varchar(255) DEFAULT NULL,
  `attempts` int NOT NULL,
  `blocked` tinyint(1) DEFAULT '0',
  `blocked_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_access` timestamp NULL DEFAULT NULL,
  `password` text NOT NULL,
  `username` text NOT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`),
  CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,0,0,NULL,'2024-03-25 19:53:18',NULL,'$2a$10$hhrNg3XCbJJevKklDtJytu5k0BePru4iavzug1ZdnWqTzg/l9aAPu','XbQEsoVWjrzcOZKK3yE45fIUeGJZozr9+glYoLRRr2k=',2),(2,NULL,0,0,NULL,'2024-03-25 19:53:18',NULL,'$2a$10$vj9jVEyJmQ6G4ofp59L5V.vH5DDM2mRyGoba3YKP0dKIggU06gLvy','CUljXPzOaHphYRXkEAcXj2TT89atg4RdCPXzwhspYqk=',2),(3,NULL,0,0,NULL,'2024-03-25 19:53:18',NULL,'$2a$10$wAwSoM3vuSEHexsDqugUJ.yaI1pPsJmmkKJqfIRACp4O1pZy7pCqK','2QRY9NPikhdt7Db3oZ0BcbG4ziroWAMRTJwQvVhkmts=',3);
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

-- Dump completed on 2024-03-30  1:23:11
