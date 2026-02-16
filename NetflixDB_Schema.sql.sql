-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: netflixdb.cntwm90ghtqa.us-east-1.rds.amazonaws.com    Database: NetflixDB
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `ACTOR`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTOR` (
  `idACTOR` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `nacionalidad` varchar(45) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  PRIMARY KEY (`idACTOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ACTOR_INTERPRETA`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTOR_INTERPRETA` (
  `ACTOR_idACTOR` int NOT NULL,
  `PUBLICACION_titulo` varchar(45) NOT NULL,
  PRIMARY KEY (`ACTOR_idACTOR`,`PUBLICACION_titulo`),
  KEY `fk_ACTOR_has_PUBLICACION_PUBLICACION1_idx` (`PUBLICACION_titulo`),
  KEY `fk_ACTOR_has_PUBLICACION_ACTOR1_idx` (`ACTOR_idACTOR`),
  CONSTRAINT `fk_ACTOR_has_PUBLICACION_ACTOR1` FOREIGN KEY (`ACTOR_idACTOR`) REFERENCES `ACTOR` (`idACTOR`),
  CONSTRAINT `fk_ACTOR_has_PUBLICACION_PUBLICACION1` FOREIGN KEY (`PUBLICACION_titulo`) REFERENCES `PUBLICACION` (`titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EPISODIOS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EPISODIOS` (
  `tituloEpisodios` varchar(45) DEFAULT NULL,
  `duracion` varchar(45) DEFAULT NULL,
  `fechaEmision` varchar(45) DEFAULT NULL,
  `Temporada` int NOT NULL,
  `Titulo` varchar(45) NOT NULL,
  `OrdenNumeroEpisodios` varchar(45) NOT NULL,
  PRIMARY KEY (`Temporada`,`Titulo`,`OrdenNumeroEpisodios`),
  CONSTRAINT `fk_EPISIODIOS_TEMPORADA1` FOREIGN KEY (`Temporada`, `Titulo`) REFERENCES `TEMPORADA` (`NTemporada`, `Titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PUBLICACION`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PUBLICACION` (
  `titulo` varchar(45) NOT NULL,
  `clasificacionEdad` int DEFAULT NULL,
  `tipo` enum('SERIE','PELICULA') NOT NULL DEFAULT 'SERIE',
  `fechaPublicacion` int DEFAULT NULL,
  `fechaFin` enum('2019','2020','2021','2022','2023','2024','2025','2026','ACTUALIDAD') NOT NULL,
  `Duracion` int DEFAULT NULL,
  PRIMARY KEY (`titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TAGS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TAGS` (
  `idTAGS` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descrpcion` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTAGS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TAG_PUBLICACION`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TAG_PUBLICACION` (
  `NombreTag` int NOT NULL,
  `TituloPublicacion` varchar(45) NOT NULL,
  PRIMARY KEY (`NombreTag`,`TituloPublicacion`),
  KEY `fk_TAGS_has_PUBLICACION_PUBLICACION1_idx` (`TituloPublicacion`),
  KEY `fk_TAGS_has_PUBLICACION_TAGS1_idx` (`NombreTag`),
  CONSTRAINT `fk_TAGS_has_PUBLICACION_PUBLICACION1` FOREIGN KEY (`TituloPublicacion`) REFERENCES `PUBLICACION` (`titulo`),
  CONSTRAINT `fk_TAGS_has_PUBLICACION_TAGS1` FOREIGN KEY (`NombreTag`) REFERENCES `TAGS` (`idTAGS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TEMPORADA`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEMPORADA` (
  `numeroTemporada` varchar(45) DEFAULT NULL,
  `NTemporada` int NOT NULL,
  `Titulo` varchar(45) NOT NULL,
  PRIMARY KEY (`NTemporada`,`Titulo`),
  KEY `fk_TEMPORADA_PUBLICACION1_idx` (`Titulo`),
  CONSTRAINT `fk_TEMPORADA_PUBLICACION1` FOREIGN KEY (`Titulo`) REFERENCES `PUBLICACION` (`titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `v_publicacion_resumen`
--

SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_publicacion_resumen` AS SELECT 
 1 AS `titulo`,
 1 AS `tipo`,
 1 AS `num_tags`,
 1 AS `num_actores`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_series_temporadas`
--

SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_series_temporadas` AS SELECT 
 1 AS `serie`,
 1 AS `temporadas`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'NetflixDB'
--

--
-- Final view structure for view `v_publicacion_resumen`
--

/*!50001 DROP VIEW IF EXISTS `v_publicacion_resumen`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_publicacion_resumen` AS select `p`.`titulo` AS `titulo`,`p`.`tipo` AS `tipo`,count(distinct `tp`.`NombreTag`) AS `num_tags`,count(distinct `ai`.`ACTOR_idACTOR`) AS `num_actores` from ((`PUBLICACION` `p` left join `TAG_PUBLICACION` `tp` on((`tp`.`TituloPublicacion` = `p`.`titulo`))) left join `ACTOR_INTERPRETA` `ai` on((`ai`.`PUBLICACION_titulo` = `p`.`titulo`))) group by `p`.`titulo`,`p`.`tipo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_series_temporadas`
--

/*!50001 DROP VIEW IF EXISTS `v_series_temporadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_series_temporadas` AS select `p`.`titulo` AS `serie`,count(0) AS `temporadas` from (`PUBLICACION` `p` join `TEMPORADA` `t` on((`t`.`Titulo` = `p`.`titulo`))) where (`p`.`tipo` = 'SERIE') group by `p`.`titulo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-16  8:34:05
