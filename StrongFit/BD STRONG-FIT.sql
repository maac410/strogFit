/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.32-MariaDB : Database - strong-fitness
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`strong-fitness` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `strong-fitness`;

/*Table structure for table `alimentos` */

DROP TABLE IF EXISTS `alimentos`;

CREATE TABLE `alimentos` (
  `idAlimentos` int(11) NOT NULL AUTO_INCREMENT,
  `Alimento` varchar(50) NOT NULL,
  `Calorias` varchar(40) NOT NULL,
  `Proteinas` varchar(10) NOT NULL,
  `Carbohidratos` varchar(10) NOT NULL,
  `Grasas` varchar(10) NOT NULL,
  PRIMARY KEY (`idAlimentos`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `alimentos` */

LOCK TABLES `alimentos` WRITE;

insert  into `alimentos`(`idAlimentos`,`Alimento`,`Calorias`,`Proteinas`,`Carbohidratos`,`Grasas`) values (1,'Harina de Maíz amarillo precocida enriquecida ','355','7,2','','1,2'),(2,'Hojuelas de Maíz amarillo azucaradas enriquecidas','363','3,7','','0,1'),(3,'Hojuelas de Maíz amarillo enriquecidas','350','6,7','','0,4'),(4,'Maíz amarillo inflado azucarado enriquecido','369','5,5','','0'),(5,'Maíz amarillo tierno enlatado. estilo crema','77','1,5','','0,2'),(6,'Maíz amarillo tierno enlatado. grano entero','85','2,5','','0,3'),(7,'Arepa de Maíz blanco enriquecida','168','3,8','','0,6'),(8,'Arepa de Maíz blanco grano pelado con cal','196','5,7','','2,5'),(9,'Maíz blanco grano entero','286','9','','4,3'),(10,'Harina de Maíz blanco integral precocida ','354','7,1','','3,8'),(11,'Harina  de Maíz blanco precocida ','354','7,2','','1,1');

UNLOCK TABLES;

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `idClientes` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `Contraseña` varchar(45) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Peso` float NOT NULL,
  `Altura` float NOT NULL,
  `Calorias_Diarias` int(11) NOT NULL,
  PRIMARY KEY (`idClientes`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `clientes` */

LOCK TABLES `clientes` WRITE;

insert  into `clientes`(`idClientes`,`Nombre`,`Correo`,`Contraseña`,`Edad`,`Peso`,`Altura`,`Calorias_Diarias`) values (1,'Roberto Cardenas','Rberto@gmail.com','hola123',57,45,1.66,3580),(2,'Lina Valentina','Lina.ciencia@gmail.com','Lina:3',22,68,1.59,2453),(3,'Emilio Peralta','peral232@gmail.com','3m1110',48,90,1.7,2100),(4,'Miguel Rincón','rinrincon527@gmail.com','FitRevolutión527',21,73,1.72,3558),(5,'Rosa Mendez','helena5590@gmail.com','CondorBuenosaires',60,64,1.58,2300),(6,'Sofia Blanco','amber@gmail.com','xzibit',19,54,1.55,2500),(7,'Phil Caseddy','Vcsstories@gmail.com','VCSCJ15',40,73,1.75,3000),(8,'Ruben Agilar','senacentro@gmail.com','Diseñoweb2',27,65,1.62,2415),(9,'Daniel Tovar','Tovar.web@gmail.com','Tecnisis547',23,80,1.6,1994),(10,'Mario Rincón','Alejoweb@gmail.com','Tecnisis548',42,67,1.64,2657),(11,'Sandra Rincón','patoweb@hotmail.com.com','Tecnisis547',42,67,1.64,2657);

UNLOCK TABLES;

/*Table structure for table `ejercicio` */

DROP TABLE IF EXISTS `ejercicio`;

CREATE TABLE `ejercicio` (
  `idEjercicio` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_ejercicio` varchar(60) NOT NULL,
  PRIMARY KEY (`idEjercicio`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `ejercicio` */

LOCK TABLES `ejercicio` WRITE;

insert  into `ejercicio`(`idEjercicio`,`Nombre_ejercicio`) values (1,'press banca'),(2,'Sentadilla'),(3,'Extension de cudriceps'),(4,'pull over'),(5,'extension triceps'),(6,'Remo con Barra'),(7,'prensa'),(8,'pendular'),(9,'deadlift'),(10,'press militar'),(11,'rack pull');

UNLOCK TABLES;

/*Table structure for table `registro_de_comidas` */

DROP TABLE IF EXISTS `registro_de_comidas`;

CREATE TABLE `registro_de_comidas` (
  `idRegistro_de_comidas` int(11) NOT NULL AUTO_INCREMENT,
  `Cantidad` float NOT NULL,
  `Tamaño_ración` enum('1.0 kg','100 gr','1.0 gr','1.0 lts','1.0 ml','1.0 oz') NOT NULL,
  `Fecha` date NOT NULL,
  `Clientes_idClientes` int(11) NOT NULL,
  `Alimentos_idAlimentos` int(11) NOT NULL,
  PRIMARY KEY (`idRegistro_de_comidas`,`Clientes_idClientes`,`Alimentos_idAlimentos`),
  KEY `Clientes_idClientes` (`Clientes_idClientes`),
  KEY `Alimentos_idAlimentos` (`Alimentos_idAlimentos`),
  CONSTRAINT `registro_de_comidas_ibfk_1` FOREIGN KEY (`Clientes_idClientes`) REFERENCES `clientes` (`idClientes`),
  CONSTRAINT `registro_de_comidas_ibfk_2` FOREIGN KEY (`Alimentos_idAlimentos`) REFERENCES `alimentos` (`idAlimentos`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `registro_de_comidas` */

LOCK TABLES `registro_de_comidas` WRITE;

insert  into `registro_de_comidas`(`idRegistro_de_comidas`,`Cantidad`,`Tamaño_ración`,`Fecha`,`Clientes_idClientes`,`Alimentos_idAlimentos`) values (1,30,'1.0 kg','0000-00-00',2,3),(2,400,'1.0 kg','0000-00-00',2,4),(3,100,'1.0 kg','0000-00-00',5,1),(4,15,'1.0 kg','0000-00-00',8,6),(5,10,'1.0 kg','0000-00-00',7,1),(6,40,'1.0 kg','0000-00-00',9,9),(7,100,'1.0 kg','0000-00-00',1,3),(8,60,'1.0 kg','0000-00-00',6,8),(9,200,'1.0 kg','0000-00-00',4,8),(10,120,'1.0 kg','0000-00-00',5,8);

UNLOCK TABLES;

/*Table structure for table `registro_de_ejercico` */

DROP TABLE IF EXISTS `registro_de_ejercico`;

CREATE TABLE `registro_de_ejercico` (
  `idRegistro de ejercico` int(11) NOT NULL AUTO_INCREMENT,
  `Series` varchar(10) NOT NULL,
  `Repeticiones` varchar(10) NOT NULL,
  `Duracion` enum('Hora','Minutos') NOT NULL,
  `Fecha` date NOT NULL,
  `Clientes_idClientes` int(11) NOT NULL,
  `Ejercicio_idEjercicio` int(11) NOT NULL,
  PRIMARY KEY (`idRegistro de ejercico`,`Clientes_idClientes`,`Ejercicio_idEjercicio`),
  KEY `Clientes_idClientes` (`Clientes_idClientes`),
  KEY `Ejercicio_idEjercicio` (`Ejercicio_idEjercicio`),
  CONSTRAINT `registro_de_ejercico_ibfk_1` FOREIGN KEY (`Clientes_idClientes`) REFERENCES `clientes` (`idClientes`),
  CONSTRAINT `registro_de_ejercico_ibfk_2` FOREIGN KEY (`Ejercicio_idEjercicio`) REFERENCES `ejercicio` (`idEjercicio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `registro_de_ejercico` */

LOCK TABLES `registro_de_ejercico` WRITE;

insert  into `registro_de_ejercico`(`idRegistro de ejercico`,`Series`,`Repeticiones`,`Duracion`,`Fecha`,`Clientes_idClientes`,`Ejercicio_idEjercicio`) values (1,'5','10','Minutos','2024-11-06',4,5);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
