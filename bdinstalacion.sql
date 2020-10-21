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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (1,32,'Examen Final','Realizar x cantidad de cosas en un periodo muy corto de tiempo.','2020-06-17 00:00:00','2020-06-18 00:00:00','2020-06-19 00:00:00','E'),(2,32,'Tarea No.234232','Prender camara y participar en clase, vale 30000% del parcial','2020-06-18 21:04:00','2020-06-19 00:00:00','2020-06-19 00:00:00','T'),(3,6,'Tarea No.234232','Prender camara y participar en clase, vale 30000% del parcial','2020-06-18 21:57:56','2020-06-19 00:00:00','2020-06-19 00:00:00','T'),(4,32,'hola','sabe','2020-06-25 00:00:00','2020-06-10 00:00:00','2020-06-30 00:00:00','T');
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
  `nombre_archivo` varchar(35) NOT NULL,
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
INSERT INTO `actividad_alumno` VALUES (1,2,'AS001',5,'No funciono el archivo','2020-06-17 00:00:00','2020-06-25 00:00:00','EXE','Virus',NULL),(1,4,'AS001',9.475,'Me gustó tu trabajo, pero la introduccion el faltó profundizaaaar.','2020-06-18 00:00:00','2020-12-31 00:00:00','PDF','Examen Final_NZ',NULL),(2,4,'AS001',9.39816,'Bien.','2020-06-17 00:00:00','2020-06-18 22:11:22','PDF','Documento',NULL);
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
INSERT INTO `administrador` VALUES (1,'AS001','Luis','Arcos','luisarcos@correo.uaa.mx','hola1234'),(2,'AS002','José','Salazar','josesalazar@correo.utags.mx','hola1234');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,'AS001',4,'Juan','Rodriguez','1977-02-28','H','Av. Universidad # 940, Ciudad Universitaria, C. P. 20131, Aguascalientes, Ags. MÉXICO.','AS','Aguascalientes','4491110000','juanrodriguez@correo.uaa.mx','hola1234',1,'2020-06-09','A',0,NULL,NULL,NULL,NULL,NULL),(1,'AS002',4,'Manuel','Rodriguez','1977-02-28','H','Av. Universidad # 940, Ciudad Universitaria, C. P. 20131, Aguascalientes, Ags. MÉXICO.','AS','Aguascalientes','4491110000','manuelrodriguez2@correo.uaa.mx','hola1234',1,'2020-06-12','A',0,NULL,NULL,NULL,NULL,1),(2,'AS001',4,'Manuel','Rodriguez','1977-02-28','H','Av. Universidad # 940, Ciudad Universitaria, C. P. 20131, Aguascalientes, Ags. MÉXICO.','AS','Aguascalientes','1231231234','manuelrodriguez@correo.uaa.mx','4321aloh',1,'2020-06-09','I',0,'PNG','Fotito Chida',NULL,NULL,1),(3,'AS001',3,'Juan Pablo','Rodriguez Martinez','1920-01-12','H','Aguascalientes, Ags.','AS','Aguascalientes','1234567890','juanpa@correo.uaa.mx','hola1234',1,'2020-06-12','A',0,NULL,NULL,NULL,NULL,1),(3,'AS002',3,'Juan Pablo','Rodriguez Martinez','1920-01-12','H','Aguascalientes, Ags.','AS','Aguascalientes','4496661111','juanpablo@correo.uaa.mx','hola1234',1,'2020-06-12','A',0,NULL,NULL,NULL,'sdvgsdgsdfgsd656sd6f5sd6fsd5f5ds5f5ds5f5sd',0),(4,'AS001',3,'Nalleli','Zuñiga','1990-02-25','M','Aguascalientes, Ags.','AS','Aguascalientes','4490001111','nalleli@correo.uaa.mx','hola1234',0,'2020-06-14','I',0,NULL,NULL,NULL,NULL,1),(10,'AS002',3,'Juan Pablo','Rodriguez Martinez','1920-01-12','H','Aguascalientes, Ags.','AS','Aguascalientes','4496661111','juanpabloxdd@correo.uaa.mx','hola1234',1,'2020-06-12','A',0,NULL,NULL,NULL,'sdvgsdgsdfgsd656sd6f5sd6fsd5f5ds5f5ds5f5sd',0),(11,'AS001',1,'El Arquitecto','Mendoza','2006-02-01','H','En la sima del cielo','AS','Por Ahi','89564289','arquitecto@correo.uaa.x','hola1234',0,'2020-06-26','A',0,NULL,NULL,NULL,NULL,1);
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
INSERT INTO `alumno_tema_impartido` VALUES (1,'AS001',32,'F',5),(2,'AS001',32,'F',7),(3,'AS001',32,'F',5),(4,'AS001',32,'F',10),(10,'AS002',31,'A',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_conocimiento`
--

LOCK TABLES `area_conocimiento` WRITE;
/*!40000 ALTER TABLE `area_conocimiento` DISABLE KEYS */;
INSERT INTO `area_conocimiento` VALUES (1,'Matematicas'),(2,'Psicologia'),(3,'Medicina'),(4,'Tecnologias'),(5,'Arte'),(6,'Quimica'),(7,'Bioquimica'),(8,'Agronomía'),(12,'Nueva Area'),(13,'Nueva Area'),(14,'Nueva Area'),(15,'Nueva Area'),(16,'hueva Area'),(17,'Xueva Area');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linea_investigacion`
--

LOCK TABLES `linea_investigacion` WRITE;
/*!40000 ALTER TABLE `linea_investigacion` DISABLE KEYS */;
INSERT INTO `linea_investigacion` VALUES (1,1,'AS001','Computacion',NULL,'A'),(2,1,'AS001','Matematicas Aplicadas',NULL,'I'),(3,4,'AS001','TICS','123456','I'),(4,4,'AS001','TICS','123456','I'),(5,4,'AS001','TICS','123456','A'),(6,3,'AS001','Biomedicina Molecular y Celular','123456','A');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posgrado`
--

LOCK TABLES `posgrado` WRITE;
/*!40000 ALTER TABLE `posgrado` DISABLE KEYS */;
INSERT INTO `posgrado` VALUES (1,'AS001',1,'Maestria en Ciencias',NULL,'2020-06-07','A','M',NULL,NULL,NULL),(2,'AS001',2,'Doctorado en Psicologia',NULL,'2020-06-07','A','D',NULL,NULL,NULL),(3,'AS001',3,'Maestría en Investigación Biomédica',NULL,'2020-06-07','A','M',NULL,NULL,NULL),(4,'AS001',4,'Doctorado en Ciencias Aplicadas y T',NULL,'2020-06-07','A','D',NULL,NULL,NULL),(5,'AS001',5,'Doctorado en Arte',NULL,'2020-06-07','I','D',NULL,NULL,NULL),(6,'AS001',5,'Doctorado en Artes','111111','2020-06-07','A','D',NULL,NULL,NULL),(7,'AS001',5,'Maestría en Arte',NULL,'2020-06-07','I','M',NULL,NULL,NULL),(8,'AS001',5,'Maestría en Arte',NULL,'2020-06-07','A','M',NULL,NULL,_binary 'JVBERi0xLjQNJeLjz9MNCjExNDggMCBvYmoNPDwvTGluZWFyaXplZCAxL0wgMjM1MzA3L08gMTE1MC9FIDE1MzczMy9OIDIvVCAyMTIyMzAvSCBbIDExOTYgMzAwXT4+DWVuZG9iag0gICAgICAgICAgIA14cmVmDTExNDggNDUNMDAwMDAwMDAxNiAwMDAwMCBuDQowMDAwMDAxNzAyIDAwMDAwIG4NCjAwMDAwMDE4NjIgMDAwMDAgbg0KMDAwMDAwMjQyMiAwMDAwMCBuDQowMDAwMDAyODM4IDAwMDAwIG4NCjAwMDAwMDMxMDAgMDAwMDAgbg0KMDAwMDAwMzY3NSAwMDAwMCBuDQowMDAwMDAzOTI2IDAwMDAwIG4NCjAwMDAwMDQ1MTAgMDAwMDAgbg0KMDAwMDAwNDc2NyAwMDAwMCBuDQowMDAwMDA1MjkxIDAwMDAwIG4NCjAwMDAwMDU1NDkgMDAwMDAgbg0KMDAwMDAwNjA5NyAwMDAwMCBuDQowMDAwMDA2MzYyIDAwMDAwIG4NCjAwMDAwMDY0NzggMDAwMDAgbg0KMDAwMDAwNzA1OCAwMDAwMCBuDQowMDAwMDA3Nzc3IDAwMDAwIG4NCjAwMDAwMDg0ODQgMDAwMDAgbg0KMDAwMDAwOTIwNiAwMDAwMCBuDQowMDAwMDA5OTM3IDAwMDAwIG4NCjAwMDAwMTAxMTggMDAwMDAgbg0KMDAwMDAxMDI5NyAwMDAwMCBuDQowMDAwMDEwNDEyIDAwMDAwIG4NCjAwMDAwMTM3NzIgMDAwMDAgbg0KMDAwMDAxNTYzNCAwMDAwMCBuDQowMDAwMDE1ODEzIDAwMDAwIG4NCjAwMDAwMTU5MjYgMDAwMDAgbg0KMDAwMDAxODU0NSAwMDAwMCBuDQowMDAwMDIxNjEyIDAwMDAwIG4NCjAwMDAwMjQzNjUgMDAwMDAgbg0KMDAwMDAyNDU0NCAwMDAwMCBuDQowMDAwMDI0NzEzIDAwMDAwIG4NCjAwMDAwMjY3NjcgMDAwMDAgbg0KMDAwMDAzMDc0MSAwMDAwMCBuDQowMDAwMDM0MzI1IDAwMDAwIG4NCjAwMDAwNTU5OTkgMDAwMDAgbg0KMDAwMDA4NDY3NCAwMDAwMCBuDQowMDAwMTE1MTcwIDAwMDAwIG4NCjAwMDAxNDIyNzYgMDAwMDAgbg0KMDAwMDE1MDE5MyAwMDAwMCBuDQowMDAwMTUwMzEzIDAwMDAwIG4NCjAwMDAxNTMxODAgMDAwMDAgbg0KMDAwMDE1MzQyOCAwMDAwMCBuDQowMDAwMDAxNDk2IDAwMDAwIG4NCjAwMDAwMDExOTYgMDAwMDAgbg0KdHJhaWxlcg08PC9TaXplIDExOTMvUm9vdCAxMTQ5IDAgUi9JbmZvIDI2IDAgUi9JRFs8RkUzODJGMEJERDY5NDlFQjhBQTU3MUIwNzAzMjVDM0Y+PEJCQzE4MTM2Mjk4QjQ4QzJCMUE3NjdBMjM4QzE4RUE5Pl0vUHJldiAyMTIyMTkvWFJlZlN0bSAxNDk2Pj4Nc3RhcnR4cmVmDTANJSVFT0YNIA0xMTkyIDAgb2JqDTw8L0MgMjMyL0ZpbHRlci9GbGF0ZURlY29kZS9JIDI1NC9MZW5ndGggMjExL1MgMTIzPj5zdHJlYW0NCmjeYmBg4GJgYJNiYGVgmGnEIMiAAIJAMTYGFgaOHwx32BoYGN47MGADTFMm+mxm5PhwxCGwV6a5U/PY9TaOxZMCEPKqER0dQO2CECDi1tHRATYPCLgZmD50A2lNINYCi7gw8DPfYC1gE5DfIPagkSGu8QRjDXsDmwYzgwPDooP2TX2seoxHmCuYPs5uPNBg3qAr/E7vTvALtg88Cz+0L+Tds+Lsvv/bns18fFWBl7W8YQvjLSSH8gAtOw+mGRx44aJSDMzWYkCaEYh3AgQYAC+4OtYNZW5kc3RyZWFtDWVuZG9iag0xMTkxIDAgb2JqDTw8L0RlY29kZVBhcm1zPDwvQ29sdW1ucyAzL1ByZWRpY3RvciAxMj4+L0ZpbHRlci9GbGF0ZURlY29kZS9JbmRleFsyNyAxMTIxXS9MZW5ndGggNTMvU2l6ZSAxMTQ4L1R5cGUvWFJlZi9XWzEgMSAxXT4+c3RyZWFtDQpo3uzRsQ0AMAzDMMdz/9/6a98oAg56QGxPmox+aa4HPMSDh3jwEA8e4sFD+zyeAAMA72oT8A1lbmRzdHJlYW0NZW5kb2JqDTExNDkgMCBvYmoNPDwvTGFuZyhlcy1FUykvTWFya0luZm88PC9NYXJrZWQgdHJ1ZT4+L01ldGFkYXRhIDI1IDAgUi9QYWdlcyAyNCAwIFIvU3RydWN0VHJlZVJvb3QgMjcgMCBSL1R5cGUvQ2F0YWxvZy9WaWV3ZXJQcmVmZXJlbmNlczw8L0RpcmVjdGlvbi9MMlI+Pj4+DWVuZG9iag0xMTUwIDAgb2JqDTw8L0FydEJveFswLjAgMC4wIDc5My43MDEgNjA5LjQ0OV0vQmxlZWRCb3hbMC4wIDAuMCA3OTMuNzAxIDYwOS40NDldL0NvbnRlbnRzWzExNzAgMCBSIDExNzEgMCBSIDExNzQgMCBSIDExNzUgMCBSIDExNzYgMCBSIDExNzkgMCBSIDExODAgMCBSIDExODEgMCBSXS9Dcm9wQm94WzAuMCAwLjAgNzkzLjcwMSA2MDkuNDQ5XS9NZWRpYUJveFswLjAgMC4wIDc5My43MDEgNjA5LjQ0OV0vUGFyZW50IDI0IDAgUi9SZXNvdXJjZXM8PC9Db2xvclNwYWNlPDwvQ1MwIDExNjcgMCBSL0NTMSAxMTY4IDAgUi9DUzIgMTE3NyAwIFIvQ1MzIDExNzggMCBSPj4vRXh0R1N0YXRlPDwvR1MwIDExNjEgMCBSL0dTMSAxMTY5IDAgUi9HUzIgMTE3MyAwIFI+Pi9Gb250PDwvVFQwIDExNjIgMCBSL1RUMSAxMTYzIDAgUi9UVDIgMTE2NCAwIFIvVFQzIDExNjUgMCBSL1RUNCAxMTY2IDAgUi9UVDUgMTE3MiAwIFI+Pi9Qcm9jU2V0Wy9QREYvVGV4dF0+Pi9Sb3RhdGUgMC9TdHJ1Y3RQYXJlbnRzIDAvVHJpbUJveFswLjAgMC4wIDc5My43MDEgNjA5LjQ0OV0vVHlwZS9QYWdlPj4NZW5kb2JqDTExNTEgMCBvYmoNPDwvRmlsdGVyL0ZsYXRlRGVjb2RlL0xlbmd0aCAzNDU+PnN0cmVhbQ0KSIlckslqwzAQQO/6ijk2h+B4mSxgDEVJwIcu1O0HONI4NdSykZ2D/74aT0ihAltPI4140ijS5bF07QTRu+9NRRM0rbOexv7mDcGFrq1TcQK2NdN9tPxNVw8qCsnVPE7Ula7pVZ5D9BEmx8nP8PRs+wutVPTmLfnWXeHpS1criKrbMPxQR26CDRQFWGrCRi/18Fp3BNGSti5tmG+neR1y/lZ8zgNBsoxjkTG9pXGoDfnaXUnlm9AKyM+hFYqc/TefbCXt0pjv2qs84cWbTehUngqnC8fCMXMinATOJJ5xPEuFU+ZMOGNGYWTeCm+Zd8I75oPwgVkLa+aj8JH5JHxiPguHQ+UonsieKG7Ibig+yD4oPsg+KD7IPig+yD64F94ziw+yj5Yzaj6jlrhe4uIWOr7Y+w3yFYeXAI/6mZv3oXTLc1lqxtVqHT1e1NAPELL4U78CDAAHqaoXDWVuZHN0cmVhbQ1lbmRvYmoNMTE1MiAwIG9iag08PC9Bc2NlbnQgMTA4My9DYXBIZWlnaHQgNzE2L0Rlc2NlbnQgLTMwNy9GbGFncyAzMi9Gb250QkJveFstMTk0IC0zMDcgMTY4OCAxMDgzXS9Gb250RmFtaWx5KEFyaWFsIEJsYWNrKS9Gb250RmlsZTIgMTE4NiAwIFIvRm9udE5hbWUvRFFJRFJWK0FyaWFsLUJsYWNrL0ZvbnRTdHJldGNoL05vcm1hbC9Gb250V2VpZ2h0IDkwMC9JdGFsaWNBbmdsZSAwL1N0ZW1WIDIwMC9UeXBlL0ZvbnREZXNjcmlwdG9yL1hIZWlnaHQgNTE5Pj4NZW5kb2JqDTExNTMgMCBvYmoNPDwvRmlsdGVyL0ZsYXRlRGVjb2RlL0xlbmd0aCA1MDQ+PnN0cmVhbQ0KSIlck82Om0AQhO88xRx3Dyts6OnelZAl/2DJh/woTh4Aw9hBigFhfPDbZ4qyNlKQbApmeuqrGTrdHnaHrp1c+n3s62OY3LntmjHc+vtYB3cKl7ZLlplr2np6Ps3/9bUakjQWHx+3KVwP3blPisKlP+LgbRof7mXd9KfwmqTfxiaMbXdxL7+2x1eXHu/D8CdcQze5hVutXBPOcaEv1fC1ugaXzmVvhyaOt9PjLdb8m/HzMQSXzc9LwtR9E25DVYex6i4hKRbxWrliH69VErrmv3F9lp3O9e9qTIoMkxeLeIv6nfod+oP6A3pNvYbeUm+hd9Q76JK6jDrnmjnWzJfUS+iMOoPOqXNooRZoT+2hlVqhjdqgyZmDMydnDk6hl8BL6CXwEnoJvIReAi+hl8BL6CXwEnoJvITry7w+90GwD8LsguzC7ILssqeOm1947oPHPnjyePB48njwePJ48HjyePAosyiyKGsVtcpaRa2yVlGrrNW5llkUWZRZFFmUWRRZlFkUWZRnqjhTZS5FLmUuRS5lLkUuYy5DLiObgc3IZmAzshnYjGwGNiObgc14joZzNLIZ2IxsBrYNvTbw2vD9Bu9Lzi8xvyRzCeY9GeINH//zK0cbxG51nz1W38cxttfc0nNfoaPaLnx2/dAPLlbhl/wVYADWZfywDWVuZHN0cmVhbQ1lbmRvYmoNMTE1NCAwIG9iag08PC9Bc2NlbnQgMTAwNi9DYXBIZWlnaHQgNzE2L0Rlc2NlbnQgLTMyNS9GbGFncyAzMi9Gb250QkJveFstNjY1IC0zMjUgMjAwMCAxMDA2XS9Gb250RmFtaWx5KEFyaWFsKS9Gb250RmlsZTIgMTE4NCAwIFIvRm9udE5hbWUvRFFJRFJWK0FyaWFsTVQvRm9udFN0cmV0Y2gvTm9ybWFsL0ZvbnRXZWlnaHQgNDAwL0l0YWxpY0FuZ2xlIDAvU3RlbVYgODgvVHlwZS9Gb250RGVzY3JpcHRvci9YSGVpZ2h0IDUxOT4+DWVuZG9iag0xMTU1IDAgb2JqDTw8L0ZpbHRlci9GbGF0ZURlY29kZS9MZW5ndGggNTEzPj5zdHJlYW0NCkiJXJTNjptAEITvPMUcdw8rbNPTvSshS17Akg/5UZw8AIaxgxQDwvjgt88UtdpIQbIpmJ7qr0Zup8WhPPTd7NLv09Acw+zOXd9O4Tbcpya4U7h0fbLeuLZr5o+n5bu51mOSxs3Hx20O10N/HpI8d+mPuHibp4d72rXDKTwn6bepDVPXX9zTr+L47NLjfRz/hGvoZ7dy261rwzkafanHr/U1uHTZ9nJo43o3P17inn8VPx9jcJvleU2YZmjDbaybMNX9JST5Kl5bl+/jtU1C3/63rhm3nc7N73pK8g2KV6t4i7qgLqBL6hK6oq6izlifoT5bU6+hN9Qb6Iw6gxZqgfbUHlqpFfqN+i1qoafAU+gp8BR6CjyFngJPoafAU+gp8BSjNuhX6ldo9pKl1456B83sguzC7ILswuyC7LKnjgebe56Dxzl4cnpwenJ6cHpyenB6cnpwenJ6cHryePAosyuyKz0VnkpPhafSU+Gp9FR4Kj0VnsrsiuzK7Irsyl669GJ2RXZldkV2ZXZFdmV2RXZldkV2Y3ZDdiOngdPIaeA0cho4jZwGTiOngdPIaeA0cho4jZwGznf2ekevgu8LvC/Zq0SvkllKZKl4hhXOsGJ9hfo96+MNQ/Hx68d4xCl2n7PX3Kcpjt0y6su8YdK6Pnz+G4zD6OIufJK/AgwAxC0Bhw1lbmRzdHJlYW0NZW5kb2JqDTExNTYgMCBvYmoNPDwvQXNjZW50IDEwMTgvQ2FwSGVpZ2h0IDcxNi9EZXNjZW50IC0zNzYvRmxhZ3MgMzIvRm9udEJCb3hbLTYyOCAtMzc2IDIwMDAgMTAxOF0vRm9udEZhbWlseShBcmlhbCkvRm9udEZpbGUyIDExODMgMCBSL0ZvbnROYW1lL0RRSURSVitBcmlhbC1Cb2xkTVQvRm9udFN0cmV0Y2gvTm9ybWFsL0ZvbnRXZWlnaHQgNzAwL0l0YWxpY0FuZ2xlIDAvU3RlbVYgMTM2L1R5cGUvRm9udERlc2NyaXB0b3IvWEhlaWdodCA1MTk+Pg1lbmRvYmoNMTE1NyAwIG9iag08PC9GaWx0ZXIvRmxhdGVEZWNvZGUvTGVuZ3RoIDQ1Mz4+c3RyZWFtDQpIiVyTy2rjQBBF9/qKXiaLID/UVTEIg2NL4EVmwnjmA2Sp7QhiSbTlhf8+dXVDAiOw+whVdZ0uqtPtfrfv2tGlb7GvD2F0p7ZrYrj2t1gHdwzntkvmC9e09fj1Nv3Xl2pIUks+3K9juOy7U5/kuUv/2MfrGO/uYdP0x/CYpL9jE2Lbnd3Dv+3h0aWH2zB8hEvoRjdz67Vrwsk2eq2GX9UluHRKe9o39r0d70+W8xPx9z4Et5je55Sp+yZch6oOserOIcln9qxdXtqzTkLX/Pc9WzHteKrfq5jkCwTPZrYYb8gb8Ja8BRfkwni5mNgWY0/2xtl8YluMGZMhJluSl+CMnIGZm025QhbwM/kZvCKvwCXZDpV7Ons4e9byqOVZy6OW5/4e+wvdBG7CeEG8MF4QL3QTuAlzZcqlm8BNlKxgego8hZ4CT2EPBT0U9lDQQ9mRd2D2U9BP4bkE51KeS3EupbPCWemscFY6K5yVzgpnpbPCWemscFZ6KjyVngpPpafC84V1X1C3YN0CdQvGF4gv6F/Av6RDCYeS+9iCYfuaKoyd3Q73PdP1LUYb5+kKTXOMCW678H3Lhn5wloVf8inAAA7g4MANZW5kc3RyZWFtDWVuZG9iag0xMTU4IDAgb2JqDTw8L0FzY2VudCA5OTgvQ2FwSGVpZ2h0IDcxNi9EZXNjZW50IC0zMjUvRmxhZ3MgOTYvRm9udEJCb3hbLTUxNyAtMzI1IDEzNTkgOTk4XS9Gb250RmFtaWx5KEFyaWFsKS9Gb250RmlsZTIgMTE4MiAwIFIvRm9udE5hbWUvRFFJRFJWK0FyaWFsLUl0YWxpY01UL0ZvbnRTdHJldGNoL05vcm1hbC9Gb250V2VpZ2h0IDQwMC9JdGFsaWNBbmdsZSAtMTIvU3RlbVYgOTIvVHlwZS9Gb250RGVzY3JpcHRvci9YSGVpZ2h0IDUxOT4+DWVuZG9iag0xMTU5IDAgb2JqDTw8L0ZpbHRlci9GbGF0ZURlY29kZS9MZW5ndGggNDc3Pj5zdHJlYW0NCkiJXJPNjptAEITvPMUcdw8r/qZ71hKyZIFX8mGTKE4eAMPYQVoDGuOD3z5T1GojBcnm46drqprptD40h3FYTPojTN3RL+Y8jH3wt+keOm9O/jKMSV6YfuiWz6v1v7u2c5LG4uPjtvjrYTxPSVWZ9Gd8eFvCwzzt+unkn5P0e+h9GMaLefpdH59NerzP84e/+nExmdluTe/PUei9nb+1V2/Stezl0Mfnw/J4iTX/3vj1mL0p1uucZrqp97e57Xxox4tPqiweW1O9xWOb+LH/77lYlp3O3Z82JFWBl7MsniLvyfvIJe+XuF/m5BxckAuwkAXsyA68IW8iW9Za1FrWWtTaklyCLdmCqWmhaZWsYOpb6NtX8iuYa9l1rR15B67JNbghN2BmtMho38ixUZUwryCv0KfAp9CnwKfQp8Cn0KfAp9CnwKfQm8Cb0I/Aj7IPij4o9RX6Sn2FvlJfoa/UV+gr9RX6yj4o+qDMrsiuzKvIq8yoyKjMqMjomNEho6MHBw+OHhw8OHpw8ODowcGDYy6HXI7rOqy7QW2R5Vh3Y8noc828NfI21G+g37AnDXqy53eJJ2zUzx2JLRsny3zNQ3cPIY7COn7rDGD3D6P/mtB5mk2swi/5K8AAoaLsHA1lbmRzdHJlYW0NZW5kb2JqDTExNjAgMCBvYmoNPDwvQXNjZW50IDEwMTgvQ2FwSGVpZ2h0IDcxNS9EZXNjZW50IC0zNzYvRmxhZ3MgOTYvRm9udEJCb3hbLTU2MCAtMzc2IDEzOTAgMTAxOF0vRm9udEZhbWlseShBcmlhbCkvRm9udEZpbGUyIDExODUgMCBSL0ZvbnROYW1lL0RRSURSVitBcmlhbC1Cb2xkSXRhbGljTVQvRm9udFN0cmV0Y2gvTm9ybWFsL0ZvbnRXZWlnaHQgNzAwL0l0YWxpY0FuZ2xlIC0xMi9TdGVtViAxNDAvVHlwZS9Gb250RGVzY3JpcHRvci9YSGVpZ2h0IDUxOT4+DWVuZG9iag0xMTYxIDAgb2JqDTw8L0FJUyBmYWxzZS9CTS9Ob3JtYWwvQ0EgMS4wL09QIGZhbHNlL09QTSAxL1NBIGZhbHNlL1NNYXNrL05vbmUvVHlwZS9FeHRHU3RhdGUvY2EgMS4wL29wIGZhbHNlPj4NZW5kb2JqDTExNjIgMCBvYmoNPDwvQmFzZUZvbnQvRFFJRFJWK0FyaWFsLUJsYWNrL0VuY29kaW5nL1dpbkFuc2lFbmNvZGluZy9GaXJzdENoYXIgMzIvRm9udERlc2NyaXB0b3IgMTE1MiAwIFIvTGFzdENoYXIgMjA1L1N1YnR5cGUvVHJ1ZVR5cGUvVG9Vbmljb2RlIDExNTEgMCBSL1R5cGUvRm9udC9XaWR0aHNbMzMzIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDY2NyA2NjcgNjY3IDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCA3NzggMCA3NzggNzc4IDcyMiA2NjcgODMzIDAgMzg5IDAgMCA2NjcgOTQ0IDgzMyA4MzMgNzIyIDAgNzc4IDcyMiA3MjIgODMzIDc3OCAwIDc3OCA3NzggMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCA3NzggMCAwIDAgMCAwIDAgMCA3MjIgMCAwIDAgMzg5XT4+DWVuZG9iag0xMTYzIDAgb2JqDTw8L0Jhc2VGb250L0RRSURSVitBcmlhbC1JdGFsaWNNVC9FbmNvZGluZy9XaW5BbnNpRW5jb2RpbmcvRmlyc3RDaGFyIDMyL0ZvbnREZXNjcmlwdG9yIDExNTggMCBSL0xhc3RDaGFyIDI1MC9TdWJ0eXBlL1RydWVUeXBlL1RvVW5pY29kZSAxMTU3IDAgUi9UeXBlL0ZvbnQvV2lkdGhzWzI3OCAwIDAgMCAwIDAgMCAwIDAgMCAzODkgMCAyNzggMCAyNzggMCAwIDAgNTU2IDAgMCA1NTYgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDY2NyA2NjcgNzIyIDcyMiA2NjcgNjExIDAgNzIyIDI3OCAwIDAgMCAwIDAgNzc4IDY2NyAwIDcyMiA2NjcgMCA3MjIgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDU1NiA1NTYgNTAwIDU1NiA1NTYgMjc4IDU1NiA1NTYgMjIyIDIyMiAwIDIyMiA4MzMgNTU2IDU1NiA1NTYgNTU2IDMzMyA1MDAgMjc4IDU1NiA1MDAgMCA1MDAgNTAwIDUwMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgNDAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDU1NiAwIDAgMCAwIDAgMCAwIDU1NiAwIDAgMCAyNzggMCAwIDAgMCAwIDU1NiAwIDAgMCAwIDAgMCA1NTZdPj4NZW5kb2JqDTExNjQgMCBvYmoNPDwvQmFzZUZvbnQvRFFJRFJWK0FyaWFsLUJvbGRJdGFsaWNNVC9FbmNvZGluZy9XaW5BbnNpRW5jb2RpbmcvRmlyc3RDaGFyIDMyL0ZvbnREZXNjcmlwdG9yIDExNjAgMCBSL0xhc3RDaGFyIDIzNy9TdWJ0eXBlL1RydWVUeXBlL1RvVW5pY29kZSAxMTU5IDAgUi9UeXBlL0ZvbnQvV2lkdGhzWzI3OCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDI3OCAwIDU1NiA1NTYgNTU2IDAgMCA1NTYgMCA1NTYgMCA1NTYgMCAwIDAgMCAwIDAgMCA3MjIgNzIyIDcyMiA3MjIgNjY3IDYxMSA3NzggNzIyIDI3OCA1NTYgMCA2MTEgODMzIDcyMiA3NzggNjY3IDAgNzIyIDY2NyA2MTEgNzIyIDY2NyAwIDY2NyAwIDYxMSAwIDAgMCAwIDAgMCA1NTYgNjExIDU1NiA2MTEgNTU2IDMzMyA2MTEgMCAyNzggMCAwIDI3OCAwIDYxMSA2MTEgNjExIDAgMzg5IDU1NiAzMzMgNjExIDAgMCA1NTYgNTU2IDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgNTAwIDUwMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgNzIyIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCA3NzggMCAwIDAgMCAwIDAgNzIyIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDI3OF0+Pg1lbmRvYmoNMTE2NSAwIG9iag08PC9CYXNlRm9udC9EUUlEUlYrQXJpYWxNVC9FbmNvZGluZy9XaW5BbnNpRW5jb2RpbmcvRmlyc3RDaGFyIDMyL0ZvbnREZXNjcmlwdG9yIDExNTQgMCBSL0xhc3RDaGFyIDI0My9TdWJ0eXBlL1RydWVUeXBlL1RvVW5pY29kZSAxMTUzIDAgUi9UeXBlL0ZvbnQvV2lkdGhzWzI3OCAwIDAgMCAwIDAgMCAwIDMzMyAzMzMgMzg5IDAgMjc4IDMzMyAyNzggMCA1NTYgNTU2IDU1NiA1NTYgNTU2IDU1NiA1NTYgNTU2IDU1NiA1NTYgMCAwIDAgMCAwIDAgMCA2NjcgNjY3IDcyMiA3MjIgNjY3IDYxMSA3NzggMCAyNzggNTAwIDAgMCA4MzMgNzIyIDc3OCA2NjcgMCA3MjIgNjY3IDYxMSA3MjIgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDU1NiA1NTYgNTAwIDU1NiA1NTYgMjc4IDU1NiAwIDIyMiAyMjIgMCAyMjIgODMzIDU1NiA1NTYgNTU2IDAgMzMzIDUwMCAyNzggNTU2IDUwMCAwIDUwMCA1MDAgNTAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCA0MDAgMCAwIDAgMCAwIDAgMCAwIDAgMzY1IDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgNTU2IDAgMCAwIDI3OCAwIDAgMCAwIDAgNTU2XT4+DWVuZG9iag0xMTY2IDAgb2JqDTw8L0Jhc2VGb250L0RRSURSVitBcmlhbC1Cb2xkTVQvRW5jb2RpbmcvV2luQW5zaUVuY29kaW5nL0ZpcnN0Q2hhciAzMi9Gb250RGVzY3JpcHRvciAxMTU2IDAgUi9MYXN0Q2hhciAyNDMvU3VidHlwZS9UcnVlVHlwZS9Ub1VuaWNvZGUgMTE1NSAwIFIvVHlwZS9Gb250L1dpZHRoc1syNzggMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDI3OCAzMzMgMjc4IDAgNTU2IDU1NiA1NTYgNTU2IDU1NiA1NTYgNTU2IDAgMCA1NTYgMCAwIDAgMCAwIDAgMCA3MjIgNzIyIDcyMiA3MjIgNjY3IDYxMSA3NzggNzIyIDI3OCA1NTYgMCA2MTEgODMzIDcyMiA3NzggNjY3IDAgNzIyIDY2NyA2MTEgNzIyIDY2NyAwIDAgNjY3IDAgMCAwIDAgMCAwIDAgNTU2IDYxMSA1NTYgNjExIDU1NiAzMzMgNjExIDYxMSAyNzggMjc4IDAgMjc4IDg4OSA2MTEgNjExIDYxMSAwIDM4OSA1NTYgMzMzIDYxMSA1NTYgNzc4IDU1NiA1NTYgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgNDAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDY2NyAwIDAgMCAwIDAgMCAwIDAgMCA3NzggMCAwIDAgMCAwIDAgNzIyIDAgMCAwIDAgMCAwIDU1NiAwIDAgMCAwIDAgMCAw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MTI3LjBdPj5zdHJlYW0NCkiJqjbUMwADBSMFQ4Wi/JwcBQMiREwUdKEsLkOFzLyU1AoFXQszPSNzE1MDM4Xc0hwFQwO4rsSUFGRuSmYZugoQ1wRmtrECF8xwmNlGRsgqQeYZIZtmDNNqhMVZpiZ49cK9VJBfoFALEGAAGyJEQw1lbmRzdHJlYW0NZW5kb2JqDTQgMCBvYmoNPDwvUEFOVE9ORSMyMDI3NDcjMjBDIDExNjcgMCBSPj4NZW5kb2JqDTUgMCBvYmoNPDwvQ29sb3JhbnRzIDQgMCBSL1N1YnR5cGUvTkNoYW5uZWw+Pg1lbmRvYmoNNiAwIG9iag08PC9MZW5ndGggMzE2NS9TdWJ0eXBlL1hNTC9UeXBlL01ldGFkYXRhPj5zdHJlYW0NCjx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTM3IDc5LjE1OTc2OCwgMjAxNi8wOC8xMS0xMzoyNDo0MiAgICAgICAgIj4KIDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+CiAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIgogICAgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIgogICAgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIgogICAgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIgogICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iCiAgICB4bWxuczpleGlmPSJodHRwOi8vbnMuYWRvYmUuY29tL2V4aWYvMS4wLyIKICAgeG1wTU06RG9jdW1lbnRJRD0iRkYxRUY2RkVCQjY2RUZENjY2N0QwNkM2NUZCODE4NkYiCiAgIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MDM4MDExNzQwNzIwNjgxMTgwODNCMTZBOTBBQjY0RjkiCiAgIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0iRkYxRUY2RkVCQjY2RUZENjY2N0QwNkM2NUZCODE4NkYiCiAgIGRjOmZvcm1hdD0iYXBwbGljYXRpb24vdm5kLmFkb2JlLnBob3Rvc2hvcCIKICAgcGhvdG9zaG9wOkNvbG9yTW9kZT0iOCIKICAgeG1wOkNyZWF0ZURhdGU9IjIwMTYtMDktMjZUMTA6NDA6MzMtMDU6MDAiCiAgIHhtcDpNb2RpZnlEYXRlPSIyMDE2LTExLTA0VDEwOjIwOjA0LTA2OjAwIgogICB4bXA6TWV0YWRhdGFEYXRlPSIyMDE2LTExLTA0VDEwOjIwOjA0LTA2OjAwIgogICB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzYgKE1hY2ludG9zaCkiCiAgIHRpZmY6SW1hZ2VXaWR0aD0iOTYwIgogICB0aWZmOkltYWdlTGVuZ3RoPSIxMjgwIgogICB0aWZmOlBob3RvbWV0cmljSW50ZXJwcmV0YXRpb249IjIiCiAgIHRpZmY6T3JpZW50YXRpb249IjEiCiAgIHRpZmY6U2FtcGxlc1BlclBpeGVsPSIzIgogICB0aWZmOllDYkNyUG9zaXRpb25pbmc9IjEiCiAgIHRpZmY6WFJlc29sdXRpb249IjcyMDAwMC8xMDAwMCIKICAgdGlmZjpZUmVzb2x1dGlvbj0iNzIwMDAwLzEwMDAwIgogICB0aWZmOlJlc29sdXRpb25Vbml0PSIyIgogICBleGlmOkV4aWZWZXJzaW9uPSIwMjIxIgogICBleGlmOkZsYXNocGl4VmVyc2lvbj0iMDEwMCIKICAgZXhpZjpDb2xvclNwYWNlPSI2NTUzNSIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249Ijc2NSIKICAgZXhpZjpQaXhlbFlEaW1lbnNpb249IjMzNSIKICAgZXhpZjpTY2VuZUNhcHR1cmVUeXBlPSIwIj4KICAgPHhtcE1NOkhpc3Rvcnk+CiAgICA8cmRmOlNlcT4KICAgICA8cmRmOmxpCiAgICAgIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiCiAgICAgIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6N2UwNTJmMmYtNDZjYy00MmY1LTk3ZGItZDcxZTUyZDYxNzRmIgogICAgICBzdEV2dDp3aGVuPSIyMDE2LTA5LTI2VDEwOjQ2OjAzLTA1OjAwIgogICAgICBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiCiAgICAgIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4KICAgICA8cmRmOmxpCiAgICAgIHN0RXZ0OmFjdGlvbj0iY29udmVydGVkIgogICAgICBzdEV2dDpwYXJhbWV0ZXJzPSJmcm9tIGltYWdlL2pwZWcgdG8gYXBwbGljYXRpb24vdm5kLmFkb2JlLnBob3Rvc2hvcCIvPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJkZXJpdmVkIgogICAgICBzdEV2dDpwYXJhbWV0ZXJzPSJjb252ZXJ0ZWQgZnJvbSBpbWFnZS9qcGVnIHRvIGFwcGxpY2F0aW9uL3ZuZC5hZG9iZS5waG90b3Nob3AiLz4KICAgICA8cmRmOmxpCiAgICAgIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiCiAgICAgIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6NzU0MGM3NWUtOWNiNS00ZDE5LWJmN2MtNjUzZTVlZTUyMWU5IgogICAgICBzdEV2dDp3aGVuPSIyMDE2LTA5LTI2VDEwOjQ2OjAzLTA1OjAwIgogICAgICBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiCiAgICAgIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4KICAgICA8cmRmOmxpCiAgICAgIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiCiAgICAgIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6MDM4MDExNzQwNzIwNjgxMTgwODNCMTZBOTBBQjY0RjkiCiAgICAgIHN0RXZ0OndoZW49IjIwMTYtMTEtMDRUMTA6MjA6MDQtMDY6MDAiCiAgICAgIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCBDUzYgKE1hY2ludG9zaCkiCiAgICAgIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4KICAgIDwvcmRmOlNlcT4KICAgPC94bXBNTTpIaXN0b3J5PgogICA8eG1wTU06RGVyaXZlZEZyb20KICAgIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6N2UwNTJmMmYtNDZjYy00MmY1LTk3ZGItZDcxZTUyZDYxNzRmIgogICAgc3RSZWY6ZG9jdW1lbnRJRD0iRkYxRUY2RkVCQjY2RUZENjY2N0QwNkM2NUZCODE4NkYiCiAgICBzdFJlZjpvcmlnaW5hbERvY3VtZW50SUQ9IkZGMUVGNkZFQkI2NkVGRDY2NjdEMDZDNjVGQjgxODZGIi8+CiAgIDx0aWZmOkJpdHNQZXJTYW1wbGU+CiAgICA8cmRmOlNlcT4KICAgICA8cmRmOmxpPjg8L3JkZjpsaT4KICAgICA8cmRmOmxpPjg8L3JkZjpsaT4KICAgICA8cmRmOmxpPjg8L3JkZjpsaT4KICAgIDwvcmRmOlNlcT4KICAgPC90aWZmOkJpdHNQZXJTYW1wbGU+CiAgIDxleGlmOkNvbXBvbmVudHNDb25maWd1cmF0aW9uPgogICAgPHJkZjpTZXE+CiAgICAgPHJkZjpsaT4xPC9yZGY6bGk+CiAgICAgPHJkZjpsaT4yPC9yZGY6bGk+CiAgICAgPHJkZjpsaT4zPC9yZGY6bGk+CiAgICAgPHJkZjpsaT4wPC9yZGY6bGk+CiAgICA8L3JkZjpTZXE+CiAgIDwvZXhpZjpDb21wb25lbnRzQ29uZmlndXJhdGlvbj4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cg1lbmRzdHJlYW0NZW5kb2JqDTcgMCBvYmoNPDwvTGVuZ3RoIDMxNjUvU3VidHlwZS9YTUwvVHlwZS9NZXRhZGF0YT4+c3RyZWFtDQo8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzEzNyA3OS4xNTk3NjgsIDIwMTYvMDgvMTEtMTM6MjQ6NDIgICAgICAgICI+CiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiCiAgICB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIKICAgIHhtbG5zOnN0RXZ0PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VFdmVudCMiCiAgICB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIKICAgIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnRpZmY9Imh0dHA6Ly9ucy5hZG9iZS5jb20vdGlmZi8xLjAvIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgIHhtcE1NOkRvY3VtZW50SUQ9IkZGMUVGNkZFQkI2NkVGRDY2NjdEMDZDNjVGQjgxODZGIgogICB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjAzODAxMTc0MDcyMDY4MTE4MDgzQjE2QTkwQUI2NEY5IgogICB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9IkZGMUVGNkZFQkI2NkVGRDY2NjdEMDZDNjVGQjgxODZGIgogICBkYzpmb3JtYXQ9ImFwcGxpY2F0aW9uL3ZuZC5hZG9iZS5waG90b3Nob3AiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjgiCiAgIHhtcDpDcmVhdGVEYXRlPSIyMDE2LTA5LTI2VDEwOjQwOjMzLTA1OjAwIgogICB4bXA6TW9kaWZ5RGF0ZT0iMjAxNi0xMS0wNFQxMDoyMDowNC0wNjowMCIKICAgeG1wOk1ldGFkYXRhRGF0ZT0iMjAxNi0xMS0wNFQxMDoyMDowNC0wNjowMCIKICAgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChNYWNpbnRvc2gpIgogICB0aWZmOkltYWdlV2lkdGg9Ijk2MCIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMTI4MCIKICAgdGlmZjpQaG90b21ldHJpY0ludGVycHJldGF0aW9uPSIyIgogICB0aWZmOk9yaWVudGF0aW9uPSIxIgogICB0aWZmOlNhbXBsZXNQZXJQaXhlbD0iMyIKICAgdGlmZjpZQ2JDclBvc2l0aW9uaW5nPSIxIgogICB0aWZmOlhSZXNvbHV0aW9uPSI3MjAwMDAvMTAwMDAiCiAgIHRpZmY6WVJlc29sdXRpb249IjcyMDAwMC8xMDAwMCIKICAgdGlmZjpSZXNvbHV0aW9uVW5pdD0iMiIKICAgZXhpZjpFeGlmVmVyc2lvbj0iMDIyMSIKICAgZXhpZjpGbGFzaHBpeFZlcnNpb249IjAxMDAiCiAgIGV4aWY6Q29sb3JTcGFjZT0iNjU1MzUiCiAgIGV4aWY6UGl4ZWxYRGltZW5zaW9uPSI3NjUiCiAgIGV4aWY6UGl4ZWxZRGltZW5zaW9uPSIzMzUiCiAgIGV4aWY6U2NlbmVDYXB0dXJlVHlwZT0iMCI+CiAgIDx4bXBNTTpIaXN0b3J5PgogICAgPHJkZjpTZXE+CiAgICAgPHJkZjpsaQogICAgICBzdEV2dDphY3Rpb249InNhdmVkIgogICAgICBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjdlMDUyZjJmLTQ2Y2MtNDJmNS05N2RiLWQ3MWU1MmQ2MTc0ZiIKICAgICAgc3RFdnQ6d2hlbj0iMjAxNi0wOS0yNlQxMDo0NjowMy0wNTowMCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIgogICAgICBzdEV2dDpjaGFuZ2VkPSIvIi8+CiAgICAgPHJkZjpsaQogICAgICBzdEV2dDphY3Rpb249ImNvbnZlcnRlZCIKICAgICAgc3RFdnQ6cGFyYW1ldGVycz0iZnJvbSBpbWFnZS9qcGVnIHRvIGFwcGxpY2F0aW9uL3ZuZC5hZG9iZS5waG90b3Nob3AiLz4KICAgICA8cmRmOmxpCiAgICAgIHN0RXZ0OmFjdGlvbj0iZGVyaXZlZCIKICAgICAgc3RFdnQ6cGFyYW1ldGVycz0iY29udmVydGVkIGZyb20gaW1hZ2UvanBlZyB0byBhcHBsaWNhdGlvbi92bmQuYWRvYmUucGhvdG9zaG9wIi8+CiAgICAgPHJkZjpsaQogICAgICBzdEV2dDphY3Rpb249InNhdmVkIgogICAgICBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjc1NDBjNzVlLTljYjUtNGQxOS1iZjdjLTY1M2U1ZWU1MjFlOSIKICAgICAgc3RFdnQ6d2hlbj0iMjAxNi0wOS0yNlQxMDo0NjowMy0wNTowMCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIgogICAgICBzdEV2dDpjaGFuZ2VkPSIvIi8+CiAgICAgPHJkZjpsaQogICAgICBzdEV2dDphY3Rpb249InNhdmVkIgogICAgICBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjAzODAxMTc0MDcyMDY4MTE4MDgzQjE2QTkwQUI2NEY5IgogICAgICBzdEV2dDp3aGVuPSIyMDE2LTExLTA0VDEwOjIwOjA0LTA2OjAwIgogICAgICBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgQ1M2IChNYWNpbnRvc2gpIgogICAgICBzdEV2dDpjaGFuZ2VkPSIvIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICAgPHhtcE1NOkRlcml2ZWRGcm9tCiAgICBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjdlMDUyZjJmLTQ2Y2MtNDJmNS05N2RiLWQ3MWU1MmQ2MTc0ZiIKICAgIHN0UmVmOmRvY3VtZW50SUQ9IkZGMUVGNkZFQkI2NkVGRDY2NjdEMDZDNjVGQjgxODZGIgogICAgc3RSZWY6b3JpZ2luYWxEb2N1bWVudElEPSJGRjFFRjZGRUJCNjZFRkQ2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ICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIgogICAgICAgICAgICB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIKICAgICAgICAgICAgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiCiAgICAgICAgICAgIHhtbG5zOnN0RXZ0PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VFdmVudCMiCiAgICAgICAgICAgIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIKICAgICAgICAgICAgeG1sbnM6cGRmPSJodHRwOi8vbnMuYWRvYmUuY29tL3BkZi8xLjMvIj4KICAgICAgICAgPHhtcDpDcmVhdGVEYXRlPjIwMTktMTEtMTRUMDk6NDc6MTAtMDY6MDA8L3htcDpDcmVhdGVEYXRlPgogICAgICAgICA8eG1wOk1ldGFkYXRhRGF0ZT4yMDE5LTExLTE0VDA5OjQ3OjEwLTA2OjAwPC94bXA6TWV0YWRhdGFEYXRlPgogICAgICAgICA8eG1wOk1vZGlmeURhdGU+MjAxOS0xMS0xNFQwOTo0NzoxMC0wNjowMDwveG1wOk1vZGlmeURhdGU+CiAgICAgICAgIDx4bXA6Q3JlYXRvclRvb2w+QWRvYmUgSW5EZXNpZ24gQ0MgMjAxNyAoTWFjaW50b3NoKTwveG1wOkNyZWF0b3JUb29sPgogICAgICAgICA8eG1wTU06SW5zdGFuY2VJRD51dWlkOjZhNGRhOTY5LWJmMGMtOGI0ZS04ZWRmLTI5NWFiMGM0OWEzZTwveG1wTU06SW5zdGFuY2VJRD4KICAgICAgICAgPHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD54bXAuZGlkOjAzODAxMTc0MDcyMDY4MTE4QTZERkI5NzhCQkMwMENDPC94bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ+CiAgICAgICAgIDx4bXBNTTpEb2N1bWVudElEPnhtcC5pZDo1NzM0ZmFkNS1mMGM5LTRhZDctYTBlYS1jNWQ3M2IwNGVjMGY8L3htcE1NOkRvY3VtZW50SUQ+CiAgICAgICAgIDx4bXBNTTpSZW5kaXRpb25DbGFzcz5wcm9vZjpwZGY8L3htcE1NOlJlbmRpdGlvbkNsYXNzPgogICAgICAgICA8eG1wTU06RGVyaXZlZEZyb20gcmRmOnBhcnNlVHlwZT0iUmVzb3VyY2UiPgogICAgICAgICAgICA8c3RSZWY6aW5zdGFuY2VJRD54bXAuaWlkOjRlYTljZGNkLTcyMGQtNDVhMi05YTY2LWM5OTcwOWYzN2VlNTwvc3RSZWY6aW5zdGFuY2VJRD4KICAgICAgICAgICAgPHN0UmVmOmRvY3VtZW50SUQ+eG1wLmRpZDoyNmY4ZGY0NC0wZTU2LTQwMjktOTcwYS0yNmIyMjNhMWMxZjI8L3N0UmVmOmRvY3VtZW50SUQ+CiAgICAgICAgICAgIDxzdFJlZjpvcmlnaW5hbERvY3VtZW50SUQ+eG1wLmRpZDowMzgwMTE3NDA3MjA2ODExOEE2REZCOTc4QkJDMDBDQzwvc3RSZWY6b3JpZ2luYWxEb2N1bWVudElEPgogICAgICAgICAgICA8c3RSZWY6cmVuZGl0aW9uQ2xhc3M+ZGVmYXVsdDwvc3RSZWY6cmVuZGl0aW9uQ2xhc3M+CiAgICAgICAgIDwveG1wTU06RGVyaXZlZEZyb20+CiAgICAgICAgIDx4bXBNTTpIaXN0b3J5PgogICAgICAgICAgICA8cmRmOlNlcT4KICAgICAgICAgICAgICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDphY3Rpb24+Y29udmVydGVkPC9zdEV2dDphY3Rpb24+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpwYXJhbWV0ZXJzPmZyb20gYXBwbGljYXRpb24veC1pbmRlc2lnbiB0byBhcHBsaWNhdGlvbi9wZGY8L3N0RXZ0OnBhcmFtZXRlcnM+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpzb2Z0d2FyZUFnZW50PkFkb2JlIEluRGVzaWduIENDIDIwMTcgKE1hY2ludG9zaCk8L3N0RXZ0OnNvZnR3YXJlQWdlbnQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpjaGFuZ2VkPi88L3N0RXZ0OmNoYW5nZWQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDp3aGVuPjIwMTktMTEtMTRUMDk6NDc6MTAtMDY6MDA8L3N0RXZ0OndoZW4+CiAgICAgICAgICAgICAgIDwvcmRmOmxpPgogICAgICAgICAgICA8L3JkZjpTZXE+CiAgICAgICAgIDwveG1wTU06SGlzdG9yeT4KICAgICAgICAgPGRjOmZvcm1hdD5hcHBsaWNhdGlvbi9wZGY8L2RjOmZvcm1hdD4KICAgICAgICAgPHBkZjpQcm9kdWNlcj5BZG9iZSBQREYgTGlicmFyeSAxNS4wPC9wZGY6UHJvZHVjZXI+CiAgICAgICAgIDxwZGY6VHJhcHBlZD5GYWxzZTwvcGRmOlRyYXBwZWQ+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgo8P3hwYWNrZXQgZW5kPSJyIj8+DWVuZHN0cmVhbQ1lbmRvYmoNMjYgMCBvYmoNPDwvQ3JlYXRpb25EYXRlKEQ6MjAxOTExMTQwOTQ3MTAtMDYnMDAnKS9DcmVhdG9yKEFkb2JlIEluRGVzaWduIENDIDIwMTcgXChNYWNpbnRvc2hcKSkvTW9kRGF0ZShEOjIwMTkxMTE0MDk0NzEwLTA2JzAwJykvUHJvZHVjZXIoQWRvYmUgUERGIExpYnJhcnkgMTUuMCkvVHJhcHBlZC9GYWxzZT4+DWVuZG9iag14cmVmDTAgMTE0OA0wMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAxNTM3MzMgMDAwMDAgbg0KMDAwMDE1NDI2MyAwMDAwMCBuDQowMDAwMTc3MTkyIDAwMDAwIG4NCjAwMDAxNzc0NDUgMDAwMDAgbg0KMDAwMDE3NzQ5MyAwMDAwMCBuDQowMDAwMTc3NTQ2IDAwMDAwIG4NCjAwMDAxODA3ODcgMDAwMDAgbg0KMDAwMDE4NDAyOCAwMDAwMCBuDQowMDAwMTg4Njc0IDAwMDAwIG4NCjAwMDAxOTI4OTAgMDAwMDAgbg0KMDAwMDE5Mjk1MSAwMDAwMCBuDQowMDAwMTkzMDE5IDAwMDAwIG4NCjAwMDAxOTU1OTYgMDAwMDAgbg0KMDAwMDE5NjY4NiAwMDAwMCBuDQowMDAwMTk4MDczIDAwMDAwIG4NCjAwMDAxOTk2OTkgMDAwMDAgbg0KMDAwMDIwMDk4NCAwMDAwMCBuDQowMDAwMjAyMTg3IDAwMDAwIG4NCjAwMDAyMDM3NjcgMDAwMDAgbg0KMDAwMDIwNTA4NCAwMDAwMCBuDQowMDAwMjA2Mzg3IDAwMDAwIG4NCjAwMDAyMDc2MzkgMDAwMDAgbg0KMDAwMDIwODk3NiAwMDAwMCBuDQowMDAwMjA5NDE2IDAwMDAwIG4NCjAwMDAyMDk0NzcgMDAwMDAgbg0KMDAwMDIxMjAzNCAwMDAwMCBuDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KMDAwMDAwMDAwMCA2NTUzNSBmDQowMDAwMDAwMDAwIDY1NTM1IGYNCjAwMDAwMDAwMDAgNjU1MzUgZg0KdHJhaWxlcg08PC9TaXplIDExNDgvSURbPEZFMzgyRjBCREQ2OTQ5RUI4QUE1NzFCMDcwMzI1QzNGPjxCQkMxODEzNjI5OEI0OEMyQjFBNzY3QTIzOEMxOEVBOT5dPj4Nc3RhcnR4cmVmDTExNg0lJUVPRg0='),(9,'AS001',5,'Maestría en Arte',NULL,'2020-06-08','A','M',NULL,NULL,NULL),(10,'AS001',5,'Maestría en Arte',NULL,'2020-06-09','A','M',NULL,NULL,NULL),(11,'AS001',5,'Maestría en Arte',NULL,'2020-06-09','A','M','pdf','convocatoria_2020-06-09 23:45:08',NULL),(12,'AS001',6,'Maestría en Quimica',NULL,'2020-06-11','A','M','pdf','convocatoria_2020-06-11 11:20:29',NULL),(13,'AS002',6,'Maestría en Quimica',NULL,'2020-06-13','A','M','pdf','convocatoria_2020-06-13 01:51:54',NULL),(14,'AS002',6,'Maestría en Quimica',NULL,'2020-06-13','A','M','pdf','convocatoria_2020-06-13 02:22:11',NULL);
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
INSERT INTO `posgrado_alumno` VALUES (3,'AS001',11,'AS001',3,2,'A','2020-02-15','2020-06-15'),(4,'AS001',11,'AS001',3,2,'A','2020-08-15','2022-12-15'),(10,'AS002',6,'AS001',4,2,'A','2020-02-15','2020-06-15');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (1,'AS001',4,1,3,'Emmanuel','Sanchez','1997-12-01','H','Av. Universidad # 940, Ciudad Universitaria, C. P. 20131, Aguascalientes, Ags. MÉXICO.','AS','Aguascalientes','4491110000',1,'emmanuel@correo.uaa.mx','hola1234',1,'2020-06-07','A',0,NULL,NULL,NULL),(2,'AS001',3,1,6,'Pedro','Perez','1977-02-28','H','Av. Universidad # 940, Ciudad Universitaria, C. P. 20131, Aguascalientes, Ags. MÉXICO.','AS','Aguascalientes','444444455',2,'pedro@correo.uaa.mx','hola1234',1,'2020-06-08','A',0,NULL,NULL,NULL),(3,'AS001',3,3,6,'Yair','Maldonado','1987-12-25','H','Aguascalientes, Ags.','AS','Aguascalientes','4490001111',12345678,'yairm@correo.uaa.mx','hola1234',0,'2020-06-15','A',0,NULL,NULL,NULL),(4,'AS001',3,1,2,'Esli','Ramirez','1987-12-25','H','Aguascalientes, Ags.','AS','Aguascalientes','4490001111',87654321,'esliram@correo.uaa.mx','hola4321',0,'2020-06-15','A',0,NULL,NULL,NULL),(5,'AS001',4,1,2,'Esli','Ramirezxd','1987-12-25','H','Aguascalientes, Ags.','AS','Aguascalientes','4490001111',87654321,'esliramxd@correo.uaa.mx','hola4321',0,'2020-06-15','A',0,NULL,NULL,_binary '?'),(6,'AS001',1,1,2,'thmghjm','ghmghm','2020-06-24','M','efdger','AS','rtyghjndh','6666666',666666,'fghm@fwf','cghjmfghjm',0,'2020-06-26','A',0,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacion_foro`
--

LOCK TABLES `publicacion_foro` WRITE;
/*!40000 ALTER TABLE `publicacion_foro` DISABLE KEYS */;
INSERT INTO `publicacion_foro` VALUES (1,32,1,4,'AS001','Hola, alguien sabe como instalar office :v?','2020-06-17 00:00:00',1),(2,32,1,1,'AS001','Hey!, como están todos?','2020-06-17 00:00:00',1),(3,32,1,3,'AS001','Hola, inicio hilo de discusion','2020-06-17 16:39:41',1),(4,32,1,2,'AS001','Hola, inicio hilo de discusion 2','2020-06-18 23:23:49',1),(5,32,0,2,'AS001','Hey!, como están todos? Saludos. atte el profe','2020-06-18 23:41:37',1),(6,32,1,2,'AS001','Hola, inicio hilo de discusion 2','2020-06-20 00:12:59',1),(7,32,1,3,'AS001','Esto es una prueba del foro','2020-06-25 00:00:00',1),(8,32,1,3,'AS001','Saludos GG','2020-06-25 00:00:00',1),(9,32,1,3,'AS001','Que ya se acabe el semestre','2020-06-25 00:00:00',1),(10,32,0,2,'AS001','Saludos de Peter Parker','2020-06-25 00:00:00',1),(11,32,0,2,'AS001','Saludos ya mero se acaba el semestre','2020-06-25 00:00:00',1),(12,32,0,2,'AS001','Dudas por Teams','2020-06-25 00:00:00',1);
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
  `nombre_archivo` varchar(35) NOT NULL,
  `contenido` longblob,
  PRIMARY KEY (`id_recurso`),
  KEY `id_tema_impartido_fk_re_idx` (`id_tema_impartido`),
  CONSTRAINT `id_tema_impartido_fk_re` FOREIGN KEY (`id_tema_impartido`) REFERENCES `tema_impartido` (`id_tema_impartido`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso`
--

LOCK TABLES `recurso` WRITE;
/*!40000 ALTER TABLE `recurso` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrador`
--

LOCK TABLES `registrador` WRITE;
/*!40000 ALTER TABLE `registrador` DISABLE KEYS */;
INSERT INTO `registrador` VALUES (1,'AS001','Gustavo','Mendez','','gusitavo@correo.mx','hola1234','I'),(2,'AS001','Miriam','Perez','4490001111','miriamperez@correo.mx','hola1234','A'),(3,'AS002','Speedy','Gonzales','4491110000','speedygonzalez@correo.mx','hola1234','A'),(8,'AS001','Bugs','Bunny','4490001111','bugsbunny@correo.mx','hola1234','A'),(9,'AS002','Pedro','Picapiedra','4490001111','pedropicapiedra@correo.mx','hola1234','A'),(10,'AS002','Pedro','Picapiedra','4490001111','pedropicapiedra2@correo.mx','hola1234','A'),(11,'AS002','Pedro','Picapiedra','4490001111','pedropicapiedra3@correo.mx','hola1234','A'),(12,'AS002','Pedro','Picapiedra','4490001111','pedropicapiedra4@correo.mx','hola1234','A'),(13,'AS002','Speedy','Gonzales','4491110000','pedropicapiedra5@correo.mx','hola1234','I');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta_foro`
--

LOCK TABLES `respuesta_foro` WRITE;
/*!40000 ALTER TABLE `respuesta_foro` DISABLE KEYS */;
INSERT INTO `respuesta_foro` VALUES (1,1,1,2,'AS001','De la pagina oficial, necesitas cuenta 365','2020-06-17 17:10:08',1),(2,1,1,3,'AS001','Puedes usar la cuenta institucional','2020-06-17 17:10:14',1),(3,1,1,4,'AS001','Gracias','2020-06-17 17:10:14',1),(4,5,0,3,'AS001','Pues ni pp','2020-06-19 02:19:16',1),(5,5,0,1,'AS001','Pues ni pp x2','2020-06-19 02:24:06',1),(6,5,0,2,'AS001','Pues ni pp x3','2020-06-24 20:00:03',1),(7,5,0,4,'AS001','Pues ni pp x4','2020-06-24 20:00:03',1),(8,1,1,3,'AS001','No se puede jajaja','2020-06-25 16:37:57',1),(9,1,1,3,'AS001','Compralo','2020-06-25 16:39:04',1),(10,1,1,3,'AS001','Usa otro','2020-06-25 16:39:50',1),(11,1,1,3,'AS001','nel','2020-06-25 16:40:07',1),(12,1,1,3,'AS001','gfrty','2020-06-25 16:40:34',1),(13,1,1,3,'AS001','nel pastel','2020-06-25 16:43:10',1),(14,1,1,3,'AS001','Achis','2020-06-25 16:43:36',1),(15,2,1,3,'AS001','Bien gracias','2020-06-25 16:43:57',1),(16,2,1,3,'AS001','SUper mal','2020-06-25 16:44:08',1),(17,1,0,2,'AS001','Yo tengo el crack','2020-06-26 00:00:00',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
INSERT INTO `solicitud` VALUES (1,4,'AS001',11,'2020-06-14','A','A',0,NULL,NULL),(4,3,'AS001',11,'2020-06-18','A','P',0,'ajfdbsdkjfbsadfbsdfjajlsbnljkasldkjasjk55jkk5j555jj55',1),(5,3,'AS002',11,'2020-06-18','R','A',0,'sslrkgwe44556456745tgt56544554ggegrg554wer34efdd',0),(6,3,'AS002',6,'2020-06-18','R','P',0,'sslrkgwe44556456745tgt56544554ggegrg554wer34efdd',0),(7,10,'AS002',6,'2020-06-18','P','P',0,'sslrkgwe44556456745tgt56544554ggegrg554wer34efdd',0),(8,3,'AS002',6,'2020-06-18','P','P',0,'sslrkgwe44556456745tgt56544554ggegrg554wer34efdd',0),(9,3,'AS001',11,'2020-06-25','P','P',0,'16e099a0835bff71ce44f71994dde00181278bd06191833729ef00996260fe29e6fcd068dd667782a562be482af77cd641912ec3fb7db6f86844ef1a301da185b688461118aedf17f1e8f499d07e2a075793cd21c98b7864696cebdff239036f54de0489',1),(10,3,'AS001',11,'2020-06-25','P','P',0,'16e099a0835bff71ce44f71994dde00181278bd06191833729ef00996260fe29e6fcd068dd667782a562be482af77cd641912ec3fb7db6f86844ef1a301da185b688461118aedf17f1e8f499d07e2a075793cd21c98b7864696cebdff239036f54de0489',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
INSERT INTO `tema` VALUES (1,1,'RESEARCH IN COMPUTING SCIENCE 1',NULL,'A'),(2,1,'RESEARCH IN COMPUTING SCIENCE 2',NULL,'A'),(3,3,'Tecnologias Emergentes','654321','A'),(4,3,'Tecnologias Emergentes 1','123456','I'),(5,3,'Tecnologias Emergentes 2','111111','A'),(6,3,'Tecnologias Emergentes 3','111112','A'),(7,3,'Tecnologias Emergentes 4','111113','A'),(10,3,'Tecnologias Emergentes','654321','A'),(11,6,'Neurobiología del sistema nervioso entérico','000123','A');
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema_impartido`
--

LOCK TABLES `tema_impartido` WRITE;
/*!40000 ALTER TABLE `tema_impartido` DISABLE KEYS */;
INSERT INTO `tema_impartido` VALUES (1,3,1,'AS001','A','2020-08-15','2020-12-15',100,'A'),(2,3,1,'AS001','B','2020-08-15','2020-12-15',100,'A'),(3,3,1,'AS001','C','2020-08-15','2020-12-15',100,'A'),(4,3,1,'AS001','D','2020-08-15','2020-12-15',100,'A'),(5,3,1,'AS001','E','2020-08-15','2020-12-15',100,'A'),(6,3,1,'AS001','F','2020-08-15','2020-12-15',100,'A'),(7,3,1,'AS001','G','2020-08-15','2020-12-15',100,'A'),(8,3,1,'AS001','H','2020-08-15','2020-12-15',100,'A'),(9,3,1,'AS001','I','2020-08-15','2020-12-15',100,'A'),(10,3,1,'AS001','J','2020-08-15','2020-12-15',100,'A'),(11,3,1,'AS001','K','2020-08-15','2020-12-15',100,'A'),(12,3,1,'AS001','L','2020-08-15','2020-12-15',100,'A'),(13,3,1,'AS001','M','2020-08-15','2020-12-15',100,'A'),(14,3,1,'AS001','N','2020-08-15','2020-12-15',100,'A'),(15,3,1,'AS001','O','2020-08-15','2020-12-15',100,'A'),(16,3,1,'AS001','P','2020-08-15','2020-12-15',100,'A'),(17,3,1,'AS001','Q','2020-08-15','2020-12-15',100,'A'),(18,3,1,'AS001','R','2020-08-15','2020-12-15',100,'A'),(19,3,1,'AS001','S','2020-08-15','2020-12-15',100,'A'),(20,3,1,'AS001','T','2020-08-15','2020-12-15',100,'A'),(21,3,1,'AS001','U','2020-08-15','2020-12-15',100,'A'),(22,3,1,'AS001','V','2020-08-15','2020-12-15',100,'A'),(23,3,1,'AS001','W','2020-08-15','2020-12-15',100,'A'),(25,3,1,'AS001','Y','2020-08-15','2020-12-15',100,'A'),(26,3,1,'AS001','Z','2020-08-15','2020-12-15',100,'A'),(27,1,2,'AS001','A','2020-08-15','2020-12-15',100,'A'),(28,1,2,'AS001','B','2020-08-15','2020-12-15',100,'A'),(29,7,2,'AS001','A','2020-08-15','2020-12-15',100,'A'),(30,7,1,'AS001','B','2020-02-15','2020-06-15',200,'A'),(31,11,1,'AS001','B','2020-02-15','2020-06-15',200,'A'),(32,11,2,'AS001','A','2021-02-15','2021-06-15',6,'A'),(33,11,1,'AS001','C','2020-02-15','2020-06-15',200,'I');
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
INSERT INTO `universidad` VALUES ('AS001','Universidad Autonoma de Aguascalientes','Avenida Universidad 940, C.U., 20130 Aguascalientes, Ags.','4499107400','cvargas@correo.uaa.mx','https://www.uaa.mx/portal/'),('AS002','Universidad Tecnologica de Aguascalientes','Aguascalientes MX, Blvrd Juan Pablo II, La Cantera, 20200 Exhacienda','4499105000','soporte@correo.utags.edu.mx','http://www.utags.edu.mx/');
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
if exists(select id_administrador from administrador where _idAdministrador=concat(id_administrador,id_universidad)) then
	update area_conocimiento set nombre = _nombre where _idAreaConocimiento = id_area_conocimiento;
    
	select nombre IdentificadorSitio, id_universidad IdUniversidadSitio, true as Confirmacion
	from identificador_sitio;
end if;
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

insert into publicacion_foro 
values(null,_idTemaImpartido,true,v_idAlumno,v_idUniversidad,_publicacion,_fecha,true);

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

insert into respuesta_foro 
values(null,_idPublicacion,true,v_idAlumno,v_idUniversidad,_respuesta,_fecha,true);

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
re.id_recurso as IdRecurso, re.nombre_archivo as Nombre, DATE_FORMAT(re.fecha, '%Y-%m-%d') as Fecha
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
declare v_fechaAsigacion date;
declare v_fechaInicio date;
declare v_fechaFin date;

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
_nombreArchivo varchar(35),
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
inner join alumno al on concat(pf.id_objetivo,pf.id_universidad) = concat(al.id_alumno,al.id_universidad)
inner join profesor pr on concat(pf.id_objetivo,pf.id_universidad) = concat(pr.id_profesor,pr.id_universidad)
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
_tipoArchivo varchar(5),
_nombreArchivo varchar(35),
_contenido longblob
)
BEGIN
insert into recurso values(null,_idTemaImpartido,_fecha,_descripcion,_tipoArchivo,
_nombreArchivo,_contenido);

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
inner join alumno al on concat(pf.id_objetivo,pf.id_universidad) = concat(al.id_alumno,al.id_universidad)
inner join profesor pr on concat(pf.id_objetivo,pf.id_universidad) = concat(pr.id_profesor,pr.id_universidad)
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

insert into publicacion_foro 
values(null,_idTemaImpartido,false,v_idProfesor,v_idUniversidad,_publicacion,_fecha,true);

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

insert into respuesta_foro 
values(null,_idPublicacion,false,v_idProfesor,v_idUniversidad,_respuesta,_fecha,true);

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
re.id_recurso as IdRecurso, re.nombre_archivo as Recurso, DATE_FORMAT(re.fecha, '%Y-%m-%d') as FechaRecurso
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
where v_idUniversidad = pg.id_universidad;
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
inner join linea_investigacion li on pr.id_linea_investigacion = li.id_linea_investigacion
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
al.correo as Correo,  al.contrasena as Contrasena, DATE_FORMAT(al.fecha_registro, '%Y-%m-%d') as FechaRegistro, al.estado as Estado,
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

-- Dump completed on 2020-06-26 10:41:43