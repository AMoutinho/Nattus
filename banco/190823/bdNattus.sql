CREATE DATABASE  IF NOT EXISTS `radix` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `radix`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: radix
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `tbladm`
--

DROP TABLE IF EXISTS `tbladm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbladm` (
  `idADM` int(11) NOT NULL AUTO_INCREMENT,
  `userAdm` varchar(10) DEFAULT NULL,
  `senhaAdm` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idADM`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbladm`
--

LOCK TABLES `tbladm` WRITE;
/*!40000 ALTER TABLE `tbladm` DISABLE KEYS */;
INSERT INTO `tbladm` VALUES (1,'root','123');
/*!40000 ALTER TABLE `tbladm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcliente`
--

DROP TABLE IF EXISTS `tblcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `senha` varchar(15) DEFAULT NULL,
  `statusConta` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcliente`
--

LOCK TABLES `tblcliente` WRITE;
/*!40000 ALTER TABLE `tblcliente` DISABLE KEYS */;
INSERT INTO `tblcliente` VALUES (1,'Antônio Souza','297.460.304-18','antonio_dare@yahoo.com','1234','\0'),(2,'Estevao','41867016820','estevao@gmail.com','1234','');
/*!40000 ALTER TABLE `tblcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblconta`
--

DROP TABLE IF EXISTS `tblconta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblconta` (
  `idConta` int(11) NOT NULL AUTO_INCREMENT,
  `valorConta` double DEFAULT NULL,
  `idVendedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConta`),
  KEY `idVendedor` (`idVendedor`),
  CONSTRAINT `tblconta_ibfk_1` FOREIGN KEY (`idVendedor`) REFERENCES `tblvendedor` (`idVendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblconta`
--

LOCK TABLES `tblconta` WRITE;
/*!40000 ALTER TABLE `tblconta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblconta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblconversa`
--

DROP TABLE IF EXISTS `tblconversa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblconversa` (
  `idConversa` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) DEFAULT NULL,
  `idVendedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConversa`),
  KEY `idCliente` (`idCliente`),
  KEY `idVendedor` (`idVendedor`),
  CONSTRAINT `tblconversa_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `tblcliente` (`idCliente`),
  CONSTRAINT `tblconversa_ibfk_2` FOREIGN KEY (`idVendedor`) REFERENCES `tblvendedor` (`idVendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblconversa`
--

LOCK TABLES `tblconversa` WRITE;
/*!40000 ALTER TABLE `tblconversa` DISABLE KEYS */;
INSERT INTO `tblconversa` VALUES (1,1,1),(2,1,1),(3,1,1);
/*!40000 ALTER TABLE `tblconversa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcupom`
--

DROP TABLE IF EXISTS `tblcupom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcupom` (
  `idCupom` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCupom` varchar(20) DEFAULT NULL,
  `detalhe` varchar(100) DEFAULT NULL,
  `num` double DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCupom`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `tblcupom_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `tblcliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcupom`
--

LOCK TABLES `tblcupom` WRITE;
/*!40000 ALTER TABLE `tblcupom` DISABLE KEYS */;
INSERT INTO `tblcupom` VALUES (1,'BEMVINDO10','Cupom de R$ 10,00 reais para novos usuários',10,NULL),(2,'BEMVINDO10','Cupom de R$ 10,00 para todos os novos usuários de nosso aplicativo, aproveite!',10,1),(3,'BEMVINDO10','Cupom de R$ 10,00 para todos os novos usuários de nosso aplicativo, aproveite!',10,2),(4,'FALE5','Cupom de R$ 5,00 para todos que deram suas sugestões para nosso app, aproveite!',5,2);
/*!40000 ALTER TABLE `tblcupom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldespesas`
--

DROP TABLE IF EXISTS `tbldespesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldespesas` (
  `idDespesas` int(11) NOT NULL AUTO_INCREMENT,
  `dia` date DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `valor` decimal(10,0) DEFAULT NULL,
  `conta` varchar(20) DEFAULT NULL,
  `situacao` varchar(30) DEFAULT NULL,
  `idADM` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDespesas`),
  KEY `idADM` (`idADM`),
  CONSTRAINT `tbldespesas_ibfk_1` FOREIGN KEY (`idADM`) REFERENCES `tbladm` (`idADM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldespesas`
--

LOCK TABLES `tbldespesas` WRITE;
/*!40000 ALTER TABLE `tbldespesas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldespesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblendereco`
--

DROP TABLE IF EXISTS `tblendereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblendereco` (
  `idEndereco` int(11) NOT NULL AUTO_INCREMENT,
  `endereco` varchar(100) DEFAULT NULL,
  `apelidoEndereco` varchar(100) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `enderecoPrincipal` bit(1) DEFAULT NULL,
  `statusEndereco` bit(1) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEndereco`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `tblendereco_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `tblcliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblendereco`
--

LOCK TABLES `tblendereco` WRITE;
/*!40000 ALTER TABLE `tblendereco` DISABLE KEYS */;
INSERT INTO `tblendereco` VALUES (1,'Rua Luiz de Camões','EstevaoM','54','333',NULL,'',2);
/*!40000 ALTER TABLE `tblendereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblentrega`
--

DROP TABLE IF EXISTS `tblentrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblentrega` (
  `idEntrega` int(11) NOT NULL AUTO_INCREMENT,
  `horario` datetime DEFAULT NULL,
  `cupom` bit(1) DEFAULT NULL,
  `frete` decimal(10,0) DEFAULT NULL,
  `statusEntrega` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idItem` int(11) DEFAULT NULL,
  `idVendedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEntrega`),
  KEY `idCliente` (`idCliente`),
  KEY `idItem` (`idItem`),
  KEY `idVendedor` (`idVendedor`),
  CONSTRAINT `tblentrega_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `tblcliente` (`idCliente`),
  CONSTRAINT `tblentrega_ibfk_2` FOREIGN KEY (`idItem`) REFERENCES `tblitem` (`idItem`),
  CONSTRAINT `tblentrega_ibfk_3` FOREIGN KEY (`idVendedor`) REFERENCES `tblvendedor` (`idVendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblentrega`
--

LOCK TABLES `tblentrega` WRITE;
/*!40000 ALTER TABLE `tblentrega` DISABLE KEYS */;
INSERT INTO `tblentrega` VALUES (1,NULL,NULL,NULL,0,2,3,1);
/*!40000 ALTER TABLE `tblentrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblfeedback`
--

DROP TABLE IF EXISTS `tblfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblfeedback` (
  `idFeedback` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(300) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFeedback`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `tblfeedback_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `tblcliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblfeedback`
--

LOCK TABLES `tblfeedback` WRITE;
/*!40000 ALTER TABLE `tblfeedback` DISABLE KEYS */;
INSERT INTO `tblfeedback` VALUES (1,'Entrega super rápida, produtos frescos e com uma qualidade sem igual.',2);
/*!40000 ALTER TABLE `tblfeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblitem`
--

DROP TABLE IF EXISTS `tblitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblitem` (
  `idItem` int(11) NOT NULL AUTO_INCREMENT,
  `qtde` int(11) DEFAULT NULL,
  `idProduto` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `statusItem` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idItem`),
  KEY `idProduto` (`idProduto`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `tblitem_ibfk_1` FOREIGN KEY (`idProduto`) REFERENCES `tblproduto` (`idProduto`),
  CONSTRAINT `tblitem_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `tblcliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblitem`
--

LOCK TABLES `tblitem` WRITE;
/*!40000 ALTER TABLE `tblitem` DISABLE KEYS */;
INSERT INTO `tblitem` VALUES (1,1,5,1,'\0'),(2,1,7,2,'\0'),(3,2,7,2,'\0'),(4,1,6,2,'');
/*!40000 ALTER TABLE `tblitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllembrete`
--

DROP TABLE IF EXISTS `tbllembrete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllembrete` (
  `idLembrete` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) DEFAULT NULL,
  `criador` varchar(50) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `requisitados` varchar(50) DEFAULT NULL,
  `statusLembrete` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idLembrete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllembrete`
--

LOCK TABLES `tbllembrete` WRITE;
/*!40000 ALTER TABLE `tbllembrete` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbllembrete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmsgcliente`
--

DROP TABLE IF EXISTS `tblmsgcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmsgcliente` (
  `idMsgCliente` int(11) NOT NULL AUTO_INCREMENT,
  `msg` varchar(150) DEFAULT NULL,
  `msgData` datetime DEFAULT NULL,
  `idConversa` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMsgCliente`),
  KEY `idConversa` (`idConversa`),
  CONSTRAINT `tblmsgcliente_ibfk_1` FOREIGN KEY (`idConversa`) REFERENCES `tblconversa` (`idConversa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmsgcliente`
--

LOCK TABLES `tblmsgcliente` WRITE;
/*!40000 ALTER TABLE `tblmsgcliente` DISABLE KEYS */;
INSERT INTO `tblmsgcliente` VALUES (1,'mt foda','2023-07-06 22:54:16',2);
/*!40000 ALTER TABLE `tblmsgcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmsgvendedor`
--

DROP TABLE IF EXISTS `tblmsgvendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmsgvendedor` (
  `idMsgVendedor` int(11) NOT NULL AUTO_INCREMENT,
  `msg` varchar(150) DEFAULT NULL,
  `msgData` datetime DEFAULT NULL,
  `idConversa` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMsgVendedor`),
  KEY `idConversa` (`idConversa`),
  CONSTRAINT `tblmsgvendedor_ibfk_1` FOREIGN KEY (`idConversa`) REFERENCES `tblconversa` (`idConversa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmsgvendedor`
--

LOCK TABLES `tblmsgvendedor` WRITE;
/*!40000 ALTER TABLE `tblmsgvendedor` DISABLE KEYS */;
INSERT INTO `tblmsgvendedor` VALUES (1,'Opa eu sou vendedor','2023-07-06 22:54:16',1),(2,'a','2023-07-06 22:54:44',1);
/*!40000 ALTER TABLE `tblmsgvendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpedido`
--

DROP TABLE IF EXISTS `tblpedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpedido` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `horario` datetime DEFAULT NULL,
  `cupom` bit(1) DEFAULT NULL,
  `frete` decimal(10,0) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idItem` int(11) DEFAULT NULL,
  `idVendedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `idCliente` (`idCliente`),
  KEY `idItem` (`idItem`),
  KEY `idVendedor` (`idVendedor`),
  CONSTRAINT `tblpedido_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `tblcliente` (`idCliente`),
  CONSTRAINT `tblpedido_ibfk_2` FOREIGN KEY (`idItem`) REFERENCES `tblitem` (`idItem`),
  CONSTRAINT `tblpedido_ibfk_3` FOREIGN KEY (`idVendedor`) REFERENCES `tblvendedor` (`idVendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpedido`
--

LOCK TABLES `tblpedido` WRITE;
/*!40000 ALTER TABLE `tblpedido` DISABLE KEYS */;
INSERT INTO `tblpedido` VALUES (1,NULL,NULL,NULL,2,2,1),(2,NULL,NULL,NULL,2,2,1),(3,NULL,NULL,NULL,2,3,1),(4,NULL,NULL,NULL,2,4,1);
/*!40000 ALTER TABLE `tblpedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproduto`
--

DROP TABLE IF EXISTS `tblproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproduto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nomeProd` varchar(50) DEFAULT NULL,
  `preco` double DEFAULT NULL,
  `foto` varchar(500) DEFAULT NULL,
  `detalhe` varchar(250) DEFAULT NULL,
  `idVendedor` int(11) DEFAULT NULL,
  `statusProduto` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `idVendedor` (`idVendedor`),
  CONSTRAINT `tblproduto_ibfk_1` FOREIGN KEY (`idVendedor`) REFERENCES `tblvendedor` (`idVendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproduto`
--

LOCK TABLES `tblproduto` WRITE;
/*!40000 ALTER TABLE `tblproduto` DISABLE KEYS */;
INSERT INTO `tblproduto` VALUES (1,'Pimentão',15.99,'4bda7af87610498bdece3b41fbc6612d.png','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ',1,''),(2,'Pepino',9,'20285168ce125cf9d86c5d86eaafd181.png','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ',1,''),(3,'Tomate',5,'5946899e32dd2003aacb7db220fd8139.png','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ',1,''),(4,'Gengibre',3.99,'5804ecc2fa85f418071bd1a5edbdc43f.png','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ',1,''),(5,'Repolho',8,'d881fc561116697b682fc00c051e105a.png','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ',1,''),(6,'Couve-Flor',3.9,'d1aa69398810b2a463fd0ecb9ea71365.png','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ',1,''),(7,'Cenoura',12,'dabd7de234ae65a44208ecff2a5defb7.png','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ',1,''),(8,'Rúcula',5.99,'7e5300afda3059fb11be565c343aae33.png','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ',1,''),(9,'Invis',100,'d7c58f766bb0bcfeb9882126fc2d6472.png','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ',1,''),(10,'Invis',100,'d7c58f766bb0bcfeb9882126fc2d6472.png','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ',1,'');
/*!40000 ALTER TABLE `tblproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpunicao`
--

DROP TABLE IF EXISTS `tblpunicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpunicao` (
  `idPunicoes` int(11) NOT NULL AUTO_INCREMENT,
  `idVendedor` int(11) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `motivo` varchar(300) DEFAULT NULL,
  `assunto` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idPunicoes`),
  KEY `idVendedor` (`idVendedor`),
  CONSTRAINT `tblpunicao_ibfk_1` FOREIGN KEY (`idVendedor`) REFERENCES `tblvendedor` (`idVendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpunicao`
--

LOCK TABLES `tblpunicao` WRITE;
/*!40000 ALTER TABLE `tblpunicao` DISABLE KEYS */;
INSERT INTO `tblpunicao` VALUES (1,1,'a','a','a');
/*!40000 ALTER TABLE `tblpunicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblreclamacao`
--

DROP TABLE IF EXISTS `tblreclamacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblreclamacao` (
  `idReclamacao` int(11) NOT NULL AUTO_INCREMENT,
  `motivo` varchar(300) DEFAULT NULL,
  `idVendedor` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReclamacao`),
  KEY `idVendedor` (`idVendedor`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `tblreclamacao_ibfk_1` FOREIGN KEY (`idVendedor`) REFERENCES `tblvendedor` (`idVendedor`),
  CONSTRAINT `tblreclamacao_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `tblcliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblreclamacao`
--

LOCK TABLES `tblreclamacao` WRITE;
/*!40000 ALTER TABLE `tblreclamacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblreclamacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblvendedor`
--

DROP TABLE IF EXISTS `tblvendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblvendedor` (
  `idVendedor` int(11) NOT NULL AUTO_INCREMENT,
  `nomeVend` varchar(50) DEFAULT NULL,
  `cpfCnpj` varchar(20) DEFAULT NULL,
  `emailVend` varchar(50) DEFAULT NULL,
  `senhaVend` varchar(15) DEFAULT NULL,
  `imagemVend` varchar(500) DEFAULT NULL,
  `enderecoVend` varchar(100) DEFAULT NULL,
  `statusConta` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idVendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblvendedor`
--

LOCK TABLES `tblvendedor` WRITE;
/*!40000 ALTER TABLE `tblvendedor` DISABLE KEYS */;
INSERT INTO `tblvendedor` VALUES (1,'Vitor da Mata','96.235.591/0001-55','vitor71@hotmail.com','VUFcfCL','',NULL,'');
/*!40000 ALTER TABLE `tblvendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19  0:21:21
