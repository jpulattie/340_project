/* This is an edited dump for Group 90's project database 

The file began as a data dump from mysql workbench and was 
edited to input data into the table under member, loan, loan type, 
account, account type, and branch */

CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `account_number` int(11) DEFAULT NULL,
  `account_amount` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`type_id`,`member_id`),
  KEY `fk_account_1_idx` (`type_id`),
  KEY `fk_account_member1_idx` (`member_id`),
  CONSTRAINT `fk_account_1` FOREIGN KEY (`type_id`) REFERENCES `account_type` (`account_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_member1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES 
(1,1,1,1100,2000.00),
(2,1,2,1101,25000.00),
(3,2,3,1102,10000.00),
(4,1,3,1103,100000.00),
(5,2,4,1104,100.00),
(6,1,5,1105,40.00);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_type` (
  `account_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`account_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_type`
--

LOCK TABLES `account_type` WRITE;
/*!40000 ALTER TABLE `account_type` DISABLE KEYS */;
INSERT INTO `account_type` VALUES (1,'checking'),(2,'savings'),(3,'money market');
/*!40000 ALTER TABLE `account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_branch_has_member`
--

DROP TABLE IF EXISTS `bank_branch_has_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_branch_has_member` (
  `branch_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`branch_id`,`member_id`),
  KEY `fk_bank_branch_has_member_member1_idx` (`member_id`),
  KEY `fk_bank_branch_has_member_bank_branch1_idx` (`branch_id`),
  CONSTRAINT `fk_bank_branch_has_member_bank_branch1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bank_branch_has_member_member1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_branch_has_member`
--

LOCK TABLES `bank_branch_has_member` WRITE;
/*!40000 ALTER TABLE `bank_branch_has_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_branch_has_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'uptown'),(2,'downtown');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `loan_amount` decimal(16,2) DEFAULT NULL,
  `loan_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`type_id`,`member_id`),
  KEY `fk_loan_loan_type1_idx` (`type_id`),
  KEY `fk_loan_member1_idx` (`member_id`),
  CONSTRAINT `fk_loan_loan_type1` FOREIGN KEY (`type_id`) REFERENCES `loan_type` (`loan_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_loan_member1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES 
(1,2,2,18000.00,5000),
(2,4,1,600.00,5001),
(3,3,5,400.00,5002);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_type`
--

DROP TABLE IF EXISTS `loan_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_type` (
  `loan_type_id` int(11) NOT NULL,
  `loan_type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`loan_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_type`
--

LOCK TABLES `loan_type` WRITE;
/*!40000 ALTER TABLE `loan_type` DISABLE KEYS */;
INSERT INTO `loan_type` VALUES (1,'mortgage'),(2,'auto'),(3,'student'),(4,'personal');
/*!40000 ALTER TABLE `loan_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `branch` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES 
(1,'Bob Firstimer','1100 Firstentry blvd','2147483647',2),
(2,'Alice Firsttimer','1101 firsttime blvd','2147483647',2),
(3, 'Ricky Bobby', '500 E Broadway Street', '5554448379',1),
(4, 'Rocky Balboa', '7000 West Malibu', '8995887361',1),
(5, 'Moana Lisa', '63 E Pacific Ave', '5559118007',2);
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-06  8:43:46


