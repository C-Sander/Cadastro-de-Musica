-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: cadastromusicas
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `codalbum` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `ano` int(11) DEFAULT NULL,
  `artista_codartista` int(11) NOT NULL,
  PRIMARY KEY (`codalbum`),
  KEY `fk_album_artista1_idx` (`artista_codartista`),
  CONSTRAINT `fk_album_artista1` FOREIGN KEY (`artista_codartista`) REFERENCES `artista` (`codartista`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'Saturno',2012,5),(2,'Listen',2014,1),(3,'Rua dos Amores',2012,2),(4,'Acústico',2012,4),(5,'Foco, Força E Fé',2014,3);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artista` (
  `codartista` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `generomusical_codgeneromusical` int(11) NOT NULL,
  PRIMARY KEY (`codartista`),
  KEY `fk_artista_generomusical_idx` (`generomusical_codgeneromusical`),
  CONSTRAINT `fk_artista_generomusical` FOREIGN KEY (`generomusical_codgeneromusical`) REFERENCES `generomusical` (`codgeneromusical`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES (1,'David Guetta',4),(2,'Djavan',5),(3,'Projota',3),(4,'Natiruts',2),(5,'Capital Inicial',1);
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generomusical`
--

DROP TABLE IF EXISTS `generomusical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generomusical` (
  `codgeneromusical` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`codgeneromusical`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generomusical`
--

LOCK TABLES `generomusical` WRITE;
/*!40000 ALTER TABLE `generomusical` DISABLE KEYS */;
INSERT INTO `generomusical` VALUES (1,'Rock'),(2,'Reaggae'),(3,'Rap'),(4,'Eletronica'),(5,'MPB');
/*!40000 ALTER TABLE `generomusical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musica`
--

DROP TABLE IF EXISTS `musica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `musica` (
  `codmusica` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `duracao` int(11) DEFAULT NULL,
  `classificacao` int(11) DEFAULT NULL,
  `album_codalbum` int(11) NOT NULL,
  PRIMARY KEY (`codmusica`),
  KEY `fk_musica_album1_idx` (`album_codalbum`),
  CONSTRAINT `fk_musica_album1` FOREIGN KEY (`album_codalbum`) REFERENCES `album` (`codalbum`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musica`
--

LOCK TABLES `musica` WRITE;
/*!40000 ALTER TABLE `musica` DISABLE KEYS */;
INSERT INTO `musica` VALUES (1,'A Rezadeira',200,7,5),(2,'Mulher',200,10,5),(3,'Cobertor',200,8,5),(4,'Quero Ser Feliz Tambem',200,9,4),(5,'Vento, Sol, Coração',200,9,4),(6,'Reggae de Raiz',200,10,4),(7,'Quinze Anos',200,7,3),(8,'Anjo de Vitro',200,8,3),(9,'Vive',200,8,3),(10,'Listen',200,10,2),(11,'S.T.O.P',200,9,2),(12,'Rise',200,7,2),(13,'Agua e Vinho',200,7,1),(14,'Saturno',200,10,1),(15,'O Lado Escuro da Lua',200,9,1);
/*!40000 ALTER TABLE `musica` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-10 16:13:06
