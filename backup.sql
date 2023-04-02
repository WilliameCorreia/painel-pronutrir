-- MySQL dump 10.13  Distrib 5.7.41, for Linux (x86_64)
--
-- Host: localhost    Database: painel
-- ------------------------------------------------------
-- Server version	5.7.41

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
-- Table structure for table `agendamentos`
--

DROP TABLE IF EXISTS `agendamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agendamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `unidade_id` int(11) DEFAULT NULL,
  `servico_id` int(11) DEFAULT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `data_confirmacao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2D12EA4ADE734E51` (`cliente_id`),
  KEY `IDX_2D12EA4AEDF4B99B` (`unidade_id`),
  KEY `IDX_2D12EA4A82E14982` (`servico_id`),
  CONSTRAINT `FK_2D12EA4A82E14982` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`),
  CONSTRAINT `FK_2D12EA4ADE734E51` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `FK_2D12EA4AEDF4B99B` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamentos`
--

LOCK TABLES `agendamentos` WRITE;
/*!40000 ALTER TABLE `agendamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `agendamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atendimentos`
--

DROP TABLE IF EXISTS `atendimentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atendimentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `unidade_id` int(11) DEFAULT NULL,
  `servico_id` int(11) DEFAULT NULL,
  `prioridade_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `usuario_tri_id` int(11) DEFAULT NULL,
  `atendimento_id` int(11) DEFAULT NULL,
  `num_local` smallint(6) DEFAULT NULL,
  `dt_age` datetime DEFAULT NULL,
  `dt_cheg` datetime NOT NULL,
  `dt_cha` datetime DEFAULT NULL,
  `dt_ini` datetime DEFAULT NULL,
  `dt_fim` datetime DEFAULT NULL,
  `tempo_espera` int(11) DEFAULT NULL,
  `tempo_permanencia` int(11) DEFAULT NULL,
  `tempo_atendimento` int(11) DEFAULT NULL,
  `tempo_deslocamento` int(11) DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resolucao` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacao` longtext COLLATE utf8mb4_unicode_ci,
  `senha_sigla` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha_numero` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_29E906E7DE734E51` (`cliente_id`),
  KEY `IDX_29E906E7EDF4B99B` (`unidade_id`),
  KEY `IDX_29E906E782E14982` (`servico_id`),
  KEY `IDX_29E906E7226EFC79` (`prioridade_id`),
  KEY `IDX_29E906E7DB38439E` (`usuario_id`),
  KEY `IDX_29E906E7875F1A79` (`usuario_tri_id`),
  KEY `IDX_29E906E776323123` (`atendimento_id`),
  CONSTRAINT `FK_29E906E7226EFC79` FOREIGN KEY (`prioridade_id`) REFERENCES `prioridades` (`id`),
  CONSTRAINT `FK_29E906E776323123` FOREIGN KEY (`atendimento_id`) REFERENCES `atendimentos` (`id`),
  CONSTRAINT `FK_29E906E782E14982` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`),
  CONSTRAINT `FK_29E906E7875F1A79` FOREIGN KEY (`usuario_tri_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FK_29E906E7DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FK_29E906E7DE734E51` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `FK_29E906E7EDF4B99B` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atendimentos`
--

