-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: ssh
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CourseGroup`
--
CREATE DATABASE ssh DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

use ssh;

DROP TABLE IF EXISTS `CourseGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CourseGroup` (
  `courseId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  PRIMARY KEY (`courseId`,`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseGroup`
--

LOCK TABLES `CourseGroup` WRITE;
/*!40000 ALTER TABLE `CourseGroup` DISABLE KEYS */;
INSERT INTO `CourseGroup` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `CourseGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentCourse`
--

DROP TABLE IF EXISTS `StudentCourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentCourse` (
  `courseId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  PRIMARY KEY (`courseId`,`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentCourse`
--

LOCK TABLES `StudentCourse` WRITE;
/*!40000 ALTER TABLE `StudentCourse` DISABLE KEYS */;
INSERT INTO `StudentCourse` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,2),(2,3),(2,4),(2,5);
/*!40000 ALTER TABLE `StudentCourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentGroup`
--

DROP TABLE IF EXISTS `StudentGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StudentGroup` (
  `studentId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  PRIMARY KEY (`studentId`,`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentGroup`
--

LOCK TABLES `StudentGroup` WRITE;
/*!40000 ALTER TABLE `StudentGroup` DISABLE KEYS */;
INSERT INTO `StudentGroup` VALUES (1,1),(2,2),(3,2),(4,3),(5,3);
/*!40000 ALTER TABLE `StudentGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assit`
--

DROP TABLE IF EXISTS `assit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assit` (
  `assitId` int(11) NOT NULL AUTO_INCREMENT,
  `assitName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `courseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`assitId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assit`
--

LOCK TABLES `assit` WRITE;
/*!40000 ALTER TABLE `assit` DISABLE KEYS */;
INSERT INTO `assit` VALUES (1,'孙悟空','123',1),(2,'猪八戒','123',1),(3,'李白','123',1),(4,'杜甫','123',2),(5,'王诗龄','123',2);
/*!40000 ALTER TABLE `assit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `courseId` int(11) NOT NULL AUTO_INCREMENT,
  `groupMaxNum` int(11) DEFAULT NULL,
  `groupMinNum` int(11) DEFAULT NULL,
  `groupPre` varchar(255) DEFAULT NULL,
  `courseName` varchar(255) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `teacherId` int(11) DEFAULT NULL,
  `allCallNumber` int(11) DEFAULT NULL,
  `onCallScore` int(11) DEFAULT NULL,
  `courseDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,3,2,'2018301','机器学习','2018-08-09 00:00:00',1,4,1,NULL),(2,1,1,NULL,'深度学习','2018-01-16 00:00:00',1,NULL,NULL,NULL),(3,1,1,NULL,'软件工程','2018-01-16 00:00:00',1,NULL,NULL,NULL),(4,1,1,NULL,'编译原理','2018-01-17 00:00:00',1,NULL,NULL,NULL),(5,1,1,NULL,'服务工程','2018-01-18 00:00:00',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group1`
--

DROP TABLE IF EXISTS `group1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group1` (
  `groupId` int(11) NOT NULL AUTO_INCREMENT,
  `leaderId` int(11) DEFAULT NULL,
  `personNum` int(11) DEFAULT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `phoneNum` varchar(255) DEFAULT NULL,
  `assitId` int(11) DEFAULT NULL,
  `courseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group1`
--

LOCK TABLES `group1` WRITE;
/*!40000 ALTER TABLE `group1` DISABLE KEYS */;
INSERT INTO `group1` VALUES (1,1,1,'333_1',NULL,1,1),(2,3,2,'2018301_2','17888821427',NULL,1),(3,5,2,'2018301_3','412312',NULL,1);
/*!40000 ALTER TABLE `group1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homework`
--

DROP TABLE IF EXISTS `homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homework` (
  `homeworkId` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `commitDate` datetime DEFAULT NULL,
  `subjectId` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  PRIMARY KEY (`homeworkId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homework`
--

LOCK TABLES `homework` WRITE;
/*!40000 ALTER TABLE `homework` DISABLE KEYS */;
INSERT INTO `homework` VALUES (1,'3_1',10,'2018-01-03 03:20:02',1,3);
/*!40000 ALTER TABLE `homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `studentId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `callNumber` int(11) NOT NULL,
  `isComing` int(11) DEFAULT NULL,
  `creatDate` datetime DEFAULT NULL,
  PRIMARY KEY (`studentId`,`courseId`,`callNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,1,1,1,'2018-01-03 03:23:57'),(1,1,2,0,'2018-01-03 04:19:07'),(2,1,1,1,'2018-01-03 03:24:01'),(2,1,2,1,'2018-01-03 04:19:08'),(3,1,2,0,'2018-01-03 04:19:09'),(4,1,1,1,'2018-01-03 03:24:02'),(4,1,2,0,'2018-01-03 04:19:10'),(5,1,1,1,'2018-01-03 03:24:03'),(5,1,2,1,'2018-01-03 04:19:11');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score` (
  `studentId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`studentId`,`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `studentId` int(11) NOT NULL AUTO_INCREMENT,
  `studentName` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `banji` varchar(50) DEFAULT NULL,
  `isFirstLogin` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'sdgfsdf','1','1','302',0),(2,'耿林桐','2014001','c81e728d9d4c2f636f067f89cc14862c',NULL,0),(3,'小纷飞','2014002','c4ca4238a0b923820dcc509a6f75849b',NULL,0),(4,'熊涛','2014003','106d94d031d7505d2b97272cb4fb6717',NULL,1),(5,'度开展','2014004','a87ff679a2f3e71d9181a67b7542122c',NULL,0);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subjectId` int(11) NOT NULL AUTO_INCREMENT,
  `subjectDesc` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `deadLine` datetime DEFAULT NULL,
  `subjectTitle` varchar(255) DEFAULT NULL,
  `courseId` int(11) DEFAULT NULL,
  `quanzhong` int(11) DEFAULT NULL,
  PRIMARY KEY (`subjectId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'使用python编写决SVM','2018-01-03 00:00:00','2018-01-05 00:00:00','SVM',1,20),(2,'实现协同过滤算法','2018-01-03 00:00:00','2018-01-12 00:00:00','协同过滤',1,20),(3,'完成高斯分布','2018-01-03 00:00:00','2018-01-11 00:00:00','高斯分布',1,20);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `teacherId` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `teacherName` varchar(50) DEFAULT NULL,
  `isFirstLogin` int(11) DEFAULT NULL,
  PRIMARY KEY (`teacherId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'22','24','肖丁',1),(2,'33','33','黎明',0);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-03  4:39:57
