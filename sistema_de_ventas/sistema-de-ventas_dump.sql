-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: sistemadeventas_adonys
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `categoria_adonys`
--

DROP TABLE IF EXISTS `categoria_adonys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_adonys` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_adonys`
--

LOCK TABLES `categoria_adonys` WRITE;
/*!40000 ALTER TABLE `categoria_adonys` DISABLE KEYS */;
INSERT INTO `categoria_adonys` VALUES (1,'Electronicos','Productos electronicos'),(2,'Alimentos','Productos de alimentacion'),(3,'Herramientas','Productos de herramientas');
/*!40000 ALTER TABLE `categoria_adonys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_adonys`
--

DROP TABLE IF EXISTS `cliente_adonys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_adonys` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `RUT` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_adonys`
--

LOCK TABLES `cliente_adonys` WRITE;
/*!40000 ALTER TABLE `cliente_adonys` DISABLE KEYS */;
INSERT INTO `cliente_adonys` VALUES (1,'Adonys Santos','8494595609','La Vega','16'),(2,'Samuel Santos','8494595610','Cutupu','17'),(3,'Matias Santos','8494595611','Rep. Dom','18');
/*!40000 ALTER TABLE `cliente_adonys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_adonys`
--

DROP TABLE IF EXISTS `producto_adonys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_adonys` (
  `idProducto` int(11) NOT NULL,
  `idProveedor` int(11) DEFAULT NULL,
  `idVenta` int(11) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `stock` varchar(30) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idProveedor` (`idProveedor`),
  KEY `idVenta` (`idVenta`),
  CONSTRAINT `idProveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor_adonys` (`idProveedor`),
  CONSTRAINT `idVenta` FOREIGN KEY (`idVenta`) REFERENCES `venta_adonys` (`idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_adonys`
--

LOCK TABLES `producto_adonys` WRITE;
/*!40000 ALTER TABLE `producto_adonys` DISABLE KEYS */;
INSERT INTO `producto_adonys` VALUES (1,2,3,'Computadora','Si',100),(2,3,1,'Jugo','Si',10),(3,1,2,'Pala','No',15);
/*!40000 ALTER TABLE `producto_adonys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor_adonys`
--

DROP TABLE IF EXISTS `proveedor_adonys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor_adonys` (
  `idProveedor` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `paginaWeb` varchar(100) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `RUT` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor_adonys`
--

LOCK TABLES `proveedor_adonys` WRITE;
/*!40000 ALTER TABLE `proveedor_adonys` DISABLE KEYS */;
INSERT INTO `proveedor_adonys` VALUES (1,'Priviciones AS','8093139234','www.prov-as.com','Santiago','14'),(2,'Priviciones SS','8093139233','www.provissions.net','La Vega','15'),(3,'Priviciones MS','8093139232','www.ms-prov.es','Santo Domingo','16');
/*!40000 ALTER TABLE `proveedor_adonys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_adonys`
--

DROP TABLE IF EXISTS `venta_adonys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_adonys` (
  `idVenta` int(11) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `descuento` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `montoTotal` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `idCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente_adonys` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_adonys`
--

LOCK TABLES `venta_adonys` WRITE;
/*!40000 ALTER TABLE `venta_adonys` DISABLE KEYS */;
INSERT INTO `venta_adonys` VALUES (1,2,'2020-04-30',0,10,2,20),(2,3,'2020-04-30',3,15,4,57),(3,1,'2020-04-30',10,100,1,90);
/*!40000 ALTER TABLE `venta_adonys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sistemadeventas_adonys'
--

--
-- Dumping routines for database 'sistemadeventas_adonys'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-30 18:16:21