LOCK TABLES `atendimentos` WRITE;
/*!40000 ALTER TABLE `atendimentos` DISABLE KEYS */;
INSERT INTO `atendimentos` VALUES (70,8,3,2,1,1,1,NULL,1,NULL,'2023-03-23 11:38:51','2023-03-23 11:42:51',NULL,'2023-03-23 11:43:04',240,253,0,0,'nao_compareceu',NULL,NULL,'C',10),(71,10,3,2,1,1,1,NULL,1,NULL,'2023-03-23 11:39:15','2023-03-23 11:43:05',NULL,'2023-03-23 11:43:13',230,238,0,0,'nao_compareceu',NULL,NULL,'C',11),(72,9,3,2,1,1,1,NULL,1,NULL,'2023-03-23 11:40:34','2023-03-23 11:43:15',NULL,'2023-03-23 11:43:24',161,170,0,0,'nao_compareceu',NULL,NULL,'C',12),(73,11,3,2,1,1,1,NULL,1,NULL,'2023-03-23 11:40:51','2023-03-23 11:43:26',NULL,'2023-03-23 11:43:37',155,166,0,0,'nao_compareceu',NULL,NULL,'C',13),(74,12,3,2,1,1,1,NULL,1,NULL,'2023-03-23 11:41:06','2023-03-23 11:43:38',NULL,'2023-03-23 11:43:48',152,162,0,0,'nao_compareceu',NULL,NULL,'C',14),(75,NULL,3,2,1,1,1,NULL,1,NULL,'2023-03-23 11:41:33','2023-03-23 11:43:49',NULL,'2023-03-23 11:47:27',136,354,0,0,'nao_compareceu',NULL,NULL,'C',15),(76,8,3,2,1,1,1,NULL,1,NULL,'2023-03-23 11:47:13','2023-03-23 11:47:29',NULL,'2023-03-23 14:28:05',16,9652,0,0,'nao_compareceu',NULL,NULL,'C',16),(77,13,3,2,1,1,1,NULL,1,NULL,'2023-03-23 13:29:21','2023-03-23 14:28:07',NULL,'2023-03-23 18:22:16',3526,17575,0,0,'nao_compareceu',NULL,NULL,'C',17),(78,13,3,2,1,1,1,NULL,1,NULL,'2023-03-23 17:57:17','2023-03-23 18:22:18',NULL,'2023-03-23 18:22:22',1501,1505,0,0,'nao_compareceu',NULL,NULL,'C',18),(79,14,3,2,1,1,1,NULL,1,NULL,'2023-03-23 18:21:45','2023-03-23 18:22:24',NULL,'2023-03-23 18:23:24',39,99,0,0,'nao_compareceu',NULL,NULL,'C',19),(80,15,3,2,1,1,1,NULL,1,NULL,'2023-03-23 18:23:09','2023-03-23 18:23:33',NULL,'2023-03-23 18:25:15',24,126,0,0,'nao_compareceu',NULL,NULL,'C',20),(81,16,3,2,1,1,1,NULL,1,NULL,'2023-03-23 18:26:06','2023-03-23 18:26:18',NULL,'2023-03-23 18:27:15',12,69,0,0,'nao_compareceu',NULL,NULL,'C',21),(82,17,3,2,1,1,1,NULL,1,NULL,'2023-03-23 18:27:07','2023-03-23 18:27:19',NULL,'2023-03-23 18:27:30',12,23,0,0,'nao_compareceu',NULL,NULL,'C',22),(83,18,3,2,1,1,1,NULL,1,NULL,'2023-03-24 08:40:10','2023-03-24 08:46:13',NULL,'2023-03-24 08:46:25',363,375,0,0,'nao_compareceu',NULL,NULL,'C',23),(84,19,3,2,1,1,1,NULL,1,NULL,'2023-03-24 08:47:03','2023-03-24 08:47:19',NULL,'2023-03-24 08:47:32',16,29,0,0,'nao_compareceu',NULL,NULL,'C',24),(85,20,3,2,1,1,1,NULL,1,NULL,'2023-03-24 08:48:13','2023-03-24 08:48:19',NULL,'2023-03-24 08:49:24',6,71,0,0,'nao_compareceu',NULL,NULL,'C',25),(86,NULL,3,2,1,1,1,NULL,1,NULL,'2023-03-24 08:49:07','2023-03-24 08:51:42',NULL,'2023-03-24 10:37:00',155,6473,0,0,'nao_compareceu',NULL,NULL,'C',26),(87,8,3,2,1,1,1,NULL,1,NULL,'2023-03-24 10:36:46','2023-03-24 10:37:02',NULL,'2023-03-24 10:57:00',16,1214,0,0,'nao_compareceu',NULL,NULL,'C',27),(88,9,3,2,1,1,1,NULL,1,NULL,'2023-03-24 10:56:47','2023-03-24 10:57:02',NULL,'2023-03-28 15:47:13',15,363026,0,0,'nao_compareceu',NULL,NULL,'C',28),(89,21,3,2,1,1,1,NULL,1,NULL,'2023-03-28 15:44:23','2023-03-28 15:47:15','2023-03-28 15:50:14','2023-03-28 15:50:51',172,388,37,179,'encerrado','resolvido',NULL,'C',29),(90,22,3,2,1,1,1,NULL,1,NULL,'2023-03-28 15:48:25','2023-03-28 15:50:53','2023-03-28 15:51:20','2023-03-28 15:51:28',148,183,8,27,'encerrado',NULL,NULL,'C',30),(91,23,3,2,1,1,1,NULL,1,NULL,'2023-03-28 15:49:15','2023-03-28 15:51:30','2023-03-28 15:52:11','2023-03-28 15:52:19',135,184,8,41,'encerrado',NULL,NULL,'C',31),(92,24,3,2,1,1,1,NULL,1,NULL,'2023-03-28 15:52:00','2023-03-28 15:52:21',NULL,'2023-03-28 15:53:31',21,91,0,0,'nao_compareceu',NULL,NULL,'C',32),(93,25,3,2,1,1,1,NULL,1,NULL,'2023-03-28 15:53:22','2023-03-28 15:53:32',NULL,'2023-03-28 17:43:48',10,6626,0,0,'nao_compareceu',NULL,NULL,'C',33),(94,26,3,2,1,1,1,NULL,1,NULL,'2023-03-28 17:43:30','2023-03-28 17:43:49',NULL,'2023-03-29 08:58:54',19,54924,0,0,'nao_compareceu',NULL,NULL,'C',34),(95,27,3,2,1,1,1,NULL,1,NULL,'2023-03-29 08:52:33','2023-03-29 08:58:57',NULL,'2023-03-29 08:59:17',384,404,0,0,'nao_compareceu',NULL,NULL,'C',35),(96,28,3,2,1,1,1,NULL,1,NULL,'2023-03-29 08:55:41','2023-03-29 08:59:19',NULL,'2023-03-29 09:00:31',218,290,0,0,'nao_compareceu',NULL,NULL,'C',36),(97,29,3,2,1,1,1,NULL,1,NULL,'2023-03-29 08:57:56','2023-03-29 09:00:33',NULL,'2023-03-29 09:00:45',157,169,0,0,'nao_compareceu',NULL,NULL,'C',37),(98,30,3,2,1,1,1,NULL,1,NULL,'2023-03-29 08:58:18','2023-03-29 09:00:47',NULL,'2023-03-29 09:00:55',149,157,0,0,'nao_compareceu',NULL,NULL,'C',38),(99,31,3,2,1,1,1,NULL,1,NULL,'2023-03-29 08:58:40','2023-03-29 09:00:56',NULL,'2023-03-29 09:02:49',136,249,0,0,'nao_compareceu',NULL,NULL,'C',39),(100,32,3,2,1,1,1,NULL,1,NULL,'2023-03-29 09:02:30','2023-03-29 09:02:58',NULL,NULL,28,NULL,NULL,NULL,'chamado',NULL,NULL,'C',40);
/*!40000 ALTER TABLE `atendimentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atendimentos_codificados`
--

DROP TABLE IF EXISTS `atendimentos_codificados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atendimentos_codificados` (
  `servico_id` int(11) NOT NULL,
  `atendimento_id` int(11) NOT NULL,
  `valor_peso` smallint(6) NOT NULL,
  PRIMARY KEY (`servico_id`,`atendimento_id`),
  KEY `IDX_DDF47B2D82E14982` (`servico_id`),
  KEY `IDX_DDF47B2D76323123` (`atendimento_id`),
  CONSTRAINT `FK_DDF47B2D76323123` FOREIGN KEY (`atendimento_id`) REFERENCES `atendimentos` (`id`),
  CONSTRAINT `FK_DDF47B2D82E14982` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atendimentos_codificados`
--

LOCK TABLES `atendimentos_codificados` WRITE;
/*!40000 ALTER TABLE `atendimentos_codificados` DISABLE KEYS */;
INSERT INTO `atendimentos_codificados` VALUES (1,89,1),(2,89,1),(2,90,1),(2,91,1);
/*!40000 ALTER TABLE `atendimentos_codificados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atendimentos_metadata`
--

DROP TABLE IF EXISTS `atendimentos_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atendimentos_metadata` (
  `namespace` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `atendimento_id` int(11) NOT NULL,
  `value` json NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`namespace`,`name`,`atendimento_id`),
  KEY `IDX_4F7723EB76323123` (`atendimento_id`),
  CONSTRAINT `FK_4F7723EB76323123` FOREIGN KEY (`atendimento_id`) REFERENCES `atendimentos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atendimentos_metadata`
--

LOCK TABLES `atendimentos_metadata` WRITE;
/*!40000 ALTER TABLE `atendimentos_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `atendimentos_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (8,'williame correia de lima','01',NULL),(9,'paulo lopes da costa junior','02',NULL),(10,'tiago moreira da silva','03',NULL),(11,'cliff de jesus morais','04',NULL),(12,'david morais de oliveira','05',NULL),(13,'williame','4645654656',NULL),(14,'FRANCISCA BARROSO PONTE','1937-11-03T00:00:00',NULL),(15,'ANA LETICIA DE PAULA LOPES RIBEIRO','1982-02-11T00:00:00',NULL),(16,'MARIA ROCHELLE SARAIVA NOGUEIRA','1988-12-14T00:00:00',NULL),(17,'VILMA FREIRE BELMINO TEIXEIRA','1960-05-27T00:00:00',NULL),(18,'JUSSARA DUARTE VIEIRA','1964-07-28T00:00:00',NULL),(19,'JOCELYNDA MARIA CAVALCANTE CARVALHO','1952-08-01T00:00:00',NULL),(20,'JOSE ANDERSON FREIRE SANDES','1954-10-21T00:00:00',NULL),(21,'MARIA NEUMAN ALBUQUERQUE VALENTE','1945-12-24T00:00:00',NULL),(22,'JOÃO CRISOSTOMO SOARES','1965-01-27T00:00:00',NULL),(23,'LEONILDA GALVANI CAVALETTI','1941-06-13T00:00:00',NULL),(24,'ED LUCIO OLIVEIRA DE ARAUJO','1971-11-01T00:00:00',NULL),(25,'LIDUINA NOGUEIRA DE FIGUEIREDO FELIX','1983-02-21T00:00:00',NULL),(26,'JOSÉ RIBAMAR CHAVES','1943-06-05T00:00:00',NULL),(27,'MARIA JOSE FERREIRA DOS SANTOS','1953-12-18T00:00:00',NULL),(28,'MARIA DA CONCEIÇÃO ALVES DE LIMA','1969-03-10T00:00:00',NULL),(29,'SILVANA MARY LIMA DA SILVA','1958-05-02T00:00:00',NULL),(30,'FRANCIMEIRE LOPES DOS SANTOS','1969-06-16T00:00:00',NULL),(31,'AFONSO JOSÉ MENDONÇA','1962-09-17T00:00:00',NULL),(32,'LUCINEIDE LOPES GUEDELHO','1960-08-10T00:00:00',NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes_metadata`
--

DROP TABLE IF EXISTS `clientes_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes_metadata` (
  `namespace` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `value` json NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`namespace`,`name`,`cliente_id`),
  KEY `IDX_23B81DEEDE734E51` (`cliente_id`),
  CONSTRAINT `FK_23B81DEEDE734E51` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes_metadata`
--

LOCK TABLES `clientes_metadata` WRITE;
/*!40000 ALTER TABLE `clientes_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contador`
--

DROP TABLE IF EXISTS `contador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contador` (
  `unidade_id` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`unidade_id`,`servico_id`),
  KEY `IDX_E83EF8FAEDF4B99B` (`unidade_id`),
  KEY `IDX_E83EF8FA82E14982` (`servico_id`),
  CONSTRAINT `FK_E83EF8FA82E14982` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`),
  CONSTRAINT `FK_E83EF8FAEDF4B99B` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contador`
--

LOCK TABLES `contador` WRITE;
/*!40000 ALTER TABLE `contador` DISABLE KEYS */;
INSERT INTO `contador` VALUES (3,1,1),(3,2,41);
/*!40000 ALTER TABLE `contador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Recepção Térreo','Recepção Térreo',1,'2023-03-17 16:58:44',NULL),(2,'Recepção 1º andar','Recepção 1º andar',1,'2023-03-17 16:59:05',NULL);
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version1','2023-03-16 14:57:44',76),('DoctrineMigrations\\Version2','2023-03-16 14:57:44',40),('DoctrineMigrations\\Version20210326134543','2023-03-16 16:18:18',81);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_atendimentos`
--

DROP TABLE IF EXISTS `historico_atendimentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_atendimentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `unidade_id` int(11) DEFAULT NULL,
  `servico_id` int(11) DEFAULT NULL,
  `prioridade_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `usuario_tri_id` int(11) DEFAULT NULL,
  `atendimento_id` int(11) DEFAULT NULL,
  `num_local` smallint(6) DEFAULT NULL,
  `dt_age` datetime DEFAULT NULL,
  `dt_cheg` datetime NOT NULL,
  `dt_cha` datetime DEFAULT NULL,
  `dt_ini` datetime DEFAULT NULL,
  `dt_fim` datetime DEFAULT NULL,
  `tempo_espera` int(11) DEFAULT NULL,
  `tempo_permanencia` int(11) DEFAULT NULL,
  `tempo_atendimento` int(11) DEFAULT NULL,
  `tempo_deslocamento` int(11) DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resolucao` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacao` longtext COLLATE utf8mb4_unicode_ci,
  `senha_sigla` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha_numero` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CBBDF95FDE734E51` (`cliente_id`),
  KEY `IDX_CBBDF95FEDF4B99B` (`unidade_id`),
  KEY `IDX_CBBDF95F82E14982` (`servico_id`),
  KEY `IDX_CBBDF95F226EFC79` (`prioridade_id`),
  KEY `IDX_CBBDF95FDB38439E` (`usuario_id`),
  KEY `IDX_CBBDF95F875F1A79` (`usuario_tri_id`),
  KEY `IDX_CBBDF95F76323123` (`atendimento_id`),
  CONSTRAINT `FK_CBBDF95F226EFC79` FOREIGN KEY (`prioridade_id`) REFERENCES `prioridades` (`id`),
  CONSTRAINT `FK_CBBDF95F76323123` FOREIGN KEY (`atendimento_id`) REFERENCES `atendimentos` (`id`),
  CONSTRAINT `FK_CBBDF95F82E14982` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`),
  CONSTRAINT `FK_CBBDF95F875F1A79` FOREIGN KEY (`usuario_tri_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FK_CBBDF95FDB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FK_CBBDF95FDE734E51` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `FK_CBBDF95FEDF4B99B` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_atendimentos`
--

LOCK TABLES `historico_atendimentos` WRITE;
/*!40000 ALTER TABLE `historico_atendimentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_atendimentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_atendimentos_codificados`
--

DROP TABLE IF EXISTS `historico_atendimentos_codificados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_atendimentos_codificados` (
  `servico_id` int(11) NOT NULL,
  `atendimento_id` int(11) NOT NULL,
  `valor_peso` smallint(6) NOT NULL,
  PRIMARY KEY (`servico_id`,`atendimento_id`),
  KEY `IDX_111248C282E14982` (`servico_id`),
  KEY `IDX_111248C276323123` (`atendimento_id`),
  CONSTRAINT `FK_111248C276323123` FOREIGN KEY (`atendimento_id`) REFERENCES `historico_atendimentos` (`id`),
  CONSTRAINT `FK_111248C282E14982` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_atendimentos_codificados`
--

LOCK TABLES `historico_atendimentos_codificados` WRITE;
/*!40000 ALTER TABLE `historico_atendimentos_codificados` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_atendimentos_codificados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_atendimentos_metadata`
--

DROP TABLE IF EXISTS `historico_atendimentos_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_atendimentos_metadata` (
  `namespace` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `atendimento_id` int(11) NOT NULL,
  `value` json NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`namespace`,`name`,`atendimento_id`),
  KEY `IDX_169630A576323123` (`atendimento_id`),
  CONSTRAINT `FK_169630A576323123` FOREIGN KEY (`atendimento_id`) REFERENCES `historico_atendimentos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_atendimentos_metadata`
--

LOCK TABLES `historico_atendimentos_metadata` WRITE;
/*!40000 ALTER TABLE `historico_atendimentos_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_atendimentos_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locais`
--

DROP TABLE IF EXISTS `locais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C823878C54BD530C` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locais`
--

LOCK TABLES `locais` WRITE;
/*!40000 ALTER TABLE `locais` DISABLE KEYS */;
INSERT INTO `locais` VALUES (1,'Guichê','2023-03-16 18:03:35','2023-03-18 14:35:36');
/*!40000 ALTER TABLE `locais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lotacoes`
--

DROP TABLE IF EXISTS `lotacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lotacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `unidade_id` int(11) DEFAULT NULL,
  `perfil_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lotacao_usuario_unidade_idx` (`usuario_id`,`unidade_id`),
  KEY `IDX_10E72C2FDB38439E` (`usuario_id`),
  KEY `IDX_10E72C2FEDF4B99B` (`unidade_id`),
  KEY `IDX_10E72C2F57291544` (`perfil_id`),
  CONSTRAINT `FK_10E72C2F57291544` FOREIGN KEY (`perfil_id`) REFERENCES `perfis` (`id`),
  CONSTRAINT `FK_10E72C2FDB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FK_10E72C2FEDF4B99B` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotacoes`
--

LOCK TABLES `lotacoes` WRITE;
/*!40000 ALTER TABLE `lotacoes` DISABLE KEYS */;
INSERT INTO `lotacoes` VALUES (1,2,3,1),(2,3,3,3);
/*!40000 ALTER TABLE `lotacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata`
--

DROP TABLE IF EXISTS `metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadata` (
  `namespace` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` json NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`namespace`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata`
--

LOCK TABLES `metadata` WRITE;
/*!40000 ALTER TABLE `metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_versions`
--

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` VALUES ('1');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CA42527C5F37A13B` (`token`),
  KEY `IDX_CA42527C19EB6921` (`client_id`),
  KEY `IDX_CA42527CA76ED395` (`user_id`),
  CONSTRAINT `FK_CA42527C19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`),
  CONSTRAINT `FK_CA42527CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES (1,1,1,'YjIxMWJhODY3MWU1ZjJhNTNmMGQ4OTdkOTBiMDRhODc4YzkxMDIwOGEzNTBkMjFlOTEwMWEzODg2YzE3NTZkOA',1679065468,NULL),(2,1,1,'ZDgyY2Q4YTI3MjU3NGMwMzdiMDBiYmY3MzM4OWU5Mjc2ODMyMTBmM2UwMjExZDQ3Y2Y3MjE4NmIwZGEyY2IwMQ',1679065974,NULL),(3,1,1,'OTMzYjYxZTk5NjVjZjcwYjE3ZjVkY2EzZDY3MWZlNmRkNzEwYzcwNGM2ZWUyNDcxN2RjNmFiY2RiYzA2YzI5NQ',1679069863,NULL),(4,1,1,'ZTcxZjI1MjZlMDAwY2ZhYjQwOTk2NGExY2YwNDY1OGMwOWFlZWI2YzAxYzViODY2ZWExOTBkNzJkMGM2NjdlNQ',1679069865,NULL),(5,1,1,'MjZiMzQxMTY0MjM3Yzk1ZDljMTRhODEyMDE1ZjM0ODU4YmE1MzRlNmQyYzU2YzU3ZGUxYjE1NzA4NDBmZWFmYQ',1679069867,NULL),(6,1,1,'OWFjNDE3M2QwZDFjNDc1NmFmN2YzMzk4MmNkZDAzNzdiNGQ3ODkwOWU5MTE3YjljNTI4NTQ3MDAwOGFhMTIwNg',1679070451,NULL),(7,1,1,'YWQwZjJhYjUzOWQwMTI1Mzg2ZTUzMTNkYTczNzQ1OThhZmJiYjliMjlkZjg2NDJkOGM3MThhZTQyOTAzZDU5OQ',1679164110,NULL),(8,1,1,'MmU1YWMzY2JjZDQzYWFiM2Q2Nzc0ZTQwOTY1ZWJjZTBlYmMyOTU4YzJhNWY5ODk2MjVkZjk0NzE5YmQxM2ZhMA',1679165352,NULL),(9,1,1,'NDRlOGQzNTgwMjk1MDE2MTJmZmMwNjRkZjhiMmRmMDM3OTQ5MmM1ZGIzZDM4NjZmMTc0M2U5ZmI5ZjEyMGRhMw',1679165372,NULL),(10,1,1,'NmExZTg1NmEyZTIwY2E5YmE1MzkxYmQ0Y2M4MDVjYjFkM2M1ZmNkOTM1MTBlZmExNTEwZDIyZjUwMTgxYTlmYg',1679165724,NULL),(11,1,1,'MTA2NWMyZmExYzQxNTE0ODY0MGU3MDhhNTVkMjk0OGVlYzY4NDBkODU2MmU4ZWNkNzMyOTQyM2Y5OWRiZDhiYw',1679165760,NULL),(12,1,1,'Y2MxNDc5MmM0YzA2ZmVjNGQwNWIwMmM0OTBkNTM2ZDRmYzQxY2NhNGMzYjhhYmJiZGY2MDMwYjdkMGVlYWFmOA',1679167440,NULL),(13,1,1,'ZDUwYTA5MGIwMTA1MWE3NTE2M2ZlNDk0NmUyMTQxNWM1NjdhMzk1NDYxOGQ1NTFlYWExYzM3MTFjYjExN2U5Nw',1679170751,NULL),(14,1,1,'ZDA0ZGZkNmIwMWExYmVjZDkxM2FhMmE2NWY0YjFmOTQzNThiZjU1Njk2MzdkMmNiZTk1YWIzOWVjZjRlOWVhZg',1679246516,NULL),(15,1,2,'OTM1ZTQzYTA3NGMxYzhkOGUzNWI4ZTRjN2M4ZTY2NWNkZmI0ZTY1MmRjMDY1ZTA5Y2NjNDEzOGYxYzk2YjE0OA',1679247050,NULL),(16,1,2,'ZmZhMWM0NTc0OWE5YWQxNjdiOTc5NTllMzRkYzVhYTVkMDMxNjk5NTU3OTQyYmU2NjJiNWE2NmQyOTI5Nzk4Mg',1679250370,NULL),(17,1,2,'ZDQ1ZjFmNTg5MDM5ZGRkYjA5NzNmMjA0N2EwNDkyYmUwNTdmNjQ5NTg2NDNjMGEwYjYyNDZiNDM1M2EwZmM3Nw',1679253730,NULL),(18,1,2,'ZDQzNWRlZGZiMTk3MWRhYmU2YWIwNDg3OWFiYjg3MDhhYjc4YThmM2YyZjk2NTA2MTM4NWM0MzNiYTJiYTBhMQ',1679257034,NULL),(19,1,2,'OGJjYjE3N2FiMThmMDdiMWQ0OGNmNmM3ZDY2ZDYyY2Y5OTE0ZTA0NWM2OTYzZTg3ZDU4MWRmYTg2N2VjZjhlZg',1679260334,NULL),(20,1,2,'ODllYjI3MGIxMTI3ODhkMTQ1NTdiN2Y3ZjBiMmUyNGE4ZWIwYjQ3M2UwMmI3Y2UwNWY1ODFhN2FlM2VkN2MwYQ',1679263577,NULL),(21,1,2,'MDBmYzA0YWVhNGE4ZWFmZGE3ZjVkZWVmMDk1ZTBkNzNkYzJiM2U0MzBhMGFjNzE2ZmY0MmYzN2Y2ODUxODZiYw',1679317693,NULL),(22,1,2,'NDc2OWE2YzNjZTQ4YmNjM2M2NmU3ZjFhYWUwMWUzN2Q3ZjRkYTM4NGM0NjJhYThjZGFkYTZkOGVlZTliMTUyMQ',1679320995,NULL),(23,1,2,'M2YxNzllMjFjMWIyMTliMGE4MDNjMzc1YzNkMWI0ODY2NmNmN2JmMWI5YTY1ZDkxMTc0NzI1YzU4YWYwYTk5MQ',1679332233,NULL),(24,1,2,'ZjRhM2M2ODQ5YzFlMDQyNGQzMTIzZGY5NmE1OWNlMmRmOGU3YjZjMjdkNTI0MjQwNTlmYTgzMTRiZmUwZTFhYg',1679332234,NULL),(25,1,1,'ZGYxYzcxMmM2ZmEwNjM4NzdjNjVmNmQwMWFhZDAxNTY1YjY4NWI4MDkwMGE1MGFmZjE1Nzk2OWE4MTViZGQ4NQ',1679332470,NULL),(26,1,1,'NGYxZWViYzk5ZmU3Mjk4MmNmZWM1NGNkNDczMzE1YWIwODVhODhlNGMxNzZjNThjNDA2ZTE2OTUxYTBjNTU5ZQ',1679429012,NULL),(27,1,1,'ZTVmYjJkZDI1MDliZDgyMWNmNzIyNDM3NmMzNmZjNzkwZTg5NjIwZjBkNzcxN2FhODE5ZjI4ODA4Yjg0MmFhZg',1679434352,NULL),(28,1,1,'N2U4MmMxMGVjMmY0N2I5Yzk4NWU1MzNkZThiYzBiMDZmZDljOWNlMWY4MTRmYWRjMjUyOTZiNDBmY2EzYjhkMA',1679434815,NULL),(29,1,1,'ZTQ0YjYyOGFhOWIwOTYxYTAxYzM0MzkzNDgyMGQ2ZDc3NzI5Mzk5YzZiOGVmYjdmNWNjYzczNGMwY2NhOGYzMQ',1679434937,NULL),(30,1,1,'ZmI4Njg5NDA2Mzk0MDA4OGQ2ZjBhMzJjYTIzYWZjY2RiNGY4OTYxZTE1OWI1NjhhMjVmMjk2M2E1MTk3NjM0OQ',1679484360,NULL),(31,1,1,'MzNiODkxM2YxYjBiOWJkYTA0MzZjM2ZhMzk1Nzg0MTVmYjI3Y2Y0OTg0MzI4ODJhMzVlNjJlZGI3NzQ5OTVmMw',1679487688,NULL),(32,1,1,'NTQ3MDVkYTUyN2M4ZjlkZGE3ZTIzNjdiZTQ2ZDk3MzYyMWIyNGVkYjg1ZDk5ZmNiYjUyZTdhM2Y3YzBiMTFmZQ',1679491031,NULL),(33,1,1,'OWY3YjFiODRjYmU4MmI3ZjdkNTY1YTc4MzlhMzI0NTY3MGQ1OTY2NmIyZTAzMTJhNDA5NGIzZDFlZjU0MWM2OA',1679494366,NULL),(34,1,1,'NGYxODAyZTZmMjVhZTQ0ZWJmMTY2NDgwMDU0YTkyOTc4OGMyYWI4ZDk1N2ZiY2UxZTk2MWZiMjJkZTE3NDg5Ng',1679494693,NULL),(35,1,1,'ZDhhNGEyZDQ0ZjMzYTZkNjVhMDZmNTdjZmI5ODhjMzY0ZWJiN2EzNzhhMDliNWNlY2NjMTcyN2JhYzk0ZGYyNQ',1679496028,NULL),(36,1,1,'NjUyZTAzNmFlZTgxY2I5MDcxMTY4Zjc2N2Q0MjkwNmM1MjQ2MDMzODA4ZTE1NzM2NDUxNmFmOWY5MTkxMDIyYQ',1679496566,NULL),(37,1,1,'MDNhNjhhM2Y0ZjQ4MzM5NzM3YjZjNjA5OWY1MTA3Y2IyMjM5ODM4NTM4MmI3NGU2NmQwMWZhYTMzYWU1YTkwNQ',1679499368,NULL),(38,1,1,'M2VjNWFkNGM0NjVmYTA1YmU4MjY5MWUwZjM3ZjliMDY1OWUzYTQ3NmQ2ZmZiY2VhNjViNjc5MjRhZmI3NWRhZg',1679515123,NULL),(39,1,1,'NmJkNjAxMDE1NzA3ZmQwZTg4MzFmMjNiYmFlNzA3ZDEzZWFlNWQ1NGE1OWZmYmM3ZDhmNjQyNTNlZGNmNTAyNQ',1679517978,NULL),(40,1,1,'OTFkZmMzYjFmNDJjZmJjMDNjNTIxMDY2MjAxYTBlOTE0N2M3NzFkZTAwNWZkM2RkNDlmZDhlNzQ3ZDVmODkzYQ',1679518435,NULL),(41,1,1,'ZDkzYWIwNzU3NTFmZGY1MDdhYzZlMWUwZTFkMjkwNDU5ZWFlZjdiMjQwY2VkZjZkYjc5NjRhNDlkZGUzYmM4Mg',1679520807,NULL),(42,1,1,'ZmU3MjMxZTc5YjU3ZTYzZTRiY2E1YzgzYzI3M2VjMWQzNmNmYTE2NTQyNjQyZDU3ZWU4ZThiZTg2ZTA4NTk1MQ',1679520881,NULL),(43,1,1,'YzJhZWNiNmM4YWQzY2M0NjlkY2U5NDE0NDUyYTg2NTM0MThlN2NlZjZmYmE4YTA3OGRjNGJlNWY3MjUxNDIzNg',1679521099,NULL),(44,1,1,'MDA3NGZkYTllMjUzMTk2MTM1OTFlZDJhYzU5ZWE4ZDFlMzIwMzIzZGRhNTVmMTc3ZDllNzE2Yjg3MDQ0MjlkZg',1679521689,NULL),(45,1,1,'NzVmMzAzM2ZkNmM4MTYxOTg3MjE1YjRjZDg0NGM4YTExNmQ5OGEzOTMyMzIxZTI2OTViM2Q0ZTgwZGIwZDZiMA',1679521826,NULL),(46,1,1,'ZTk2NjIxNzVmZjJkNzAyODJmMzJhZGYwNWUzODEyNjcyY2JkNDllODhkM2U1MGE1Y2EyMWNmMTUwNDBjZDc4NA',1679522005,NULL),(47,1,1,'NDcyYzVjNTFlYjU3YzRiNzc1NzQ1NWQ2YjQzOWE0YTk0NWI1N2QyMTJkNWVmNGE0ZDFmYTk5ODhmN2ExOTAxNA',1679522093,NULL),(48,1,1,'YzI5MTc5MTI1MTY1ZDU4YTNlNTU1NGIyMWI1NDdhZjAxOWVhZjQ3MjM3ZDIzZWYyN2E0ZWQwNjZhNTViMTVhMw',1679522506,NULL),(49,1,1,'OWY3ZWNiMDU2MGVmNmFiYzQ1MzdmNmFiYzQzNjA1NDJjMWM2Y2E0ZDVmODViZWE2NjA2ZWIyYzNkODhkOTI5Mw',1679522566,NULL),(50,1,1,'OTIzYzE1YTljNmU0ZjI2ZDcyYWU0YWY0NzU4OWJmMGY0ZWI5NTFkNjA5MzQwYTVmNTdmZDU4YTQxNmVjMjYwMg',1679522697,NULL),(51,1,1,'Y2M2ZWZjMWQ4MTliYTZhZWMxZTU3NTc5NTE2NThmODc5M2I5OTE1ZjFhOGQxZWY0MTgzNWY1ZDhjMzIwODE4Zg',1679522719,NULL),(52,1,1,'NmUzMjljNDQ1ZWMwOTg4ZjM0N2JjNWZhOTQxZWRhMmQwZWMwNzMyNDJkOTcyOGE2YzZjNGYxZTVmODYwNjA3Nw',1679522783,NULL),(53,1,1,'ODQwMmYyODdhYjVmMzQyNjFhNDBlZjEwYTRjMGQ1YjBlNmRiYWUyN2RjMTBiMzdiOWJkYjI3ZGVhNWJjNDJjMw',1679572199,NULL),(54,1,1,'MDhlYjI4ZWI3YTRhODliYzQzY2Y2NTJiOWRlNTk4OTA0MWRlOGVmYzU3NWVmYTc2MDI4YmI1YmQyYTk5NzM0MA',1679575547,NULL),(55,1,1,'YTQyMTY1NzUzZTYyNGRmOGY5YjgwODNiNDdmNzNjMWRiNjJhNWZmZTNmM2QxZDY0Zjc5NDE1YTI5ZGM5ZDdjYg',1679576359,NULL),(56,1,1,'ODliYjliZjgwOTViMWVkZDFkZDU4NjAyNzk0Zjk2NDgyMTJmMzZiMmUwOGQ1NTY5MGNkNDViOGVjZmFiZDZmZg',1679577040,NULL),(57,1,1,'NmYzZGJlMTVkNDFmMWQ4ZTA4YWQ1YzdiOTA2MTQ4MTVmYTRiYmVhMGUzYTk1NmIxZjcyM2VhM2JiODc0YTg2Zg',1679579038,NULL),(58,1,1,'ZGIwNjgwNWY2MWJkM2NiZTZiOGZlOTQ3ZmZkZWJkNDJiMTYyMDRkM2FhYTMwODQzNWZkMTZiZTdiMTVmNmVmNg',1679580401,NULL),(59,1,1,'MzRhYWRjNWZiNDdiNzFkMjk4OWUxNzI1YjJhZGYzYTYzZWQyNzVkNTkzOGMzMGMzNTY2ZmY5OGNhZWFiOGY0ZA',1679583702,NULL),(60,1,1,'YmU2N2YzMjhiNjFlNjhiNGU2MGYyODM4NTU3MzRiZDdhZWNjMTFkNzY2YTZiNDVhYmQ0MDM0OTVhNzg0YjU4OA',1679583862,NULL),(61,1,1,'OTE4ZTVlNDNhN2ZmN2U4MWY1NjkyNjUzZTQxMGIxYWIwZjkyNzQ5ODYxZmNmZjUyZWU4ZTQ3NTJjYTQyYzk0OA',1679587190,NULL),(62,1,1,'MDYxMzgyNDY1MzA3NjljYzY4MDAzZGUyY2JiMjNkZWJjNDczOWU4YzgyN2UyM2Y4N2FhMzM1N2I1MjAxODQwMQ',1679592472,NULL),(63,1,1,'ZTM3ZWY5NTMzNTliYTI3NjdhMzAwMDE0MzJiNDE2MGIyY2NmNmM2NzNhM2I5MmFhNDVlNWU2NGY2YzczYzBkNg',1679596598,NULL),(64,1,1,'N2M3NjJhZWJlYTEyMGVlOGM3M2M0ODRkMWFiZjMxZTg1ZjFkNWE0MTdmNmU1ZjMxMzNmNzdiNjQ1NWQ1N2QxNQ',1679603230,NULL),(65,1,1,'Nzc0MWUyMDNiY2Q3NDFmZWRkMmIxNTU0YTE2NTBkYmIwNjgzNDZjMGZiMmM5OGZmMTRjMzJkYjAyZDM3NTg0NA',1679605626,NULL),(66,1,1,'MGI0ZWQxOGIxMDg4MWNhODQyZWUyY2ZhODJhNDg0YTU5MzA3OGEwNDY3NjhmNmExMGQ5NTZkMTA3NTkzMzgwNA',1679605939,NULL),(67,1,1,'ZDFiYzMxOGZlMWJlNTM3NWEzMDY4OTZkMWVmZmI4ZDFhYmFlMjZmNjdjNjQ5OGMyMDUyOTJjMWIwMjIzYzBiYQ',1679606006,NULL),(68,1,1,'NGYwNzY3M2NjYjc4YjgzOWRkNzhjOWI2ODE2ZDZiMzU5OWI0YzA0ODQzMWMzZWM1MTlmYWJmZjc5MDk3NGNlOA',1679606078,NULL),(69,1,1,'MTU0YzIzMjRiODA0NDE4M2YzNGU2YWZlYjE0MjcyNmMzZWU5YzU4MGFkZjg5ZTlkMjUyNDYzNzBkYzMwODUxYw',1679608615,NULL),(70,1,1,'MDJhZTQ2MTM2MTcyZjU5YmMxMjY3ZWY4Nzg1NDMyOTNiNDBhNzMzNjdmNWExZTEwNTQwOGM2OTgyOGRlMGZmYg',1679610099,NULL),(71,1,1,'ZDFkYTBjN2I2ZjUwMjc4NjA4YTAwOTZhNTFjNmQwMDk0ZTMyNDM3MmQ5ZTU0YWEyZWQxODU2YjJiYTg0MjA0Yg',1679610180,NULL),(72,1,1,'ODkwZGY0N2ZjYmMxYmQ3NTlkOThkZmQ1MDg2ZThiYzhkZDdjMjYxZmQzYmUzNmQyNjQzZGFiYmE1ZTdjMDJkOA',1679610289,NULL),(73,1,1,'ODc4ZjgxYTY1YTgyMzBjNTk0Yjc3MTU5YzEyNjBlN2ExNWY0NGVhOGYxZTEyZTg3NDJjMzIxYWMzYTkyZDhjOQ',1679610351,NULL),(74,1,1,'MDBlYTM3YWMxNWI2OWFjOTk3OTlmZjA1M2M4M2MxYWNhYzdlZDg1NGNlZDlhMjEwOTEwMmJlYTE2OWM1NTMwNA',1679610425,NULL),(75,1,1,'NGYwNjFkNDdlNWIwZDdiNWI0NGJlNmZjMjcyOGY1Y2NhZTVkZWViYzU4OGJlODhjNjIyOTZiZTJlYzM4ZjVkZg',1679658043,NULL),(76,1,1,'MzkwOWZmMzA3NWNkNjc0YmZhNjI2MjdmMzhhZTRlMTFhYWFlMTFjNzZjMmMyOTFkZmE3ZDU4ZDkzNDM5OTdhMw',1679661371,NULL),(77,1,1,'Mzk0YzM4OWY0NjUzY2FiZTMyZTUxNGU0ZjRjYzQ5OWVlODNiNmUyYzJhMTk5NzkzZTUwOGNmODkyMWE3OGM1Zg',1679661609,NULL),(78,1,1,'NmVkZjUzMzg5YWI2NzgzMTlmZTA0YjAzYTI5NmU0ZDgyZTI3MmZiNjc1ZDUzMGU3YWE0ZTY0N2RmNTliODBhMQ',1679662022,NULL),(79,1,1,'MGRiNWViNDg1Y2ZkNTg0OWI2ZjQwMjhkNWZjYTU4NmU4N2Y1MTUwMmEyMDJjODM4ZDljNmQ1YTcxZjg4M2QxNA',1679662092,NULL),(80,1,1,'YTQ5Njc3M2FhYjkyNzc5ZWRjZjJlY2FjMmMyNGJjMDk5MmNmYWY2MjRmMjI3MjdhNmNiNDQxMzQwOWI4YTU2OQ',1679665743,NULL),(81,1,2,'ZDU3ZTBkOTkwYjhjOWU0NDdjMjI1YTg1NTg5MWZkMTU1OTZjNDNlY2UxYzU3NDRiZGMxNGE5NDExMzRmMDg3Yg',1679667988,NULL),(82,1,1,'NDliMzg0NjlhYWM1ZmMzMjMxMTNmMmE1YjUwMGE3Y2EzZWIyY2VmYWNlYzFhMDM4Yjg4YWJlMGFhN2M4N2FlMQ',1679668567,NULL),(83,1,1,'ZDY1YWY5OTA4ZTI0MzlmMjViODEwOGM1Y2JmYmExYTkwMjY5M2Q3ZGFlYTY2ODMxYzcyMzY0NDE4MDI0YWY0ZQ',1679669054,NULL),(84,1,1,'NWRhYTA5NDVhODI1NDc2MzQzYzRlMWQ5YWQ5ODdkNGVlZDM2NWVkMjZlOWZiYzRmZjRmNTZmYzA4M2UzMDBmOQ',1679669484,NULL),(85,1,1,'YjZkYzliYzZlNTBjYmY3OTEyNTllNzljZTg0Njg2NGM4OGQ1MzI1YTkxZDE4Y2UxMTQ2YmE5ODk0MDg5NTllNQ',1679672475,NULL),(86,1,1,'NmM4YTNkZGI5NThmYjQ4YjUwMDg5Y2QzMDcxNzFmNjZkMWFlMjllMjAxZGY0MmExNGE2MTgwNDRlZTE2ZTMyNg',1679672835,NULL),(87,1,1,'ZTZiY2MyNDI2MWMzMmY3NjQ5YzMxNmI5MDc4ZjkwMmIyMmU4ODFmYTFmNGY2M2NlMmMzMGM0Zjg0MTkxMDQyMg',1679676077,NULL),(88,1,1,'OWUxMmY5ZWFlMzNhMDlmNmIyOWJhODRmOTM4MWFhOGYwMDU5YzdlOTg5MGZlYjhmZmNkNWEwNzQxYTdmNTEyYw',1679676428,NULL),(89,1,1,'ZGUxYjA2MDM2Y2VlOTJlZDRlZjJjZmJkZjhjZDZjZGM1NTM5MDBkNTJjZmZkNzczNjQ5YjNjOTVkNjYzMWNiMg',1679676431,NULL),(90,1,1,'N2ZiNWJkNDk2YmI5NDEwYzcwYTVjNGQ2NGY5ZjE0MjdlNjBkZWQwNmFhMTJlZmEzNzgyNjhmZGM1N2M2MmU5Nw',1679921853,NULL),(91,1,1,'ZGYyOWU1YzI2YzY3M2RjNzYzMzczYTEwY2IzY2FkZTA4MmU4MjYwNDA0YTZkNTk1YzcwZmQwMzBiMTc1ZDdhYg',1679922960,NULL),(92,1,1,'MGY2YmVlODkxNWQ3ZWY5NjA3NGY0NzI0ZDUxNWE5Zjg3Y2UwMTcwMGM2NDc3YjAyYjE3ZjAzZjJiMDAzYmYxOQ',1679938237,NULL),(93,1,1,'Y2FiNzJhNGRkMTllMzUwMmEyMmRlMzhmY2M3Nzg0MjA5ODEyNTNhZTQ0NWYzMWJlMDhlMmE0MDI2MGUwYTkxMA',1679941569,NULL),(94,1,1,'ZjExYmYwOTdhN2IwOWNkMTg5NzBiNTgyY2RjMmFhNWQ2ZDM4NzMwOWIxYmM5NTI0Yjg3NjkzODA2NWYwY2RkZA',1679943712,NULL),(95,1,1,'MDM5NjMxNzcwOGE2MzIyOTVmOGQ3MDVmZjI4M2ZmYzBmYmI1OTY2YTQwNTE5Mjk2ODI5NDI1NTBlM2NhYTJkMw',1679944870,NULL),(96,1,1,'MDc3MDgwYzY4YzI1MDMxYWZjMDY1MTJlZWEyNDk3ZDU3YmJmYjE0MGFjNjA3NDU2OTU5MzBhODdlODUyNmY2Mw',1679947033,NULL),(97,1,1,'MjM3ZDZkNjBhYjFhNTYwMGYxOGJjYWM0YmM1MWYxYjM4MWY2YjY4NTFjZjI4Mzg3NmZmMjJkZDg2NDlkZGM4Mg',1679948170,NULL),(98,1,1,'NmZmMGVkZmZhNmQwN2JmMDgzMDhjMWZjZWFjYmFlNWUxYjk5ZWZhMDYzOTk5Y2NkMTJhODFiYjNjMGZlOGMxYg',1679951471,NULL),(99,1,1,'YjYyZmJhMDU0MWUzYTkxMTUzOWRmNzMxMjA5N2IzZDE1NjY4MDhjMjVmYmQ0MjBhODM5YWNkMjgxMzQwZmNhNw',1680005941,NULL),(100,1,1,'MmZmNjQ5Nzc1OTVhZjgwODk3Y2I0ODAxNGQxNmYxNWM1ODQ4ZGYwNDY4OTEyN2I2YmExMGViYmZlNjdmZGQ4Zg',1680006595,NULL),(101,1,1,'ZTYwNTZjZDQyN2MzYjdmYTJiZDI0YjY2YzQ3ZmQxYzI2YjljY2JmNzI5OTc2NGIyYWNjYmNjNTQ4OTAzMjViNw',1680007510,NULL),(102,1,1,'ZTY5MTFhM2MwMDBkNWE0Y2JhZjkxYTI4ODFmN2ZkZjFlOGQ4YjE3MTRlZGY1OGY1YWFkMzYwYzMzMjJmZjkwNA',1680007519,NULL),(103,1,1,'ZDNmZDEwYzI4MmZmY2QxMmM1YTFmM2YxMjhiN2NiNmFkNGFjNDc5MGNkY2EzYTMxY2RmNzA2NzIyNjY5YjAzNg',1680009708,NULL),(104,1,1,'ZjY5YWFlMzFkM2ZjYTVhYWQ4MzVmNTg2NzE5YjY5YTRmODAwZmExMGVkNDZiZWQwNjgxNzZkMWE0Mjc2NTdmMA',1680009729,NULL),(105,1,1,'ZmM5MjhjNmQyYzVkYzkzNDNiNGQxNDg3NTAwYWZkZTQ4NGI1Mzg4NWFjZjAzMjU1NWNjM2U4YzUyMDE3YzY3NA',1680009741,NULL),(106,1,1,'Y2Y0ODM3ZGU2ZDg3N2VhM2JhNDQ4YjM4MmYyZTE1MDVhNzhjMGNkNTQyYWJiNDk0NWIzZWE1ODMwYTQ4MTMwMg',1680009789,NULL),(107,1,1,'YTA1YjcxMzM2OGE3ZjVkNWY3ZDIwOWZkZDkwZjRkZDg2YmQ5ZTFmZGU0NDUwMjk0MjM4Y2EzNWVmMzY4MGRkYw',1680009838,NULL),(108,1,1,'MzFlMGNkMGFkMTA2NzI2MjY5YmY0OWJiNzFiMzlhZmQ2M2M3OTk2Mzk1NDJlYTZiOGEyZTFiNTYzOGMyNmRjOQ',1680010210,NULL),(109,1,1,'MDFkNGEwYWExZGM0NTQ1NTQ0M2Q3NGM0YmM3NzdkZmFkYmIyMjc0MDVhOGM3ZGFkZTk1ZTE4MjM2OTcyYmVjYQ',1680013121,NULL),(110,1,1,'MzY2ZjA0MGQzZjBlZDIyN2QzMDY1OTIyNmFiYzQ3OTJmOTI4ZTAwN2Q3ZWMzNDhhYmFjMmNhMjk3MTUzOWYwMw',1680016368,NULL),(111,1,1,'MzMyMjk0ZWZhMzUyMWNhZWMzM2NmN2E3NTkyOGNiZmEzNGM3MTQ5ODJlZGEwYjA2ZTdmNmQ4YmRiODUwNTYxYw',1680016525,NULL),(112,1,1,'NWMwZDdjMzQ3ZjdiZTE4NDNiYTEyMGM3ZWU0ODMyNTc2MThkN2QzMDVlODE4NTc5ZjUzZGZlYmNhZTUyMGQ5NQ',1680016532,NULL),(113,1,1,'ZDNhM2M0ZTQ3NzliNDZhNTM0NTVkYzg5ZDBmMzMzM2RhYTk3ZjIwNWQ5YjIxZDE3MDgwZTMwNjBjNDI4OWI4MA',1680016652,NULL),(114,1,1,'MDUxMDY0Njc5NmQ4NTc4NWFjZTgyOWRiN2FlN2NlOGJjOWIyYmRiMzEyNTAyOGNlNDcyNzkzMzk2YTNhMmQzYQ',1680019865,NULL),(115,1,1,'ZDQ4Yjc4MDljZGFjNzU1NWM2YjMzODI2ODEwZWVlZWJkZDRlYWI0OTk3ZGZjZTY0Y2E2YzU0ZjZkYWFmZDJhZg',1680023226,NULL),(116,1,1,'ZTllYzQ5NTI0YzJhMmM3N2Y5MjkxNjJjZDMzNjNmYTQ3N2E1NmQ0NjQ0NjVjMDgyOWZhYWQ0ZTE0ZTYzYWZiOA',1680026585,NULL),(117,1,1,'NDE3MmYzYzNiNzNkMzRlMDQxMTM0YjdhNmM5Mzk1NjE5MGE5YTFiZGEzNzJjMWIyMmU0ZmQ0ZjA4ZmRlMmJiMQ',1680032662,NULL),(118,1,1,'Njg2MTgzNDcyODEzZDVhZjEzN2IwZWEwMzkzN2RkMjZlMzU1MWE5OTVhMGUyZTg2NDBjNWUzMTkxNjM4ZGZlNg',1680032729,NULL),(119,1,1,'OTI2MjE1MmU4NWUzYjk2YWRhYWEwOTY1YTZhZjNlZGUyZjdlMTMzYWMwOThjNTc3MzZhNjViMTE3ODVlMzlmMg',1680032904,NULL),(120,1,1,'OWI0N2U4NjcyZDc5YTRjZjFhMjNkMzIyYWEzOGZkMWQ1MTA4YzRiZDcxNDNjYTBmZTUzMzlhN2NmMDQ3ZGI1MA',1680032954,NULL),(121,1,1,'ZGExYTdkYTU2YjMyYzg1YmNjNGMxYTNkZTc3YzM3Yzk2NzhkYzZkMjA2NjQxYjQzNjg3MDllNDMzNjY4YzI4OQ',1680033120,NULL),(122,1,1,'MjQxNWZmNDg1ODBjNDVjZTlmZGYzNmZkMjA4YTcxOGRjOTNmODZjNDRiYzhhZDYwMzYxNjllMjJhNzE0ODYzNQ',1680033202,NULL),(123,1,1,'MWQ2ZWM2NDFkNjhhNzc3ZThkYzRkNGE4YTM1ZWM4MzQ1NTUxZDA0NTAzYmNmYmUyYzc4YjQzMTNkNjBlODZmMg',1680033409,NULL),(124,1,1,'OTVkZTg0YjcwZDQwNzRmZTI4NWY5YTNmNjg1OGE4Y2NmMzdjY2QyYTZiMmY0YzI5MzQwYjMxNTA3YzA1NGI3Zg',1680034376,NULL),(125,1,1,'Y2M1YzM2ZGNjMjVjNzllNmJiOTAxYWVlMDUxZWM2Yjg5N2E4MjE0NGE2NjdiM2NiZjRmOGIxMzMwMTljZWI0Yw',1680036717,NULL),(126,1,1,'MmQ2MGM0ZTBiNjM4ZmQyMjUxNGFlZmUyZjMxOWIwYzlkMDU4MDMwZTAxMWM4ZjNiNzQ1MDZkNTY4MWFjNzVmZA',1680037695,NULL),(127,1,1,'ZjUyYWZhZjVlMTViN2ZiMWI1NTVlZjIwNTZiODI1ODlhNDM1OGNiNjBmNjFiODUwYWY1YzYwMTdmNGJlZmM4MA',1680039809,NULL),(128,1,1,'ODM1ODJjNTVkYWRlNTdiMDM5NDc1MmFkY2ZhZmY5MjljNzU2YTA5OWM4ZTgyNGY3ZTY5ZTkxYWU5YTIzZWI0Mg',1680091125,NULL),(129,1,1,'YTcwZTU1MzFkNTY3MDkzMDc0Mzg2MGQ3OWExMGU4MDM0YjBlOWNjYTc0ZGY3MDY5YzRkZDU0MjI0N2ZkNjVkNQ',1680091380,NULL),(130,1,1,'NGI2ZmQxNjg1YmQ4ZDU5MTA4NjY3N2I1YTA5YmYwN2RiYWJkZGU4MGJiMWUzY2M1YWNlZDIzYjViMDYyMmVjYw',1680091393,NULL),(131,1,1,'MmI1ZDhkMzEyOWY1OGUzYTIxMzRkYzI5Zjk2NTk4NTVmNGU3ZGQ1YmE0ZmJlYTZlMDQ5MDlhMDc5OTUzNjYyMA',1680092756,NULL),(132,1,1,'ZjYxYTJkZjUxY2I0YTk4YTI4ZGQwZjg5Yjc4ODAwOTFjNmQ0YjQ3OWIwYjVkNmU4ZTM4YmVkZDc4Mjg3NTJjNA',1680094352,NULL),(133,1,1,'Njg1Y2FhYTM2ZWJmM2I3YmEyOTViNTJlYzM2YzVkYjE1NWVmMGRlZjdiOGM0YTY4ZWYwYTJiYjI0NjNmOWVhYQ',1680094431,NULL),(134,1,1,'OTVlMTU5NjYyZWM3NTEyMTg3NGMzM2NmNTA0NzRjYTg3NTVjNjhjMjg4NDk4NzAzNmU4OGNlYjc1YWQ1NmRlMg',1680094540,NULL),(135,1,1,'OTA0YTI4ZDcxNjQ0MjM5M2NhMDQwOTIzM2EyYmJmMGMwODU1NmY1ZjUwNzFiNzM5YjI1ODUzMmM4NGVjNWQ1Yw',1680094675,NULL),(136,1,1,'ZGEwYjE0ZTU3ZDE4OWM3OTdmODg3ZjI0MjQ0YzU4ODdkZDc0YjVmMDE3NDcwZjVjNDhlN2NhZWE4MzI0YjMyOQ',1680094697,NULL),(137,1,1,'MThkYjE3MmExYjk1M2YzNWJhYTlmNTRmZmYxYjBkNjZhZjA1ZDU4M2UzMWU3NWU2NDA2MDdkODk3MWQ5OWNkMQ',1680094719,NULL),(138,1,1,'NmRmMjgwMDlhNDYyOTY3MzFmNzJmZGM0Nzc3MWI1ZmI5M2M1NTdiMzkyNGE2NDAxNWVjNmMzOTU4NGQ1ZjQ0Ng',1680094949,NULL),(139,1,1,'MTQ0MDgyZDRjNmI4MDE5YTNmNzFhZDQwZTNiMjc4NjFlNzI5ZTExNzRlN2RjY2NiY2EzN2U3Nzg2ZDZlYTcwMA',1680095284,NULL),(140,1,1,'ZDExOWE3ODdiMTkyZjlhNjNiMjlkMjk4ZWRkZTFjNzE2NDVmYTM3Mjg2MGUzM2RjNjA4M2Y0YzVjZWUxMzkxMw',1680096057,NULL),(141,1,1,'NGI5ZTAxNWY1NTBjMzU2NGVjOWMxZDQ3Mzg3MzI3NmYzMDU4NWVlNzRlZmFhNjViZTU0NWNkMTdkYmU3MzA1Ng',1680096057,NULL),(142,1,1,'ZWUyYjA1NjBjOGVhYzY2MzM2ZjMyMGY2OTI4NzE0OTYxNzQ0MThiY2Q3YWUwMjIzNWYzYmUwZDFlOGU4Y2M3Nw',1680096065,NULL),(143,1,1,'MzBhZmE4NWNjNTQ3NWUwZDdlM2NkYmViNjExNzBlMmFiOTdlOTk2OTEwZTZjNDFkNzc5ZDIyMWVmZGM3ODY3Ng',1680098643,NULL),(144,1,1,'MDgzZTUyNTlhYTFlNDk4Y2I1YTY5NjUzMzc1ZjcxMjMzYThhMmVlZWVlMDgwZmI2NzhmM2U4ZDFlODM4MWE4MQ',1680099367,NULL),(145,1,1,'MzA4OTQyNDg3MWFjZWIzMTVlNWVhODk3NjU1ZDQzZjNiNjlmYTU0YzgyZmY3MTczN2JjNjNiNTMzZDQ5MTE0Zg',1680101943,NULL),(146,1,1,'ZGRjNTk0MDIyZmFjNjNlMWM5MzljNjNlNGE0OGY1ZDA5NTkyNWU0NzA5MWNiNTNkZjkyYTUyYjFmNWNmZDk2Yw',1680103615,NULL),(147,1,1,'OGE1MjNiNjY1MzhjNDBjODVjNDBjZjlhMzE3NzVkNWZhOTcxODA5MjMyZWYxYTY0YjI0MTVmNjZmMmVlN2Y3Nw',1680103656,NULL),(148,1,1,'MDZkNDc0NzJjN2JiYWU0MTYzNDQ1MDE0NDYzMDQ3MTJiMjY2MmRlOTIyNWM2OWJiOTcwZGUxM2E4Yjg3MGEzOA',1680105244,NULL),(149,1,1,'MjVkODU4YjViZjBlMTRjOWVkNDFjMjBlNmViNWY0MDdkNTFlYjEzNTU1MzQxYmFiNTBkY2E2NDNlOTJlYzg3Yw',1680106996,NULL),(150,1,1,'NTcwNjQ5ZTBkZjA3Y2QwOTkxZjhkMzY2NGM1MjcwZjhmNjA4YjUzYmJhZjA1NDM5MmM1NzA3OGMxZGY5NDU1YQ',1680108544,NULL),(151,1,1,'YzZlZjRjMTI5NzNiMmVhYzZjYTM4ZGQ1YWMwYzllYjg2MDk1NmQwMzYzMDRhZmZmNjBhYjM2ZmQ1NDQyMDViMg',1680111784,NULL),(152,1,1,'Mzg1MjBiODIxMmY3MmNjYTQ1ZDZhMzc2OWM1OWYzNmYyZjM3NjZmMDUxZDEyNmU2YTBiNjg0MGMwNzE4ZGQ3Zg',1680111844,NULL),(153,1,1,'OGIzN2JmODBkOWQ4MzUwMjNiZGQ3MzZkMzBkNDJlYTE3N2YzNzA3MDU5YmM5OTFmYzFjOTVhYjI4NjA4ZWIzNg',1680112018,NULL),(154,1,1,'OWVmMGI2M2JiZjAyODQwMjJkM2E0YzE3MmZkOWMzYTMxY2YxOWFlMjBiMDRiYjc4ZTZiYTEyZWYyMjhjZDk1MA',1680115152,NULL),(155,1,1,'MmJhYzM1MTBhZmRlMTRlMzI3NTRmMGRjOWI2ZTZiNzk5YWU4NzcyNzBjZjg4NzFiNThiZTViNmE0NWMxMjUwMA',1680115359,NULL),(156,1,1,'YzQwOWZjNWQ1MDI1ZGU2YzU3NjY0ZmQ1YzZiZTU2OGY0OThjNGJlZWM5MjcxYzZlMzU5MzJiOWFlMzhjMWJkYg',1680118503,NULL),(157,1,1,'NmJjYWM2MjU4MmI0OWEyMDY3OGY5NTRlOWFkNDM5NmI1ZDRiZTg2ZGQ5MDIwYjQ1MmJiODY4MzJjMjA1MGE1Mw',1680121346,NULL),(158,1,1,'Zjc5YjE3YTAwZWJiNDhmZjY3MDVmOTBhZTFlYTQxMTNlMTQ1NDIyMDQ0MmUzOGEwNDg2ODE4NzQ1ZDhlODViYw',1680121820,NULL);
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `random_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_grant_types` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `description` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,'53ua0rznsug404ks8owkc00scw0c4gks0ckkw8gcs88kcg4g4g','a:0:{}','6azwiwe4wfk8oskkgsgw4skg8scgoc4kkw44004k8kww0c0oco','a:3:{i:0;s:5:\"token\";i:1;s:8:\"password\";i:2;s:13:\"refresh_token\";}','painelPronutrir');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5AB6875F37A13B` (`token`),
  KEY `IDX_5AB68719EB6921` (`client_id`),
  KEY `IDX_5AB687A76ED395` (`user_id`),
  CONSTRAINT `FK_5AB68719EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`),
  CONSTRAINT `FK_5AB687A76ED395` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` VALUES (1,1,1,'ZmMyYjY1OWU4MmZkMjAwMGQ0ZGRmNTg2Njk0NTk4MzFlZjBhYzRjYmJlODVmYzc2ZDU5ZDQ1MGFkY2JjMGNlMQ',1680271469,NULL),(2,1,1,'YTVlYWY0MWZjMTkyMzdiMzYzZjZlZWQwNTQ0NWU0MzhlZDRkNTJhNDZjZGZmZTAyM2Y1MDYyZDdiN2EyYzk0Mw',1680271974,NULL),(3,1,1,'ODc0Zjk4MTEzMTJhNTBiMDMxNmQxZjI4N2NiODI4ZWUzYWEzOGYwN2FkNTk0Yjc1M2FhNWFhOTE4YmZmYjIyNw',1680275863,NULL),(4,1,1,'YzQ4NGYwY2E2OTU1ZDdmMmNhM2UwZDI0M2ZmYmY0ZDZkZDA4ZDNkYTExOTIwMDA0ZjAxNTQ4ZDA2MDNiY2UxYg',1680275865,NULL),(5,1,1,'ODA3YzdlNWQ3MDFhYzIyYzU3ODAxMTVhMmFkZGNhNWZmNTZhNTY5ZWVkMjQ0MjkxY2UxYTZjNWYyMjA2Mjk3Mg',1680275868,NULL),(6,1,1,'MWU3YWJlOWNmMTUyMzZjYTcwMmUxZDUyMjFlYzA4ZDk2MWE5ZmQ1MjM4MTkwNmEzYTY5MDBmNjFiNjFhZWFkNw',1680276452,NULL),(8,1,1,'NDBjMzlmYzhiMDQyZjUxODAzZGRlN2FiMzhiNmRkZDhmMGFiNWQ2NDk0NTgzMjg4MTY5ODBlOWIxZTZmZjEyZQ',1680371352,NULL),(9,1,1,'NWUxNTNmMjA2Nzc4ODY5Njk3Y2EzYjAyNTk5MGQ2ZWEzNGMwYmJlODc5MmE3MGMxYzkzMWE3M2VjNjc2YzIyMw',1680371372,NULL),(10,1,1,'MzUyNzU2NWVlMjM2ZGEzNjFlMThkMGNhZmY4ZjAwNjFiZjllZThkNGIyNmM1YWI1ZTdiZmY0YjlkMWI5N2EwNw',1680371724,NULL),(11,1,1,'N2VhN2UzMmJlMzU2YWFmMjFiN2FhOGQwYTc1NWY0MjBjYWY5OWYwZmQ2MmYzYzMwNWMxYjIxYzU1NjJhNmZhZg',1680371760,NULL),(13,1,1,'YTM0YmFlZDE3YjllZDIwMTI0Y2VjNzQ2ZTMwYzU1MDYwNWYzMzA0ZDdlMjAyZmY1OGUyNjk4MWU4YzgxZmExNg',1680376751,NULL),(14,1,1,'MGY2ZmIxMmJlNzkzYmI4OTJjYjdmMTYxMTdjNzk2YzA5N2Y3MzRjYzQzYjZhNmI5N2M2MTE0ZmZjNzZkZDQ5Yw',1680452516,NULL),(23,1,2,'MmNlMTRjNWM4ODZlNWYzMWI2NDlhNjJlMDBlOGU4ODVmMTZkZWE0Mzc4NTQyM2M2ZDNiZWRmOWI2YTg4MThlZA',1680538233,NULL),(24,1,2,'NjAyODBhMjM1ZTI1YjIwZTNkYTJiMTYyY2Q2Zjg3NjgyNWViNTY5NDY0YjU1NzkxNzI3ZmFhZWM3N2VlNTIxOQ',1680538234,NULL),(25,1,1,'MWRhZTMzMmM5ZWU2YjBlMzI4YmIyZWU5ODk1YzljNmJiM2Y3ODg2Y2I1N2E3YmU2NmQzZWJiM2NjODIzZjY1Ng',1680538470,NULL),(26,1,1,'ZThlZWVkNTI2MTFkYTM4Y2RhNmVmNTk3OWJjZWU1ZDdhYjhhMjVkY2NlODM0NGNmM2FhY2ZmZmVmYjVlZjk0Zg',1680635013,NULL),(27,1,1,'MDZhMjAxMzU0NmM4OTRkNmQ2OTVkZmRkOWM2NTQ5MzY2ZWQ2ZGVlN2RhNDQ4OTczOWE3NTY5NTVkNTk0NjZkOA',1680640352,NULL),(28,1,1,'OTcxNTc2Y2EzOTU2ODMyZGYxMDZhNGRiNjBhYjRiZDY2YWFhYmJkMjdiMzZmN2FkNjQ1MWRjNWFiOWM4ZTJiNQ',1680640815,NULL),(33,1,1,'Y2MzZTQxYzliZmQyMmNhYmNkZGI4YWQxNzk2NTQ1NTYyZjAxODEyMjEzYTRhZWM1YWQwMGYwMTA4NGVhODRiMw',1680700366,NULL),(34,1,1,'Zjk2Y2I4ZWYwMTk4MGI0ZGMyMWY2NWI3OGI3Y2U0OWI4MjA3NTgzMmQzODYzZDk0ZTZiYTNjZWY5MWRhYzQ4ZA',1680700693,NULL),(35,1,1,'ZmVjNmVhODg3MTE3ODMzZjVhNWJjMTZhZWEwMjU0ZGNiNzQ1ZmZhYmRhMDJjODIxMTI2MDQxZDYxMmMwNWFkNw',1680702028,NULL),(36,1,1,'NDgzOGM5NTc1ZWI2ZTg2NTU2MDkzZTBlZmM2ZjNmNTVkOTg5OGNkZWM1MmQ5OTA4ZmU5Y2M5MzY0ODk0NTMwZA',1680702566,NULL),(37,1,1,'YjMxMzcwNjhkYjM2Y2E5MTc2ZGJkNWJjMWQyMDdjNjMyNDI0M2ViN2JiMzY4NDI2NWUxNzY3NGY5MGI0YjkxZg',1680705368,NULL),(39,1,1,'YjBiY2JlNjJhZDYxODY1ZmZjODk1ZTE0YzliNTZkMTRmNGFiMjRjNzgzMTk4ZGMxYzI5Zjk4YzdhNzMxYzg4ZQ',1680723978,NULL),(40,1,1,'Njc1YTQ2NmMxMDM4MjZkMzI1NmM3MmU2YTEwODA2MWIxNjVmNzQ3ZTVmYzYxZjYzNmI3NzY2NTZkMDVjNmMwMQ',1680724435,NULL),(41,1,1,'YTY2NDM4ZDMzOGRmMmI1NWQyYTlkYWFlYjgxZjQyNjk0N2FlMjgyOGM3ZGUzOWEzNmNlYzFjMGMwODZkZDQ3Mw',1680726807,NULL),(42,1,1,'NjZjYjRhNWRkMzM4YjM2MmY1YjdiMDQ1MWZhNThiMDg2NDRjYWYwODY4NGIzNDRiZDhhNjQzOGI1ZDFiZGM2Nw',1680726881,NULL),(43,1,1,'ZmZlNGQyYjFmOTkyYzc5NTllMDMxZjFiM2NmM2Y4M2RiYWZkMGNjY2VhNzQyYzIxNzFmODI5OGVhNTkzZWQwZg',1680727099,NULL),(44,1,1,'MDM2MWViNzcxNWY2ODc1ZTgzODYyZTExZjQ0NzA2YWNkYmZjNjVjY2VlMDUyODJlNTE1NGJkMDFiMTg0ODE0NQ',1680727689,NULL),(45,1,1,'MzE0M2NjNjFiMjM1MDYwOTc4MWNiMWM1MmE1ZTlhMTliMjdlNzYyYmM3OTQzNTE2YjU4YTIxMzNkZTJjNTBhNw',1680727826,NULL),(46,1,1,'MDY2MDliNTc3YjZiODAzMTE3MjEwYTA3MWJlMzcyYTA4MWZkNDcwNjUwYTAyMGVkN2ZjYjVkYWVkMmZiMGJhOQ',1680728005,NULL),(47,1,1,'MWUxYzdiZWViZWUxMWIwMDZlNGVkYjRmYmYxMWJkNjU4MjI1ZGMzZWIzYTllM2FhY2MwZTVkMzlkOTRmYTliNw',1680728093,NULL),(48,1,1,'MmRkNDE0NmNiMzQ2ZDA1YzI0YTNjZDc3NTkxYjA0NzQ5ZmU0NTA4MWRiZDAzNGIwYjUzNzAwNTNlMDA0YjQ5Ng',1680728506,NULL),(49,1,1,'NzVhYmE4ZTBjZmM1ZGU1Mjc2OWEzNzE0OTc0MTZjNGViY2M3YWU1N2JlMTc2NTE2Nzk3YjJjYTRkM2NiYWQzNw',1680728566,NULL),(50,1,1,'NmUzMTE3NTdkYjYwMTJmZGY4MDA2MTI5NWRjOWI0M2VlMWQ4NzUyYzkxN2E5NTA4NzJmMDIxZDE3YzA2ZmFiMQ',1680728698,NULL),(51,1,1,'NzRmMmQxZjgyYjViMzljZmEzZTNjYjQwOWE3MDRlYjI3ODY4NmNmNDJmNmM3MGVmNmYwYzk4MGY5N2VhZDNhOA',1680728719,NULL),(54,1,1,'MDhhMjc3OTY0MzJkMGI4Njg2ZjFlYTZlY2QxODYxZmQxNTRkMWVlOTEyMGU0ODJhZGQ0MzcyODRhOTI4NDZjZg',1680781548,NULL),(55,1,1,'OTI2Nzk5MDVmM2UzYTBkODVmNmVjZGYyYmJkYjkxZDg2YzU0Zjc5MzdkNGM0NGNkY2JkZDE2NzE3ZDIwZTA1Zg',1680782359,NULL),(57,1,1,'MmJlYjJjN2E4MWVmYTAzZTQ0MWJlOTZkZDk0Yzg1ZjM4ZTI3ZWNhNmMzZjkyMzRkNWFiZjJjOTE5NzEwNTYzNg',1680785039,NULL),(59,1,1,'ZjY5Y2E0OWY5YjZlMTVkMTU3ZjJkMzdjZDdhNzg4MDI2MGUyODE0Y2MzNWQyMGY4ZTU4YjgxNWY1ZGEzNTk2ZA',1680789702,NULL),(61,1,1,'NWY3ZjAwNmNiZjYxMmNjNDE4N2FlYmI5MzBmMDAyMDhiMWY4NGI4ODNkYzg1YTVkYzQwYjQwZTM0NGU1NGJhZQ',1680793190,NULL),(62,1,1,'YjNhOThiNDE2NGNlMTNmMmYwMzQyN2RmMmQ1ZjQ4NjI5M2NjNTA5NDNiMjU2YWZjOTYyYzM0MWY4ZWYxMjM3YQ',1680798472,NULL),(63,1,1,'YjVjNzVkMzAzZDc4M2M0YmVkMDg4OGMwMmUyMGYwOTBjY2Y1MWNmYzdhZDg3ODlmOTZlMzBlZWE1YjRiYzZmNA',1680802598,NULL),(64,1,1,'YjM4NmRhMTU3NzY0MjQ4NDNlZWZlOWQ0NDhmMTA2Y2EwZGY3YjdkMjQ5MmM4YmZiMDBiMTg0ODU1MzcwOTE0MA',1680809230,NULL),(65,1,1,'MmZkZjk5YjU3MzAwMDdiOGQ4ZGI5NmViMTc1ZGJmYTdiZGQxYmQ3ZjFiOWNlYjZlODU4ZjZkMjY4M2FlODVlNg',1680811626,NULL),(66,1,1,'MjlhZjE1NDhkZTBiN2U2YjI3Nzk2ZjU3OGNmZTgyNTVkYjg5MGE0NDEwMDgxYTA4M2VlM2YzYWIxNGU5NjAwZg',1680811939,NULL),(67,1,1,'ZTg5MjAyYmFiOGJmNzRlNjdiZDFiN2YwNDE5MTEwZjkwNmRkYmEyYmI0Y2MwNzEwNjY1YjRjNjFlNDI3NTkzYQ',1680812006,NULL),(68,1,1,'N2QzNmJmNzNhYTk0ZTFjMGNiYThjMWI4MzIwNzA2NmViNGQ4MGNjMjNmMjVkZGQ2MmNjNDIyM2ZlZDZiZGVlNA',1680812078,NULL),(69,1,1,'OTliOGE0MWZhNDY2YjdkZDRjNDFmNjA4NzM1MzMwNmFjNGJjMDU5NDhhNmEwN2M5MzRlMDIwYTNjOWJiNmUxYQ',1680814615,NULL),(70,1,1,'NDBhOGE1NzhhZGI1NmEzOTM3OGZlYzE1YWM1MmYwMDk5YWIwMDQ3OWRhZWIxNjg3OGI1M2M3MjAzNDE1YTc0MQ',1680816099,NULL),(71,1,1,'MTVlMWQ4ZTY4NTE1NTQ1YTkyMTk2YjZiNGNjODZjNjc1MjYxNGY5MWZiZWY2ZmY4ZjIzNDg5YjI2OTgyMmMyNA',1680816180,NULL),(73,1,1,'NTFlZjNiMDM4ZTgzNWU2MmE0MDEyZTE4YzNjNTFkZDg0M2QzMjU3NzQzZTUxNDZmYWVmNTk3NjY5ZTU2Y2U2OQ',1680816351,NULL),(74,1,1,'YjViYzMwMDYzMTUzMTExNzFhMjhhYjBhMjI4ZGM2MTUxMzRkODQ3MTE5NjhlYjRhM2U2ZjU3YzY2MGJkNDZjMQ',1680816426,NULL),(77,1,1,'ZDNiNGM1MWYyNjEzY2U4M2M3ODBhNGFlNWQ5NzY0ZmVjNzlhMWZhNWJiNWRjNTAwYzJjZTc5NzE0ZmFhNjg2ZQ',1680867609,NULL),(78,1,1,'MzUwMDM2ZWVkMWNlNjVjNzlkZmNjMzZmNjI2YWQ5MzNlNzE0ZTNjZWI4YTg2MTMzNTRkNWVhZjVlNjk4MDk2OA',1680868022,NULL),(79,1,1,'NzRhOGU0NGJhYzFkZjZlMjc2M2U0ZTdhYTUxMzU3ZGI5Nzk2OTc0ZTRjMWUxN2JmMDkzNmM0NzhhMTdjYTU2Zg',1680868092,NULL),(81,1,2,'YTg0MDI1ZTA0YWU5ZTE2ZDU1MTQ1MDIzZTQ5YTExZDk3MmMzOTBlOWQyMjA5NTg2MTZiYmI1NGNjNTQ0NTkyYg',1680873988,NULL),(82,1,1,'NTc3OThjYTRiNWYyZDA2ZmU5ZjFiY2M0ODc0NTg3ZTc0OGJjN2FjYmFhNjFmYTQ5YmI2YzYwMTk1ZjRkN2FjZQ',1680874567,NULL),(85,1,1,'YTEyMzYwNDgxYjQzMGUzNDUwNzMwYTUzMjQwY2M0N2UxYTFjZThhZDExZDk5YmU5ODZmY2Y5YmJmNTAyNDhmZg',1680878475,NULL),(87,1,1,'ZDA2ZDdhOGM0NTEwMzI1MjAzZWQ4YjY5YzliMDI0MTBkNjc0YTEyYzcwOTU2NTBlYjYxMjM0YWQxZDI2ZjZmMw',1680882077,NULL),(88,1,1,'NTUxYTczM2E1OTY2YjY3N2ZhZjBlNmU4Y2FkYTkwNDI4MTE2Yjk4NzA0N2E4ZGI0NGQxNzNhZDdkMGQ1NjVlNA',1680882429,NULL),(89,1,1,'MTk3ZGUzOGUxNTBlYmI2YjY0NzQ3ZTU4MzQ0NzE2NWJlZDk2OGM5ZDYzMjJhYzdjYmM3YzdkZjVhNTMyMzY5NQ',1680882431,NULL),(90,1,1,'NjJlODg5ZjUyODY3NGZmYzRjZDdiZjE1ZGI1ZTc1MzAxNDIxNDMwOThlYTgzNGUwNzdmYjQ1MDkyZGJhNTE3ZA',1681127853,NULL),(91,1,1,'Y2FmNGJhYmZjZDcyZjE0OTY4ZWM2NzA2NWZjOGI0OGU1OTEzNzBjMWRmYTBmYjM0Y2ZjMjdhZDZiMzA1ZGU0NQ',1681128960,NULL),(94,1,1,'NjE3NDgwNjkxNzYyZjExNTAyYzA2NjkzMjgzZmQ0NzI2OGMxOTIxMjQzOTFjOGU0NTljZWU3NjZmNmEyMzZhZA',1681149712,NULL),(96,1,1,'MWE0ZTBmNGE2NTljZjg4NzM2NTg2Njk5OGI2NGRmY2QwMjg0ZDk0NDMxMjZhYTlmMTUxOThiYmI5ZGM5NTBiMg',1681153033,NULL),(98,1,1,'OGE0OWMzMGU1M2JlMDI2MzQ1MjMwYmQzMDMwMzkzMWZlNWJmNzYzMmVmNWUwOGQxYTFjZWIyNWU2ZjJjZmU3Yw',1681157471,NULL),(99,1,1,'N2Y1MzViYzJjNjQ2MTVmZTc1OGQ5NmZjYzAzOThiMjY1OTNjYWFhOWM0MjJlODIwNjc0OTk4NzVkOWRkMjIzMg',1681211941,NULL),(100,1,1,'OWY1ZjEyODU4NDcyZWVkMzYyYzY1MGM4ZDJiN2QzOGI1ZWI4ZWQwMjk1NzczYzMwODczNzJhZmNmYzliODg5OQ',1681212595,NULL),(101,1,1,'MzdiNWI1YmU3YmUxOTBmYzIyOTY5MDg2YmZhNjk2ODdjNDAwY2FmZGM5YWRiMzBhNzk5MWYxMTZhYzdjN2M5NQ',1681213510,NULL),(102,1,1,'ODkwZjEyZmYyMDY3MGM4Mzk4MmJhYTQ5OGQ2ZTc5YTI5YjgzNzY4NDg3OTUyZDI4YWQyNzE5MTA5MTU0MmVhYw',1681213519,NULL),(103,1,1,'ODllYTFiNjQ1NzE1YmNmYjM4MjQxYmE1Y2YwZTZiZDIwYjE2MjdiNzlmMGVhYmRkM2JjY2ZiNDg0MTVlMTQzNg',1681215708,NULL),(104,1,1,'OTE2YTBiYTkzMjhhN2Q1ODkxMzNiYTk1NTI0OWM5YmVlMjM1ZjUyZjMyMDE0YTQyYzEwNmZkYjM5MGI3MGUyYw',1681215729,NULL),(105,1,1,'NmZhODllYmY2OTI0NmZhNGYzODkyY2E3N2E5NWVjZTFmMjc5ZjdlNGE2ZGE5ZjkyZTM5Y2VkZGUxMzk0MzhkOA',1681215741,NULL),(107,1,1,'NTI3ODI0NDk0MzQ5ZDYwZDMyMWRkZTBiMmEzZDdlYWU0ODk0YWQwMmUxMTRkYjMxZWJlNTBjMTg3ZWE0YjZjZg',1681215838,NULL),(109,1,1,'MTk0ZjJjZTI5M2U1MDFmNjY3ZTExZTlmNTA1YWQ2M2JiYzUwMzUwNjhlODEzYjk1Y2ViOWQ5Nzg4MDkwOTZmYQ',1681219121,NULL),(110,1,1,'YTBmNmYzNDI3N2U2ZmE0N2M2N2Q3ODU0NTY2YzQxNGU3ZmIzZGUwYTExZDI3MTRiMjQxMDI2MGVkZWUwNDc1OQ',1681222368,NULL),(111,1,1,'NDc4NTMyNWVjYTcyZmIyYzQxOTA5MTg3ZGVjYzE1ZjFlMWE2NDNjZDc3MzE4MzNhNjYzMTJkZjM1MTUyYmUxNg',1681222525,NULL),(113,1,1,'ODE5MDM3ZDY1YzQ1MDBmODhiYzZlZWQ5NDUzMjdjNWM0YmM5MjFmZTMwZDUyYmE2ZDQxNTU3YmJmMzA1YTVjYQ',1681222652,NULL),(116,1,1,'NzE0M2JjNDhhNTgxYTFhZTYyNmQ0NDE5ZTljYzE4MjhlYjI2OGZjZjkxNmJmYzAyYzM2YmZlODlkMmQ0ZDM3MA',1681232585,NULL),(117,1,1,'ZjlkYWI3NmM5Y2FmOTNiNTgxNjExYWMyNDljYTcxZDcyZTNkZmE3ZTBiNTExNjJjMTdiY2ViNDg1MDFiMjQ1Ng',1681238662,NULL),(118,1,1,'Yzg1MWY2ZjhhNWYyNTVjMWVjODI4NGUwOGMyMDA0ZTdiNmNiZjhkNGE3MTUwNTlmNmZmYmM1N2NmZDZlZTE2MA',1681238729,NULL),(119,1,1,'NWU1MWViNTQyZTQ3Y2QxZGVjMTQ0ZTI2MTVjYjQxMGMwMWI3ODZmM2FmM2Q4ZjYwMWU4MzFiNGZhZWM3NzllNw',1681238904,NULL),(120,1,1,'NGZmZWE3ZTkwODFhYjhhNDE2ZGJhMTAzZTNjNzQzMTg2OGU5MDBhNTJjOTQ4ZDViNGM2MzFjOTYyMTQyNDlmMA',1681238954,NULL),(121,1,1,'OWJkZGJmMjA5ZjEwYjZkNDNkYTUxYTJmNzFhMzg4ZTI5ZmVkMzNlZTIxZDRhZDY2NjY5MzhmNTNlNmNhNzliZg',1681239120,NULL),(122,1,1,'ZTdhOGJkNWQ5OTU1NzMzNTZiODcwNmFlMDg2ZWE2NDE1ZjMyM2RhZGQyNzY5ZmJjY2IzOWU4OGVjNDcwMzc0YQ',1681239202,NULL),(126,1,1,'YjQ2NTM2MGY1YWU0MDBmNzY2MzJkNzY0Zjc3YjdhMWUyZGJkMzk3ZjM2YjNlODIxZjNhYmRmMjg5YjgxYzQ4MQ',1681243695,NULL),(127,1,1,'MDg5ZjEyY2FiNDFlNzE0NWI2YjU4NzVkNTUwMWU4MzNhNzZkMGY0NzM4ZmM3NTdkZmE2ZGFjYzNkNDZhZmEzMQ',1681245809,NULL),(129,1,1,'Njc5ZjcwOTJiNDMzYmYxODRkZWI5NzQ5MmQzZGNmZTdiZDYxYjkyY2E2MTEwZTQ0MjYxYjcxMGQ5NjQ1YjI3Ng',1681297380,NULL),(130,1,1,'MDY3NWRiZWYyNWU5ZGUxZThmNWJmZDI2MzJlZDIxZTE2NjhiMzBkYTVmODBjODViYmNiM2U0YjUxOGQ4MjEwNw',1681297393,NULL),(132,1,1,'MmJiNDFhMzdiNGRiZjkwN2IxYThmYzlkY2FjOGQ4YWM2NDgzYWRhMWViY2E2OWQyMzQxMzk3ZGE3YzUzODIwYw',1681300352,NULL),(133,1,1,'YTJmOWU5Y2I4MmFkNGJhMTljNWY4MDdlMWExY2NkZGZhMDc1MTc5NDQ3MGI2NDM2OGQ2NzJmYzg2ZGQxMjJhMA',1681300431,NULL),(134,1,1,'YmExZTNiMGFiOGYzYjUyMWVlMDdlNGMyODUwNTFhZGQwN2YwNjViOWUzODMzZmZiNzU4YjBlZjAzYjhhODkxYw',1681300540,NULL),(135,1,1,'YTNlYTQ4M2Q0NzRlMDQ3OTMyOWQ2OWNjYWEzMGE1ODMwOTE2MmZmOWRkNjA5ZDc1Y2IyYzIyYjU0NjljNjg5Zg',1681300675,NULL),(136,1,1,'NjdjZGRlZGFmNWJhNjg0MzgxMGQ0MTNiZGE4MDI2Nzk0ZjQ2MDU1NTA4ODRiYWRjYWMzOWQxZGE0NTI4ZGQ1Mg',1681300697,NULL),(137,1,1,'MzlmNzcxYTliNGNkMmNjOGUyNTRhMjcwMTcyMDJlM2NiNDM5ZmJkZmM2ZjE4OTdiZjc0YTY5N2U3NzE4ZGEwMg',1681300719,NULL),(138,1,1,'YzM2M2NhNDRkMDE0MTEwNzkwOWJhMmUzYzcyNjMzMWM1YzcwNmExM2FjY2UyMDExMjRhMzFjNGQyMzE5Zjg4NA',1681300949,NULL),(140,1,1,'OWVlYmE5MjlkZjcxNDRmMmJkOGVhZDVjNTI0YmMxMjA3ZDM4MzQ2Y2FlZWY3MzkyNDRiOTVhMGY1N2FiNmYyMg',1681302057,NULL),(141,1,1,'OGUzZjBiYTkyOWRmZjU3YzM3MzdlYjc4OWE2OWZmNTk4YTY1N2NiNGUzMGExYzEzMDJjMWYyZjhiZDhmNTdjMg',1681302057,NULL),(144,1,1,'OGRlNDRjYzY3ZWNmMmM2YzE1YjA2YmM5Y2NjNDhlYmYzMThmNDcxZjQyZjdjNTQzNWQ1YjE2OTRlZjgxOTg1MQ',1681305367,NULL),(146,1,1,'N2E2YmQ2MDY0ZDczNDZiMDIwN2ZmYzcyNWRjMGQyZGM5MjczNjFiNTc5MThiYmQ2ZTFkYzA2MGI4NjIyZTdjMg',1681309615,NULL),(152,1,1,'NzUyMGQ3YzRjYjYwMzU0NDczMTg0MmMyNTFjZjRhYmM0ZTAzZWEzMjY4NTU2NjE4MWVlZWQ3NGZmZmZkODJlNA',1681317844,NULL),(155,1,1,'NDBkNDMzZDk2NzA1MDA2ZDBhOWYxNGE3YjhhNjBkOTEwMjY3MTI1M2QxODEwNGUwNWQwNTE0ZjEyZTQ0ZmFlYw',1681321359,NULL),(157,1,1,'OWYwY2I4MWIzNWZhNTUyNDY3NTQ2YTU3MmYyYjU1M2U4NTVkZTVhMzYyZTkzYWY3ZTQ0OWFiNjMyMGU2ODJkOA',1681327346,NULL),(158,1,1,'MzA4ZjRlOGQ2ZTBjZWY4MDNjZThhOGE4ODFhOTg0OWM1MmRmOGY0OWQxMDEyNzQzOGRmZDZmODI2NDExYTVmNg',1681327820,NULL);
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paineis`
--

DROP TABLE IF EXISTS `paineis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paineis` (
  `host` int(11) NOT NULL,
  `unidade_id` int(11) DEFAULT NULL,
  `senha` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`host`),
  KEY `IDX_CE58BF05EDF4B99B` (`unidade_id`),
  CONSTRAINT `FK_CE58BF05EDF4B99B` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paineis`
--

LOCK TABLES `paineis` WRITE;
/*!40000 ALTER TABLE `paineis` DISABLE KEYS */;
/*!40000 ALTER TABLE `paineis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paineis_servicos`
--

DROP TABLE IF EXISTS `paineis_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paineis_servicos` (
  `host` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL,
  `unidade_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`host`,`servico_id`),
  KEY `IDX_D98415D3CF2713FD` (`host`),
  KEY `IDX_D98415D382E14982` (`servico_id`),
  KEY `IDX_D98415D3EDF4B99B` (`unidade_id`),
  CONSTRAINT `FK_D98415D382E14982` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`),
  CONSTRAINT `FK_D98415D3CF2713FD` FOREIGN KEY (`host`) REFERENCES `paineis` (`host`),
  CONSTRAINT `FK_D98415D3EDF4B99B` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paineis_servicos`
--

LOCK TABLES `paineis_servicos` WRITE;
/*!40000 ALTER TABLE `paineis_servicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `paineis_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `painel_senha`
--

DROP TABLE IF EXISTS `painel_senha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `painel_senha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servico_id` int(11) DEFAULT NULL,
  `unidade_id` int(11) DEFAULT NULL,
  `num_senha` int(11) NOT NULL,
  `sig_senha` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `msg_senha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `local` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_local` smallint(6) NOT NULL,
  `peso` smallint(6) NOT NULL,
  `prioridade` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome_cliente` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `documento_cliente` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_390182E682E14982` (`servico_id`),
  KEY `IDX_390182E6EDF4B99B` (`unidade_id`),
  CONSTRAINT `FK_390182E682E14982` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`),
  CONSTRAINT `FK_390182E6EDF4B99B` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `painel_senha`
--

LOCK TABLES `painel_senha` WRITE;
/*!40000 ALTER TABLE `painel_senha` DISABLE KEYS */;
INSERT INTO `painel_senha` VALUES (67,2,3,1,'C','','Guichê',1,0,'Normal',NULL,NULL),(68,2,3,2,'C','','Guichê',1,0,'Normal',NULL,NULL),(69,2,3,3,'C','','Guichê',1,0,'Normal','williame correia de lima','159654789'),(70,2,3,4,'C','','Guichê',1,0,'Normal',NULL,NULL),(71,2,3,5,'C','','Guichê',1,0,'Normal',NULL,NULL),(72,2,3,6,'C','','Guichê',1,0,'Normal','PAULO LOPES','123456'),(73,2,3,7,'C','','Guichê',1,0,'Normal','CLIFF DE JESUS','123456852'),(74,2,3,8,'C','','Guichê',1,0,'Normal',NULL,NULL),(75,2,3,9,'C','','Guichê',1,0,'Normal','tiago moreira da silva','987654'),(76,2,3,10,'C','','Guichê',1,0,'Normal','williame correia de lima','01'),(77,2,3,11,'C','','Guichê',1,0,'Normal','tiago moreira da silva','03'),(78,2,3,12,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(79,2,3,13,'C','','Guichê',1,0,'Normal','cliff de jesus morais','04'),(80,2,3,14,'C','','Guichê',1,0,'Normal','david morais de oliveira','05'),(81,2,3,15,'C','','Guichê',1,0,'Normal',NULL,NULL),(82,2,3,16,'C','','Guichê',1,0,'Normal','williame correia de lima','01'),(83,2,3,17,'C','','Guichê',1,0,'Normal','williame','4645654656'),(84,2,3,18,'C','','Guichê',1,0,'Normal','williame','4645654656'),(85,2,3,19,'C','','Guichê',1,0,'Normal','FRANCISCA BARROSO PONTE','1937-11-03T00:00:00'),(86,2,3,20,'C','','Guichê',1,0,'Normal','ANA LETICIA DE PAULA LOPES RIBEIRO','1982-02-11T00:00:00'),(87,2,3,21,'C','','Guichê',1,0,'Normal','MARIA ROCHELLE SARAIVA NOGUEIRA','1988-12-14T00:00:00'),(88,2,3,21,'C','','Guichê',1,0,'Normal','MARIA ROCHELLE SARAIVA NOGUEIRA','1988-12-14T00:00:00'),(89,2,3,22,'C','','Guichê',1,0,'Normal','VILMA FREIRE BELMINO TEIXEIRA','1960-05-27T00:00:00'),(90,2,3,23,'C','','Guichê',1,0,'Normal','JUSSARA DUARTE VIEIRA','1964-07-28T00:00:00'),(91,2,3,24,'C','','Guichê',1,0,'Normal','JOCELYNDA MARIA CAVALCANTE CARVALHO','1952-08-01T00:00:00'),(92,2,3,25,'C','','Guichê',1,0,'Normal','JOSE ANDERSON FREIRE SANDES','1954-10-21T00:00:00'),(93,2,3,26,'C','','Guichê',1,0,'Normal',NULL,NULL),(94,2,3,26,'C','','Guichê',1,0,'Normal',NULL,NULL),(95,2,3,26,'C','','Guichê',1,0,'Normal',NULL,NULL),(96,2,3,26,'C','','Guichê',1,0,'Normal',NULL,NULL),(97,2,3,26,'C','','Guichê',1,0,'Normal',NULL,NULL),(98,2,3,26,'C','','Guichê',1,0,'Normal',NULL,NULL),(99,2,3,26,'C','','Guichê',1,0,'Normal',NULL,NULL),(100,2,3,26,'C','','Guichê',1,0,'Normal',NULL,NULL),(101,2,3,27,'C','','Guichê',1,0,'Normal','williame correia de lima','01'),(102,2,3,27,'C','','Guichê',1,0,'Normal','williame correia de lima','01'),(103,2,3,27,'C','','Guichê',1,0,'Normal','williame correia de lima','01'),(104,2,3,27,'C','','Guichê',1,0,'Normal','williame correia de lima','01'),(105,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(106,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(107,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(108,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(109,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(110,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(111,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(112,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(113,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(114,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(115,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(116,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(117,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(118,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(119,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(120,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(121,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(122,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(123,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(124,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(125,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(126,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(127,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(128,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(129,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(130,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(131,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(132,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(133,2,3,28,'C','','Guichê',1,0,'Normal','paulo lopes da costa junior','02'),(134,2,3,29,'C','','Guichê',1,0,'Normal','MARIA NEUMAN ALBUQUERQUE VALENTE','1945-12-24T00:00:00'),(135,2,3,29,'C','','Guichê',1,0,'Normal','MARIA NEUMAN ALBUQUERQUE VALENTE','1945-12-24T00:00:00'),(136,2,3,30,'C','','Guichê',1,0,'Normal','JOÃO CRISOSTOMO SOARES','1965-01-27T00:00:00'),(137,2,3,31,'C','','Guichê',1,0,'Normal','LEONILDA GALVANI CAVALETTI','1941-06-13T00:00:00'),(138,2,3,32,'C','','Guichê',1,0,'Normal','ED LUCIO OLIVEIRA DE ARAUJO','1971-11-01T00:00:00'),(139,2,3,33,'C','','Guichê',1,0,'Normal','LIDUINA NOGUEIRA DE FIGUEIREDO FELIX','1983-02-21T00:00:00'),(140,2,3,33,'C','','Guichê',1,0,'Normal','LIDUINA NOGUEIRA DE FIGUEIREDO FELIX','1983-02-21T00:00:00'),(141,2,3,33,'C','','Guichê',1,0,'Normal','LIDUINA NOGUEIRA DE FIGUEIREDO FELIX','1983-02-21T00:00:00'),(142,2,3,33,'C','','Guichê',1,0,'Normal','LIDUINA NOGUEIRA DE FIGUEIREDO FELIX','1983-02-21T00:00:00'),(143,2,3,33,'C','','Guichê',1,0,'Normal','LIDUINA NOGUEIRA DE FIGUEIREDO FELIX','1983-02-21T00:00:00'),(144,2,3,33,'C','','Guichê',1,0,'Normal','LIDUINA NOGUEIRA DE FIGUEIREDO FELIX','1983-02-21T00:00:00'),(145,2,3,33,'C','','Guichê',1,0,'Normal','LIDUINA NOGUEIRA DE FIGUEIREDO FELIX','1983-02-21T00:00:00'),(146,2,3,33,'C','','Guichê',1,0,'Normal','LIDUINA NOGUEIRA DE FIGUEIREDO FELIX','1983-02-21T00:00:00'),(147,2,3,33,'C','','Guichê',1,0,'Normal','LIDUINA NOGUEIRA DE FIGUEIREDO FELIX','1983-02-21T00:00:00'),(148,2,3,33,'C','','Guichê',1,0,'Normal','LIDUINA NOGUEIRA DE FIGUEIREDO FELIX','1983-02-21T00:00:00'),(149,2,3,33,'C','','Guichê',1,0,'Normal','LIDUINA NOGUEIRA DE FIGUEIREDO FELIX','1983-02-21T00:00:00'),(150,2,3,33,'C','','Guichê',1,0,'Normal','LIDUINA NOGUEIRA DE FIGUEIREDO FELIX','1983-02-21T00:00:00'),(151,2,3,33,'C','','Guichê',1,0,'Normal','LIDUINA NOGUEIRA DE FIGUEIREDO FELIX','1983-02-21T00:00:00'),(152,2,3,33,'C','','Guichê',1,0,'Normal','LIDUINA NOGUEIRA DE FIGUEIREDO FELIX','1983-02-21T00:00:00'),(153,2,3,33,'C','','Guichê',1,0,'Normal','LIDUINA NOGUEIRA DE FIGUEIREDO FELIX','1983-02-21T00:00:00'),(154,2,3,34,'C','','Guichê',1,0,'Normal','JOSÉ RIBAMAR CHAVES','1943-06-05T00:00:00'),(155,2,3,34,'C','','Guichê',1,0,'Normal','JOSÉ RIBAMAR CHAVES','1943-06-05T00:00:00'),(156,2,3,34,'C','','Guichê',1,0,'Normal','JOSÉ RIBAMAR CHAVES','1943-06-05T00:00:00'),(157,2,3,34,'C','','Guichê',1,0,'Normal','JOSÉ RIBAMAR CHAVES','1943-06-05T00:00:00'),(158,2,3,34,'C','','Guichê',1,0,'Normal','JOSÉ RIBAMAR CHAVES','1943-06-05T00:00:00'),(159,2,3,35,'C','','Guichê',1,0,'Normal','MARIA JOSE FERREIRA DOS SANTOS','1953-12-18T00:00:00'),(160,2,3,36,'C','','Guichê',1,0,'Normal','MARIA DA CONCEIÇÃO ALVES DE LIMA','1969-03-10T00:00:00'),(161,2,3,37,'C','','Guichê',1,0,'Normal','SILVANA MARY LIMA DA SILVA','1958-05-02T00:00:00'),(162,2,3,38,'C','','Guichê',1,0,'Normal','FRANCIMEIRE LOPES DOS SANTOS','1969-06-16T00:00:00'),(163,2,3,39,'C','','Guichê',1,0,'Normal','AFONSO JOSÉ MENDONÇA','1962-09-17T00:00:00'),(164,2,3,40,'C','','Guichê',1,0,'Normal','LUCINEIDE LOPES GUEDELHO','1960-08-10T00:00:00'),(165,2,3,40,'C','','Guichê',1,0,'Normal','LUCINEIDE LOPES GUEDELHO','1960-08-10T00:00:00'),(166,2,3,40,'C','','Guichê',1,0,'Normal','LUCINEIDE LOPES GUEDELHO','1960-08-10T00:00:00'),(167,2,3,40,'C','','Guichê',1,0,'Normal','LUCINEIDE LOPES GUEDELHO','1960-08-10T00:00:00'),(168,2,3,40,'C','','Guichê',1,0,'Normal','LUCINEIDE LOPES GUEDELHO','1960-08-10T00:00:00'),(169,2,3,40,'C','','Guichê',1,0,'Normal','LUCINEIDE LOPES GUEDELHO','1960-08-10T00:00:00'),(170,2,3,40,'C','','Guichê',1,0,'Normal','LUCINEIDE LOPES GUEDELHO','1960-08-10T00:00:00'),(171,2,3,40,'C','','Guichê',1,0,'Normal','LUCINEIDE LOPES GUEDELHO','1960-08-10T00:00:00'),(172,2,3,40,'C','','Guichê',1,0,'Normal','LUCINEIDE LOPES GUEDELHO','1960-08-10T00:00:00'),(173,2,3,40,'C','','Guichê',1,0,'Normal','LUCINEIDE LOPES GUEDELHO','1960-08-10T00:00:00'),(174,2,3,40,'C','','Guichê',1,0,'Normal','LUCINEIDE LOPES GUEDELHO','1960-08-10T00:00:00'),(175,2,3,40,'C','','Guichê',1,0,'Normal','LUCINEIDE LOPES GUEDELHO','1960-08-10T00:00:00'),(176,2,3,40,'C','','Guichê',1,0,'Normal','LUCINEIDE LOPES GUEDELHO','1960-08-10T00:00:00');
/*!40000 ALTER TABLE `painel_senha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfis`
--

DROP TABLE IF EXISTS `perfis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modulos` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:simple_array)',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfis`
--

LOCK TABLES `perfis` WRITE;
/*!40000 ALTER TABLE `perfis` DISABLE KEYS */;
INSERT INTO `perfis` VALUES (1,'Guichê','atendimento Guichê','novosga.scheduling,novosga.attendance,novosga.reports,novosga.triage','2023-03-17 16:42:52','2023-03-17 16:43:56'),(2,'Quimioterapia','Quimioterapia','novosga.scheduling,novosga.attendance,novosga.monitor,novosga.reports','2023-03-17 16:51:41',NULL),(3,'Impressoras','Impressoras','novosga.triage','2023-03-17 16:52:03',NULL);
/*!40000 ALTER TABLE `perfis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prioridades`
--

DROP TABLE IF EXISTS `prioridades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prioridades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peso` smallint(6) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prioridades`
--

LOCK TABLES `prioridades` WRITE;
/*!40000 ALTER TABLE `prioridades` DISABLE KEYS */;
INSERT INTO `prioridades` VALUES (1,'Normal','Normal',0,1,'2023-03-16 18:03:32','2023-03-17 17:06:10',NULL),(2,'Gestantes','Gestantes',10,1,'2023-03-16 18:03:32','2023-03-17 17:04:12','2023-03-17 17:05:27'),(3,'Prioriodade','Prioriodade',1,1,'2023-03-17 17:06:35',NULL,NULL);
/*!40000 ALTER TABLE `prioridades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos`
--

DROP TABLE IF EXISTS `servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `macro_id` int(11) DEFAULT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `peso` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_89DD09E3F43A187E` (`macro_id`),
  CONSTRAINT `FK_89DD09E3F43A187E` FOREIGN KEY (`macro_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos`
--

LOCK TABLES `servicos` WRITE;
/*!40000 ALTER TABLE `servicos` DISABLE KEYS */;
INSERT INTO `servicos` VALUES (1,NULL,'Atendimento Psicologia/Nutrição','Atendimento Psicologia/Nutrição',1,1,'2023-03-17 16:10:42',NULL,NULL),(2,NULL,'Consulta','Consulta',1,18,'2023-03-17 16:11:08',NULL,NULL),(3,NULL,'Retirada Infusor / Medicamentos de Suporte e Oral','Retirada Infusor / Medicamentos de Suporte e Oral',1,6,'2023-03-17 16:33:19',NULL,NULL),(4,NULL,'Tratamento / Medicações','Tratamento / Medicações',1,6,'2023-03-17 16:33:39',NULL,NULL);
/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos_metadata`
--

DROP TABLE IF EXISTS `servicos_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicos_metadata` (
  `namespace` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `servico_id` int(11) NOT NULL,
  `value` json NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`namespace`,`name`,`servico_id`),
  KEY `IDX_8E8BF0E482E14982` (`servico_id`),
  CONSTRAINT `FK_8E8BF0E482E14982` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos_metadata`
--

LOCK TABLES `servicos_metadata` WRITE;
/*!40000 ALTER TABLE `servicos_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicos_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos_unidades`
--

DROP TABLE IF EXISTS `servicos_unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicos_unidades` (
  `servico_id` int(11) NOT NULL,
  `unidade_id` int(11) NOT NULL,
  `departamento_id` int(11) DEFAULT NULL,
  `sigla` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `peso` smallint(6) NOT NULL,
  `numero_inicial` int(11) NOT NULL,
  `numero_final` int(11) DEFAULT NULL,
  `incremento` int(11) NOT NULL,
  `local_id` int(11) DEFAULT NULL,
  `mensagem` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prioridade` tinyint(1) NOT NULL,
  PRIMARY KEY (`servico_id`,`unidade_id`),
  KEY `IDX_C50F703482E14982` (`servico_id`),
  KEY `IDX_C50F7034EDF4B99B` (`unidade_id`),
  KEY `IDX_C50F70345A91C08D` (`departamento_id`),
  KEY `IDX_C50F70345D5A2101` (`local_id`),
  CONSTRAINT `FK_C50F70345A91C08D` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`),
  CONSTRAINT `FK_C50F70345D5A2101` FOREIGN KEY (`local_id`) REFERENCES `locais` (`id`),
  CONSTRAINT `FK_C50F703482E14982` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`),
  CONSTRAINT `FK_C50F7034EDF4B99B` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos_unidades`
--

LOCK TABLES `servicos_unidades` WRITE;
/*!40000 ALTER TABLE `servicos_unidades` DISABLE KEYS */;
INSERT INTO `servicos_unidades` VALUES (1,3,1,'A',1,1,1,NULL,1,1,NULL,0),(2,3,1,'C',1,1,1,NULL,1,1,NULL,0);
/*!40000 ALTER TABLE `servicos_unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos_usuarios`
--

DROP TABLE IF EXISTS `servicos_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicos_usuarios` (
  `servico_id` int(11) NOT NULL,
  `unidade_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `peso` smallint(6) NOT NULL,
  PRIMARY KEY (`servico_id`,`unidade_id`,`usuario_id`),
  KEY `IDX_CF69430282E14982` (`servico_id`),
  KEY `IDX_CF694302EDF4B99B` (`unidade_id`),
  KEY `IDX_CF694302DB38439E` (`usuario_id`),
  CONSTRAINT `FK_CF69430282E14982` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`),
  CONSTRAINT `FK_CF694302DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FK_CF694302EDF4B99B` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos_usuarios`
--

LOCK TABLES `servicos_usuarios` WRITE;
/*!40000 ALTER TABLE `servicos_usuarios` DISABLE KEYS */;
INSERT INTO `servicos_usuarios` VALUES (1,3,1,1),(2,3,1,1);
/*!40000 ALTER TABLE `servicos_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `impressao_cabecalho` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `impressao_rodape` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `impressao_exibir_data` tinyint(1) NOT NULL,
  `impressao_exibir_prioridade` tinyint(1) NOT NULL,
  `impressao_exibir_nome_unidade` tinyint(1) NOT NULL,
  `impressao_exibir_nome_servico` tinyint(1) NOT NULL,
  `impressao_exibir_mensagem_servico` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES (1,'wcl','teste',1,'2023-03-16 18:03:17',NULL,'2023-03-16 18:57:50','Novo SGA','Novo SGA',1,1,1,1,1),(2,'Recepção - Térreo','Recepção - Térreo',1,'2023-03-16 18:59:31','2023-03-17 16:40:43','2023-03-17 16:54:24','Novo SGA','========',1,1,1,1,1),(3,'Pronutrir - Filial - Fortaleza','Pronutrir - Filial - Fortaleza',1,'2023-03-17 16:41:05','2023-03-17 17:16:44',NULL,'BEM VINDO A PRONUTRIR','========',1,1,1,1,1),(4,'Pronutrir - Filial - Sobral','Pronutrir - Filial - Sobral',1,'2023-03-17 17:00:19',NULL,NULL,'Novo SGA','========',1,1,1,1,1),(5,'Pronutrir - Filial - Carirí','Pronutrir - Filial - Carirí',1,'2023-03-17 17:00:49',NULL,NULL,'Novo SGA','========',1,1,1,1,1);
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades_metadata`
--

DROP TABLE IF EXISTS `unidades_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidades_metadata` (
  `namespace` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unidade_id` int(11) NOT NULL,
  `value` json NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`namespace`,`name`,`unidade_id`),
  KEY `IDX_A21ACF47EDF4B99B` (`unidade_id`),
  CONSTRAINT `FK_A21ACF47EDF4B99B` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades_metadata`
--

LOCK TABLES `unidades_metadata` WRITE;
/*!40000 ALTER TABLE `unidades_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidades_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sobrenome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `senha` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `ultimo_acesso` datetime DEFAULT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `algorithm` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `salt` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_EF687F2AA08CB10` (`login`),
  UNIQUE KEY `UNIQ_EF687F2E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','williame','correia',NULL,'$2y$12$TpH/LzyKzD5Fy4Oc92MyB.qbj5wbi/mrXkhs8PpDi9s58VzZxKQ2G',1,NULL,NULL,'94466d9855c251f8806b3558c2b7a8ad','bcrypt',1,NULL,'2023-03-16 18:02:57','2023-03-23 14:36:06',NULL),(2,'Williame','Williame','correia de lima','williame_lima@hotmail.com','$2y$12$6yReZvxtUvMYwQGSyJr79u8ZZVl92Xjq8jFSx7nGzc4LYa19rjdFu',1,NULL,NULL,'8a928ec05079ab2be466c5687f2424c4','bcrypt',0,NULL,'2023-03-17 17:19:44','2023-03-20 11:57:12',NULL),(3,'impressao','impressao','impressao',NULL,'$2y$12$tLN8i.Bfhpk.aR/z8fv9JOFwiip7HzQZIOFHZKAZiSGxN89hvk2QG',1,NULL,NULL,'3m48mtiplh43ph6g9lc9pta84d','bcrypt',0,NULL,'2023-03-17 17:23:03','2023-03-17 17:23:22',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_metadata`
--

DROP TABLE IF EXISTS `usuarios_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_metadata` (
  `namespace` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `value` json NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`namespace`,`name`,`usuario_id`),
  KEY `IDX_BD8E7838DB38439E` (`usuario_id`),
  CONSTRAINT `FK_BD8E7838DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_metadata`
--

LOCK TABLES `usuarios_metadata` WRITE;
/*!40000 ALTER TABLE `usuarios_metadata` DISABLE KEYS */;
INSERT INTO `usuarios_metadata` VALUES ('global','atendimento.local',1,'1'),('global','atendimento.local',2,'1'),('global','atendimento.local',3,'1'),('global','atendimento.num_local',2,'1'),('global','atendimento.tipo',1,'\"todos\"'),('global','atendimento.tipo',2,'\"todos\"'),('global','atendimento.tipo',3,'\"todos\"'),('global','session.unidade',1,'3'),('global','session.unidade',2,'3'),('global','session.unidade',3,'3');
/*!40000 ALTER TABLE `usuarios_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_atendimentos`
--

DROP TABLE IF EXISTS `view_atendimentos`;
/*!50001 DROP VIEW IF EXISTS `view_atendimentos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_atendimentos` AS SELECT 
 1 AS `id`,
 1 AS `num_local`,
 1 AS `dt_age`,
 1 AS `dt_cheg`,
 1 AS `dt_cha`,
 1 AS `dt_ini`,
 1 AS `dt_fim`,
 1 AS `tempo_espera`,
 1 AS `tempo_permanencia`,
 1 AS `tempo_atendimento`,
 1 AS `tempo_deslocamento`,
 1 AS `status`,
 1 AS `resolucao`,
 1 AS `observacao`,
 1 AS `senha_sigla`,
 1 AS `senha_numero`,
 1 AS `cliente_id`,
 1 AS `unidade_id`,
 1 AS `servico_id`,
 1 AS `prioridade_id`,
 1 AS `usuario_id`,
 1 AS `usuario_tri_id`,
 1 AS `atendimento_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_atendimentos_codificados`
--

DROP TABLE IF EXISTS `view_atendimentos_codificados`;
/*!50001 DROP VIEW IF EXISTS `view_atendimentos_codificados`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_atendimentos_codificados` AS SELECT 
 1 AS `valor_peso`,
 1 AS `servico_id`,
 1 AS `atendimento_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_atendimentos`
--

/*!50001 DROP VIEW IF EXISTS `view_atendimentos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pronutrir_painel`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_atendimentos` AS select `atendimentos`.`id` AS `id`,`atendimentos`.`num_local` AS `num_local`,`atendimentos`.`dt_age` AS `dt_age`,`atendimentos`.`dt_cheg` AS `dt_cheg`,`atendimentos`.`dt_cha` AS `dt_cha`,`atendimentos`.`dt_ini` AS `dt_ini`,`atendimentos`.`dt_fim` AS `dt_fim`,`atendimentos`.`tempo_espera` AS `tempo_espera`,`atendimentos`.`tempo_permanencia` AS `tempo_permanencia`,`atendimentos`.`tempo_atendimento` AS `tempo_atendimento`,`atendimentos`.`tempo_deslocamento` AS `tempo_deslocamento`,`atendimentos`.`status` AS `status`,`atendimentos`.`resolucao` AS `resolucao`,`atendimentos`.`observacao` AS `observacao`,`atendimentos`.`senha_sigla` AS `senha_sigla`,`atendimentos`.`senha_numero` AS `senha_numero`,`atendimentos`.`cliente_id` AS `cliente_id`,`atendimentos`.`unidade_id` AS `unidade_id`,`atendimentos`.`servico_id` AS `servico_id`,`atendimentos`.`prioridade_id` AS `prioridade_id`,`atendimentos`.`usuario_id` AS `usuario_id`,`atendimentos`.`usuario_tri_id` AS `usuario_tri_id`,`atendimentos`.`atendimento_id` AS `atendimento_id` from `atendimentos` union all select `historico_atendimentos`.`id` AS `id`,`historico_atendimentos`.`num_local` AS `num_local`,`historico_atendimentos`.`dt_age` AS `dt_age`,`historico_atendimentos`.`dt_cheg` AS `dt_cheg`,`historico_atendimentos`.`dt_cha` AS `dt_cha`,`historico_atendimentos`.`dt_ini` AS `dt_ini`,`historico_atendimentos`.`dt_fim` AS `dt_fim`,`historico_atendimentos`.`tempo_espera` AS `tempo_espera`,`historico_atendimentos`.`tempo_permanencia` AS `tempo_permanencia`,`historico_atendimentos`.`tempo_atendimento` AS `tempo_atendimento`,`historico_atendimentos`.`tempo_deslocamento` AS `tempo_deslocamento`,`historico_atendimentos`.`status` AS `status`,`historico_atendimentos`.`resolucao` AS `resolucao`,`historico_atendimentos`.`observacao` AS `observacao`,`historico_atendimentos`.`senha_sigla` AS `senha_sigla`,`historico_atendimentos`.`senha_numero` AS `senha_numero`,`historico_atendimentos`.`cliente_id` AS `cliente_id`,`historico_atendimentos`.`unidade_id` AS `unidade_id`,`historico_atendimentos`.`servico_id` AS `servico_id`,`historico_atendimentos`.`prioridade_id` AS `prioridade_id`,`historico_atendimentos`.`usuario_id` AS `usuario_id`,`historico_atendimentos`.`usuario_tri_id` AS `usuario_tri_id`,`historico_atendimentos`.`atendimento_id` AS `atendimento_id` from `historico_atendimentos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_atendimentos_codificados`
--

/*!50001 DROP VIEW IF EXISTS `view_atendimentos_codificados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pronutrir_painel`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_atendimentos_codificados` AS select `atendimentos_codificados`.`valor_peso` AS `valor_peso`,`atendimentos_codificados`.`servico_id` AS `servico_id`,`atendimentos_codificados`.`atendimento_id` AS `atendimento_id` from `atendimentos_codificados` union all select `historico_atendimentos_codificados`.`valor_peso` AS `valor_peso`,`historico_atendimentos_codificados`.`servico_id` AS `servico_id`,`historico_atendimentos_codificados`.`atendimento_id` AS `atendimento_id` from `historico_atendimentos_codificados` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-30  9:10:02
