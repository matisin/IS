-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: proyecto_is
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.10.1

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
-- Table structure for table `CALIFICACION`
--

DROP TABLE IF EXISTS `CALIFICACION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CALIFICACION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Turista` int(11) NOT NULL,
  `ID_POI` int(11) NOT NULL,
  `Categoria` varchar(30) DEFAULT NULL,
  `Nota` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`,`ID_Turista`,`ID_POI`),
  KEY `ID_Turista` (`ID_Turista`),
  KEY `ID_POI` (`ID_POI`),
  CONSTRAINT `CALIFICACION_ibfk_1` FOREIGN KEY (`ID_Turista`) REFERENCES `TURISTA` (`ID`),
  CONSTRAINT `CALIFICACION_ibfk_2` FOREIGN KEY (`ID_POI`) REFERENCES `PUNTO_DE_INTERES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CALIFICACION`
--

LOCK TABLES `CALIFICACION` WRITE;
/*!40000 ALTER TABLE `CALIFICACION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CALIFICACION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORIA`
--

DROP TABLE IF EXISTS `CATEGORIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CATEGORIA` (
  `Nombre_Categoria` varchar(20) NOT NULL,
  PRIMARY KEY (`Nombre_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIA`
--

LOCK TABLES `CATEGORIA` WRITE;
/*!40000 ALTER TABLE `CATEGORIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `CATEGORIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORIA_SUCURSAL`
--

DROP TABLE IF EXISTS `CATEGORIA_SUCURSAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CATEGORIA_SUCURSAL` (
  `ID_POI` int(11) NOT NULL,
  `Nombre_Categoria` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_POI`,`Nombre_Categoria`),
  KEY `Nombre_Categoria` (`Nombre_Categoria`),
  CONSTRAINT `CATEGORIA_SUCURSAL_ibfk_1` FOREIGN KEY (`ID_POI`) REFERENCES `SUCURSAL` (`ID_POI`),
  CONSTRAINT `CATEGORIA_SUCURSAL_ibfk_2` FOREIGN KEY (`Nombre_Categoria`) REFERENCES `CATEGORIA` (`Nombre_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIA_SUCURSAL`
--

LOCK TABLES `CATEGORIA_SUCURSAL` WRITE;
/*!40000 ALTER TABLE `CATEGORIA_SUCURSAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `CATEGORIA_SUCURSAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPRESA`
--

DROP TABLE IF EXISTS `EMPRESA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPRESA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) DEFAULT NULL,
  `RUT_Empresa` varchar(20) DEFAULT NULL,
  `ID_Empresario` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Empresario` (`ID_Empresario`),
  CONSTRAINT `EMPRESA_ibfk_1` FOREIGN KEY (`ID_Empresario`) REFERENCES `EMPRESARIO` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPRESA`
--

LOCK TABLES `EMPRESA` WRITE;
/*!40000 ALTER TABLE `EMPRESA` DISABLE KEYS */;
/*!40000 ALTER TABLE `EMPRESA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPRESARIO`
--

DROP TABLE IF EXISTS `EMPRESARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPRESARIO` (
  `ID` int(11) NOT NULL,
  `RUT` varchar(12) DEFAULT NULL,
  `Direcion` varchar(20) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `EMPRESARIO_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `USUARIO` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPRESARIO`
--

LOCK TABLES `EMPRESARIO` WRITE;
/*!40000 ALTER TABLE `EMPRESARIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `EMPRESARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INDICACION`
--

DROP TABLE IF EXISTS `INDICACION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INDICACION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Texto` varchar(300) DEFAULT NULL,
  `ID_POI` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_POI` (`ID_POI`),
  CONSTRAINT `INDICACION_ibfk_1` FOREIGN KEY (`ID_POI`) REFERENCES `PUNTO_DE_INTERES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INDICACION`
--

LOCK TABLES `INDICACION` WRITE;
/*!40000 ALTER TABLE `INDICACION` DISABLE KEYS */;
/*!40000 ALTER TABLE `INDICACION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ITINERARIO`
--

DROP TABLE IF EXISTS `ITINERARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ITINERARIO` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Duracion` varchar(10) DEFAULT NULL,
  `ID_Usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `ITINERARIO_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `USUARIO` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ITINERARIO`
--

LOCK TABLES `ITINERARIO` WRITE;
/*!40000 ALTER TABLE `ITINERARIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ITINERARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LUGAR_LIBRE_ACCESO`
--

DROP TABLE IF EXISTS `LUGAR_LIBRE_ACCESO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LUGAR_LIBRE_ACCESO` (
  `ID_POI` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_POI`),
  CONSTRAINT `LUGAR_LIBRE_ACCESO_ibfk_1` FOREIGN KEY (`ID_POI`) REFERENCES `PUNTO_DE_INTERES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LUGAR_LIBRE_ACCESO`
