CREATE DATABASE  IF NOT EXISTS `vendas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `vendas`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: vendas
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `Uf` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cidade` (`Nome`) /*!80000 INVISIBLE */,
  KEY `idx_nome` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (2,'Jonas 02','Brasilia 02','DF'),(3,'Jonas 03','Brasilia 03','DF'),(5,'Jonas 03','Brasilia 03','DF'),(6,'Jonas 06','Brasilia 06','DF'),(7,'Jonas 07','Brasilia 07','DF'),(8,'Jonas 08','Brasilia 08','DF'),(9,'Jonas 09','Brasilia 09','DF'),(10,'Jonas 10','Brasilia 10','DF'),(11,'Jonas 11','Brasilia 11','DF'),(12,'Jonas 12','Brasilia 12','DF'),(13,'Jonas 13','Brasilia 13','DF'),(14,'Jonas 14','Brasilia 14','DF'),(15,'Jonas 15','Brasilia 15','DF'),(16,'Jonas 16','Brasilia 16','GO'),(17,'Jonas 17','Brasilia 17','DF'),(18,'Jonas 18','Brasilia 18','DF'),(19,'Jonas 19','Brasilia 19','DF'),(20,'Jonas 20','Brasilia 20','DF'),(21,'Jonas 01','BRASILIA','DF');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidosdadosgerais`
--

DROP TABLE IF EXISTS `pedidosdadosgerais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidosdadosgerais` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Data` datetime DEFAULT CURRENT_TIMESTAMP,
  `idCliente` int DEFAULT NULL,
  `ValorTotal` float DEFAULT NULL,
  `VendaFinalizada` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_idx` (`idCliente`),
  KEY `idx_NumeroPedido` (`id`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidosdadosgerais`
--

