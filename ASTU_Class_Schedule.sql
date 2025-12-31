CREATE DATABASE  IF NOT EXISTS `astu_schedule_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `astu_schedule_db`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: astu_schedule_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `academic_year`
--

DROP TABLE IF EXISTS `academic_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_year` (
  `year_id` int NOT NULL,
  `year_name` varchar(20) NOT NULL,
  PRIMARY KEY (`year_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_year`
--

LOCK TABLES `academic_year` WRITE;
/*!40000 ALTER TABLE `academic_year` DISABLE KEYS */;
INSERT INTO `academic_year` VALUES (3,'3rd Year'),(4,'4th Year'),(5,'5th Year');
/*!40000 ALTER TABLE `academic_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_code` varchar(10) NOT NULL,
  `course_title` varchar(150) NOT NULL,
  PRIMARY KEY (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('CSEg3202','Computer Architecture and Organization'),('CSEg3203','Advanced Programming'),('CSEg3204','Data Communication and Computer Networks'),('CSEg4203','Formal Language & Automata Theory'),('CSEg4205','Computer Systems Security'),('CSEg5307','Advanced Computer Networking'),('ECEg3103','Probability and Random Processes'),('LART1003','History of Ethiopia and the Horn'),('Math2201','Linear Algebra'),('SEng3201','Software Requirements Engineering'),('SEng3304','Formal Methods in Software Engineering'),('SEng4201','Software Testing and Quality Assurance'),('SEng4203','Capstone Project'),('SEng4207','Software Process and Project Management'),('SEng4303','Introduction to Systems Engineering'),('SEng5201','Final Year Project I'),('SEng5203','Ethics and Professionalism in Computing'),('SEng5301','Intro to Computer Vision and Image Processing'),('SEng5303','Introduction to Natural Language Processing'),('SEng5305','Introduction to Machine Learning'),('SEng5307','Embedded System and Robotic Control'),('SOSC5003','Entrepreneurship and Business Development');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `course_code` varchar(10) DEFAULT NULL,
  `section_id` varchar(5) DEFAULT NULL,
  `day_name` enum('Monday','Tuesday','Wednesday','Thursday','Friday') DEFAULT NULL,
  `time_slot_id` int DEFAULT NULL,
  `activity_type` enum('Lecture','Lab','Tutorial') DEFAULT NULL,
  `details` varchar(150) DEFAULT NULL,
  `room` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `course_code` (`course_code`),
  KEY `section_id` (`section_id`),
  KEY `time_slot_id` (`time_slot_id`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`),
  CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slot` (`time_slot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'SEng3201','S1','Monday',1,'Lecture','Main Lecture','B507 R13'),(2,'CSEg3204','S1','Monday',6,'Lecture','Main Lecture','B507 R13'),(3,'CSEg3203','S1','Tuesday',1,'Lecture','Main Lecture','B507 R13'),(4,'CSEg3204','S1','Tuesday',6,'Lab','G1 / CSEg3202 G2','Lab Room'),(5,'CSEg3202','S1','Wednesday',1,'Lecture','Main Lecture','B507 R13'),(6,'ECEg3103','S1','Wednesday',3,'Lecture','Main Lecture','B507 R13'),(7,'ECEg3103','S1','Thursday',1,'Tutorial','Tutorial Session','B507 R13'),(8,'CSEg3203','S1','Friday',1,'Lab','G2 Lab','Lab Room'),(9,'Math2201','S1','Friday',6,'Lecture','Main Lecture','B507 R13'),(10,'CSEg3204','S2','Monday',1,'Lab','G3 / CSEg3202 G4','Lab'),(11,'CSEg3203','S2','Tuesday',1,'Lab','G3 Lab','Lab'),(12,'CSEg3202','S2','Tuesday',4,'Lecture','Main Lecture','B507 R13'),(13,'SEng3201','S2','Tuesday',6,'Lecture','Main Lecture','B507 R13'),(14,'CSEg3203','S2','Wednesday',1,'Lab','G4 Lab','Lab'),(15,'CSEg3203','S2','Wednesday',4,'Lecture','Main Lecture','B507 R13'),(16,'Math2201','S2','Wednesday',6,'Lecture','Main Lecture','B507 R13'),(17,'ECEg3103','S2','Thursday',4,'Lecture','Main Lecture','B507 R13'),(18,'ECEg3103','S2','Thursday',6,'Tutorial','Tutorial','B507 R13'),(19,'CSEg3204','S2','Friday',1,'Lecture','Main Lecture','B507 R13'),(20,'CSEg3204','S2','Friday',6,'Lab','G4 / CSEg3202 G3','Lab'),(21,'CSEg3204','S3','Monday',1,'Lab','G5 / CSEg3202 G6','Lab'),(22,'ECEg3103','S3','Monday',6,'Tutorial','Tutorial','B507 R14'),(23,'CSEg3203','S3','Tuesday',1,'Lecture','Main Lecture','B507 R14'),(24,'ECEg3103','S3','Tuesday',3,'Lecture','Main Lecture','B507 R14'),(25,'SEng3201','S3','Tuesday',6,'Lecture','Main Lecture','B507 R14'),(26,'CSEg3202','S3','Wednesday',1,'Lecture','Main Lecture','B507 R14'),(27,'CSEg3204','S3','Wednesday',6,'Lab','G6 / CSEg3202 G5','Lab'),(28,'Math2201','S3','Thursday',1,'Lecture','Main Lecture','B507 R14'),(29,'CSEg3203','S3','Thursday',6,'Lab','G5 Lab','Lab'),(30,'CSEg3203','S3','Friday',1,'Lab','G6 Lab','Lab'),(31,'CSEg3204','S3','Friday',6,'Lecture','Main Lecture','B507 R14'),(32,'SEng4201','S4','Monday',1,'Lecture','Main Lecture','B507 R14'),(33,'CSEg4205','S4','Monday',6,'Lab','G2 / CSEg5307 G1','Lab'),(34,'CSEg4205','S4','Wednesday',1,'Lecture','Main Lecture','B507 R12'),(35,'CSEg4205','S4','Wednesday',4,'Lecture','Main Lecture','B507 R14'),(36,'CSEg4203','S4','Wednesday',6,'Lecture','Main Lecture','B507 R14'),(37,'SEng4207','S4','Thursday',6,'Lecture','Main Lecture','B507 R14'),(38,'LART1003','S4','Friday',1,'Lecture','Main Lecture','B507 R14'),(39,'SEng3304','S4','Friday',6,'Lecture','Main Lecture','B512 R7'),(40,'LART1003','S5','Monday',1,'Lecture','Main Lecture','B507 R15'),(41,'CSEg4205','S5','Monday',6,'Lab','G4 / CSEg5307 G3','Lab'),(42,'CSEg4205','S5','Tuesday',1,'Lab','G3 / CSEg5307 G4','Lab'),(43,'SEng4303','S5','Tuesday',6,'Lecture','Main Lecture','B515 R2'),(44,'CSEg4205','S5','Wednesday',1,'Lecture','Main Lecture','B507 R12'),(45,'CSEg4203','S5','Wednesday',6,'Lecture','Main Lecture','B507 R14'),(46,'SEng4201','S5','Thursday',6,'Lecture','Main Lecture','B507 R15'),(47,'SEng4207','S5','Friday',1,'Lecture','Main Lecture','B507 R15'),(48,'SEng3304','S5','Friday',6,'Lecture','Main Lecture','B512 R7'),(49,'CSEg4205','S6','Monday',1,'Lab','G5 / CSEg5307 G6','Lab'),(50,'SEng4201','S6','Monday',6,'Lecture','Main Lecture','B507 R15'),(51,'LART1003','S6','Tuesday',1,'Lecture','Main Lecture','B507 R15'),(52,'SEng4303','S6','Tuesday',6,'Lecture','Main Lecture','B515 R2'),(53,'CSEg4205','S6','Wednesday',1,'Lecture','Main Lecture','B507 R12'),(54,'CSEg4203','S6','Wednesday',6,'Lecture','Main Lecture','B507 R14'),(55,'CSEg4205','S6','Thursday',1,'Lab','G6 / CSEg5307 G5','Lab'),(56,'SEng4207','S6','Thursday',6,'Lecture','Main Lecture','B513 R1'),(57,'CSEg4205','S6','Friday',1,'Lecture','Main Lecture','B512 R5'),(58,'SEng3304','S6','Friday',6,'Lecture','Main Lecture','B512 R7'),(59,'SEng5201','S7','Monday',1,'Lecture','Final Year Project I','B507 R16'),(60,'SEng5301','S7','Monday',2,'Lecture','Computer Vision','B507 R17'),(61,'SEng5307','S7','Monday',3,'Lecture','Embedded Systems','B507 R17'),(62,'SEng5203','S7','Tuesday',1,'Lecture','Ethics & Professionalism','B507 R16'),(63,'SOSC5003','S7','Tuesday',3,'Lecture','Entrepreneurship','B507 R16'),(64,'SEng5301','S7','Tuesday',6,'Lab','G1 / SEng5303 G2','Lab'),(65,'SOSC5003','S7','Wednesday',3,'Lecture','Entrepreneurship','B507 R16'),(66,'SEng5305','S7','Thursday',1,'Lecture','Machine Learning','B507 R16'),(67,'SEng5301','S7','Thursday',3,'Lab','G2 / SEng5303 G1','Lab'),(68,'SEng5305','S7','Thursday',6,'Lab','G2 / SEng5307 G1','Lab'),(69,'SEng5305','S7','Friday',1,'Lab','G1 / SEng5307 G2','Lab'),(70,'SEng5201','S8','Monday',1,'Lecture','Final Year Project I','B507 R16'),(71,'SEng5301','S8','Monday',2,'Lecture','Computer Vision','B507 R17'),(72,'SEng5307','S8','Monday',3,'Lecture','Embedded Systems','B507 R17'),(73,'SEng5301','S8','Tuesday',1,'Lab','G4 / SEng5303 G5','Lab'),(74,'SEng5305','S8','Tuesday',6,'Lab','G3 / SEng5307 G4','Lab'),(75,'SEng5303','S8','Wednesday',1,'Lecture','Natural Language Processing','B507 R16'),(76,'SOSC5003','S8','Wednesday',3,'Lecture','Entrepreneurship','B507 R16'),(77,'SEng5203','S8','Thursday',1,'Lecture','Ethics & Professionalism','B512 R5'),(78,'SEng5305','S8','Thursday',3,'Lecture','Machine Learning','B507 R16'),(79,'SEng5305','S8','Thursday',6,'Lab','G4 / SEng5307 G3','Lab'),(80,'SEng5301','S8','Friday',1,'Lab','G3 / SEng5303 G4','Lab'),(81,'SEng5201','S9','Monday',1,'Lecture','Final Year Project I','B507 R17'),(82,'SEng5301','S9','Monday',2,'Lecture','Computer Vision','B507 R17'),(83,'SEng5307','S9','Monday',3,'Lecture','Embedded Systems','B507 R17'),(84,'SEng5301','S9','Tuesday',1,'Lab','G5 / SEng5303 G6','Lab'),(85,'SEng5305','S9','Tuesday',6,'Lab','G6 / SEng5307 G5','Lab'),(86,'SEng5305','S9','Wednesday',1,'Lecture','Machine Learning','B507 R16'),(87,'SEng5303','S9','Wednesday',3,'Lecture','Natural Language Processing','B507 R16'),(88,'SEng5203','S9','Thursday',1,'Lecture','Ethics & Professionalism','B507 R17'),(89,'SOSC5003','S9','Thursday',3,'Lecture','Entrepreneurship','B507 R17'),(90,'SEng5301','S9','Thursday',6,'Lab','G6 / SEng5303 G5','Lab'),(91,'SEng5305','S9','Friday',1,'Lab','G5 / SEng5307 G6','Lab');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `section_id` varchar(5) NOT NULL,
  `year_id` int DEFAULT NULL,
  `room` varchar(20) DEFAULT NULL,
  `semester` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `year_id` (`year_id`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`year_id`) REFERENCES `academic_year` (`year_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES ('S1',3,'B507 R13','1st Semester'),('S2',3,'B507 R13','1st Semester'),('S3',3,'B507 R14','1st Semester'),('S4',4,'B507 R14','1st Semester'),('S5',4,'B507 R15','1st Semester'),('S6',4,'B507 R15','1st Semester'),('S7',5,'B507 R16','1st Semester'),('S8',5,'B507 R16','1st Semester'),('S9',5,'B507 R17','1st Semester');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_slot` (
  `time_slot_id` int NOT NULL AUTO_INCREMENT,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`time_slot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slot`
--

LOCK TABLES `time_slot` WRITE;
/*!40000 ALTER TABLE `time_slot` DISABLE KEYS */;
INSERT INTO `time_slot` VALUES (1,'08:00:00','08:50:00'),(2,'09:00:00','09:50:00'),(3,'10:00:00','10:50:00'),(4,'11:00:00','11:50:00'),(5,'12:00:00','12:50:00'),(6,'14:00:00','14:50:00'),(7,'15:00:00','15:50:00'),(8,'16:00:00','16:50:00'),(9,'17:00:00','17:50:00');
/*!40000 ALTER TABLE `time_slot` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-28 11:19:55