--

LOCK TABLES `LUGAR_LIBRE_ACCESO` WRITE;
/*!40000 ALTER TABLE `LUGAR_LIBRE_ACCESO` DISABLE KEYS */;
/*!40000 ALTER TABLE `LUGAR_LIBRE_ACCESO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDEN`
--

DROP TABLE IF EXISTS `ORDEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDEN` (
  `ID_Itinerario` int(11) NOT NULL,
  `ID_POI` int(11) NOT NULL,
  `Posicion` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Itinerario`,`ID_POI`),
  KEY `ID_POI` (`ID_POI`),
  CONSTRAINT `ORDEN_ibfk_1` FOREIGN KEY (`ID_Itinerario`) REFERENCES `ITINERARIO` (`ID`),
  CONSTRAINT `ORDEN_ibfk_2` FOREIGN KEY (`ID_POI`) REFERENCES `PUNTO_DE_INTERES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDEN`
--

LOCK TABLES `ORDEN` WRITE;
/*!40000 ALTER TABLE `ORDEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PUNTO_DE_INTERES`
--

DROP TABLE IF EXISTS `PUNTO_DE_INTERES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PUNTO_DE_INTERES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Direccion` varchar(30) DEFAULT NULL,
  `Longitud` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUNTO_DE_INTERES`
--

LOCK TABLES `PUNTO_DE_INTERES` WRITE;
/*!40000 ALTER TABLE `PUNTO_DE_INTERES` DISABLE KEYS */;
/*!40000 ALTER TABLE `PUNTO_DE_INTERES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICIO`
--

DROP TABLE IF EXISTS `SERVICIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERVICIO` (
  `Nombre_Servicio` varchar(20) NOT NULL,
  `ID_POI` int(11) DEFAULT NULL,
  PRIMARY KEY (`Nombre_Servicio`),
  KEY `ID_POI` (`ID_POI`),
  CONSTRAINT `SERVICIO_ibfk_1` FOREIGN KEY (`ID_POI`) REFERENCES `SUCURSAL` (`ID_POI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICIO`
--

LOCK TABLES `SERVICIO` WRITE;
/*!40000 ALTER TABLE `SERVICIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `SERVICIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUCURSAL`
--

DROP TABLE IF EXISTS `SUCURSAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUCURSAL` (
  `ID_POI` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Sello_De_Turismo` tinyint(4) DEFAULT NULL,
  `ID_Empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_POI`),
  KEY `ID_Empresa` (`ID_Empresa`),
  CONSTRAINT `SUCURSAL_ibfk_1` FOREIGN KEY (`ID_Empresa`) REFERENCES `EMPRESA` (`ID`),
  CONSTRAINT `SUCURSAL_ibfk_2` FOREIGN KEY (`ID_POI`) REFERENCES `PUNTO_DE_INTERES` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUCURSAL`
--

LOCK TABLES `SUCURSAL` WRITE;
/*!40000 ALTER TABLE `SUCURSAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `SUCURSAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TURISTA`
--

DROP TABLE IF EXISTS `TURISTA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TURISTA` (
  `ID` int(11) NOT NULL,
  `Edad` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `TURISTA_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `USUARIO` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TURISTA`
--

LOCK TABLES `TURISTA` WRITE;
/*!40000 ALTER TABLE `TURISTA` DISABLE KEYS */;
/*!40000 ALTER TABLE `TURISTA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USUARIO` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO`
--

LOCK TABLES `USUARIO` WRITE;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-13 21:31:47