LOCK TABLES `pedidosdadosgerais` WRITE;
/*!40000 ALTER TABLE `pedidosdadosgerais` DISABLE KEYS */;
INSERT INTO `pedidosdadosgerais` VALUES (8,'2022-09-04 12:38:05',2,429497,NULL),(9,'2022-09-04 13:36:11',2,0,NULL),(10,'2022-09-04 13:44:08',2,429497,NULL),(11,'2022-09-04 13:44:44',2,429497,NULL),(12,'2022-09-04 13:45:38',3,429497,NULL),(13,'2022-09-04 13:46:37',2,429497,NULL),(14,'2022-09-04 13:47:13',2,429497,NULL),(15,'2022-09-04 13:49:11',3,429497,NULL),(16,'2022-09-04 13:56:02',2,420.45,NULL),(17,'2022-09-04 13:56:08',2,429497,NULL),(18,'2022-09-04 13:58:34',2,429497,NULL),(19,'2022-09-04 14:02:01',5,429497,NULL),(20,'2022-09-04 14:10:30',2,429497,NULL),(21,'2022-09-04 14:11:59',2,429497,NULL),(22,'2022-09-04 14:15:58',2,429497,NULL),(23,'2022-09-04 14:23:46',2,429497,NULL),(24,'2022-09-04 14:25:00',5,429497,NULL),(25,'2022-09-04 14:27:58',2,429497,NULL),(26,'2022-09-04 14:31:49',2,429497,NULL),(27,'2022-09-04 14:34:36',2,429497,NULL),(28,'2022-09-04 14:35:44',2,429497,NULL),(29,'2022-09-04 14:37:16',2,429497,NULL),(30,'2022-09-04 14:37:57',3,429497,NULL),(31,'2022-09-04 14:48:07',5,429497,NULL),(32,'2022-09-04 14:49:24',2,429497,NULL),(33,'2022-09-04 14:55:48',3,429497,NULL),(34,'2022-09-04 14:56:43',3,429497,NULL),(35,'2022-09-04 14:58:22',3,11.58,NULL),(36,'2022-09-04 14:59:27',6,11.58,NULL),(37,'2022-09-04 15:01:52',5,11.58,NULL),(39,'2022-09-04 15:06:25',5,11.58,NULL),(40,'2022-09-04 15:07:18',3,11.58,NULL),(41,'2022-09-04 15:08:26',3,11.58,NULL),(42,'2022-09-04 15:10:46',5,11.58,NULL),(43,'2022-09-04 15:12:35',5,11.58,NULL),(44,'2022-09-04 15:19:31',6,0,NULL),(45,'2022-09-04 15:23:42',3,0,NULL),(46,'2022-09-04 15:55:23',5,0,NULL),(47,'2022-09-04 16:01:18',5,0,NULL),(48,'2022-09-04 16:04:27',3,0,NULL),(49,'2022-09-04 16:06:27',5,0,NULL),(50,'2022-09-04 16:06:40',2,0,NULL),(51,'2022-09-04 16:14:56',5,0,NULL),(52,'2022-09-05 14:31:44',5,0,NULL);
/*!40000 ALTER TABLE `pedidosdadosgerais` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pedidosdadosgerais_BEFORE_UPDATE` BEFORE UPDATE ON `pedidosdadosgerais` FOR EACH ROW BEGIN
	call BaixarEstoque(new.id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pedidosprodutos`
--

DROP TABLE IF EXISTS `pedidosprodutos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidosprodutos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `IdPedido` int NOT NULL,
  `IdProduto` int DEFAULT NULL,
  `Quantidade` float DEFAULT '1',
  `ValorUnitario` float DEFAULT NULL,
  `ValorTotal` float DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_idPedido_idx` (`IdPedido`),
  KEY `fk_idProduto_idx` (`IdProduto`),
  CONSTRAINT `fk_idPedido` FOREIGN KEY (`IdPedido`) REFERENCES `pedidosdadosgerais` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_idProduto` FOREIGN KEY (`IdProduto`) REFERENCES `produtos` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidosprodutos`
--

LOCK TABLES `pedidosprodutos` WRITE;
/*!40000 ALTER TABLE `pedidosprodutos` DISABLE KEYS */;
INSERT INTO `pedidosprodutos` VALUES (12,41,1,1,11.58,11.58),(13,41,2,1,10.5,10.5),(14,41,3,5,3.75,18.75),(15,41,1,5,11.58,57.9),(16,41,1,7,11.58,81.06),(17,42,1,1,11.58,11.58),(18,42,2,1,10.5,10.5),(19,43,1,1,12.52,12.52),(20,43,1,1,11.58,11.58),(21,43,3,1,3.75,3.75),(22,43,5,1,15,15),(23,44,1,1,11.58,11.58),(24,44,2,1,10.5,10.5),(25,44,3,1,3.75,3.75),(26,44,4,1,5,5),(27,44,5,1,12,12),(28,45,1,1,11.58,11.58),(29,46,1,1,11.58,11.58),(30,46,2,1,10.5,10.5),(31,46,3,1,3.75,3.75),(32,47,1,1,11.58,11.58),(33,47,1,1,11.58,11.58),(34,47,2,1,10.5,10.5),(39,48,1,1,11.58,11.58),(40,49,1,1,11.58,11.58),(41,50,1,1,11.58,11.58),(42,50,2,1,10.5,10.5),(43,50,3,1,3.75,3.75),(44,51,1,1,11.58,11.58),(45,51,3,1,3.75,3.75),(46,51,4,1,5,5),(47,51,5,1,12,12),(48,51,6,1,13.5,13.5),(49,52,1,1,11.58,11.58),(50,52,2,1,10.5,10.5),(51,52,3,1,3.75,3.75),(52,52,4,1,5,5),(53,52,5,1,12,12);
/*!40000 ALTER TABLE `pedidosprodutos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(50) DEFAULT NULL,
  `ValorUnitario` float DEFAULT NULL,
  `Estoque` float DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Produto 01',11.58,52),(2,'Produto 02',10.5,53),(3,'Produto 03',3.75,12),(4,'Produto 04',5,52),(5,'Produto 05',12,35),(6,'Produto 06',13.5,62),(7,'Produto 07',5.75,48),(8,'Produto 08',8,95),(9,'Produto 09',10,58),(10,'Produto 10',0.5,545),(11,'Produto 11',5,45),(12,'Produto 12',1,3),(13,'Produto 13',5,5),(14,'Produto 14',3,58),(15,'Produto 15',4.73,50),(16,'Produto 16',3.37,152),(17,'Produto 17',2,1),(18,'Produto 18',3.52,30),(19,'Produto 19',4.53,52),(20,'Produto 20',5,155);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'vendas'
--

--
-- Dumping routines for database 'vendas'
--
/*!50003 DROP PROCEDURE IF EXISTS `BaixarEstoque` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BaixarEstoque`(idPedido integer)
BEGIN
	declare idProduto Integer;
    declare eQtdVendida Float;
	 declare cProdutos cursor for 
                                SELECT pp.IdProduto, pp.Quantidade
                                FROM pedidosProdutos pp
                                where pp.idPedido = idPedido;
    open cProdutos;										
    LoopProduto: loop
	fetch cProdutos into idProduto, eQtdVendida;
		update produtos set estoque = estoque - eQtdVendida
        where id = idProduto;
	end loop LoopProduto;
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

-- Dump completed on 2022-09-05 14:37:49
