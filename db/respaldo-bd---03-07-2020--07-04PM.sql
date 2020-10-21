CREATE DATABASE  IF NOT EXISTS `bdposgrados` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdposgrados`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: bdposgrados
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad` (
  `id_actividad` int unsigned NOT NULL AUTO_INCREMENT,
  `id_tema_impartido` int unsigned NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `actividad` text NOT NULL,
  `fecha_asignacion` datetime NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `tipo` char(1) NOT NULL,
  PRIMARY KEY (`id_actividad`),
  KEY `id_tema_impartido_fk_ac_idx` (`id_tema_impartido`),
  CONSTRAINT `id_tema_impartido_fk_ac` FOREIGN KEY (`id_tema_impartido`) REFERENCES `tema_impartido` (`id_tema_impartido`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (12,38,'ACtividad de Diagnostico','Realizar la siguinte actividad','2020-07-03 18:44:00','2020-07-03 20:00:00','2020-07-04 23:59:00','E');
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actividad_alumno`
--

DROP TABLE IF EXISTS `actividad_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad_alumno` (
  `id_actividad` int unsigned NOT NULL,
  `id_alumno` int unsigned NOT NULL,
  `id_universidad_al` char(5) NOT NULL,
  `calificacion` float DEFAULT NULL,
  `comentarios` text,
  `fecha_subida` datetime NOT NULL,
  `fecha_calificada` datetime DEFAULT NULL,
  `tipo_archivo` varchar(5) NOT NULL,
  `nombre_archivo` varchar(60) NOT NULL,
  `archivo` longblob,
  PRIMARY KEY (`id_actividad`,`id_alumno`,`id_universidad_al`),
  KEY `id_alumno_fk_aa_idx` (`id_alumno`),
  KEY `id_universidad_fk_aa_idx` (`id_universidad_al`),
  CONSTRAINT `id_actividad_fk_aa` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`id_actividad`),
  CONSTRAINT `id_alumno_fk_aa` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  CONSTRAINT `id_universidad_fk_aa` FOREIGN KEY (`id_universidad_al`) REFERENCES `alumno` (`id_universidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad_alumno`
--

LOCK TABLES `actividad_alumno` WRITE;
/*!40000 ALTER TABLE `actividad_alumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad_alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `id_administrador` int unsigned NOT NULL AUTO_INCREMENT,
  `id_universidad` char(5) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `correo` varchar(35) NOT NULL,
  `contrasena` varchar(25) NOT NULL,
  PRIMARY KEY (`id_administrador`,`id_universidad`),
  UNIQUE KEY `id_universidad_UNIQUE` (`id_universidad`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  KEY `id_universidad_fk_idx` (`id_universidad`),
  CONSTRAINT `id_universidad_fk_adm` FOREIGN KEY (`id_universidad`) REFERENCES `universidad` (`id_universidad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'AS001','Luis','Arcos','luisarcos@correo.uaa.mx','hola1234');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `id_alumno` int unsigned NOT NULL AUTO_INCREMENT,
  `id_universidad` char(5) NOT NULL,
  `id_area_conocimiento` int unsigned NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` char(1) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `entidad_federativa` char(2) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(35) NOT NULL,
  `contrasena` varchar(25) NOT NULL,
  `online` tinyint NOT NULL,
  `fecha_registro` date NOT NULL,
  `estado` char(1) NOT NULL,
  `strikes` int unsigned NOT NULL,
  `tipo_archivo` varchar(5) DEFAULT NULL,
  `nombre_archivo` varchar(35) DEFAULT NULL,
  `foto` mediumblob,
  `clave_i` varchar(255) DEFAULT NULL,
  `origen_i` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_alumno`,`id_universidad`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  KEY `id_universidad_fk_al_idx` (`id_universidad`),
  KEY `id_area_conocimiento_fk_al_idx` (`id_area_conocimiento`),
  FULLTEXT KEY `idx_alumno_nombres_apellidos` (`nombres`,`apellidos`),
  CONSTRAINT `id_area_conocimiento_fk_al` FOREIGN KEY (`id_area_conocimiento`) REFERENCES `area_conocimiento` (`id_area_conocimiento`),
  CONSTRAINT `id_universidad_fk_al` FOREIGN KEY (`id_universidad`) REFERENCES `universidad` (`id_universidad`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (14,'AS001',19,'Diego Eduardo','Mendez Zavala','1999-10-01','H','Colmena #118 Fracc. Municipio Libre','AS','Tepezala','448641234','edy_mz@edu.uaa.mx','hola1234',0,'2020-07-03','A',0,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno_tema_impartido`
--

DROP TABLE IF EXISTS `alumno_tema_impartido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno_tema_impartido` (
  `id_alumno` int unsigned NOT NULL,
  `id_universidad_al` char(5) NOT NULL,
  `id_tema_impartido` int unsigned NOT NULL,
  `estado` char(1) NOT NULL,
  `calificacion_final` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_alumno`,`id_universidad_al`),
  KEY `id_universidad_al_fk_ati_idx` (`id_universidad_al`),
  KEY `id_tema_impartido_fk_ati_idx` (`id_tema_impartido`),
  CONSTRAINT `id_alumno_fk_ati` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  CONSTRAINT `id_tema_impartido_fk_ati` FOREIGN KEY (`id_tema_impartido`) REFERENCES `tema_impartido` (`id_tema_impartido`),
  CONSTRAINT `id_universidad_al_fk_ati` FOREIGN KEY (`id_universidad_al`) REFERENCES `alumno` (`id_universidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_tema_impartido`
--

LOCK TABLES `alumno_tema_impartido` WRITE;
/*!40000 ALTER TABLE `alumno_tema_impartido` DISABLE KEYS */;
INSERT INTO `alumno_tema_impartido` VALUES (14,'AS001',38,'A',NULL);
/*!40000 ALTER TABLE `alumno_tema_impartido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_conocimiento`
--

DROP TABLE IF EXISTS `area_conocimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_conocimiento` (
  `id_area_conocimiento` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_area_conocimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_conocimiento`
--

LOCK TABLES `area_conocimiento` WRITE;
/*!40000 ALTER TABLE `area_conocimiento` DISABLE KEYS */;
INSERT INTO `area_conocimiento` VALUES (1,'Matematicas'),(2,'Psicologia'),(3,'Medicina'),(4,'Tecnologias'),(5,'Arte'),(6,'Quimica'),(7,'Bioquimica'),(8,'Agronomía'),(9,'Ciencias Agropecuarias'),(10,'Ciencias de la Economia'),(11,'Comercio Electronico'),(19,'Ciencias Ocultas');
/*!40000 ALTER TABLE `area_conocimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identificador_sitio`
--

DROP TABLE IF EXISTS `identificador_sitio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identificador_sitio` (
  `nombre` varchar(8) NOT NULL,
  `id_universidad` char(5) NOT NULL,
  PRIMARY KEY (`nombre`),
  UNIQUE KEY `id_universidad_UNIQUE` (`id_universidad`),
  CONSTRAINT `id_universidad_fk_is` FOREIGN KEY (`id_universidad`) REFERENCES `universidad` (`id_universidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identificador_sitio`
--

LOCK TABLES `identificador_sitio` WRITE;
/*!40000 ALTER TABLE `identificador_sitio` DISABLE KEYS */;
INSERT INTO `identificador_sitio` VALUES ('sitio1','AS001');
/*!40000 ALTER TABLE `identificador_sitio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linea_investigacion`
--

DROP TABLE IF EXISTS `linea_investigacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `linea_investigacion` (
  `id_linea_investigacion` int unsigned NOT NULL AUTO_INCREMENT,
  `id_posgrado` int unsigned NOT NULL,
  `id_universidad_pg` char(5) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `clave` varchar(6) DEFAULT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_linea_investigacion`),
  KEY `id_posgrado_fk_idx` (`id_posgrado`),
  KEY `id_universidad_fk_li_idx` (`id_universidad_pg`),
  CONSTRAINT `id_posgrado_fk_li` FOREIGN KEY (`id_posgrado`) REFERENCES `posgrado` (`id_posgrado`),
  CONSTRAINT `id_universidad_fk_li` FOREIGN KEY (`id_universidad_pg`) REFERENCES `posgrado` (`id_universidad`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linea_investigacion`
--

LOCK TABLES `linea_investigacion` WRITE;
/*!40000 ALTER TABLE `linea_investigacion` DISABLE KEYS */;
INSERT INTO `linea_investigacion` VALUES (39,16,'AS001','Cafe Mancia','001001','A');
/*!40000 ALTER TABLE `linea_investigacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posgrado`
--

DROP TABLE IF EXISTS `posgrado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posgrado` (
  `id_posgrado` int unsigned NOT NULL AUTO_INCREMENT,
  `id_universidad` char(5) NOT NULL,
  `id_area_conocimiento` int unsigned NOT NULL,
  `nombre` varchar(65) NOT NULL,
  `clave` varchar(6) DEFAULT NULL,
  `fecha_publicacion` date NOT NULL,
  `estado` char(1) NOT NULL,
  `nivel` char(1) NOT NULL,
  `tipo_archivo` varchar(5) DEFAULT NULL,
  `nombre_archivo` varchar(35) DEFAULT NULL,
  `convocatoria` mediumblob,
  PRIMARY KEY (`id_posgrado`,`id_universidad`),
  UNIQUE KEY `clave_UNIQUE` (`clave`),
  KEY `id_universidad_fk_idx` (`id_universidad`),
  KEY `id_area_conocimiento_fk_idx` (`id_area_conocimiento`),
  CONSTRAINT `id_area_conocimiento_fk_pg` FOREIGN KEY (`id_area_conocimiento`) REFERENCES `area_conocimiento` (`id_area_conocimiento`),
  CONSTRAINT `id_universidad_fk_pg` FOREIGN KEY (`id_universidad`) REFERENCES `universidad` (`id_universidad`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posgrado`
--

LOCK TABLES `posgrado` WRITE;
/*!40000 ALTER TABLE `posgrado` DISABLE KEYS */;
/*!40000 ALTER TABLE `posgrado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posgrado_alumno`
--

DROP TABLE IF EXISTS `posgrado_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posgrado_alumno` (
  `id_alumno` int unsigned NOT NULL,
  `id_universidad_al` char(5) NOT NULL,
  `id_tema` int unsigned NOT NULL,
  `id_universidad` char(5) NOT NULL,
  `id_posgrado` int unsigned NOT NULL,
  `id_profesor_tutor` int unsigned NOT NULL,
  `estado` char(1) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id_universidad_al`,`id_alumno`,`id_tema`),
  KEY `id_alumno_fk_pa_idx` (`id_alumno`),
  KEY `id_tema_fk_pa_idx` (`id_tema`),
  KEY `id_posgrado_fk_pa_idx` (`id_posgrado`),
  KEY `id_profesor_fk_pa_idx` (`id_profesor_tutor`) /*!80000 INVISIBLE */,
  KEY `id_universidad_pr_fk_pa_idx` (`id_universidad`),
  CONSTRAINT `id_alumno_fk_pa` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  CONSTRAINT `id_posgrado_fk_pa` FOREIGN KEY (`id_posgrado`) REFERENCES `posgrado` (`id_posgrado`),
  CONSTRAINT `id_profesor_fk_pa` FOREIGN KEY (`id_profesor_tutor`) REFERENCES `profesor` (`id_profesor`),
  CONSTRAINT `id_tema_fk_pa` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id_tema`),
  CONSTRAINT `id_universidad_al_fk_pa` FOREIGN KEY (`id_universidad_al`) REFERENCES `alumno` (`id_universidad`),
  CONSTRAINT `id_universidad_pg_fk_pa` FOREIGN KEY (`id_universidad`) REFERENCES `posgrado` (`id_universidad`),
  CONSTRAINT `id_universidad_pr_fk_pa` FOREIGN KEY (`id_universidad`) REFERENCES `profesor` (`id_universidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posgrado_alumno`
--

LOCK TABLES `posgrado_alumno` WRITE;
/*!40000 ALTER TABLE `posgrado_alumno` DISABLE KEYS */;
INSERT INTO `posgrado_alumno` VALUES (14,'AS001',424,'AS001',16,9,'A','2020-07-03','2020-07-30');
/*!40000 ALTER TABLE `posgrado_alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `id_profesor` int unsigned NOT NULL AUTO_INCREMENT,
  `id_universidad` char(5) NOT NULL,
  `id_area_conocimiento` int unsigned NOT NULL,
  `id_posgrado` int unsigned NOT NULL,
  `id_linea_investigacion` int unsigned DEFAULT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` char(1) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `entidad_federativa` char(2) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `cedula` int unsigned NOT NULL,
  `correo` varchar(35) NOT NULL,
  `contrasena` varchar(25) NOT NULL,
  `online` tinyint NOT NULL,
  `fecha_registro` date NOT NULL,
  `estado` char(1) NOT NULL,
  `strikes` int unsigned NOT NULL,
  `tipo_archivo` varchar(5) DEFAULT NULL,
  `nombre_archivo` varchar(35) DEFAULT NULL,
  `foto` mediumblob,
  PRIMARY KEY (`id_profesor`,`id_universidad`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  KEY `id_universidad_fk_pr_idx` (`id_universidad`),
  KEY `id_area_conocimiento_fk_pr_idx` (`id_area_conocimiento`),
  KEY `id_posgrado_fk_pr_idx` (`id_posgrado`),
  KEY `id_linea_investigacion_fk_pr_idx` (`id_linea_investigacion`),
  FULLTEXT KEY `idx_profesor_nombres_apellidos` (`nombres`,`apellidos`),
  CONSTRAINT `id_area_conocimiento_fk_pr` FOREIGN KEY (`id_area_conocimiento`) REFERENCES `area_conocimiento` (`id_area_conocimiento`),
  CONSTRAINT `id_linea_investigacion_fk_pr` FOREIGN KEY (`id_linea_investigacion`) REFERENCES `linea_investigacion` (`id_linea_investigacion`),
  CONSTRAINT `id_posgrado_fk_pr` FOREIGN KEY (`id_posgrado`) REFERENCES `posgrado` (`id_posgrado`),
  CONSTRAINT `id_universidad_fk_pr` FOREIGN KEY (`id_universidad`) REFERENCES `universidad` (`id_universidad`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (9,'AS001',19,16,39,'Martin','Martinez','1981-07-15','H','calle arbolada #124 Fracc. Pulgas Pandas','AS','Aguascalientes','4499785236',12345678,'martin.martinez@edu.uaa.mx','hola1234',0,'2020-07-03','A',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacion_foro`
--

DROP TABLE IF EXISTS `publicacion_foro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacion_foro` (
  `id_publicacion_foro` int unsigned NOT NULL AUTO_INCREMENT,
  `id_tema_impartido` int unsigned NOT NULL,
  `de_alumno` tinyint NOT NULL,
  `id_objetivo` int unsigned NOT NULL,
  `id_universidad` char(5) NOT NULL,
  `publicacion` text NOT NULL,
  `fecha` datetime NOT NULL,
  `es_visible` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_publicacion_foro`),
  KEY `id_tema_impartido_fk_pf_idx` (`id_tema_impartido`),
  KEY `id_alumno_fk_pf_idx` (`id_objetivo`),
  KEY `id_universidad_al_fk_pf_idx` (`id_universidad`),
  CONSTRAINT `id_alumno_fk_pf` FOREIGN KEY (`id_objetivo`) REFERENCES `alumno` (`id_alumno`),
  CONSTRAINT `id_profesor_fk_pf` FOREIGN KEY (`id_objetivo`) REFERENCES `profesor` (`id_profesor`),
  CONSTRAINT `id_tema_impartido_fk_pf` FOREIGN KEY (`id_tema_impartido`) REFERENCES `tema_impartido` (`id_tema_impartido`),
  CONSTRAINT `id_universidad_al_fk_pf` FOREIGN KEY (`id_universidad`) REFERENCES `alumno` (`id_universidad`),
  CONSTRAINT `id_universidad_pr_fk_pf` FOREIGN KEY (`id_universidad`) REFERENCES `profesor` (`id_universidad`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacion_foro`
--

LOCK TABLES `publicacion_foro` WRITE;
/*!40000 ALTER TABLE `publicacion_foro` DISABLE KEYS */;
INSERT INTO `publicacion_foro` VALUES (32,38,0,9,'AS001','Que tal Jovenes bienvenidos al curso.','2020-07-03 18:48:00',1);
/*!40000 ALTER TABLE `publicacion_foro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurso`
--

DROP TABLE IF EXISTS `recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recurso` (
  `id_recurso` int unsigned NOT NULL AUTO_INCREMENT,
  `id_tema_impartido` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text,
  `tipo_archivo` varchar(5) NOT NULL,
  `nombre_archivo` varchar(60) NOT NULL,
  `contenido` longblob,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_recurso`),
  KEY `id_tema_impartido_fk_re_idx` (`id_tema_impartido`),
  CONSTRAINT `id_tema_impartido_fk_re` FOREIGN KEY (`id_tema_impartido`) REFERENCES `tema_impartido` (`id_tema_impartido`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso`
--

LOCK TABLES `recurso` WRITE;
/*!40000 ALTER TABLE `recurso` DISABLE KEYS */;
INSERT INTO `recurso` VALUES (12,38,'2020-07-03','Equi esta el programa que seguiremos.','pdf','Ejercicio 2.pdf',_binary 'data:application/pdf;base64,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L0VuY29kaW5nL1dpbkFuc2lFbmNvZGluZy9Gb250RGVzY3JpcHRvciA2IDAgUi9GaXJzdENoYXIgMzIvTGFzdENoYXIgMjQxL1dpZHRocyAzMSAwIFI+Pg0KZW5kb2JqDQo2IDAgb2JqDQo8PC9UeXBlL0ZvbnREZXNjcmlwdG9yL0ZvbnROYW1lL0JDREVFRStDYWxpYnJpLUJvbGQvRmxhZ3MgMzIvSXRhbGljQW5nbGUgMC9Bc2NlbnQgNzUwL0Rlc2NlbnQgLTI1MC9DYXBIZWlnaHQgNzUwL0F2Z1dpZHRoIDUzNi9NYXhXaWR0aCAxNzgxL0ZvbnRXZWlnaHQgNzAwL1hIZWlnaHQgMjUwL1N0ZW1WIDUzL0ZvbnRCQm94WyAtNTE5IC0yNTAgMTI2MyA3NTBdIC9Gb250RmlsZTIgMzIgMCBSPj4NCmVuZG9iag0KNyAwIG9iag0KPDwvVHlwZS9FeHRHU3RhdGUvQk0vTm9ybWFsL2NhIDE+Pg0KZW5kb2JqDQo4IDAgb2JqDQo8PC9UeXBlL0V4dEdTdGF0ZS9CTS9Ob3JtYWwvQ0EgMT4+DQplbmRvYmoNCjkgMCBvYmoNCjw8L1R5cGUvRm9udC9TdWJ0eXBlL1RydWVUeXBlL05hbWUvRjIvQmFzZUZvbnQvQkNERkVFK0NhbGlicmkvRW5jb2RpbmcvV2luQW5zaUVuY29kaW5nL0ZvbnREZXNjcmlwdG9yIDEwIDAgUi9GaXJzdENoYXIgMzIvTGFzdENoYXIgMjUwL1dpZHRocyAzMyAwIFI+Pg0KZW5kb2JqDQoxMCAwIG9iag0KPDwvVHlwZS9Gb250RGVzY3JpcHRvci9Gb250TmFtZS9CQ0RGRUUrQ2FsaWJyaS9GbGFncyAzMi9JdGFsaWNBbmdsZSAwL0FzY2VudCA3NTAvRGVzY2VudCAtMjUwL0NhcEhlaWdodCA3NTAvQXZnV2lkdGggNTIxL01heFdpZHRoIDE3NDMvRm9udFdlaWdodCA0MDAvWEhlaWdodCAyNTAvU3RlbVYgNTIvRm9udEJCb3hbIC01MDMgLTI1MCAxMjQwIDc1MF0gL0ZvbnRGaWxlMiAzNCAwIFI+Pg0KZW5kb2JqDQoxMSAwIG9iag0KPDwvVHlwZS9YT2JqZWN0L1N1YnR5cGUvSW1hZ2UvV2lk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abOu5xQXxSvvfnKzJ74OrazjqKybXiAcvyA1WoNVPu34phNpc6+8S7znWOa+/e+9W0//Nv17mhx5ftfjTdN5M49cKpz68WuZy84HRyov/ju3ZAf3fEPW4Kc+O3bvlA+NXfi55eWke717NnA3vhaea2eWlT3nTKzjxZdLrt5evPnFrds8tcIRN5x0ruTtvq5p3fLaifdAM3vgQ6vPqyN9NnWVMb5ff0jzU+nSLkPLO70uDABRTMi5DQplbmRzdHJlYW0NCmVuZG9iag0KMzUgMCBvYmoNCjw8L1R5cGUvTWV0YWRhdGEvU3VidHlwZS9YTUwvTGVuZ3RoIDMxMDI+Pg0Kc3RyZWFtDQo8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/Pjx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IjMuMS03MDEiPgo8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgo8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiAgeG1sbnM6cGRmPSJodHRwOi8vbnMuYWRvYmUuY29tL3BkZi8xLjMvIj4KPHBkZjpQcm9kdWNlcj5NaWNyb3NvZnTCriBXb3JkIHBhcmEgT2ZmaWNlIDM2NTwvcGRmOlByb2R1Y2VyPjwvcmRmOkRlc2NyaXB0aW9uPgo8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiAgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIj4KPGRjOmNyZWF0b3I+PHJkZjpTZXE+PHJkZjpsaT5HdXN0YXZvIEFicmFoYW0gTcOpbmRleiBaYXZhbGE8L3JkZjpsaT48L3JkZjpTZXE+PC9kYzpjcmVhdG9yPjwvcmRmOkRlc2NyaXB0aW9uPgo8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiAgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIj4KPHhtcDpDcmVhdG9yVG9vbD5NaWNyb3NvZnTCriBXb3JkIHBhcmEgT2ZmaWNlIDM2NTwveG1wOkNyZWF0b3JUb29sPjx4bXA6Q3JlYXRlRGF0ZT4yMDIwLTAzLTE5VDA5OjQwOjUyLTA2OjAwPC94bXA6Q3JlYXRlRGF0ZT48eG1wOk1vZGlmeURhdGU+MjAyMC0wMy0xOVQwOTo0MDo1Mi0wNjowMDwveG1wOk1vZGlmeURhdGU+PC9yZGY6RGVzY3JpcHRpb24+CjxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiICB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyI+Cjx4bXBNTTpEb2N1bWVudElEPnV1aWQ6RTE1ODNCRjUtQUZBRi00RDYyLUJBOTYtRjcwQjRBQTkxMjQ0PC94bXBNTTpEb2N1bWVudElEPjx4bXBNTTpJbnN0YW5jZUlEPnV1aWQ6RTE1ODNCRjUtQUZBRi00RDYyLUJBOTYtRjcwQjRBQTkxMjQ0PC94bXBNTTpJbnN0YW5jZUlEPjwvcmRmOkRlc2NyaXB0aW9uPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPC9yZGY6UkRGPjwveDp4bXBtZXRhPjw/eHBhY2tldCBlbmQ9InciPz4NCmVuZHN0cmVhbQ0KZW5kb2JqDQozNiAwIG9iag0KPDwvRGlzcGxheURvY1RpdGxlIHRydWU+Pg0KZW5kb2JqDQozNyAwIG9iag0KPDwvVHlwZS9YUmVmL1NpemUgMzcvV1sgMSA0IDJdIC9Sb290IDEgMCBSL0luZm8gMTIgMCBSL0lEWzxGNTNCNThFMUFGQUY2MjREQkE5NkY3MEI0QUE5MTI0ND48RjUzQjU4RTFBRkFGNjI0REJBOTZGNzBCNEFBOTEyNDQ+XSAvRmlsdGVyL0ZsYXRlRGVjb2RlL0xlbmd0aCAxMzE+Pg0Kc3RyZWFtDQp4nDXOOwrCYBCF0fnjIzE+8wBL12EjopWNlV32JwguxAVYu4BgWrGROLmfTjGHgZnLmHm1bfCemXWc4SGiVGQHeIm8FsUKTvARZSM2d7/1lNImMIUZzGEMv82F323z/xQggh70YQBDiCGBEaQetlvql/1bXJ7iGneE401Ua7MvipsRpA0KZW5kc3RyZWFtDQplbmRvYmoNCnhyZWYNCjAgMzgNCjAwMDAwMDAwMTMgNjU1MzUgZg0KMDAwMDAwMDAxNyAwMDAwMCBuDQowMDAwMDAwMTY2IDAwMDAwIG4NCjAwMDAwMDAyMjIgMDAwMDAgbg0KMDAwMDAwMDUyMiAwMDAwMCBuDQowMDAwMDA0NDI1IDAwMDAwIG4NCjAwMDAwMDQ1OTggMDAwMDAgbg0KMDAwMDAwNDg0MiAwMDAwMCBuDQowMDAwMDA0ODk1IDAwMDAwIG4NCjAwMDAwMDQ5NDggMDAwMDAgbg0KMDAwMDAwNTExNyAwMDAwMCBuDQowMDAwMDA1MzU3IDAwMDAwIG4NCjAwMDAwMTYwODQgMDAwMDAgbg0KMDAwMDAwMDAxNCA2NTUzNSBmDQowMDAwMDAwMDE1IDY1NTM1IGYNCjAwMDAwMDAwMTYgNjU1MzUgZg0KMDAwMDAwMDAxNyA2NTUzNSBmDQowMDAwMDAwMDE4IDY1NTM1IGYNCjAwMDAwMDAwMTkgNjU1MzUgZg0KMDAwMDAwMDAyMCA2NTUzNSBmDQowMDAwMDAwMDIxIDY1NTM1IGYNCjAwMDAwMDAwMjIgNjU1MzUgZg0KMDAwMDAwMDAyMyA2NTUzNSBmDQowMDAwMDAwMDI0IDY1NTM1IGYNCjAwMDAwMDAwMjUgNjU1MzUgZg0KMDAwMDAwMDAyNiA2NTUzNSBmDQowMDAwMDAwMDI3IDY1NTM1IGYNCjAwMDAwMDAwMjggNjU1MzUgZg0KMDAwMDAwMDAyOSA2NTUzNSBmDQowMDAwMDAwMDMwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAxNjkxOSAwMDAwMCBuDQowMDAwMDE3NDAwIDAwMDAwIG4NCjAwMDAwNDM1MDAgMDAwMDAgbg0KMDAwMDA0NDAzOSAwMDAwMCBuDQowMDAwMDg1NzA0IDAwMDAwIG4NCjAwMDAwODg4ODkgMDAwMDAgbg0KMDAwMDA4ODkzNCAwMDAwMCBuDQp0cmFpbGVyDQo8PC9TaXplIDM4L1Jvb3QgMSAwIFIvSW5mbyAxMiAwIFIvSURbPEY1M0I1OEUxQUZBRjYyNERCQTk2RjcwQjRBQTkxMjQ0PjxGNTNCNThFMUFGQUY2MjREQkE5NkY3MEI0QUE5MTI0ND5dID4+DQpzdGFydHhyZWYNCjg5MjY2DQolJUVPRg0KeHJlZg0KMCAwDQp0cmFpbGVyDQo8PC9TaXplIDM4L1Jvb3QgMSAwIFIvSW5mbyAxMiAwIFIvSURbPEY1M0I1OEUxQUZBRjYyNERCQTk2RjcwQjRBQTkxMjQ0PjxGNTNCNThFMUFGQUY2MjREQkE5NkY3MEI0QUE5MTI0ND5dIC9QcmV2IDg5MjY2L1hSZWZTdG0gODg5MzQ+Pg0Kc3RhcnR4cmVmDQo5MDE4Mw0KJSVFT0Y=','Programa de la Materia');
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrador`
--

DROP TABLE IF EXISTS `registrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrador` (
  `id_registrador` int unsigned NOT NULL AUTO_INCREMENT,
  `id_universidad` char(5) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(35) NOT NULL,
  `contrasena` varchar(25) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_registrador`,`id_universidad`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  KEY `id_universidad_fk_re_idx` (`id_universidad`),
  CONSTRAINT `id_universidad_fk_re` FOREIGN KEY (`id_universidad`) REFERENCES `universidad` (`id_universidad`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrador`
--

LOCK TABLES `registrador` WRITE;
/*!40000 ALTER TABLE `registrador` DISABLE KEYS */;
INSERT INTO `registrador` VALUES (16,'AS001','Gustavo Abraham','Mendez Zavala','4493273132','al218817@edu.uaa.mx','hola1234','A');
/*!40000 ALTER TABLE `registrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta_foro`
--

DROP TABLE IF EXISTS `respuesta_foro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuesta_foro` (
  `id_respuesta_foro` int unsigned NOT NULL AUTO_INCREMENT,
  `id_publicacion_foro` int unsigned NOT NULL,
  `de_alumno` tinyint NOT NULL,
  `id_objetivo` int unsigned NOT NULL,
  `id_universidad` char(5) NOT NULL,
  `respuesta` text NOT NULL,
  `fecha` datetime NOT NULL,
  `es_visible` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_respuesta_foro`),
  KEY `id_publicacion_foro_fk_rf_idx` (`id_publicacion_foro`),
  KEY `id_alumno_fk_rf_idx` (`id_objetivo`),
  KEY `id_universidad_al_fk_rf_idx` (`id_universidad`),
  CONSTRAINT `id_alumno_fk_rf` FOREIGN KEY (`id_objetivo`) REFERENCES `alumno` (`id_alumno`),
  CONSTRAINT `id_profesor_fk_rf` FOREIGN KEY (`id_objetivo`) REFERENCES `profesor` (`id_profesor`),
  CONSTRAINT `id_publicacion_foro_fk_rf` FOREIGN KEY (`id_publicacion_foro`) REFERENCES `publicacion_foro` (`id_publicacion_foro`),
  CONSTRAINT `id_universidad_al_fk_rf` FOREIGN KEY (`id_universidad`) REFERENCES `alumno` (`id_universidad`),
  CONSTRAINT `id_universidad_pr_fk_rf` FOREIGN KEY (`id_universidad`) REFERENCES `profesor` (`id_universidad`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta_foro`
--

LOCK TABLES `respuesta_foro` WRITE;
/*!40000 ALTER TABLE `respuesta_foro` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta_foro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud` (
  `id_solicitud` int unsigned NOT NULL AUTO_INCREMENT,
  `id_alumno` int unsigned NOT NULL,
  `id_universidad_al` char(5) NOT NULL,
  `id_tema` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `estado_uni` char(1) NOT NULL,
  `estado_alumno` char(1) NOT NULL,
  `en_validacion` tinyint NOT NULL,
  `clave_i` varchar(255) DEFAULT NULL,
  `origen_i` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `id_alumno_fk_so_idx` (`id_alumno`),
  KEY `id_universidad_idx` (`id_universidad_al`),
  KEY `id_tema_fk_so_idx` (`id_tema`),
  CONSTRAINT `id_alumno_fk_so` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  CONSTRAINT `id_tema_fk_so` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id_tema`),
  CONSTRAINT `id_universidad_fk_so` FOREIGN KEY (`id_universidad_al`) REFERENCES `alumno` (`id_universidad`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
INSERT INTO `solicitud` VALUES (16,14,'AS001',424,'2020-07-03','A','A',0,'d47e5bec41ac82b12a0019c0d34bbc923aaba7ba113784bc6fc3d87ca86e6f8ef911fcfe9e0a22fb2ac1420b7d218d79164484a2f09c20899981bed64d89cce27528af090a29b8581f052d88b80bccb4e94cc84d01137b77254d6fcf18e802be120d7ed3',1);
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tema` (
  `id_tema` int unsigned NOT NULL AUTO_INCREMENT,
  `id_linea_investigacion` int unsigned NOT NULL,
  `nombre` varchar(65) NOT NULL,
  `clave` varchar(6) DEFAULT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_tema`),
  KEY `id_linea_investigacion_fk_tm_idx` (`id_linea_investigacion`),
  CONSTRAINT `id_linea_investigacion_fk_tm` FOREIGN KEY (`id_linea_investigacion`) REFERENCES `linea_investigacion` (`id_linea_investigacion`)
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
INSERT INTO `tema` VALUES (424,39,'Cafe en Grano I','001','A'),(425,39,'Cafe en Grano II','002','A'),(426,39,'Cafe Instantaneo','003','A');
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tema_impartido`
--

DROP TABLE IF EXISTS `tema_impartido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tema_impartido` (
  `id_tema_impartido` int unsigned NOT NULL AUTO_INCREMENT,
  `id_tema` int unsigned NOT NULL,
  `id_profesor` int unsigned NOT NULL,
  `id_universidad_pr` char(5) NOT NULL,
  `grupo` char(1) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `cupo` int unsigned NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_tema_impartido`),
  KEY `id_tema_fk_ti_idx` (`id_tema`),
  KEY `id_profesor_idx` (`id_profesor`),
  KEY `id_universidad_fk_ti_idx` (`id_universidad_pr`),
  CONSTRAINT `id_profesor_fk_ti` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`),
  CONSTRAINT `id_tema_fk_ti` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id_tema`),
  CONSTRAINT `id_universidad_fk_ti` FOREIGN KEY (`id_universidad_pr`) REFERENCES `profesor` (`id_universidad`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema_impartido`
--

LOCK TABLES `tema_impartido` WRITE;
/*!40000 ALTER TABLE `tema_impartido` DISABLE KEYS */;
INSERT INTO `tema_impartido` VALUES (38,424,9,'AS001','A','2020-07-03','2020-07-30',15,'A');
/*!40000 ALTER TABLE `tema_impartido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universidad`
--

DROP TABLE IF EXISTS `universidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `universidad` (
  `id_universidad` char(5) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(35) NOT NULL,
  `paginaweb` text,
  PRIMARY KEY (`id_universidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universidad`
--

LOCK TABLES `universidad` WRITE;
/*!40000 ALTER TABLE `universidad` DISABLE KEYS */;
INSERT INTO `universidad` VALUES ('AS001','Universidad Autonoma de Aguascalientes','Avenida Universidad 940, C.U., 20130 Aguascalientes, Ags.','4499107400','cvargas@correo.uaa.mx','https://www.uaa.mx/portal/'),('AS002','Universidad Tecnologica de Aguascalientes','Aguascalientes MX, Blvrd Juan Pablo II, La Cantera, 20200 Exhacienda','4499105000','soporte@utags.edu.mx','http://www.utags.edu.mx/'),('NL001','Universidad Autónoma de Nuevo León',' Pedro de Alba S/N, Niños Héroes, Ciudad Universitaria, San Nicolás de los Garza, N.L.','8183294000','contactouni@uanl.mx','https://www.uanl.mx/');
/*!40000 ALTER TABLE `universidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bdposgrados'
--

--
-- Dumping routines for database 'bdposgrados'
--
/*!50003 DROP PROCEDURE IF EXISTS `admin1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin1`(
_idAdministrador varchar(10)
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, concat(pg.id_posgrado,pg.id_universidad) as IdPosgrado, pg.nombre as NombrePosgrado,
	   ac.id_area_conocimiento as IdAreaConocimiento, ac.nombre as NombreAreaConocimiento
from posgrado pg
inner join area_conocimiento ac on pg.id_area_conocimiento = ac.id_area_conocimiento
inner join identificador_sitio i
inner join administrador adm
where adm.id_universidad = pg.id_universidad
and _idAdministrador = concat(id_administrador, adm.id_universidad)
and pg.estado = 'A';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin10` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin10`(
_idPosgrado varchar(8),
_nombre varchar(65),
_convocatoria mediumblob
)
BEGIN
update posgrado
set nombre = _nombre, convocatoria = _convocatoria
where _idPosgrado = concat(id_posgrado, id_universidad);
select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin11` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin11`(
_idAreaConocimiento int unsigned
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, 
concat(id_profesor, pr.id_universidad) as IdProfesor, concat(nombres,' ',apellidos) as NombreProfesor
from profesor pr
inner join identificador_sitio i
where _idAreaConocimiento = id_area_conocimiento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin12` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin12`(
_idProfesor varchar(10)
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
concat(pr.id_profesor, pr.id_universidad) as IdProfesor, concat(pr.nombres,' ',pr.apellidos) as NombreProfesor,
pg.nombre as PosgradoProfesor, pr.foto as FotoProfesor
from posgrado pg
inner join profesor pr on pg.id_posgrado = pr.id_posgrado 
inner join identificador_sitio i
where _idProfesor = concat(pr.id_profesor, pr.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin13_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin13_1`(
_idAdministrador varchar(10),
_idPosgrado varchar(8),
_nombre varchar(35),
_clave varchar(6),
_estado char(1)
)
BEGIN
declare v_idUniversidad varchar(5);
declare v_idPosgradoLineaInv int unsigned;
declare v_idLineaInvestigacion int unsigned;

select id_universidad into v_idUniversidad from administrador where _idAdministrador=concat(id_administrador,id_universidad);

select id_posgrado into v_idPosgradoLineaInv from posgrado where _idPosgrado = concat(id_posgrado, id_universidad);

insert into linea_investigacion 
values(null,v_idPosgradoLineaInv,v_idUniversidad,_nombre,_clave,_estado);
set v_idLineaInvestigacion = last_insert_id();

select nombre IdentificadorSitio, id_universidad IdUniversidadSitio,
true as ConfirmacionLineaInv, v_idLineaInvestigacion as IdLineaInvestigacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin13_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin13_2`(
_idLineaInvestigacion int unsigned,
_idProfesor varchar(10)
)
BEGIN
update profesor set id_linea_investigacion = _idLineaInvestigacion where _idProfesor = concat(id_profesor, id_universidad);

select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as ConfirmacionProfesor
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin13_3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin13_3`(
_idLineaInvestigacion int unsigned,
_nombre varchar(35),
_clave varchar(6),
_estado char(1)
)
BEGIN
insert into tema values(null,_idLineaInvestigacion,_nombre,_clave,_estado);

select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as ConfirmacionTema
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin14_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin14_1`(
_idLineaInvestigacion int unsigned
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
li.id_linea_investigacion as IdLineaInvestigacion, li.nombre as NombreLineaInvestigacion, li.clave as ClaveLineaInvestigacion,
li.estado as EstadoLineaInvestigacion, pg.id_area_conocimiento as IdAreaConocimientoLineaInv, ac.nombre as NombreAreaConocimientoLineaInv,
concat(pr.id_profesor, pr.id_universidad) as IdProfesorLineaInvestigacion, concat(pr.nombres, ' ', pr.apellidos) as NombreProfesorLineaInv
from profesor pr
right join linea_investigacion li on pr.id_linea_investigacion = li.id_linea_investigacion
inner join posgrado pg on concat(li.id_posgrado, li.id_universidad_pg) = concat(pg.id_posgrado, pg.id_universidad)
inner join area_conocimiento ac on pg.id_area_conocimiento = ac.id_area_conocimiento
inner join identificador_sitio i
where _idLineaInvestigacion = li.id_linea_investigacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin14_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin14_2`(
_idLineaInvestigacion int unsigned
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
li.id_linea_investigacion as IdLineaInvestigacion, li.nombre as NombreLineaInvestigacion, li.clave as ClaveLineaInvestigacion,
li.estado as EstadoLineaInvestigacion, pg.id_area_conocimiento as IdAreaConocimientoLineaInv, ac.nombre as NombreAreaConocimientoLineaInv,
tm.id_tema as IdTemaLineaInvestigacion, tm.nombre as NombreTemaLineaInvestigacion
from tema tm
right join linea_investigacion li on tm.id_linea_investigacion = li.id_linea_investigacion
inner join posgrado pg on concat(li.id_posgrado, li.id_universidad_pg) = concat(pg.id_posgrado, pg.id_universidad)
inner join area_conocimiento ac on pg.id_area_conocimiento = ac.id_area_conocimiento
inner join identificador_sitio i
where _idLineaInvestigacion = li.id_linea_investigacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin15` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin15`(
_idLineaInvestigacion int unsigned
)
BEGIN
declare v_estado char(1);
select estado into v_estado from linea_investigacion where _idLineaInvestigacion = id_linea_investigacion;
if v_estado = 'A' then
	update linea_investigacion set estado = 'I' where _idLineaInvestigacion = id_linea_investigacion;
    
    select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
    from identificador_sitio;
elseif v_estado = 'I' then
	update linea_investigacion set estado = 'A' where _idLineaInvestigacion = id_linea_investigacion;
    
    select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
    from identificador_sitio;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin16` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin16`(
_idProfesor varchar(10)
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
concat(pr.id_profesor, pr.id_universidad) as IdProfesor, concat(pr.nombres, ' ' ,pr.apellidos) as NombreProfesor,
u.nombre as UniversidadProfesor, pr.cedula as CedulaProfesor, pr.direccion as DireccionProfesor, pr.telefono as TelefonoProfesor,
pr.correo as CorreoProfesor, pr.foto as FotoProfesor
from profesor pr
inner join universidad u on pr.id_universidad = u.id_universidad
inner join identificador_sitio i
where _idProfesor = concat(pr.id_profesor, pr.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin17` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin17`(
_idLineaInvestigacion int unsigned,
_idAreaConocimiento int unsigned
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
li.id_linea_investigacion as IdLineaInvestigacion, li.nombre as NombreLineaInvestigacion, li.clave as ClaveLineaInvestigacion,
li.estado as EstadoLineaInvestigacion, concat(pr.id_profesor, pr.id_universidad) as IdProfesor,
concat(pr.nombres, ' ', pr.apellidos) as NombreProfesor, pr.id_linea_investigacion as IdLineaInvestigacionPr, pr.estado EstadoProfesor
from linea_investigacion li
inner join posgrado pg on concat(li.id_posgrado, li.id_universidad_pg) = concat(pg.id_posgrado, pg.id_universidad)
inner join area_conocimiento ac on pg.id_area_conocimiento = ac.id_area_conocimiento
left join profesor pr on ac.id_area_conocimiento = pr.id_area_conocimiento
inner join identificador_sitio i
where _idLineaInvestigacion = li.id_linea_investigacion
and _idAreaConocimiento = ac.id_area_conocimiento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin18` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin18`(
_idProfesor varchar(10)
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
concat(pr.id_profesor, pr.id_universidad) as IdProfesor, concat(pr.nombres,' ',pr.apellidos) as NombreProfesor,
pg.nombre as PosgradoProfesor, pr.foto as FotoProfesor
from posgrado pg
inner join profesor pr on pg.id_posgrado = pr.id_posgrado
inner join identificador_sitio i
where _idProfesor = concat(pr.id_profesor, pr.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin19` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin19`(
_idLineaInvestigacion int unsigned,
_idProfesor varchar (10),
_seAgrega boolean
)
BEGIN
declare v_idLineaInvestigacion int unsigned;
select id_linea_investigacion into v_idLineaInvestigacion 
from profesor 
where _idProfesor = concat(id_profesor, id_universidad);

if _seAgrega then
	if v_idLineaInvestigacion = _idLineaInvestigacion then
		select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, 
        true Confirmacion #se conserva la linea actual
        from identificador_sitio;
    else
		update profesor set id_linea_investigacion = _idLineaInvestigacion 
        where _idProfesor = concat(id_profesor, id_universidad);
        
        select nombre IdentificadorSitio, id_universidad IdUniversidadSitio,
        true Confirmacion #se agrega a la linea actual
        from identificador_sitio;
	end if;
else
	if v_idLineaInvestigacion = _idLineaInvestigacion then
		update profesor set id_linea_investigacion = null 
        where _idProfesor = concat(id_profesor, id_universidad);
        
		select nombre IdentificadorSitio, id_universidad IdUniversidadSitio,
        true Confirmacion #lo retira de la linea actual
        from identificador_sitio;
    else
		select nombre IdentificadorSitio, id_universidad IdUniversidadSitio,
        true Confirmacion #no se incluye en la linea actual
        from identificador_sitio;
	end if;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin2`(
_idAdministrador varchar(10),
_clavePosgrado varchar(6),
_nombrePosgrado varchar(65),
_idAreaConocimiento int unsigned,
_nivelPosgrado char(1)
)
BEGIN
if _clavePosgrado is not null or _nombrePosgrado is not null then
	select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, 
    concat(pg.id_posgrado,pg.id_universidad) as IdPosgradoFiltrado,
	pg.nombre as NombrePosgradoFiltrado
	from posgrado pg
	inner join area_conocimiento ac on pg.id_area_conocimiento = ac.id_area_conocimiento
	inner join administrador adm on pg.id_universidad = adm.id_universidad
	inner join identificador_sitio i
	where _idAdministrador = concat(id_administrador, adm.id_universidad)
	and (_nombrePosgrado = pg.nombre or _clavePosgrado = pg.clave)
    and pg.estado = 'A';
elseif _idAreaConocimiento is not null and _nivelPosgrado is not null then
	select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, 
    concat(pg.id_posgrado,pg.id_universidad) as IdPosgradoFiltrado,
	pg.nombre as NombrePosgradoFiltrado
	from posgrado pg
	inner join area_conocimiento ac on pg.id_area_conocimiento = ac.id_area_conocimiento
	inner join administrador adm on pg.id_universidad = adm.id_universidad
	inner join identificador_sitio i
	where _idAdministrador = concat(id_administrador, adm.id_universidad)
	and (_idAreaConocimiento = pg.id_area_conocimiento and _nivelPosgrado = pg.nivel)
    and pg.estado = 'A';
elseif _idAreaConocimiento is not null then
	select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, concat(pg.id_posgrado,pg.id_universidad) as IdPosgradoFiltrado,
	pg.nombre as NombrePosgradoFiltrado
	from posgrado pg
	inner join area_conocimiento ac on pg.id_area_conocimiento = ac.id_area_conocimiento
	inner join administrador adm on pg.id_universidad = adm.id_universidad
	inner join identificador_sitio i
	where _idAdministrador = concat(id_administrador, adm.id_universidad)
	and pg.id_area_conocimiento = _idAreaConocimiento
    and pg.estado = 'A';
elseif _nivelPosgrado is not null then
	select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, concat(pg.id_posgrado,pg.id_universidad) as IdPosgradoFiltrado,
	pg.nombre as NombrePosgradoFiltrado
	from posgrado pg
	inner join area_conocimiento ac on pg.id_area_conocimiento = ac.id_area_conocimiento
	inner join administrador adm on pg.id_universidad = adm.id_universidad
	inner join identificador_sitio i
	where _idAdministrador = concat(id_administrador, adm.id_universidad)
	and pg.nivel = _nivelPosgrado
    and pg.estado = 'A';
else
	select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, concat(pg.id_posgrado,pg.id_universidad) as IdPosgradoFiltrado,
	pg.nombre as NombrePosgradoFiltrado
	from posgrado pg
	inner join area_conocimiento ac on pg.id_area_conocimiento = ac.id_area_conocimiento
	inner join administrador adm on pg.id_universidad = adm.id_universidad
	inner join identificador_sitio i
	where _idAdministrador = concat(id_administrador, adm.id_universidad)
    and pg.estado = 'A';
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin21` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin21`(
_idLineaInvestigacion int unsigned,
_nombre varchar(65),
_clave varchar(6),
_estado char(1)
)
BEGIN
declare v_id_tema int unsigned;

insert into tema values(null,_idLineaInvestigacion,_nombre,_clave,_estado);

set v_id_tema = last_insert_id();
select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion, v_id_tema as IdTema
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin22` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin22`(
_idTema int unsigned
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
tm.id_tema as IdTema, tm.nombre as NombreTema, tm.clave as ClaveTema, tm.estado as EstadoTema,
ti.id_tema_impartido as IdTemaImpartido, ti.grupo as Grupo
from tema_impartido ti
right join tema tm on ti.id_tema = tm.id_tema
inner join identificador_sitio i
where _idTema = tm.id_tema;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin23` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin23`(
_idTema int unsigned
)
BEGIN
declare v_estado char(1);
select estado into v_estado from tema where _idTema = id_tema;
if v_estado = 'A' then
	update tema set estado = 'I' where _idTema = id_tema;
    
	select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
	from identificador_sitio;
elseif v_estado = 'I' then
	update tema set estado = 'A' where _idTema = id_tema;
    
	select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
	from identificador_sitio;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin24` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin24`(
_idTema int unsigned
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
id_tema as IdTema, estado as EstadoTema 
from tema
inner join identificador_sitio i
where _idtema = id_tema;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin25` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin25`(
_idTema int unsigned,
_nombre varchar(65),
_clave char(6)
)
BEGIN
update tema set nombre = _nombre, clave = _clave where _idTema = id_tema;

select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin26` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin26`(
_idTema int unsigned
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
tm.id_tema as IdTema, tm.nombre as NombreTema, tm.id_linea_investigacion as IdLineaInvestigacionTema,
li.nombre as NombreLineaInvestigacionTema, li.id_posgrado as IdPosgradoTema, pg.nombre as NombrePosgradoTema,
concat(pr.id_profesor, pr.id_universidad) as IdProfesorTm, concat(pr.nombres, ' ', pr.apellidos) as NombreProfesorTm
from tema tm
inner join linea_investigacion li on tm.id_linea_investigacion = li.id_linea_investigacion
inner join posgrado pg on li.id_posgrado = pg.id_posgrado
left join profesor pr on li.id_linea_investigacion = pr.id_linea_investigacion
inner join identificador_sitio i
where _idTema = tm.id_tema;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin27` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin27`(
_idProfesor varchar(10)
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
concat(pr.id_profesor, pr.id_universidad) as IdProfesor, concat(pr.nombres,' ',pr.apellidos) as NombreProfesor,
pg.nombre as PosgradoProfesor, pr.foto as FotoProfesor
from posgrado pg
inner join profesor pr on pg.id_posgrado = pr.id_posgrado
inner join identificador_sitio i 
where _idProfesor = concat(pr.id_profesor, pr.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin28` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin28`(
_idTema int unsigned,
_idProfesor varchar(10),
_grupo char(1),
_fechaInicio date,
_fechaFin date,
_cupo int unsigned, 
_estado char(1)
)
BEGIN
declare v_idTemaImpartido int unsigned;
declare v_idProfesor int unsigned;
declare v_iduniversidadPr char(5);

select id_profesor, id_universidad
into v_idProfesor, v_idUniversidadPr
from profesor
where _idProfesor = concat(id_profesor, id_universidad);

insert into tema_impartido values(null,_idTema,v_idProfesor,v_idUniversidadPr,_grupo,_fechaInicio,_fechaFin,_cupo,_estado);

set v_idTemaImpartido = last_insert_id();

select nombre IdentificadorSitio, id_universidad IdUniversidadSitio,
true as Confirmacion, v_idTemaImpartido as IdTemaImpartido, _grupo as Grupo
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin29` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin29`(
_idTemaImpartido int unsigned
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
ti.id_tema_impartido as IdTemaImpartido, ti.grupo as Grupo, ti.cupo as Cupo, DATE_FORMAT(ti.fecha_inicio, '%Y-%m-%d') as FechaInicio,
DATE_FORMAT(ti.fecha_fin, '%Y-%m-%d') as FechaFin, ti.estado as Estado, count(ati.id_alumno) NumeroAlumnosInscritos, ti.id_profesor as IdProfesor, 
concat(pr.nombres, ' ', pr.apellidos) as NombreProfesor
from alumno_tema_impartido ati
right join tema_impartido ti on ati.id_tema_impartido = ti.id_tema_impartido
inner join profesor pr on concat(ti.id_profesor,ti.id_universidad_pr) = concat(pr.id_profesor,pr.id_universidad)
inner join identificador_sitio i
where _idTemaImpartido = ti.id_tema_impartido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin3`(
_idAdministrador varchar(10)
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, concat(pg.id_posgrado,pg.id_universidad) as IdPosgrado, pg.nombre as NombrePosgrado
from posgrado pg
inner join area_conocimiento ac on pg.id_area_conocimiento = ac.id_area_conocimiento
inner join identificador_sitio i
inner join administrador adm
where adm.id_universidad = pg.id_universidad
and _idAdministrador = concat(id_administrador, adm.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin30` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin30`(
_idTemaImpartido int unsigned
)
BEGIN
declare v_estado char(1);
select estado into v_estado from tema_impartido where _idTemaImpartido = id_tema_impartido;
if v_estado = 'A' then
	update tema_impartido set estado = 'I' where _idTemaImpartido = id_tema_impartido;
    
    select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
	from identificador_sitio;
elseif v_estado = 'I' then
	update tema_impartido set estado = 'A' where _idTemaImpartido = id_tema_impartido;
    
    select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
	from identificador_sitio;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin31` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin31`(
_idTemaImpartido int unsigned
)
BEGIN
declare v_idTema int unsigned;
select id_tema into v_idTema from tema_impartido where _idTemaImpartido = id_tema_impartido;

select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
tm.id_tema as IdTema, tm.nombre as NombreTema, tm.id_linea_investigacion as IdLineaInvestigacionTema,
li.nombre as NombreLineaInvestigacionTema, li.id_posgrado as IdPosgradoTema, pg.nombre as NombrePosgradoTema,
concat(pr.id_profesor, pr.id_universidad) as IdProfesorTm, concat(pr.nombres, ' ', pr.apellidos) as NombreProfesorTm
from tema tm
inner join linea_investigacion li on tm.id_linea_investigacion = li.id_linea_investigacion
inner join posgrado pg on li.id_posgrado = pg.id_posgrado
left join profesor pr on li.id_linea_investigacion = pr.id_linea_investigacion
inner join identificador_sitio i
where v_idTema = tm.id_tema;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin32` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin32`(
_idTemaImpartido int unsigned,
_idProfesor varchar(10),
_fechaInicio date,
_fechaFin date,
_cupo int unsigned, 
_estado char(1)
)
BEGIN
declare v_idProfesor int unsigned;
declare v_iduniversidadPr char(5);

select id_profesor, id_universidad
into v_idProfesor, v_idUniversidadPr
from profesor
where _idProfesor = concat(id_profesor, id_universidad);

update tema_impartido set id_profesor = v_idProfesor, id_universidad_pr = v_idUniversidadPr, fecha_inicio = _fechaInicio,
fecha_fin = _fechaFin, cupo = _cupo, estado = _estado where id_tema_impartido = _idTemaImpartido;

select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin33` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin33`(
_idAdministrador varchar(10),
_nombres varchar(50),
_apellidos varchar(50),
_telefono varchar(20),
_correo varchar(35),
_contrasena varchar(25),
_estado char(1)
)
BEGIN
declare v_idRegistrador int unsigned;
declare v_idUniversidad varchar(5);

select id_universidad into v_idUniversidad from administrador where _idAdministrador=concat(id_administrador,id_universidad);

insert into registrador values(null,v_idUniversidad,_nombres,_apellidos,_telefono,_correo,_contrasena,_estado);
set v_idRegistrador =  last_insert_id();

select nombre IdentificadorSitio, id_universidad IdUniversidadSitio,
true as Confirmacion, concat(v_idRegistrador,v_idUniversidad) as IdRegistrador
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin34` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin34`(
_idAdministrador varchar(10)
)
BEGIN
declare v_idUniversidad varchar(5);
select id_universidad into v_idUniversidad from administrador where _idAdministrador=concat(id_administrador,id_universidad);

select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
concat(id_registrador, re.id_universidad) as IdRegistrador, concat(nombres, ' ', apellidos) as NombreRegistrador
from registrador re
inner join identificador_sitio i
where v_idUniversidad = re.id_universidad
and re.estado = 'A';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin35` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin35`(
_idAdministrador varchar(10),
_idRegistrador varchar(10)
)
BEGIN
declare v_idUniversidad varchar(5);
select id_universidad into v_idUniversidad from administrador where _idAdministrador=concat(id_administrador,id_universidad);

select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
concat(id_registrador, re.id_universidad) as IdRegistrador, nombres as NombresRegistrador, apellidos as ApellidosRegistrador,
telefono as TelefonoRegistrador, correo as CorreoRegistrador, contrasena as ContrasenaRegistrador
from registrador re
inner join identificador_sitio i
where _idRegistrador = concat(id_registrador,re.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin36` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin36`(
_idRegistrador varchar(10),
_nombres varchar(50),
_apellidos varchar(50),
_telefono varchar(20),
_contrasena varchar(25)
)
BEGIN
update registrador set nombres = _nombres, apellidos = _apellidos, telefono = _telefono, contrasena = _contrasena
where _idRegistrador = concat(id_registrador, id_universidad);

select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin37` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin37`(
_idRegistrador varchar(10)
)
BEGIN
declare v_estado char(1);
select estado into v_estado from registrador where _idRegistrador = concat(id_registrador, id_universidad);
if v_estado = 'A' then
	update registrador set estado = 'I' where _idRegistrador = concat(id_registrador, id_universidad);
    
    select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
	from identificador_sitio;
elseif v_estado = 'I' then
	update registrador set estado = 'A' where _idRegistrador = concat(id_registrador, id_universidad);
	
    select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
	from identificador_sitio;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin38` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin38`(
_nombre varchar(30)
)
BEGIN
declare v_idAreaConocimiento int unsigned;
if not exists(
	select id_area_conocimiento from area_conocimiento where nombre = _nombre) then
	insert into area_conocimiento values(null,_nombre);
	set v_idAreaConocimiento = last_insert_id();

	select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, 
	true as Confirmacion, v_idAreaConocimiento as IdAreaConocimiento
	from identificador_sitio;
else
	select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, 
	false as Confirmacion, v_idAreaConocimiento as IdAreaConocimiento
	from identificador_sitio;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin39` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin39`(
_idAdministrador varchar(10)
)
BEGIN
if exists(select id_administrador from administrador where _idAdministrador=concat(id_administrador,id_universidad)) then
	select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
    ac.id_area_conocimiento as IdAreaConocimiento, ac.nombre as NombreAreaConomiento
	from area_conocimiento ac
    inner join identificador_sitio i;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin4`(
_idAdministrador varchar(10)
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, id_area_conocimiento as IdAreaConocimiento, ac.nombre as NombreAreaConocimiento
from area_conocimiento ac
inner join identificador_sitio i;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin40` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin40`(
_idAdministrador varchar(10),
_idAreaConocimiento int unsigned,
_nombre varchar(30)
)
BEGIN
/*if exists(select id_administrador from administrador where _idAdministrador=concat(id_administrador,id_universidad)) then*/
	update area_conocimiento set nombre = _nombre where _idAreaConocimiento = id_area_conocimiento;
    
	select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
	from identificador_sitio;
/*end if;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin5` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin5`(
_idAdministrador varchar(10),
_idAreaConocimiento int unsigned,
_nombre varchar(65),
_clave varchar(6),
_fechaPublicacion date,
_estado char(1),
_nivel char(1),
_tipoArchivo varchar(5),
_nombreArchivo varchar(35),
_convocatoria mediumblob
)
BEGIN
declare v_idUniversidad varchar(5);
declare v_idPosgrado int unsigned;

select id_universidad into v_idUniversidad from administrador where _idAdministrador=concat(id_administrador,id_universidad);
insert into posgrado
values(null,v_idUniversidad,_idAreaConocimiento,_nombre,_clave,_fechaPublicacion,_estado,_nivel,_tipoArchivo,_nombreArchivo,_convocatoria);
set v_idPosgrado = last_insert_id();
select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion, concat(v_idPosgrado, v_idUniversidad) as IdPosgrado
from identificador_sitio i;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin6` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin6`(
_idAdministrador varchar(10),
_idPosgrado varchar(8)
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, concat(pg.id_posgrado,pg.id_universidad) as IdPosgrado,
pg.nombre as NombrePosgrado, pg.clave as ClavePosgrado, pg.id_area_conocimiento IdAreaConocimientoPg,
ac.nombre NombreAreaConocimientoPg, pg.nivel NivelPosgrado, li.id_linea_investigacion IdLineaInvestigacionPg,
li.nombre NombreLineaInvestigacionPg
from linea_investigacion li
right join posgrado pg on concat(li.id_posgrado,li.id_universidad_pg) = concat(pg.id_posgrado,pg.id_universidad)
inner join area_conocimiento ac on pg.id_area_conocimiento = ac.id_area_conocimiento
inner join identificador_sitio i
inner join administrador adm
where _idPosgrado = concat(pg.id_posgrado,pg.id_universidad)
and adm.id_universidad = pg.id_universidad
and _idAdministrador = concat(id_administrador, adm.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin7` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin7`(
_idPosgrado varchar(8)
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
tipo_archivo as TipoArchivoPosgrado, nombre_archivo as NombreArchivoPosgrado, convocatoria as ConvocatoriaPosgrado
from posgrado pg
inner join identificador_sitio i
where _idPosgrado = concat(id_posgrado, pg.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin8` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin8`(
_idPosgrado varchar(8)
)
BEGIN
declare v_estado char(1);
select estado into v_estado from posgrado where _idPosgrado = concat(id_posgrado,id_universidad);
if v_estado = 'A' then
	update posgrado set estado = 'I' where _idPosgrado = concat(id_posgrado,id_universidad);
    select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
    from identificador_sitio;
elseif v_estado = 'I' then
	update posgrado set estado = 'A' where _idPosgrado = concat(id_posgrado,id_universidad);
    select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
    from identificador_sitio;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin9` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin9`(
_idPosgrado varchar(8)
)
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
concat(pg.id_posgrado, pg.id_universidad) as IdPosgrado, pg.clave as ClavePosgrado,
ac.nombre as AreaConocimientoPosgrado, nivel as NivelPosgrado
from posgrado pg
inner join area_conocimiento ac on pg.id_area_conocimiento = ac.id_area_conocimiento
inner join identificador_sitio i
where _idPosgrado = concat(pg.id_posgrado, pg.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno10` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno10`(
_idAlumno varchar(10),
_idTemaImpartido int unsigned,
_publicacion text,
_fecha datetime
)
BEGIN
declare v_idAlumno int unsigned;
declare v_idUniversidad char(5);

select id_alumno, id_universidad into v_idAlumno,v_idUniversidad from alumno
where _idAlumno = concat(id_alumno, id_universidad);

SET FOREIGN_KEY_CHECKS=0;
insert into publicacion_foro 
values(null,_idTemaImpartido,true,v_idAlumno,v_idUniversidad,_publicacion,_fecha,true);
SET FOREIGN_KEY_CHECKS=1;

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno11` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno11`(
_idPublicacion int unsigned
)
BEGIN
declare v_publicacion text;
declare v_autorPublicacion varchar(101);
declare v_fechaPublicacion datetime;

select pf.publicacion,
case pf.de_alumno when true then 
		concat(al.nombres, ' ', al.apellidos) 
    else 
		concat(pr.nombres, ' ', pr.apellidos) 
end, pf.fecha
into v_publicacion,v_autorPublicacion,v_fechaPublicacion
from publicacion_foro pf
inner join alumno al on concat(pf.id_objetivo,pf.id_universidad) = concat(al.id_alumno,al.id_universidad)
inner join profesor pr on concat(pf.id_objetivo,pf.id_universidad) = concat(pr.id_profesor,pr.id_universidad)
where _idPublicacion = pf.id_publicacion_foro;

if exists(select id_respuesta_foro from respuesta_foro where id_publicacion_foro = _idPublicacion) then
	select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
	_idPublicacion as IdPublicacionForo, v_publicacion as Publicacion, 
	v_autorPublicacion as AutorPublicacion, DATE_FORMAT(v_fechaPublicacion, '%Y-%m-%d %H:%i:%s') as FechaPublicacion,
	rf.id_respuesta_foro as IdRespuestaForo, rf.respuesta as Respuesta,
	case rf.de_alumno when true then 
			concat(al.nombres, ' ', al.apellidos) 
		else 
			concat(pr.nombres, ' ', pr.apellidos) 
	end as AutorRespuesta, DATE_FORMAT(rf.fecha, '%Y-%m-%d %H:%i:%s') as FechaRespuesta
	from respuesta_foro rf
	right join alumno al 
	on concat(rf.id_objetivo,rf.id_universidad) = concat(al.id_alumno,al.id_universidad)
	right join profesor pr 
	on concat(rf.id_objetivo,rf.id_universidad) = concat(pr.id_profesor,pr.id_universidad)
	inner join identificador_sitio i
	where _idPublicacion = rf.id_publicacion_foro;
else
	select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio,
	_idPublicacion as IdPublicacionForo, v_publicacion as Publicacion, 
	v_autorPublicacion as AutorPublicacion, v_fechaPublicacion as FechaPublicacion,
    null as IdRespuestaForo, null as Respuesta, null as AutorRespuesta, null as FechaRespuesta
	from identificador_sitio;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno12` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno12`(
_idAlumno varchar(10),
_idPublicacion int unsigned,
_respuesta text,
_fecha datetime
)
BEGIN
declare v_idAlumno int unsigned;
declare v_idUniversidad char(5);

select id_alumno, id_universidad into v_idAlumno,v_idUniversidad from alumno
where _idAlumno = concat(id_alumno, id_universidad);

SET FOREIGN_KEY_CHECKS=0;
insert into respuesta_foro 
values(null,_idPublicacion,true,v_idAlumno,v_idUniversidad,_respuesta,_fecha,true);
SET FOREIGN_KEY_CHECKS=1;

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno13` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno13`(
_idAlumno varchar(10)
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio, 
ac.nombre as AreaConocimiento, pg.nombre as Posgrado, li.nombre as LineaInvestigacion,
concat(pr.id_profesor, pr.id_universidad) as IdProfesor, 
concat(pr.nombres,' ',pr.apellidos) as Nombre, 
pr.telefono as Telefono, pr.cedula as Cedula,
pr.correo as Correo, pr.online as OnlineProfesor, 
pr.tipo_archivo as TipoArchivo, pr.nombre_archivo as NombreArchivo, pr.foto as Foto
from posgrado_alumno pa
inner join profesor pr on concat(pa.id_profesor_tutor, pa.id_universidad) = concat(pr.id_profesor,pr.id_universidad)
inner join area_conocimiento ac on pr.id_area_conocimiento = ac.id_area_conocimiento
inner join posgrado pg on pr.id_posgrado = pg.id_posgrado
inner join linea_investigacion li on pr.id_linea_investigacion = li.id_linea_investigacion
inner join identificador_sitio i
where _idAlumno = concat(pa.id_alumno,pa.id_universidad_al);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno14` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno14`()
BEGIN
select identificador_sitio.nombre as IdentificadorSitio, 
identificador_sitio.id_universidad as IdUniversidadSitio,
universidad.id_universidad as IdUniversidad, universidad.nombre as Universidad
from universidad
inner join identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno15` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno15`(
_idUniversidad char(5),
_idAlumno varchar(10)
)
BEGIN
select identificador_sitio.nombre as IdentificadorSitio, 
identificador_sitio.id_universidad as IdUniversidadSitio,
posgrado.id_posgrado as IdPosgrado, 
posgrado.nombre as Posgrado, 
area_conocimiento.nombre AreaConocimiento
from posgrado
inner join area_conocimiento on posgrado.id_area_conocimiento = area_conocimiento.id_area_conocimiento
inner join alumno on area_conocimiento.id_area_conocimiento = alumno.id_area_conocimiento
inner join identificador_sitio
where _idUniversidad = posgrado.id_universidad
and _idAlumno = concat(alumno.id_alumno,alumno.id_universidad)
and posgrado.estado = 'A';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno16` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno16`(
_idPosgrado int unsigned
)
BEGIN
select 
identificador_sitio.nombre as IdentificadorSitio, 
identificador_sitio.id_universidad as IdUniversidadSitio,
posgrado.id_posgrado as IdPosgrado, posgrado.tipo_archivo as TipoArchivo, 
posgrado.nombre_archivo as NombreArchivo, posgrado.convocatoria as Convocatoria
from posgrado
inner join identificador_sitio
where _idPosgrado = posgrado.id_posgrado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno17` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno17`(
_idPosgrado int unsigned
)
BEGIN
select 
identificador_sitio.nombre as IdentificadorSitio, 
identificador_sitio.id_universidad as IdUniversidadSitio,
posgrado.id_posgrado as IdPosgrado, posgrado.nombre as Posgrado, 
universidad.nombre Universidad,
linea_investigacion.id_linea_investigacion IdLineaInvestigacion, 
linea_investigacion.nombre LineaInvestigacion
from posgrado
inner join universidad on posgrado.id_universidad = universidad.id_universidad
left join linea_investigacion on posgrado.id_posgrado = linea_investigacion.id_posgrado
inner join identificador_sitio
where _idPosgrado = posgrado.id_posgrado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno18` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno18`(
_idLineaInvestigacion int unsigned
)
BEGIN
select 
identificador_sitio.nombre as IdentificadorSitio,
identificador_sitio.id_universidad as IdUniversidadSitio,
linea_investigacion.id_linea_investigacion as IdLineaInvestigacion, 
linea_investigacion.nombre as LineaInvestgacion, 
tema.id_tema as IdTema, tema.nombre as Tema
from linea_investigacion
left join tema on linea_investigacion.id_linea_investigacion = tema.id_linea_investigacion
inner join identificador_sitio
where _idLineaInvestigacion = linea_investigacion.id_linea_investigacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno19_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno19_1`(
_idAlumno varchar(10)
)
BEGIN
select identificador_sitio.nombre as IdentificadorSitio, 
identificador_sitio.id_universidad as IdUniversidadSitio,
universidad.nombre UniversidadAlumno, area_conocimiento.nombre AreaConocimientoAlumno, _idAlumno as IdAlumno,
alumno.nombres as Nombres, alumno.apellidos as Apellidos, DATE_FORMAT(alumno.fecha_nacimiento, '%Y-%m-%d') as FechaNacimiento,
alumno.genero as Genero, alumno.direccion as Direccion, alumno.entidad_federativa as EntidadFederativa,
alumno.ciudad as Ciudad, alumno.telefono as Telefono, alumno.correo as Correo, DATE_FORMAT(alumno.fecha_registro, '%Y-%m-%d') as FechaRegistro,
alumno.tipo_archivo as TipoArchivo, alumno.nombre_archivo as NombreArchivo, alumno.foto as Foto
from alumno
inner join universidad on alumno.id_universidad = universidad.id_universidad
inner join area_conocimiento on alumno.id_area_conocimiento = area_conocimiento.id_area_conocimiento
inner join identificador_sitio
where _idAlumno = concat(alumno.id_alumno,alumno.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno19_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno19_2`(
_idUniversidad char(5),
_idPosgrado int unsigned,
_idLineaInvestigacion int unsigned,
_idTema int unsigned
)
BEGIN
select identificador_sitio.nombre as IdentificadorSitio, 
identificador_sitio.id_universidad as IdUniversidadSitio,
_idUniversidad as IdUniversidad, universidad.nombre as UniversidadSeleccionada, 
_idPosgrado as IdPosgrado, posgrado.nombre as PosgradoSeleccionado,
_idLineaInvestigacion as IdLineaInvestigacion, linea_investigacion.nombre as LineaInvestigacionSeleccionada,
_idTema as IdTema, tema.nombre as TemaSeleccionado
from universidad
inner join posgrado on universidad.id_universidad = posgrado.id_universidad
inner join linea_investigacion on posgrado.id_posgrado = linea_investigacion.id_posgrado
inner join tema on linea_investigacion.id_linea_investigacion = tema.id_linea_investigacion
inner join identificador_sitio
where _idTema = tema.id_tema;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno1_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno1_1`(
_idAlumno varchar(10)
)
BEGIN
select
i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio, _idAlumno as IdAlumno,
ati.id_tema_impartido as IdCurso, pg.nombre as NombrePosgrado, li.nombre as LineaInvestigacion,
tm.nombre as Tema, ti.grupo as Grupo, concat(ti.id_profesor, ti.id_universidad_pr) as IdProfesor,
concat(pr.nombres, ' ', pr.apellidos) as NombreProfesor, pr.online as OnlineProfesor, 
pr.tipo_archivo as TipoArchivo, pr.nombre_archivo as NombreArchivo, pr.foto as Foto
from alumno_tema_impartido ati
inner join tema_impartido ti on ati.id_tema_impartido = ti.id_tema_impartido
inner join tema tm on ti.id_tema = tm.id_tema
inner join linea_investigacion li on tm.id_linea_investigacion = li.id_linea_investigacion
inner join posgrado pg on li.id_posgrado = pg.id_posgrado
inner join profesor pr on concat(ti.id_profesor, ti.id_universidad_pr) = concat(pr.id_profesor,pr.id_universidad)
inner join identificador_sitio i
where _idAlumno = concat(ati.id_alumno, ati.id_universidad_al);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno1_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno1_2`(
_idAlumno varchar(10)
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
re.id_recurso as IdRecurso, re.nombre as Nombre, DATE_FORMAT(re.fecha, '%Y-%m-%d') as Fecha
from alumno_tema_impartido ati
inner join recurso re on ati.id_tema_impartido = re.id_tema_impartido
inner join identificador_sitio i
where _idAlumno = concat(ati.id_alumno, ati.id_universidad_al);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno1_3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno1_3`(
_idAlumno varchar(10)
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
act.id_actividad as IdActividad, act.nombre as Nombre, DATE_FORMAT(act.fecha_asignacion, '%Y-%m-%d %H:%i:%s') as FechaAsignacion, act.tipo as Tipo
from alumno_tema_impartido ati
inner join actividad act on ati.id_tema_impartido = act.id_tema_impartido
inner join identificador_sitio i
where _idAlumno = concat(ati.id_alumno, ati.id_universidad_al);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno1_4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno1_4`(
_idAlumno varchar(10)
)
BEGIN
declare v_idTemaImpartido int unsigned;

select id_tema_impartido into v_idTemaImpartido 
from alumno_tema_impartido 
where _idAlumno = concat(id_alumno,id_universidad_al);

select 
identificador_sitio.nombre as IdentificadorSitio, 
identificador_sitio.id_universidad as IdUniversidadSitio,
concat(alumno.id_alumno,alumno.id_universidad) as IdAlumno,
concat(alumno.nombres,' ',alumno.apellidos) as Nombre,
alumno.online as OnlineAlumno,
alumno.tipo_archivo as TipoArchivo,
alumno.nombre_archivo as NombreArchivo,
alumno.foto as Foto
from alumno_tema_impartido
inner join alumno 
on concat(alumno_tema_impartido.id_alumno,alumno_tema_impartido.id_universidad_al) 
= concat(alumno.id_alumno,alumno.id_universidad)
inner join identificador_sitio
where alumno_tema_impartido.id_tema_impartido = v_idTemaImpartido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno2`(
_idAlumno varchar(10)
)
BEGIN
select 
identificador_sitio.nombre as IdentificadorSitio, 
identificador_sitio.id_universidad as IdUniversidadSitio,
_idAlumno as IdAlumno, 
area_conocimiento.nombre as AreaConocimiento, 
universidad.nombre as Universidad,
alumno.nombres Nombres, alumno.apellidos Apellidos, 
DATE_FORMAT(alumno.fecha_nacimiento, '%Y-%m-%d') as FechaNacimiento, alumno.genero as Genero, 
alumno.direccion as Direccion, alumno.entidad_federativa as EntidadFederativa,
alumno.ciudad as Ciudad, alumno.telefono as Telefono, 
alumno.correo as Correo, DATE_FORMAT(alumno.fecha_registro, '%Y-%m-%d') as FechaRegistro,
alumno.tipo_archivo as TipoArchivo, 
alumno.nombre_archivo as NombreArchivo, 
alumno.foto as Foto
from alumno
inner join area_conocimiento on alumno.id_area_conocimiento = area_conocimiento.id_area_conocimiento
inner join universidad on alumno.id_universidad = universidad.id_universidad 
inner join identificador_sitio
where _idAlumno = concat(alumno.id_alumno,alumno.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno20` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno20`(
_claveAlumno varchar(255),
_origenAlumno boolean,
_claveSolicitud varchar(255),
_origenSolicitud boolean,
_idAlumno int unsigned,
_idUniversidadAl char(5),
_idAreaConocimiento int unsigned,
_nombres varchar(50),
_apellidos varchar(50),
_fechaNacimiento date,
_genero char(1),
_direccion char(200),
_entidadFederativa char(2),
_ciudad varchar(50),
_telefono varchar(20),
_correo varchar(35),
_contrasena varchar(25),
_onlineAl boolean,
_fechaRegistro date,
_estado char(1),
_strikes int unsigned,
_tipoArchivo varchar(5),
_nombreArchivo varchar(35),
_foto mediumblob,
_idTema int unsigned,
_fechaSolicitud date
)
BEGIN
declare v_idSolicitud int unsigned;

if _origenAlumno is false 
and not exists(
	select id_alumno 
    from alumno 
    where concat(id_alumno,id_universidad) = concat(_idAlumno,_idUniversidadAl)
    )
then
	insert into alumno 
    values(_idAlumno,_idUniversidadAl,_idAreaConocimiento,_nombres,_apellidos,_fechaNacimiento,_genero,
    _direccion,_entidadFederativa,_ciudad,_telefono,_correo,_contrasena,_onlineAl,_fechaRegistro,_estado,
    _strikes,_tipoArchivo,_nombreArchivo,_foto,_claveAlumno,_origenAlumno);
end if;

insert into solicitud 
values(null,_idAlumno,_idUniversidadAl,_idTema,_fechaSolicitud,'P','P',false,_claveSolicitud,_origenSolicitud);

set v_idSolicitud = last_insert_id();

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion, 
_claveAlumno as ClaveAlumno, _origenAlumno as OrigenAlumno,
_claveSolicitud ClaveSolicitud ,_origenSolicitud OrigenSolicitud, v_idSolicitud IdSolicitud
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno21` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno21`(
_idAlumno varchar(10)
)
BEGIN
select identificador_sitio.nombre as IdentificadorSitio, identificador_sitio.id_universidad as IdUniversidadSitio,
solicitud.id_solicitud as IdSolicitud, DATE_FORMAT(solicitud.fecha, '%Y-%m-%d') as Fecha, 
posgrado.nombre Posgrado, solicitud.estado_alumno
as EstadoAlumno
from solicitud
inner join tema on solicitud.id_tema = tema.id_tema
inner join linea_investigacion on tema.id_linea_investigacion = linea_investigacion.id_linea_investigacion
inner join posgrado on linea_investigacion.id_posgrado = posgrado.id_posgrado
inner join identificador_sitio
where _idAlumno = concat(solicitud.id_alumno,solicitud.id_universidad_al);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno22_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno22_1`(
_idSolicitud int unsigned
)
BEGIN
select identificador_sitio.nombre as IdentificadorSitio, identificador_sitio.id_universidad as IdUniversidadSitio,
concat(solicitud.id_alumno, solicitud.id_universidad_al) as IdAlumno, 
area_conocimiento.nombre as AreaConocimiento, universidad.nombre as Universidad,
alumno.nombres as Nombres, alumno.apellidos as Apellidos, DATE_FORMAT(alumno.fecha_nacimiento, '%Y-%m-%d') as FechaNacimiento,
alumno.genero as Genero, alumno.direccion as Direccion, alumno.entidad_federativa as EntidadFederativa,
alumno.ciudad as Ciudad, alumno.telefono as Telefono, alumno.correo as Correo, DATE_FORMAT(alumno.fecha_registro, '%Y-%m-%d') as FechaRegistro,
alumno.tipo_archivo as TipoArchivo, alumno.nombre_archivo as NombreArchivo, alumno.foto as Foto
from solicitud
inner join alumno on concat(solicitud.id_alumno,solicitud.id_universidad_al) = concat(alumno.id_alumno,alumno.id_universidad)
inner join area_conocimiento on alumno.id_area_conocimiento = area_conocimiento.id_area_conocimiento
inner join universidad on alumno.id_universidad = universidad.id_universidad
inner join identificador_sitio
where _idSolicitud = solicitud.id_solicitud;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno22_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno22_2`(
_idSolicitud int unsigned
)
BEGIN
select identificador_sitio.nombre as IdentificadorSitio, identificador_sitio.id_universidad as IdUniversidadSitio,
universidad.nombre as UniversidadSeleccionada,
posgrado.nombre as PosgradoSeleccionado,
linea_investigacion.nombre as LineaInvestigacionSeleccionada,
tema.nombre as TemaSeleccionado,
DATE_FORMAT(solicitud.fecha, '%Y-%m-%d') as FechaSolicitud,
solicitud.estado_uni as EstadoUniversidad, solicitud.estado_alumno as EstadoAlumno
from solicitud
inner join tema on solicitud.id_tema = tema.id_tema
inner join linea_investigacion on tema.id_linea_investigacion = linea_investigacion.id_linea_investigacion
inner join posgrado on linea_investigacion.id_posgrado = posgrado.id_posgrado
inner join universidad on posgrado.id_universidad = universidad.id_universidad
inner join identificador_sitio
where _idSolicitud = solicitud.id_solicitud;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno23` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno23`(
_idSolicitud int unsigned,
_estadoAlumno char(1)
)
BEGIN
update solicitud set estado_alumno = _estadoAlumno where id_solicitud = _idSolicitud;

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno3`(
_idAlumno varchar(10)
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
_idAlumno as IdAlumno, ac.nombre as AreaConocimiento, uni.nombre as Universidad,
al.nombres Nombres, al.apellidos Apellidos, DATE_FORMAT(al.fecha_nacimiento, '%Y-%m-%d') as FechaNacimiento,
al.genero as Genero, al.direccion as Direccion, al.entidad_federativa as EntidadFederativa,
al.ciudad as Ciudad, al.telefono as Telefono, al.correo as Correo, DATE_FORMAT(al.fecha_registro, '%Y-%m-%d') as FechaRegistro,
al.tipo_archivo as TipoArchivo, al.nombre_archivo as NombreArchivo, al.foto as Foto
from alumno al
inner join area_conocimiento ac on al.id_area_conocimiento = ac.id_area_conocimiento
inner join universidad uni on al.id_universidad = uni.id_universidad 
inner join identificador_sitio i
where _idAlumno = concat(al.id_alumno,al.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno4`(
_idAlumno varchar(10),
_telefono varchar(20),
_contrasena varchar(25),
_tipoArchivo varchar(5),
_nombreArchivo varchar(35),
_foto mediumblob
)
BEGIN
update alumno set telefono = _telefono, 
contrasena = _contrasena, 
tipo_archivo = _tipoArchivo,
nombre_archivo = _nombreArchivo, foto = _foto 
where _idAlumno = concat(id_alumno,id_universidad);

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno5` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno5`(
_idRecurso int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
_idRecurso as IdRecurso, re.descripcion as Descripcion, DATE_FORMAT(re.fecha, '%Y-%m-%d') as Fecha, 
re.tipo_archivo as TipoArchivo, re.nombre_archivo as NombreArchivo, 
re.contenido as Contenido
from recurso re
inner join identificador_sitio i
where _idRecurso = re.id_recurso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno6` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno6`(
_idAlumno varchar(10),
_idActividad int unsigned
)
BEGIN
declare v_nombreActividad varchar(35);
declare v_actividadDescripcion text;
declare v_tipoActividad char(1);
declare v_fechaAsigacion datetime;
declare v_fechaInicio datetime;
declare v_fechaFin datetime;

select 
act.nombre, act.actividad, act.tipo,
act.fecha_asignacion, act.fecha_inicio, act.fecha_fin
into
v_nombreActividad, v_actividadDescripcion, v_tipoActividad,
v_fechaAsigacion, v_fechaInicio, v_fechaFin
from actividad act
where _idActividad = act.id_actividad;

select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
_idActividad as IdActividad, v_nombreActividad as NombreActividad, v_actividadDescripcion as DescripcionActividad,
v_tipoActividad as TipoActividad, DATE_FORMAT(v_fechaAsigacion, '%Y-%m-%d %H:%i:%s') as FechaAsignacion, 
DATE_FORMAT(v_fechaInicio, '%Y-%m-%d %H:%i:%s') as FechaInicio, DATE_FORMAT(v_fechaFin, '%Y-%m-%d %H:%i:%s') as FechaFin,
DATE_FORMAT(actal.fecha_subida, '%Y-%m-%d %H:%i:%s') as FechaSubida, DATE_FORMAT(actal.fecha_calificada, '%Y-%m-%d %H:%i:%s') as FechaCalificada,
actal.calificacion as Calificacion, actal.comentarios as Comentarios
from alumno al
left join actividad_alumno actal on 
concat(al.id_alumno, al.id_universidad) = concat(actal.id_alumno, actal.id_universidad_al)
and _idActividad = actal.id_actividad
inner join identificador_sitio i
where _idAlumno = concat(al.id_alumno, al.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno7` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno7`(
_idAlumno varchar(10),
_idActividad int unsigned,
_fechaSubida datetime,
_tipoArchivo varchar(5),
_nombreArchivo varchar(60),
_archivo longblob
)
BEGIN
declare v_idAlumno int unsigned;
declare v_idUniversidad char(5);

select id_alumno, id_universidad into v_idAlumno, v_idUniversidad from alumno
where _idAlumno = concat(id_alumno,id_universidad);

insert into actividad_alumno 
values(_idActividad,v_idAlumno,v_idUniversidad,null,null,
_fechaSubida,null,_tipoArchivo,_nombreArchivo,_archivo);

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno8` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno8`(
_idTemaImpartido int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
pf.id_publicacion_foro as IdPublicacionForo, pf.publicacion as Publicacion,
case pf.de_alumno when true then 
		concat(al.nombres, ' ', al.apellidos) 
    else 
		concat(pr.nombres, ' ', pr.apellidos) 
end as Autor, DATE_FORMAT(pf.fecha, '%Y-%m-%d %H:%i:%s') as Fecha
from publicacion_foro pf
left join alumno al on concat(pf.id_objetivo,pf.id_universidad) = concat(al.id_alumno,al.id_universidad)
left join profesor pr on concat(pf.id_objetivo,pf.id_universidad) = concat(pr.id_profesor,pr.id_universidad)
inner join identificador_sitio i
where _idTemaImpartido = pf.id_tema_impartido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumno9` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumno9`(
_idAlumno varchar(10),
_idTemaImpartido int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
pf.id_publicacion_foro as IdPublicacionForo, pf.publicacion as Publicacion, DATE_FORMAT(pf.fecha, '%Y-%m-%d %H:%i:%s') as Fecha
from publicacion_foro pf
inner join identificador_sitio i
where _idTemaImpartido = pf.id_tema_impartido
and _idAlumno = concat(pf.id_objetivo,pf.id_universidad)
and de_alumno = true;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `backupadmin38` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `backupadmin38`(
_nombre varchar(30)
)
BEGIN
select nombre IdentificadorSitio, id_universidad IdUniversidadSitio,
exists(
	select id_area_conocimiento 
	from area_conocimiento where nombre = _nombre
) as Existe
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `backupadmin40` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `backupadmin40`(
_idAreaConocimiento int unsigned
)
BEGIN
select identificador_sitio.nombre IdentificadorSitio, identificador_sitio.id_universidad IdUniversidadSitio,
area_conocimiento.id_area_conocimiento as IdAreaConocimiento, area_conocimiento.nombre as NombreAreaConomiento
from area_conocimiento
inner join identificador_sitio
where id_area_conocimiento = _idAreaConocimiento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `backupalumno20` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `backupalumno20`(
_idAlumno varchar(10)
)
BEGIN
select identificador_sitio.nombre as IdentificadorSitio, identificador_sitio.id_universidad as IdUniversidadSitio,
alumno.id_alumno as IdAlumno, alumno.id_universidad as IdUniversidadAl, alumno.id_area_conocimiento as IdAreaConocimiento, 
alumno.nombres as Nombres, alumno.apellidos as Apellidos, DATE_FORMAT(alumno.fecha_nacimiento, '%Y-%m-%d') as FechaNacimiento, 
alumno.genero as Genero, alumno.direccion as Direccion, alumno.entidad_federativa as EntidadFederativa, 
alumno.ciudad as Ciudad, alumno.telefono as Telefono, alumno.correo as Correo, 
alumno.contrasena as Contrasena, alumno.online as OnlineAl, DATE_FORMAT(alumno.fecha_registro, '%Y-%m-%d') as FechaRegistro, 
alumno.estado as Estado, alumno.strikes as Strikes, 
alumno.tipo_archivo as TipoArchivo, alumno.nombre_archivo as NombreArchivo, alumno.foto as Foto, 
alumno.clave_i as ClaveInsercion, alumno.origen_i as OrigenInsercion
from alumno
inner join identificador_sitio
where _idAlumno = concat(alumno.id_alumno,alumno.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `backupalumno23` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `backupalumno23`(
_idSolicitud int unsigned
)
BEGIN
select 
identificador_sitio.nombre as IdentificadorSitio, identificador_sitio.id_universidad as IdUniversidadSitio,
solicitud.id_solicitud as IdSolicitud, solicitud.estado_alumno as EstadoAlumno
from solicitud
inner join identificador_sitio
where solicitud.id_solicitud = _idSolicitud;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `backupalumno4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `backupalumno4`(
_idAlumno varchar(10)
)
BEGIN 
select 
identificador_sitio.nombre as IdentificadorSitio,
identificador_sitio.id_universidad as IdUniversidadSitio,
_idAlumno as IdAlumno, alumno.telefono as Telefono, alumno.contrasena as Contrasena,
alumno.tipo_archivo as TipoArchivo, alumno.nombre_archivo as NombreArchivo, alumno.foto as Foto
from alumno
inner join identificador_sitio
where _idAlumno = concat(alumno.id_alumno,alumno.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `backupregistrador6` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `backupregistrador6`(
_idAlumno varchar(10)
)
BEGIN
select identificador_sitio.nombre as IdentificadorSitio, identificador_sitio.id_universidad as IdUniversidadSitio,
_idAlumno as IdAlumno, alumno.estado as EstadoAlumno
from alumno
inner join identificador_sitio
where _idAlumno = concat(alumno.id_alumno,alumno.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `backupregistrador9` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `backupregistrador9`(
_idAlumno varchar(10)
)
BEGIN
select identificador_sitio.nombre as IdentificadorSitio, identificador_sitio.id_universidad as IdUniversidadSitio,
_idAlumno as IdAlumno, nombres as Nombres, apellidos as Apellidos, correo as Correo, DATE_FORMAT(fecha_nacimiento, '%Y-%m-%d') as FechaNacimiento,
genero as Genero, direccion as Direccion, entidad_federativa as EntidadFederativa, ciudad as Ciudad, 
telefono as Telefono, id_area_conocimiento as IdAreaConocimiento
from alumno
inner join identificador_sitio
where _idAlumno = concat(id_alumno,alumno.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login1`(
_correo varchar(35),
_contrasena varchar(25),
_tipoUsuario varchar (13)
)
BEGIN
if _tipoUsuario = "alumno" then
	select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, estado as Estado, 
    concat(id_alumno, al.id_universidad) as IdUsuario,
    concat(nombres, ' ', apellidos) as NombreUsuario,
    tipo_archivo as TipoArchivo, nombre_archivo as NombreArchivo, foto as Foto
	from alumno al
    inner join identificador_sitio i
	where _correo=correo    
	and _contrasena=contrasena;
elseif _tipoUsuario = "profesor" then
	select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, estado as Estado, 
    concat(id_profesor, pr.id_universidad) as IdUsuario, 
    concat(nombres, ' ', apellidos) as NombreUsuario,
    tipo_archivo as TipoArchivo, nombre_archivo as NombreArchivo, foto as Foto
	from profesor pr
    inner join identificador_sitio i
	where _correo=correo
	and _contrasena=contrasena;
elseif _tipoUsuario = "registrador" then
	select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, estado as Estado, 
    concat(id_registrador, re.id_universidad) as IdUsuario, 
    concat(nombres, ' ', apellidos) as NombreUsuario,
    null as TipoArchivo, null as NombreArchivo, null as Foto
	from registrador re
    inner join identificador_sitio i
	where _correo=correo
	and _contrasena=contrasena;
elseif _tipoUsuario = "administrador" then
	select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, "A" as Estado, 
    concat(id_administrador, adm.id_universidad) as IdUsuario, 
    concat(nombres, ' ', apellidos) as NombreUsuario,
    null as TipoArchivo, null as NombreArchivo, null as Foto
	from administrador adm
    inner join identificador_sitio i
	where _correo=correo
	and _contrasena=contrasena;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login2`(
_correo varchar(35),
_tipoUsuario varchar(13)
)
BEGIN
if _tipoUsuario = "alumno" then
	select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, estado as Estado, contrasena as Contrasena
	from alumno
    inner join identificador_sitio i
	where _correo=correo;
elseif _tipoUsuario = "profesor" then
	select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, estado as Estado, contrasena as Contrasena
	from profesor
    inner join identificador_sitio i
	where _correo=correo;
elseif _tipoUsuario = "registrador" then
	select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, estado as Estado, contrasena as Contrasena
	from registrador
    inner join identificador_sitio i
	where _correo=correo;
elseif _tipoUsuario = "administrador" then
	select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio, "A" as Estado, contrasena as Contrasena
	from administrador
    inner join identificador_sitio i
	where _correo=correo;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor10` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor10`(
_idAlumno varchar(10),
_idActividad int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
actal.nombre_archivo as NombreArchivo,
actal.tipo_archivo as TipoArchivo,
actal.archivo as Archivo
from actividad_alumno actal
inner join identificador_sitio i
where _idActividad = actal.id_actividad
and _idAlumno = concat(actal.id_alumno,actal.id_universidad_al);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor11` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor11`(
_idAlumno varchar(10),
_idActividad int unsigned,
_fechaCalificada datetime,
_calificacion float,
_comentarios text
)
BEGIN
update actividad_alumno set fecha_calificada = _fechaCalificada,
calificacion = _calificacion, comentarios = _comentarios
where _idAlumno = concat(id_alumno,id_universidad_al) and _idActividad = id_actividad;

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor12` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor12`(
_idTemaImpartido int unsigned,
_nombre varchar(35),
_actividad text,
_fechaAsginacion datetime,
_fechaInicio datetime,
_fechaFin datetime,
_tipo char(1)
)
BEGIN
insert into actividad values(null,_idTemaImpartido,_nombre,_actividad,
_fechaAsginacion,_fechaInicio,_fechaFin,_tipo);

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor13` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor13`(
_idTemaImpartido int unsigned,
_fecha date,
_descripcion text,
_nombre varchar(45),
_tipoArchivo varchar(5),
_nombreArchivo varchar(60),
_contenido longblob
)
BEGIN
insert into recurso values(null,_idTemaImpartido,_fecha,_descripcion,_tipoArchivo,
_nombreArchivo,_contenido,_nombre);

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor14` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor14`(
_idTemaImpartido int unsigned
)
BEGIN
select 
	i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
	_idTemaImpartido as IdCurso, ti.grupo as Grupo, tm.nombre NombreCurso,
	concat(ati.id_alumno,ati.id_universidad_al) as IdAlumno,
	concat(al.nombres, ' ',al.apellidos) as Nombre,
    act.id_actividad as IdActividad, act.nombre NombreActividad, act.tipo as Tipo,
	concat(actal.id_actividad,'-',actal.id_alumno,actal.id_universidad_al) as IdActRealizada,
	actal.calificacion as Calificacion
from alumno_tema_impartido ati
	inner join tema_impartido ti
		on ati.id_tema_impartido = ti.id_tema_impartido
	inner join alumno al
		on (al.id_alumno = ati.id_alumno) 
		and (al.id_universidad = ati.id_universidad_al)
	inner join tema tm
		on ti.id_tema = tm.id_tema
	inner join actividad act
		on ti.id_tema_impartido = act.id_tema_impartido
	left join actividad_alumno actal
		on act.id_actividad = actal.id_actividad
		and (al.id_alumno = actal.id_alumno) 
		and (al.id_universidad = actal.id_universidad_al)
	inner join identificador_sitio i
where 
	ti.id_tema_impartido = _idTemaImpartido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor15` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor15`(
_idTemaImpartido int unsigned,
_idAlumno varchar(10),
_calificacionFinal int unsigned,
_estado char(1)
)
BEGIN
update alumno_tema_impartido 
set calificacion_final = _calificacionFinal, estado = _estado
where _idAlumno = concat(id_alumno,id_universidad_al)
and _idTemaImpartido = id_tema_impartido;

update posgrado_alumno set estado = _estado, fecha_fin = sysdate()
where _idAlumno = concat(id_alumno,id_universidad_al);

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor16` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor16`(
_idTemaImpartido int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
pf.id_publicacion_foro as IdPublicacionForo, pf.publicacion as Publicacion,
case pf.de_alumno when true then 
		concat(al.nombres, ' ', al.apellidos)
    else 
		concat(pr.nombres, ' ', pr.apellidos) 
end as Autor, DATE_FORMAT(pf.fecha, '%Y-%m-%d %H:%i:%s') as Fecha
from publicacion_foro pf
left join alumno al on concat(pf.id_objetivo,pf.id_universidad) = concat(al.id_alumno,al.id_universidad)
left join profesor pr on concat(pf.id_objetivo,pf.id_universidad) = concat(pr.id_profesor,pr.id_universidad)
inner join identificador_sitio i
where _idTemaImpartido = pf.id_tema_impartido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor17` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor17`(
_idProfesor varchar(10),
_idTemaImpartido int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
pf.id_publicacion_foro as IdPublicacionForo, pf.publicacion as Publicacion, DATE_FORMAT(pf.fecha, '%Y-%m-%d %H:%i:%s') as Fecha
from publicacion_foro pf
inner join identificador_sitio i
where _idTemaImpartido = pf.id_tema_impartido
and _idProfesor = concat(pf.id_objetivo,pf.id_universidad)
and de_alumno = false;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor18` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor18`(
_idProfesor varchar(10),
_idTemaImpartido int unsigned,
_publicacion text,
_fecha datetime
)
BEGIN
declare v_idProfesor int unsigned;
declare v_idUniversidad char(5);

select id_profesor, id_universidad into v_idProfesor,v_idUniversidad from profesor
where _idProfesor = concat(id_profesor, id_universidad);

SET FOREIGN_KEY_CHECKS=0;
insert into publicacion_foro 
values(null,_idTemaImpartido,false,v_idProfesor,v_idUniversidad,_publicacion,_fecha,true);
SET FOREIGN_KEY_CHECKS=1;

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor19` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor19`(
_idPublicacion int unsigned
)
BEGIN
declare v_publicacion text;
declare v_autorPublicacion varchar(101);
declare v_fechaPublicacion datetime;

select pf.publicacion,
case pf.de_alumno when true then 
		concat(al.nombres, ' ', al.apellidos) 
    else 
		concat(pr.nombres, ' ', pr.apellidos) 
end, pf.fecha
into v_publicacion,v_autorPublicacion,v_fechaPublicacion
from publicacion_foro pf
inner join alumno al on concat(pf.id_objetivo,pf.id_universidad) = concat(al.id_alumno,al.id_universidad)
inner join profesor pr on concat(pf.id_objetivo,pf.id_universidad) = concat(pr.id_profesor,pr.id_universidad)
where _idPublicacion = pf.id_publicacion_foro;

if exists(select id_respuesta_foro from respuesta_foro where id_publicacion_foro = _idPublicacion) then
	select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
	_idPublicacion as IdPublicacionForo, v_publicacion as Publicacion, 
	v_autorPublicacion as AutorPublicacion, DATE_FORMAT(v_fechaPublicacion, '%Y-%m-%d %H:%i:%s') as FechaPublicacion,
	rf.id_respuesta_foro as IdRespuestaForo, rf.respuesta as Respuesta,
	case rf.de_alumno when true then 
			concat(al.nombres, ' ', al.apellidos) 
		else 
			concat(pr.nombres, ' ', pr.apellidos) 
	end as AutorRespuesta, DATE_FORMAT(rf.fecha, '%Y-%m-%d %H:%i:%s') as FechaRespuesta
	from respuesta_foro rf
	right join alumno al 
	on concat(rf.id_objetivo,rf.id_universidad) = concat(al.id_alumno,al.id_universidad)
	right join profesor pr 
	on concat(rf.id_objetivo,rf.id_universidad) = concat(pr.id_profesor,pr.id_universidad)
	inner join identificador_sitio i
	where _idPublicacion = rf.id_publicacion_foro;
else
	select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio,
	_idPublicacion as IdPublicacionForo, v_publicacion as Publicacion, 
	v_autorPublicacion as AutorPublicacion, v_fechaPublicacion as FechaPublicacion,
    null as IdRespuestaForo, null as Respuesta, null as AutorRespuesta, null as FechaRespuesta
	from identificador_sitio;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor1_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor1_1`(
_idProfesor varchar(10)
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio, 
_idProfesor as IdProfesor, concat(pr.nombres, ' ' ,pr.apellidos) as Nombre,
pr.tipo_archivo as TipoArchivo, pr.nombre_archivo as NombreArchivo, pr.foto as Foto
from profesor pr
inner join identificador_sitio i
where _idProfesor = concat(pr.id_profesor,pr.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor1_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor1_2`(
_idProfesor varchar(10)
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
ti.id_tema_impartido as IdCurso, tm.nombre as Tema, ti.grupo as Grupo
from tema_impartido ti
inner join tema tm on ti.id_tema = tm.id_tema
inner join identificador_sitio i
where _idProfesor = concat(ti.id_profesor, ti.id_universidad_pr);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor2`(
_idProfesor varchar(10)
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio, 
_idProfesor as IdProfesor, ac.nombre as AreaConocimiento, 
pg.nombre as Posgrado, li.nombre as LineaInvestigacion, uni.nombre Universidad, 
pr.nombres as Nombres, pr.apellidos as Apellidos,
DATE_FORMAT(pr.fecha_nacimiento, '%Y-%m-%d') as FechaNacimiento, pr.genero as Genero, pr.direccion as Direccion,
pr.entidad_federativa as EntidadFederativa, pr.ciudad as Ciudad,
pr.telefono as Telefono, pr.cedula as Cedula,
pr.correo as Correo, DATE_FORMAT(pr.fecha_registro, '%Y-%m-%d') as FechaRegistro, 
pr.tipo_archivo as TipoArchivo, pr.nombre_archivo as NombreArchivo, pr.foto as Foto
from profesor pr
inner join universidad uni on pr.id_universidad = uni.id_universidad 
inner join area_conocimiento ac on pr.id_area_conocimiento = ac.id_area_conocimiento
inner join posgrado pg on pr.id_posgrado = pg.id_posgrado
inner join linea_investigacion li on pr.id_linea_investigacion = li.id_linea_investigacion
inner join identificador_sitio i
where _idProfesor = concat(pr.id_profesor,pr.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor20` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor20`(
_idProfesor varchar(10),
_idPublicacion int unsigned,
_respuesta text,
_fecha datetime
)
BEGIN
declare v_idProfesor int unsigned;
declare v_idUniversidad char(5);

select id_profesor, id_universidad into v_idProfesor,v_idUniversidad from profesor
where _idProfesor = concat(id_profesor, id_universidad);

SET FOREIGN_KEY_CHECKS=0;
insert into respuesta_foro 
values(null,_idPublicacion,false,v_idProfesor,v_idUniversidad,_respuesta,_fecha,true);
SET FOREIGN_KEY_CHECKS=1;

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor21` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor21`(
_idProfesor varchar(10)
)
BEGIN
select 
	i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
	concat(pa.id_alumno,pa.id_universidad_al) as IdAlumno,
	concat(al.nombres,' ',al.apellidos) as Nombre, pg.nombre as Posgrado,
	li.nombre as LineaInvestigacion, tm.nombre as Tema
from posgrado_alumno pa
	inner join alumno al on (pa.id_alumno = al.id_alumno) and (pa.id_universidad_al = al.id_universidad)
	inner join posgrado pg on pa.id_posgrado = pg.id_posgrado
    inner join tema tm on pa.id_tema = tm.id_tema
    inner join linea_investigacion li on tm.id_linea_investigacion = li.id_linea_investigacion
	inner join identificador_sitio i
    where _idProfesor = concat(pa.id_profesor_tutor,pa.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor22` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor22`(
_idAlumno varchar(10)
)
BEGIN
select 
	i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio, 
	ac.nombre as AreaConocimiento, pg.nombre as Posgrado, 
    li.nombre as LineaInvestigacion, tm.nombre as Tema,
	concat(al.id_alumno, al.id_universidad) as IdAlumno, 
	concat(al.nombres,' ',al.apellidos) as Nombre, 
	al.telefono as Telefono, al.correo as Correo, al.online as OnlineAlumno, 
	al.tipo_archivo as TipoArchivo, al.nombre_archivo as NombreArchivo, al.foto as Foto
from posgrado_alumno pa
	inner join alumno al on (pa.id_alumno = al.id_alumno) and (pa.id_universidad_al = al.id_universidad)
    inner join area_conocimiento ac on al.id_area_conocimiento = ac.id_area_conocimiento
	inner join posgrado pg on pa.id_posgrado = pg.id_posgrado
    inner join tema tm on pa.id_tema = tm.id_tema
    inner join linea_investigacion li on tm.id_linea_investigacion = li.id_linea_investigacion
	inner join identificador_sitio i
    where _idAlumno = concat(pa.id_alumno,pa.id_universidad_al);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor3`(
_idProfesor varchar(10)
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio, 
_idProfesor as IdProfesor, ac.nombre as AreaConocimiento, 
pg.nombre as Posgrado, li.nombre as LineaInvestigacion, uni.nombre Universidad, 
pr.nombres as Nombres, pr.apellidos as Apellidos,
DATE_FORMAT(pr.fecha_nacimiento, '%Y-%m-%d') as FechaNacimiento, pr.genero as Genero, pr.direccion as Direccion,
pr.entidad_federativa as EntidadFederativa, pr.ciudad as Ciudad,
pr.telefono as Telefono, pr.cedula as Cedula,
pr.correo as Correo, DATE_FORMAT(pr.fecha_registro, '%Y-%m-%d') as FechaRegistro, 
pr.tipo_archivo as TipoArchivo, pr.nombre_archivo as NombreArchivo, pr.foto as Foto
from profesor pr
inner join universidad uni on pr.id_universidad = uni.id_universidad 
inner join area_conocimiento ac on pr.id_area_conocimiento = ac.id_area_conocimiento
inner join posgrado pg on pr.id_posgrado = pg.id_posgrado
inner join linea_investigacion li on pr.id_linea_investigacion = li.id_linea_investigacion
inner join identificador_sitio i
where _idProfesor = concat(pr.id_profesor,pr.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor4`(
_idProfesor varchar(10),
_telefono varchar(20),
_contrasena varchar(25),
_tipoArchivo varchar(5),
_nombreArchivo varchar(35),
_foto mediumblob
)
BEGIN
update profesor set telefono = _telefono, contrasena = _contrasena, tipo_archivo = _tipoArchivo,
nombre_archivo = _nombreArchivo, foto = _foto where _idProfesor = concat(id_profesor,id_universidad);

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor5_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor5_1`(
_idTemaImpartido int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
_idTemaImpartido as IdCurso, pg.nombre as Posgrado, li.nombre as LineaInvestigacion, 
tm.nombre as Tema, ti.grupo as Grupo, DATE_FORMAT(ti.fecha_inicio, '%Y-%m-%d') as FechaInicio, DATE_FORMAT(ti.fecha_fin, '%Y-%m-%d') as FechaFin,
ti.cupo as Cupo, count(ati.id_alumno) as NumeroAlumnosIncritos, ti.estado EstadoGrupo
from alumno_tema_impartido ati
right join tema_impartido ti on ati.id_tema_impartido = ti.id_tema_impartido
inner join tema tm on ti.id_tema = tm.id_tema
inner join linea_investigacion li on tm.id_linea_investigacion = li.id_linea_investigacion
inner join posgrado pg on li.id_posgrado = pg.id_posgrado
inner join identificador_sitio i
where _idTemaImpartido = ti.id_tema_impartido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor5_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor5_2`(
_idTemaImpartido int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
re.id_recurso as IdRecurso, re.nombre as Recurso, DATE_FORMAT(re.fecha, '%Y-%m-%d') as FechaRecurso
from recurso re
inner join tema_impartido ti on re.id_tema_impartido = ti.id_tema_impartido
inner join identificador_sitio i
where _idTemaImpartido = ti.id_tema_impartido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor5_3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor5_3`(
_idTemaImpartido int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
act.id_actividad as IdActividad, act.nombre as Actvidad,
DATE_FORMAT(act.fecha_asignacion, '%Y-%m-%d %H:%i:%s') as FechaActividad, act.tipo Tipo
from actividad act
inner join tema_impartido ti on act.id_tema_impartido = ti.id_tema_impartido
inner join identificador_sitio i
where _idTemaImpartido = ti.id_tema_impartido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor5_4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor5_4`(
_idTemaImpartido int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
concat(al.id_alumno,al.id_universidad) as IdAlumno,
concat(al.nombres,' ',al.apellidos) as Nombre, al.online as OnlineAl, 
al.tipo_archivo as TipoArchivo, al.nombre_archivo as NombreArchivo, al.foto as Foto
from alumno al
inner join alumno_tema_impartido ati 
on concat(al.id_alumno,al.id_universidad) = concat(ati.id_alumno,ati.id_universidad_al)
inner join tema_impartido ti on ati.id_tema_impartido = ti.id_tema_impartido
inner join identificador_sitio i
where _idTemaImpartido = ti.id_tema_impartido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor6` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor6`(
_idRecurso int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
_idRecurso as IdRecurso, re.descripcion as Descripcion, DATE_FORMAT(re.fecha, '%Y-%m-%d') as Fecha, 
re.tipo_archivo as TipoArchivo, re.nombre_archivo as NombreArchivo, 
re.contenido as Contenido
from recurso re
inner join identificador_sitio i
where _idRecurso = re.id_recurso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor7` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor7`(
_idRecurso int unsigned
)
BEGIN
delete from recurso where id_recurso = _idRecurso;

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor8_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor8_1`(
_idActividad int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
_idActividad as IdActividad, act.nombre as NombreActivdad, 
act.actividad as DescripcionActividad,
DATE_FORMAT(act.fecha_asignacion, '%Y-%m-%d %H:%i:%s') as FechaAsignacion, DATE_FORMAT(act.fecha_inicio, '%Y-%m-%d %H:%i:%s') as FechaInicio,
DATE_FORMAT(act.fecha_fin, '%Y-%m-%d %H:%i:%s') as FechaFin, act.tipo as Tipo, 
count(actal.fecha_subida) as NumeroActRealizadas,
count(actal.fecha_calificada) as NumeroActCalificadas,
(count(actal.fecha_subida)-count(actal.fecha_calificada)) as NumeroActPendientes
from actividad_alumno actal
right join actividad act on actal.id_actividad = act.id_actividad
inner join identificador_sitio i
where _idActividad = act.id_actividad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor8_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor8_2`(
_idActividad int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
concat(actal.id_alumno,actal.id_universidad_al) as IdAlumno,
concat(al.nombres, ' ',al.apellidos) as Nombre,
actal.calificacion as Calificacion,
actal.comentarios as Comentarios
from actividad_alumno actal
inner join actividad act on actal.id_actividad = act.id_actividad
inner join alumno al
on concat(actal.id_alumno,actal.id_universidad_al) = concat(al.id_alumno,al.id_universidad)
inner join identificador_sitio i
where _idActividad = act.id_actividad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profesor9` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `profesor9`(
_idActividad int unsigned,
_idAlumno varchar(10)
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
act.nombre as NombreActividad, _idAlumno as IdAlumno,
concat(al.nombres, ' ',al.apellidos) as NombreAlumno,
DATE_FORMAT(actal.fecha_subida, '%Y-%m-%d %H:%i:%s') as FechaSubida,
actal.nombre_archivo as NombreArchivo
from actividad_alumno actal
inner join actividad act on actal.id_actividad = act.id_actividad
inner join alumno al
on concat(actal.id_alumno,actal.id_universidad_al) = concat(al.id_alumno,al.id_universidad)
inner join identificador_sitio i
where _idActividad = act.id_actividad
and _idAlumno = concat(actal.id_alumno,actal.id_universidad_al);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador1`()
BEGIN
select i.nombre IdentificadorSitio, i.id_universidad IdUniversidadSitio,
ac.id_area_conocimiento as IdAreaConocimiento, ac.nombre as NombreAreaConocimiento
from area_conocimiento ac
inner join identificador_sitio i;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador10` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador10`(
_idRegistrador varchar(10)
)
BEGIN
declare v_idUniversidad char(5);
select id_universidad into v_idUniversidad from registrador where _idRegistrador = concat(id_registrador,id_universidad);

select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio, 
so.id_solicitud as IdSolicitud, concat(al.nombres,' ',al.apellidos) as NombreAlumno, pg.nombre as Posgrado
from solicitud so
inner join alumno al on concat(so.id_alumno,so.id_universidad_al) = concat(al.id_alumno,al.id_universidad)
inner join tema tm on so.id_tema = tm.id_tema
inner join linea_investigacion li on tm.id_linea_investigacion = li.id_linea_investigacion
inner join posgrado pg on li.id_posgrado = pg.id_posgrado
inner join identificador_sitio i
where v_idUniversidad = pg.id_universidad
and so.estado_uni = 'P';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador11` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador11`(
_idSolicitud int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio, 
so.id_solicitud as IdSolicitud, concat(so.id_alumno,so.id_universidad_al) as IdAlumno, al.nombres as Nombres, al.apellidos as Apellidos,
DATE_FORMAT(al.fecha_nacimiento, '%Y-%m-%d') as FechaNacimiento, al.genero as Genero, al.direccion as Direccion, al.entidad_federativa as EntidadFederativa,
al.ciudad as Ciudad, al.telefono as Telefono, al.correo as Correo, ac.nombre as AreaConocimiento, DATE_FORMAT(so.fecha, '%Y-%m-%d') as FechaSolicitud,
pg.nombre as Posgrado, li.nombre as LineaInvestigacion, tm.nombre as Tema,
pg.tipo_archivo as TipoArchivo, pg.nombre_archivo as NombreArchivo, pg.convocatoria as Convocatoria
from solicitud so
inner join alumno al on concat(so.id_alumno,so.id_universidad_al) = concat(al.id_alumno,al.id_universidad)
inner join tema tm on so.id_tema = tm.id_tema
inner join linea_investigacion li on tm.id_linea_investigacion = li.id_linea_investigacion
inner join posgrado pg on li.id_posgrado = pg.id_posgrado
inner join area_conocimiento ac on pg.id_area_conocimiento = ac.id_area_conocimiento
inner join identificador_sitio i
where _idSolicitud = so.id_solicitud;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador12` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador12`(
_idSolicitud varchar(10),
_estadoUni char(1)
)
BEGIN
update solicitud set estado_uni = _estadoUni where _idSolicitud = id_solicitud;

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador13` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador13`(
_idRegistrador varchar(10)
)
BEGIN
declare v_idUniversidad char(5);
select id_universidad into v_idUniversidad from registrador where _idRegistrador = concat(id_registrador,id_universidad);

select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio, 
so.id_solicitud as IdSolicitud, concat(al.nombres,' ',al.apellidos) as NombreAlumno, pg.nombre as Posgrado
from solicitud so
inner join alumno al on concat(so.id_alumno,so.id_universidad_al) = concat(al.id_alumno,al.id_universidad)
inner join tema tm on so.id_tema = tm.id_tema
inner join linea_investigacion li on tm.id_linea_investigacion = li.id_linea_investigacion
inner join posgrado pg on li.id_posgrado = pg.id_posgrado
inner join identificador_sitio i
where v_idUniversidad = pg.id_universidad
and so.estado_uni = 'A'
and so.estado_alumno = 'A'
and concat(so.id_alumno,so.id_universidad_al) not in (select concat(id_alumno,id_universidad_al) from posgrado_alumno);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador14_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador14_1`(
_idSolicitud int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio, 
so.id_solicitud as IdSolicitud, concat(so.id_alumno,so.id_universidad_al) as IdAlumno, al.nombres as Nombres, al.apellidos as Apellidos,
DATE_FORMAT(al.fecha_nacimiento, '%Y-%m-%d') as FechaNacimiento, al.genero as Genero, al.direccion as Direccion, al.entidad_federativa as EntidadFederativa,
al.ciudad as Ciudad, al.telefono as Telefono, al.correo as Correo, ac.nombre as AreaConocimiento, DATE_FORMAT(so.fecha, '%Y-%m-%d') as FechaSolicitud,
pg.nombre as Posgrado, li.nombre as LineaInvestigacion, tm.nombre as Tema
from solicitud so
inner join alumno al on concat(so.id_alumno,so.id_universidad_al) = concat(al.id_alumno,al.id_universidad)
inner join tema tm on so.id_tema = tm.id_tema
inner join linea_investigacion li on tm.id_linea_investigacion = li.id_linea_investigacion
inner join posgrado pg on li.id_posgrado = pg.id_posgrado
inner join area_conocimiento ac on pg.id_area_conocimiento = ac.id_area_conocimiento
inner join identificador_sitio i
where _idSolicitud = so.id_solicitud;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador14_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador14_2`(
_idSolicitud int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
ti.id_tema_impartido as IdTemaImpartido, ti.grupo as Grupo, 
(select (ti.cupo - count(id_alumno)) from alumno_tema_impartido
where ti.id_tema_impartido = id_tema_impartido) as Cupo, 
DATE_FORMAT(ti.fecha_inicio, '%Y-%m-%d') as FechaInicio, DATE_FORMAT(ti.fecha_fin, '%Y-%m-%d') as FechaFin, ti.estado as EstadoTemaImp
from solicitud so
inner join tema tm on so.id_tema = tm.id_tema
inner join tema_impartido ti on tm.id_tema = ti.id_tema
inner join identificador_sitio i
where _idSolicitud = so.id_solicitud;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador14_3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador14_3`(
_idSolicitud int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
concat(pr.id_profesor, pr.id_universidad) as IdProfesorTutor, concat(pr.nombres, ' ', pr.apellidos) as NombreProfesorTutor
from solicitud so
inner join tema tm on so.id_tema = tm.id_tema
inner join linea_investigacion li on tm.id_linea_investigacion = li.id_linea_investigacion
left join profesor pr on li.id_linea_investigacion = pr.id_linea_investigacion
inner join identificador_sitio i
where _idSolicitud = so.id_solicitud;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador15` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador15`(
_idSolicitud int unsigned, 
_idTemaImpartido int unsigned,
_idProfesor varchar(10),
_fechaInicio date,
_fechaFin date
)
BEGIN
declare v_idAlumno int unsigned;
declare v_idUniversidadAlumno char(5);
declare v_idTema int unsigned;
declare v_idUniversidad char(5);
declare v_idPosgrado int unsigned;
declare v_idProfesorTutor int unsigned;

select so.id_alumno, so.id_universidad_al, so.id_tema, li.id_universidad_pg, li.id_posgrado
into v_idAlumno, v_idUniversidadAlumno, v_idTema, v_idUniversidad, v_idPosgrado
from solicitud so
inner join tema tm on so.id_tema = tm.id_tema
inner join linea_investigacion li on tm.id_linea_investigacion = li.id_linea_investigacion
where _idSolicitud = so.id_solicitud;

select id_profesor into v_idProfesorTutor from profesor where _idProfesor=concat(id_profesor,id_universidad);

insert into posgrado_alumno
values(v_idAlumno,v_idUniversidadAlumno,v_idTema,v_idUniversidad,v_idPosgrado,v_idProfesorTutor,'A',_fechaInicio,_fechaFin);

insert into alumno_tema_impartido
values(v_idAlumno,v_idUniversidadAlumno,_idTemaImpartido,'A',null);

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador16` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador16`(
_idRegistrador varchar(10)
)
BEGIN
declare v_idUniversidad char(5);

select id_universidad into v_idUniversidad from registrador where _idRegistrador = concat(id_registrador, id_universidad);

select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
ac.id_area_conocimiento as IdAreaConocimiento, ac.nombre as NombreAreaConocimiento,
pg.id_posgrado as IdPosgrado, pg.nombre as NombrePosgrado, 
li.id_linea_investigacion as IdLineaInvestigacion, li.nombre as NombreLineaInvestigacion
from linea_investigacion li
inner join posgrado pg on li.id_posgrado = pg.id_posgrado
inner join area_conocimiento ac on pg.id_area_conocimiento = ac.id_area_conocimiento
inner join identificador_sitio i
where v_idUniversidad = pg.id_universidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador16_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador16_1`()
BEGIN
select 
identificador_sitio.nombre as IdentificadorSitio, 
identificador_sitio.id_universidad as IdUniversidadSitio,
area_conocimiento.id_area_conocimiento as IdAreaConocimiento, 
area_conocimiento.nombre as NombreAreaConocimiento
from area_conocimiento
inner join identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador16_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador16_2`(
_idUniversidad char(5)
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
pg.id_posgrado as IdPosgrado, pg.nombre as NombrePosgrado, 
pg.id_area_conocimiento as IdAreaConocimientoPosgrado
from posgrado pg
inner join identificador_sitio i
where _idUniversidad = pg.id_universidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador16_3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador16_3`(
_idPosgrado int unsigned
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
li.id_linea_investigacion as IdLineaInvestigacion, li.nombre as NombreLineaInvestigacion,
li.id_posgrado as IdposgradoLineaInvestigacion
from linea_investigacion li
inner join identificador_sitio i
where _idPosgrado = li.id_posgrado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador17` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador17`(
_idRegistrador varchar(10),
_nombres varchar(50),
_apellidos varchar(50),
_correo varchar(35),
_fechaNacimiento date,
_genero char(1),
_direccion char(200),
_entidadFederativa char(2),
_ciudad varchar(50),
_telefono varchar(20),
_cedula int unsigned,
_contrasena varchar(25),
_fechaRegistro date,
_estado char(1),
_idAreaConocimiento int unsigned,
_idPosgrado int unsigned,
_idLineaInvestigacion int unsigned
)
BEGIN
declare v_idUniversidad char(5);
declare v_idProfesor int unsigned;
select id_universidad into v_idUniversidad from registrador where _idRegistrador = concat(id_registrador, id_universidad);

insert into profesor
values(null,v_idUniversidad,_idAreaConocimiento,_idPosgrado,_idLineaInvestigacion,_nombres,_apellidos,_fechaNacimiento,
_genero,_direccion,_entidadFederativa,_ciudad,_telefono,_cedula,_correo,_contrasena,false,_fechaRegistro,_estado,0,null,null,null);

set v_idProfesor = last_insert_id();

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, 
true as Confirmacion, concat(v_idProfesor,v_idUniversidad) as IdProfesor
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador18` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador18`()
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
concat(pr.id_profesor,pr.id_universidad) as IdProfesor, concat(pr.nombres,' ',pr.apellidos) as NombreProfesor,
ac.id_area_conocimiento as IdAreaConocimiento, ac.nombre as NombreAreaConocimiento,
pg.id_posgrado as IdPosgrado, pg.nombre as NombrePosgrado
from profesor pr
inner join posgrado pg on pr.id_posgrado = pg.id_posgrado
inner join area_conocimiento ac on pg.id_area_conocimiento = ac.id_area_conocimiento
inner join identificador_sitio i;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador19` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador19`(
_idProfesor varchar(10),
_nombreProfesor varchar(101),
_idAreaConocimiento int unsigned,
_idPosgrado int unsigned
)
BEGIN
if _idProfesor is not null or _nombreProfesor is not null
and (_idPosgrado is not null and _idAreaConocimiento is not null) then
	select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
	concat(pr.id_profesor,pr.id_universidad) as IdProfesorFiltrado, concat(pr.nombres,' ',pr.apellidos) as NombreProfesorFiltrado
	from profesor pr
	inner join area_conocimiento ac on pr.id_area_conocimiento = ac.id_area_conocimiento
	inner join posgrado pg on pr.id_posgrado = pg.id_posgrado
	inner join identificador_sitio i
	where _idProfesor = concat(pr.id_profesor,pr.id_universidad) 
	or match(pr.nombres,pr.apellidos) against(_nombreProfesor in boolean mode)
    and (_idPosgrado = pr.id_posgrado and _idAreaConocimiento = pr.id_area_conocimiento);
elseif _idProfesor is not null or _nombreProfesor is not null
and (_idPosgrado is not null or _idAreaConocimiento is not null) then
	select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
	concat(pr.id_profesor,pr.id_universidad) as IdProfesorFiltrado, concat(pr.nombres,' ',pr.apellidos) as NombreProfesorFiltrado
	from profesor pr
	inner join area_conocimiento ac on pr.id_area_conocimiento = ac.id_area_conocimiento
	inner join posgrado pg on pr.id_posgrado = pg.id_posgrado
	inner join identificador_sitio i
	where _idProfesor = concat(pr.id_profesor,pr.id_universidad) 
	or match(pr.nombres,pr.apellidos) against(_nombreProfesor in boolean mode)
    and (_idPosgrado = pr.id_posgrado or _idAreaConocimiento = pr.id_area_conocimiento);
elseif _idProfesor is not null or _nombreProfesor is not null then
	select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
	concat(pr.id_profesor,pr.id_universidad) as IdProfesorFiltrado, concat(pr.nombres,' ',pr.apellidos) as NombreProfesorFiltrado
	from profesor pr
	inner join area_conocimiento ac on pr.id_area_conocimiento = ac.id_area_conocimiento
	inner join posgrado pg on pr.id_posgrado = pg.id_posgrado
	inner join identificador_sitio i
	where _idProfesor = concat(pr.id_profesor,pr.id_universidad) 
	or match(pr.nombres,pr.apellidos) against(_nombreProfesor in boolean mode);
elseif _idPosgrado is not null and _idAreaConocimiento is not null then
	select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
	concat(pr.id_profesor,pr.id_universidad) as IdProfesorFiltrado, concat(pr.nombres,' ',pr.apellidos) as NombreProfesorFiltrado
	from profesor pr
	inner join area_conocimiento ac on pr.id_area_conocimiento = ac.id_area_conocimiento
	inner join posgrado pg on pr.id_posgrado = pg.id_posgrado
	inner join identificador_sitio i
	where _idPosgrado = pr.id_posgrado and _idAreaConocimiento = pr.id_area_conocimiento;
elseif _idAreaConocimiento is not null then    
	select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
	concat(pr.id_profesor,pr.id_universidad) as IdProfesorFiltrado, concat(pr.nombres,' ',pr.apellidos) as NombreProfesorFiltrado
	from profesor pr
	inner join area_conocimiento ac on pr.id_area_conocimiento = ac.id_area_conocimiento
	inner join posgrado pg on pr.id_posgrado = pg.id_posgrado
	inner join identificador_sitio i
	where _idAreaConocimiento = pr.id_area_conocimiento;
elseif _idPosgrado is not null then
	select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
	concat(pr.id_profesor,pr.id_universidad) as IdProfesorFiltrado, concat(pr.nombres,' ',pr.apellidos) as NombreProfesorFiltrado
	from profesor pr
	inner join area_conocimiento ac on pr.id_area_conocimiento = ac.id_area_conocimiento
	inner join posgrado pg on pr.id_posgrado = pg.id_posgrado
	inner join identificador_sitio i
	where  _idPosgrado = pr.id_posgrado;
else
	select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
	concat(pr.id_profesor,pr.id_universidad) as IdProfesorFiltrado, concat(pr.nombres,' ',pr.apellidos) as NombreProfesorFiltrado
	from profesor pr
	inner join area_conocimiento ac on pr.id_area_conocimiento = ac.id_area_conocimiento
	inner join posgrado pg on pr.id_posgrado = pg.id_posgrado
	inner join identificador_sitio i;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador2`(
_idRegistrador varchar(10),
_nombres varchar(50),
_apellidos varchar(50),
_correo varchar(35),
_fechaNacimiento date,
_genero char(1),
_direccion char(200),
_entidadFederativa char(2),
_ciudad varchar(50),
_telefono varchar(20),
_idAreaConocimiento int unsigned,
_contrasena varchar(25),
_fechaRegistro date,
_estado char(1)
)
BEGIN
declare v_idUniversidad char(5);
declare v_idAlumno int unsigned;
select id_universidad into v_idUniversidad from registrador where _idRegistrador = concat(id_registrador, id_universidad);

insert into alumno values(null,v_idUniversidad,_idAreaConocimiento,_nombres,_apellidos,_fechaNacimiento,_genero,_direccion,
_entidadFederativa,_ciudad,_telefono,_correo,_contrasena,false,_fechaRegistro,_estado,0,null,null,null,null,true);

set v_idAlumno = last_insert_id();

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, 
true as Confirmacion, concat(v_idAlumno,v_idUniversidad) as IdAlumno
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador20` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador20`(
_idProfesor varchar(10)
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
concat(pr.id_profesor, pr.id_universidad) as IdProfesor, concat(pr.nombres,' ',pr.apellidos) as Nombre, 
DATE_FORMAT(pr.fecha_nacimiento, '%Y-%m-%d') as FechaNacimiento, pr.genero as Genero, pr.direccion as Direccion, 
pr.entidad_federativa as EntidadFederativa, pr.ciudad as Ciudad, pr.telefono as Telefono, pr.cedula as Cedula,
pr.correo as Correo, DATE_FORMAT(pr.fecha_registro, '%Y-%m-%d') as FechaRegistro, pr.estado as Estado,
ac.nombre as AreaConocimiento, pg.nombre as Posgrado, li.nombre as LineaInvestigacion
from profesor pr
left join linea_investigacion li on pr.id_linea_investigacion = li.id_linea_investigacion
inner join posgrado pg on pr.id_posgrado = pg.id_posgrado
inner join area_conocimiento ac on pr.id_area_conocimiento = ac.id_area_conocimiento
inner join identificador_sitio i
where _idProfesor = concat(pr.id_profesor,pr.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador21` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador21`(
_idProfesor varchar(10)
)
BEGIN
declare v_estado char(1);
select estado into v_estado from profesor where _idProfesor = concat(id_profesor,id_universidad);
if v_estado = 'A' then
	update profesor set estado = 'I' where _idProfesor = concat(id_profesor,id_universidad);
    
    select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
	from identificador_sitio;
elseif v_estado = 'I' then
	update profesor set estado = 'A' where _idProfesor = concat(id_profesor,id_universidad);
    
    select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
	from identificador_sitio;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador22_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador22_1`(
_idProfesor varchar(10)
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
concat(pr.id_profesor, pr.id_universidad) as IdProfesor, pr.nombres as Nombres, pr.apellidos as Apellidos, 
DATE_FORMAT(pr.fecha_nacimiento, '%Y-%m-%d') as FechaNacimiento, pr.genero as Genero, pr.direccion as Direccion, 
pr.entidad_federativa as EntidadFederativa, pr.ciudad as Ciudad, pr.telefono as Telefono, pr.cedula as Cedula,
pr.correo as Correo, DATE_FORMAT(pr.fecha_registro, '%Y-%m-%d') as FechaRegistro, pr.estado as Estado, pr.contrasena as Contrasena
from profesor pr
inner join identificador_sitio i
where _idProfesor = concat(pr.id_profesor,pr.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador22_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador22_2`()
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
ac.id_area_conocimiento as IdAreaConocimiento, ac.nombre as AreaConocimiento,
pg.id_posgrado as IdPosgrado, pg.nombre as Posgrado, 
li.id_linea_investigacion as IdLineaInvestigacion, li.nombre as LineaInvestigacion
from linea_investigacion li
inner join posgrado pg on li.id_posgrado = pg.id_posgrado
inner join area_conocimiento ac on pg.id_area_conocimiento = ac.id_area_conocimiento
inner join identificador_sitio i;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador23` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador23`(
_idProfesor varchar(10),
_nombres varchar(50),
_apellidos varchar(50),
_correo varchar(35),
_fechaNacimiento date,
_genero char(1),
_direccion char(200),
_entidadFederativa char(2),
_ciudad varchar(50),
_telefono varchar(20),
_cedula int unsigned,
_contrasena varchar(25),
_idAreaConocimiento int unsigned,
_idPosgrado int unsigned,
_idLineaInvestigacion int unsigned
)
BEGIN
update profesor set nombres = _nombres, apellidos = _apellidos, correo = _correo, fecha_nacimiento = _fechaNacimiento, 
genero = _genero, direccion = _direccion, entidad_federativa = _entidadFederativa, ciudad = _ciudad, telefono = _telefono,
cedula = _cedula, contrasena = _contrasena, id_area_conocimiento = _idAreaConocimiento, id_posgrado = _idPosgrado, 
id_linea_investigacion = _idLineaInvestigacion
where _idProfesor = concat(id_profesor,id_universidad);

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador3`()
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
ac.id_area_conocimiento as IdAreaConocimiento, ac.nombre as NombreAreaConocimiento,
concat(al.id_alumno,al.id_universidad) as IdAlumno, concat(al.nombres,' ',al.apellidos) as NombreAlumno
from alumno al
inner join area_conocimiento ac on al.id_area_conocimiento = ac.id_area_conocimiento
inner join identificador_sitio i;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador4`(
_idAlumno varchar(10),
_nombreAlumno varchar(101),
_idAreaConocimiento int unsigned
)
BEGIN
if _idAlumno is not null or _nombreAlumno is not null and _idAreaConocimiento is not null then
	select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
	concat(al.id_alumno,al.id_universidad) as IdAlumnoFiltrado, concat(al.nombres,' ',al.apellidos) as NombreAlumnoFiltrado
	from alumno al
	inner join area_conocimiento ac on al.id_area_conocimiento = ac.id_area_conocimiento
	inner join identificador_sitio i
	where _idAlumno = concat(al.id_alumno,al.id_universidad) 
	or match(al.nombres,al.apellidos) against(_nombreAlumno in boolean mode)
    and al.id_area_conocimiento = _idAreaConocimiento;
elseif _idAlumno is not null or _nombreAlumno is not null then
	select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
	concat(al.id_alumno,al.id_universidad) as IdAlumnoFiltrado, concat(al.nombres,' ',al.apellidos) as NombreAlumnoFiltrado
	from alumno al
	inner join area_conocimiento ac on al.id_area_conocimiento = ac.id_area_conocimiento
	inner join identificador_sitio i
	where _idAlumno = concat(al.id_alumno,al.id_universidad) 
	or match(al.nombres,al.apellidos) against(_nombreAlumno in boolean mode);
elseif _idAreaConocimiento is not null then
	select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
	concat(al.id_alumno,al.id_universidad) as IdAlumnoFiltrado, concat(al.nombres,' ',al.apellidos) as NombreAlumnoFiltrado
	from alumno al
	inner join area_conocimiento ac on al.id_area_conocimiento = ac.id_area_conocimiento
	inner join identificador_sitio i
	where al.id_area_conocimiento = _idAreaConocimiento;
else
	select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
	concat(al.id_alumno,al.id_universidad) as IdAlumnoFiltrado, concat(al.nombres,' ',al.apellidos) as NombreAlumnoFiltrado
	from alumno al
	inner join area_conocimiento ac on al.id_area_conocimiento = ac.id_area_conocimiento
	inner join identificador_sitio i;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador5` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador5`(
_idAlumno varchar(10)
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
concat(al.id_alumno,al.id_universidad) as IdAlumno, concat(al.nombres,' ',al.apellidos) as Nombre, DATE_FORMAT(al.fecha_nacimiento, '%Y-%m-%d') as FechaNacimiento,
al.genero as Genero, al.direccion as Direccion, al.entidad_federativa as EntidadFederativa, al.ciudad as Ciudad, al.telefono as Telefono,
al.correo as Correo,  al.contrasena as Contrasena, DATE_FORMAT(al.fecha_registro, '%Y-%m-%d') as FechaRegistro, al.estado as Estado, ac.id_area_conocimiento as IdAreaConocimiento,
ac.nombre as AreaConocimiento, pg.nombre as Posgrado, pa.estado EstadoPosgradoAlumno, li.nombre as LineaInvestigacion, tm.nombre as Tema, 
concat(pr.id_profesor, pr.id_universidad) as IdProfesorTutor, concat(pr.nombres,' ',pr.apellidos) as NombreProfesorTutor
from posgrado_alumno pa
right join alumno al on concat(pa.id_alumno,pa.id_universidad_al) = concat(al.id_alumno,al.id_universidad)
left join tema tm on pa.id_tema = tm.id_tema
left join profesor pr on concat(pa.id_profesor_tutor,pa.id_universidad) = concat(pr.id_profesor,pr.id_universidad)
left join posgrado pg on concat(pa.id_posgrado, pa.id_universidad) = concat(pg.id_posgrado, pg.id_universidad)
left join linea_investigacion li on tm.id_linea_investigacion = li.id_linea_investigacion
inner join area_conocimiento ac on al.id_area_conocimiento = ac.id_area_conocimiento
inner join identificador_sitio i
where _idAlumno = concat(al.id_alumno,al.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador6` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador6`(
_idAlumno varchar(10)
)
BEGIN
declare v_estado char(1);
select estado into v_estado from alumno where _idAlumno = concat(id_alumno,id_universidad);
if v_estado = 'A' then
	update alumno set estado = 'I' where _idAlumno = concat(id_alumno,id_universidad);
    
    select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
	from identificador_sitio;
elseif v_estado = 'I' then
	update alumno set estado = 'A' where _idAlumno = concat(id_alumno,id_universidad);
    
    select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
	from identificador_sitio;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador7` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador7`(
_idAlumno varchar(10)
)
BEGIN
select i.nombre as IdentificadorSitio, i.id_universidad as IdUniversidadSitio,
concat(al.id_alumno,al.id_universidad) as IdAlumno, al.nombres as Nombres, al.apellidos as Apellidos, al.correo as Correo, 
DATE_FORMAT(al.fecha_nacimiento, '%Y-%m-%d') as FechaNacimiento, al.genero as Genero, al.direccion as Direccion, al.entidad_federativa as EntidadFederativa, 
al.ciudad as Ciudad, al.telefono as Telefono, al.id_area_conocimiento as IdAreaConocimiento, ac.nombre as AreaConocimiento, 
pa.id_posgrado as IdPosgradoActual, pa.estado as EstadoPosgradoAlumno, pg.nombre PosgradoActual
from posgrado_alumno pa
right join alumno al on concat(pa.id_alumno,pa.id_universidad_al) = concat(al.id_alumno,al.id_universidad)
left join posgrado pg on concat(pa.id_posgrado, pa.id_universidad) = concat(pg.id_posgrado, pg.id_universidad)
inner join area_conocimiento ac on al.id_area_conocimiento = ac.id_area_conocimiento
inner join identificador_sitio i
where _idAlumno = concat(al.id_alumno,al.id_universidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador8` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador8`(
_idAlumno varchar(10),
_estado char(1)
)
BEGIN
update posgrado_alumno set estado = _estado where _idAlumno = concat(id_alumno, id_universidad_al);
select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrador9` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrador9`(
_idAlumno varchar(10),
_nombres varchar(50),
_apellidos varchar(50),
_correo varchar(35),
_fechaNacimiento date,
_genero char(1),
_direccion char(200),
_entidadFederativa char(2),
_ciudad varchar(50),
_telefono varchar(20),
_idAreaConocimiento int unsigned
)
BEGIN
update alumno set nombres = _nombres, apellidos = _apellidos, correo = _correo, fecha_nacimiento = _fechaNacimiento, genero = _genero,
direccion = _direccion, entidad_federativa = _entidadFederativa, ciudad = _ciudad, telefono = _telefono/*, id_area_conocimiento = _idAreaConocimiento*/
where _idAlumno = concat(id_alumno,id_universidad);

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rollbackadmin38` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rollbackadmin38`(
_idAreaConocimiento int unsigned
)
BEGIN
delete from area_conocimiento where (id_area_conocimiento = _idAreaConocimiento);

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rollbackadmin40` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rollbackadmin40`(
_idAreaConocimiento int unsigned,
_nombre varchar(30)
)
BEGIN
update area_conocimiento set nombre = _nombre where _idAreaConocimiento = id_area_conocimiento;
    
select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rollbackalumno20` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rollbackalumno20`(
_claveAlumno varchar(255),
_origenAlumno boolean,
_claveSolicitud varchar(255),
_origenSolicitud boolean
)
BEGIN
declare v_idSolicitud int unsigned;
declare v_idAlumno int unsigned;
declare v_idUniversidad char(5);

select id_solicitud into v_idSolicitud
from solicitud 
where clave_i = _claveSolicitud;

select id_alumno, id_universidad into v_idAlumno, v_idUniversidad
from alumno 
where clave_i = _claveAlumno;

DELETE FROM solicitud WHERE (id_solicitud = v_idSolicitud);

if _origenAlumno is false then
	SET FOREIGN_KEY_CHECKS=0;
	DELETE FROM alumno WHERE (id_alumno = v_idAlumno) and (id_universidad = v_idUniversidad);
	SET FOREIGN_KEY_CHECKS=1;
end if;

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rollbackalumno23` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rollbackalumno23`(
_idSolicitud int unsigned,
_estadoAlumno char(1)
)
BEGIN
update solicitud set estado_alumno = _estadoAlumno where id_solicitud = _idSolicitud;

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rollbackalumno4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rollbackalumno4`(
_idAlumno varchar(10),
_telefono varchar(20),
_contrasena varchar(25),
_tipoArchivo varchar(5),
_nombreArchivo varchar(35),
_foto mediumblob
)
BEGIN
update alumno set telefono = _telefono, contrasena = _contrasena, tipo_archivo = _tipoArchivo,
nombre_archivo = _nombreArchivo, foto = _foto where _idAlumno = concat(id_alumno,id_universidad);

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rollbackregistrador6` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rollbackregistrador6`(
_idAlumno varchar(10),
_estado char(1)
)
BEGIN
update alumno set estado = _estado where _idAlumno = concat(id_alumno,id_universidad);

select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rollbackregistrador9` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rollbackregistrador9`(
_idAlumno varchar(10),
_nombres varchar(50),
_apellidos varchar(50),
_correo varchar(35),
_fechaNacimiento date,
_genero char(1),
_direccion char(200),
_entidadFederativa char(2),
_ciudad varchar(50),
_telefono varchar(20),
_idAreaConocimiento int unsigned
)
BEGIN
update alumno set nombres = _nombres, apellidos = _apellidos, correo = _correo, fecha_nacimiento = _fechaNacimiento, genero = _genero,
direccion = _direccion, entidad_federativa = _entidadFederativa, ciudad = _ciudad, telefono = _telefono, id_area_conocimiento = _idAreaConocimiento
where _idAlumno = concat(id_alumno,id_universidad);

select nombre as IdentificadorSitio, id_universidad as IdUniversidadSitio, true as Confirmacion
from identificador_sitio;
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

-- Dump completed on 2020-07-03 19:04:42