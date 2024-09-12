CREATE DATABASE  IF NOT EXISTS `projeto_sge` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `projeto_sge`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: projeto_sge
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas` (
  `id_area` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'Matemática'),(2,'Física'),(3,'Química'),(4,'Biologia'),(5,'Literatura'),(6,'História'),(7,'Geografia'),(8,'Educação Física'),(9,'Arte'),(10,'Educação Musical');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professores`
--

DROP TABLE IF EXISTS `professores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professores` (
  `id_professor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `admissao` date NOT NULL,
  `senha` varchar(45) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `area` int(11) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_professor`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  KEY `area` (`area`),
  CONSTRAINT `professores_ibfk_1` FOREIGN KEY (`area`) REFERENCES `areas` (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professores`
--

LOCK TABLES `professores` WRITE;
/*!40000 ALTER TABLE `professores` DISABLE KEYS */;
INSERT INTO `professores` VALUES (1,'Professor Dorivaldo','423942307','2004-11-10','senhadorivaldo','09819278911',3,NULL),(2,'Teste','teste','2004-11-10','teste','111',7,NULL),(3,'TDWFDWDW','DWADWADAW','2004-11-10','DWADAD','42342',9,NULL),(4,'WADWADAWD','DAWDADAD','2003-11-10','DWDAWDWA','WADWADWA',8,NULL),(5,'TESTDW','-49747306','2004-11-10','DWADAWD','DWADAWDAWD',1,NULL),(6,'dawdwadawd','1354539330','2222-12-10','2222','dawdwa',2,NULL),(7,'dawdwadwadaw','24166594','1111-11-11','dadawdwad','adadwadadad',6,NULL),(8,'TESTE IMAGEM','180588765','2004-11-10','1011','1011',2,'assets/a.jpg'),(9,'dwdadawd','91188240','1111-11-11','dadawdaw','dawdawdawd',2,'assets/t.jpg'),(10,'awdawdawdawd','1121262265','2004-11-10','adawdawd','dawdwadwad',1,'assets/X.jpg'),(11,'dwadwadaw','180553396','1111-11-11','dadaw','dadaw',1,'assets/d.jpg'),(12,'wadwadwa','687119279','1111-11-11','ddd','ddd',2,'assets/ppp.jpg'),(13,'wadwadawdada','1348314760','2004-11-10','wadwadawd','14141',1,NULL),(14,'dwawadwadawdaw','254464290','1111-11-11','dwadawda','dawdw',4,'assets/dwadwadwa.jpg');
/*!40000 ALTER TABLE `professores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'projeto_sge'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-12 17:24:06
