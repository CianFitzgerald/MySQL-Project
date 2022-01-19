-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: fitzgerald20206773
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `Candidate_details`
--

DROP TABLE IF EXISTS `Candidate_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Candidate_details` (
  `candidateid` int NOT NULL COMMENT 'Candidate identifier number ',
  `firstname` varchar(20) NOT NULL COMMENT 'First name of candidate',
  `surname` varchar(20) NOT NULL COMMENT 'Last name of candidate',
  `address` varchar(45) DEFAULT NULL COMMENT 'address of the candidate',
  `telephone` varchar(45) DEFAULT NULL COMMENT 'Telephone number of the candidate',
  PRIMARY KEY (`candidateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Candidate_details`
--

LOCK TABLES `Candidate_details` WRITE;
/*!40000 ALTER TABLE `Candidate_details` DISABLE KEYS */;
INSERT INTO `Candidate_details` VALUES (12078,'William','Butler','Cork','0868512741'),(21552,'Hollie','Piper','Limerick','0864797458'),(34572,'Niamh','McCarthy','Galway','0870212430'),(44708,'Sarah','Leonard','Leitrim','0850545035'),(49655,'Paul','Moloney','Dublin','0865004047'),(54293,'Leon','Harris','Cork','0876763266'),(66367,'Liam','Dineen','Cork','0857942520'),(68247,'Josh','Ward','Kerry','0851406272'),(72253,'Peter','Galvin','Wexford','0866320063'),(74699,'David','Conway','Kilkenny','0853750975'),(81485,'Tim','Lehane','Killarney','0879887271'),(85671,'Cian','Fitzgerald','Limerick','0869391295'),(86442,'Ian','Horgan','Cork','0875760028'),(87425,'Steven','Williams','Roscommon','0853349300'),(92632,'Darragh','Fitzpatrick','Mayo','0866638783');
/*!40000 ALTER TABLE `Candidate_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has_skills`
--

DROP TABLE IF EXISTS `has_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has_skills` (
  `candidate` int NOT NULL COMMENT 'Candidate id',
  `skills` varchar(20) NOT NULL COMMENT 'Skill of the candidate',
  PRIMARY KEY (`candidate`,`skills`),
  CONSTRAINT `candidate_id` FOREIGN KEY (`candidate`) REFERENCES `Candidate_details` (`candidateid`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has_skills`
--

LOCK TABLES `has_skills` WRITE;
/*!40000 ALTER TABLE `has_skills` DISABLE KEYS */;
INSERT INTO `has_skills` VALUES (12078,'administrative'),(21552,'analytical '),(34572,'nursing'),(44708,'equipment-protocols'),(44708,'Problem-solving'),(49655,'administrative'),(49655,'dexterity'),(54293,'communication'),(54293,'nursing'),(66367,'equipment-protocols'),(68247,'Problem-solving'),(72253,'Management'),(74699,'communication'),(81485,'dexterity'),(81485,'equipment-protocols'),(81485,'nursing'),(85671,'administrative'),(85671,'nursing'),(86442,'analytical '),(86442,'dexterity'),(86442,'Management'),(87425,'dexterity');
/*!40000 ALTER TABLE `has_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hospital_details`
--

DROP TABLE IF EXISTS `Hospital_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hospital_details` (
  `Hospitalid` int NOT NULL COMMENT 'Hospital identifier code',
  `Hospitalname` varchar(45) NOT NULL COMMENT 'The name of the hospital',
  `address` varchar(45) DEFAULT NULL COMMENT 'Address of the hospital',
  `telephone` varchar(20) DEFAULT NULL COMMENT 'Telephone number of the hospital',
  PRIMARY KEY (`Hospitalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hospital_details`
--

LOCK TABLES `Hospital_details` WRITE;
/*!40000 ALTER TABLE `Hospital_details` DISABLE KEYS */;
INSERT INTO `Hospital_details` VALUES (10001,'Galway University Hospital','Galway','0213896576'),(12345,'Cork University Hospital','Cork','0214292000'),(23456,'University Hospital Limerick','Limerick','0214567362'),(34567,'Wexford General Hospital','Wexford','0216894673'),(45678,'Mayo General Hospital','Mayo','0216835720'),(56789,'Kerry General Hospital','Kerry','0216946208'),(67891,'South Tipperary General Hospital','Tipperary','0213278450'),(78901,'Roscommon County Hospital','Roscommon','0217903572'),(89012,'Naas General Hospital','Naas','0217945327'),(90123,'Mallow General Hospital','Mallow','0218956712');
/*!40000 ALTER TABLE `Hospital_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Interview_details`
--

DROP TABLE IF EXISTS `Interview_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Interview_details` (
  `interviewid` int NOT NULL COMMENT 'Interview id code',
  `candidateid` int NOT NULL COMMENT 'Id of the candidate',
  `positionid` int NOT NULL COMMENT 'Id of the position details',
  `date` date DEFAULT NULL COMMENT 'the date of the interview',
  `positionoffered` varchar(20) DEFAULT NULL COMMENT 'Whether the position was offered or not',
  PRIMARY KEY (`interviewid`),
  KEY `positionid_idx` (`positionid`),
  KEY `candidateid_idx` (`candidateid`),
  CONSTRAINT `candidateid` FOREIGN KEY (`candidateid`) REFERENCES `Candidate_details` (`candidateid`) ON UPDATE CASCADE,
  CONSTRAINT `positionid` FOREIGN KEY (`positionid`) REFERENCES `Position_details` (`positionid`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Interview_details`
--

LOCK TABLES `Interview_details` WRITE;
/*!40000 ALTER TABLE `Interview_details` DISABLE KEYS */;
INSERT INTO `Interview_details` VALUES (13704,87425,1411,'2020-04-12','no'),(16909,21552,5712,'2020-02-22','yes'),(19951,34572,6446,'2020-06-22','yes'),(23732,85671,6914,'2020-04-19','yes'),(25513,34572,1411,'2020-08-20','no'),(29925,81485,6914,'2020-06-03','no'),(35528,86442,5712,'2020-04-15','yes'),(35648,85671,5756,'2020-06-17','no'),(54835,87425,3807,'2020-07-03','yes'),(55446,68247,6043,'2020-06-20','no'),(81850,34572,1411,'2020-03-27','no'),(83569,74699,6500,'2020-05-10','yes'),(88723,54293,6914,'2020-06-20','yes'),(93118,21552,6043,'2020-02-27','no'),(98397,74699,6914,'2020-01-05','no');
/*!40000 ALTER TABLE `Interview_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Position_details`
--

DROP TABLE IF EXISTS `Position_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Position_details` (
  `positionid` int NOT NULL COMMENT 'Position identifier number\n',
  `type` varchar(45) DEFAULT NULL COMMENT 'Type of position',
  `hospital` int DEFAULT NULL COMMENT 'hospital id advertising the position',
  PRIMARY KEY (`positionid`),
  KEY `hospitalid_idx` (`hospital`),
  CONSTRAINT `hospitalid` FOREIGN KEY (`hospital`) REFERENCES `Hospital_details` (`Hospitalid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Position_details`
--

LOCK TABLES `Position_details` WRITE;
/*!40000 ALTER TABLE `Position_details` DISABLE KEYS */;
INSERT INTO `Position_details` VALUES (1411,'Receptionist',90123),(3807,'Radiologic technician',34567),(4685,'Registered nurse',12345),(5712,'Registered nurse',12345),(5756,'Medical technologist',78901),(6043,'Occupational therapist',78901),(6446,'Respiratory therapist',67891),(6500,'Pharmacist',56789),(6914,'Surgeon',56789),(7215,'Surgeon',10001);
/*!40000 ALTER TABLE `Position_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `required_skills`
--

DROP TABLE IF EXISTS `required_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `required_skills` (
  `position` int NOT NULL COMMENT 'Position id',
  `req_skill` varchar(45) NOT NULL COMMENT 'skills required for the position',
  PRIMARY KEY (`position`,`req_skill`),
  CONSTRAINT `position_id` FOREIGN KEY (`position`) REFERENCES `Position_details` (`positionid`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `required_skills`
--

LOCK TABLES `required_skills` WRITE;
/*!40000 ALTER TABLE `required_skills` DISABLE KEYS */;
INSERT INTO `required_skills` VALUES (1411,'administrative'),(1411,'Problem-solving'),(3807,'equipment protocols'),(4685,'equipment-protocols'),(4685,'nursing'),(5712,'equipment-protocols'),(5712,'nursing'),(5756,'analytical '),(6043,'communication'),(6446,'Problem-solving'),(6500,'analytical'),(6500,'Management'),(6914,'dexterity'),(7215,'communication'),(7215,'dexterity');
/*!40000 ALTER TABLE `required_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fitzgerald20206773'
--

--
-- Dumping routines for database 'fitzgerald20206773'
--
/*!50003 DROP PROCEDURE IF EXISTS `newrow_candidate_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newrow_candidate_details`(IN candidate_ID INT, IN First_name varchar(20), 
IN surname varchar(20), IN address varchar(45),IN telephone varchar(45))
BEGIN
INSERT INTO Candidate_details (candidateid, firstname,surname,address,telephone)
 VALUES 
(candidate_ID,First_name, surname, address, telephone );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newrow_has_skills` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newrow_has_skills`(IN Candidate_ID INT, IN skills varchar(20))
BEGIN
INSERT INTO has_skills (candidate, skills)
 VALUES 
(Candidate_ID,skills);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newrow_Hospital_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newrow_Hospital_details`(IN Hospital_ID INT, IN Hospital_name varchar(45), IN address varchar(45), IN telephone varchar(20))
BEGIN
INSERT INTO Hospital_details (hospitalid, hospitalname,address,telephone)
 VALUES 
(Hospital_ID, Hospital_name, address, telephone);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newrow_interview_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newrow_interview_details`(IN Interview_ID INT, IN Candidate_ID INT, IN Position_ID INT, IN new_date DATE, IN Offer varchar(20))
BEGIN
INSERT INTO Interview_details (interviewid, candidateid, positionid, date, positionoffered)
 VALUES 
(Interview_ID, Candidate_ID, Position_ID, new_date, Offer);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newrow_position_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newrow_position_details`(IN Position_ID INT, IN Position_type varchar(45), IN Hospital_ID INT)
BEGIN
INSERT INTO Position_details (positionid,type,hospital)
 VALUES 
(Position_ID, Position_type, Hospital_ID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newrow_required_skills` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newrow_required_skills`(IN Position_ID INT, IN required_skills varchar(45))
BEGIN
INSERT INTO required_skills (position, req_skill)
 VALUES 
(Position_ID,required_skills);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `part_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `part_1`(IN Hospital_ID varchar(20))
BEGIN
select Hospitalid, Hospitalname, address, telephone
	from fitzgerald20206773.Hospital_details 
    where Hospitalid = Hospital_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `part_10` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `part_10`(IN interview_date DATE)
BEGIN
select candidateid, date

	from fitzgerald20206773.Interview_details
    
    where date = interview_date ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `part_11` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `part_11`()
BEGIN
select firstname, surname, CD.candidateid

	from fitzgerald20206773.interview_details ID, fitzgerald20206773.Candidate_details CD
	where CD.candidateid = ID.candidateid 
    group by ID.candidateid
    having count(ID.candidateid)>=2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `part_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `part_2`(IN Hospital_name varchar(45))
BEGIN
select Hospitalid, Hospitalname, address, telephone
	from fitzgerald20206773.Hospital_details 
    where Hospitalname = Hospital_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `part_3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `part_3`(IN candidate_Surname varchar(20))
BEGIN
select candidateid, firstname, surname, address, telephone
	from fitzgerald20206773.Candidate_details CD
    where surname = candidate_Surname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `part_4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `part_4`(IN position_ID varchar(20))
BEGIN
select CD.candidateid, PD.type, firstname, surname, HS.skills
	from fitzgerald20206773.Candidate_details CD, fitzgerald20206773.has_skills HS, fitzgerald20206773.required_skills RS, fitzgerald20206773.Position_details PD 
    where CD.candidateid = HS.candidate and PD.positionid = RS.position and HS.skills = RS.req_skill and RS.position = position_ID ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `part_5` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `part_5`()
BEGIN
select count(interviewid) from fitzgerald20206773.interview_details  where positionoffered ="yes";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `part_6` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `part_6`(IN Skill_required varchar(20))
BEGIN
select type, HD.hospitalname
	from fitzgerald20206773.Position_details PD, fitzgerald20206773.Hospital_details HD, fitzgerald20206773.required_skills RS
    where PD.hospital = HD.hospitalid and RS.POSITION = PD.positionid and RS.req_skill = Skill_required ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `part_7` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `part_7`()
BEGIN
select count(position)
	from fitzgerald20206773.required_skills
    where req_skill = "nursing";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `part_8` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `part_8`()
BEGIN
select HD.hospitalname, type
	from fitzgerald20206773.Position_details PD, fitzgerald20206773.Hospital_details HD
    where PD.hospital = HD.hospitalid
    order by HD.hospitalname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `part_9` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `part_9`(IN interview_date DATE)
BEGIN
select CD.firstname, CD.surname, PD.type, HD.hospitalname

	from fitzgerald20206773.Position_details PD, fitzgerald20206773.interview_details ID, 
    fitzgerald20206773.Candidate_details CD, fitzgerald20206773.hospital_details  HD
    
    where PD.positionid = ID.positionid and CD.candidateid = ID.candidateid and HD.hospitalid = PD.hospital
    and date = interview_date ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-24 14:31:02
