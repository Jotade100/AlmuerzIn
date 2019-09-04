-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: almuerzin
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `especificacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comedor`
--

DROP TABLE IF EXISTS `comedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comedor` (
  `idComedor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(75) NOT NULL,
  `promedio` decimal(10,0) DEFAULT NULL,
  `idDueño` int(11) NOT NULL,
  `trayectoria` varchar(140) NOT NULL,
  PRIMARY KEY (`idComedor`),
  KEY `idUsuario_idx` (`idDueño`),
  CONSTRAINT `idUsuarioComedor` FOREIGN KEY (`idDueño`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detallepedido`
--

DROP TABLE IF EXISTS `detallepedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallepedido` (
  `idDetallePedido` int(11) NOT NULL,
  `idMenuItem` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idDetallePedido`),
  KEY `idMenuItemPedido_idx` (`idMenuItem`),
  CONSTRAINT `idMenuItemPedido` FOREIGN KEY (`idMenuItem`) REFERENCES `menuitem` (`idMenuItem`) ON UPDATE CASCADE,
  CONSTRAINT `idPedido` FOREIGN KEY (`idDetallePedido`) REFERENCES `pedido` (`idPedido`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `idMenu` int(11) NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `fechaFin` datetime DEFAULT NULL,
  `idComedor` int(11) NOT NULL,
  PRIMARY KEY (`idMenu`),
  KEY `idComedorMenu_idx` (`idComedor`),
  CONSTRAINT `idComedorMenu` FOREIGN KEY (`idComedor`) REFERENCES `comedor` (`idComedor`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menucategoria`
--

DROP TABLE IF EXISTS `menucategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menucategoria` (
  `idMenu` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  PRIMARY KEY (`idMenu`,`idCategoria`),
  KEY `idMenuCat_idx` (`idCategoria`),
  CONSTRAINT `idMenuCat` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON UPDATE CASCADE,
  CONSTRAINT `idMenuCatM` FOREIGN KEY (`idMenu`) REFERENCES `menuitem` (`idMenuItem`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menuitem`
--

DROP TABLE IF EXISTS `menuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menuitem` (
  `idMenuItem` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `idMenu` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMenuItem`),
  KEY `idMenuItem_idx` (`idMenu`),
  CONSTRAINT `idMenuItem` FOREIGN KEY (`idMenu`) REFERENCES `menu` (`idMenu`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificaciones` (
  `idNotificaciones` int(11) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `contenido` varchar(140) DEFAULT NULL,
  `leido` bit(1) DEFAULT b'0',
  PRIMARY KEY (`idNotificaciones`),
  KEY `idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `ubicacionEntrega` varchar(100) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `iDPedidoUsuario_idx` (`idUsuario`),
  CONSTRAINT `iDPedidoUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reviewpedidos`
--

DROP TABLE IF EXISTS `reviewpedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewpedidos` (
  `idPedido` int(11) NOT NULL,
  `calificacion` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idPedido`),
  CONSTRAINT `idPedidoReview` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'almuerzin'
--

--
-- Dumping routines for database 'almuerzin'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-16 13:59:28
