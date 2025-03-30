/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.32-MariaDB : Database - strongfit
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`strongfit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `strongfit`;

/*Table structure for table `dieta` */

DROP TABLE IF EXISTS `dieta`;

CREATE TABLE `dieta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objetivo` enum('subir de peso','mantener peso','bajar de peso') NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `calorias` int(11) NOT NULL,
  `proteinas` varchar(50) NOT NULL,
  `carbohidratos` varchar(50) NOT NULL,
  `grasas` varchar(50) NOT NULL,
  `fibra` varchar(50) NOT NULL,
  `ingredientes` text NOT NULL,
  `descripcion` text NOT NULL,
  `guia` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dieta` */

LOCK TABLES `dieta` WRITE;

insert  into `dieta`(`id`,`objetivo`,`nombre`,`calorias`,`proteinas`,`carbohidratos`,`grasas`,`fibra`,`ingredientes`,`descripcion`,`guia`) values (1,'subir de peso','Batido Hipercalórico de Avena y Plátano',650,'30g','85g','22g','8g','2 platanos maduros, 1 taza de avena, 2 cucharadas de mantequilla de mani, 1 scoop de protea­na whey, 2 tazas de leche entera, 1 cucharada de miel, 1 cucharada de semillas de chia','Batido denso en calorías y nutrientes para ganar masa muscular y peso','Añadir todos los ingredientes en una licuadora. Batir hasta conseguir una mezcla homogénea. Consumir inmediatamente después del entrenamiento o como merienda entre comidas.'),(2,'subir de peso','Pasta con Pollo y Salsa Cremosa',720,'45g','70g','28g','5g','200g de pasta integral, 200g de pechuga de pollo, 100ml de crema de leche, 50g de queso parmesano rallado, 2 dientes de ajo, 1 cebolla, 2 cucharadas de aceite de oliva, albahaca fresca, sal y pimienta','Plato completo rico en carbohidratos complejos y proteínas para aumentar masa','Cocer la pasta según instrucciones. Saltear el pollo cortado en cubos con ajo y cebolla. Añadir la crema y el queso, cocinar a fuego lento 3 minutos. Mezclar con la pasta escurrida y servir con queso adicional.'),(3,'subir de peso','Bowl de Arroz, Salmón y Aguacate',680,'35g','65g','30g','7g','1.5 tazas de arroz integral cocido, 150g de salmon, 1 aguacate entero, 2 cucharadas de semillas mixtas (girasol, calabaza), 2 cucharadas de aceite de oliva, salsa de soja, jengibre rallado, 1 huevo frito (opcional)','Bowl nutritivo con grasas saludables y omega-3 para ganar peso de forma equilibrada','Cocer el arroz. Cocinar el salmón a la plancha 4 minutos por lado. Montar el bowl con el arroz como base, salmón y aguacate en rodajas. Añadir semillas y aliñar con aceite y salsa de soja. Coronar con huevo frito si se desea.'),(4,'subir de peso','Wrap de Pollo con Hummus y Queso',590,'40g','45g','28g','6g','1 tortilla integral grande, 150g de pollo cocido desmenuzado, 3 cucharadas de hummus, 30g de queso cheddar rallado, 1/2 aguacate, hojas de espinaca, 1 cucharada de aceite de oliva, especias al gusto','Wrap completo y portátil ideal para aumentar la ingesta calórica entre comidas','Calentar ligeramente la tortilla. Extender el hummus sobre ella. Añadir capas de pollo, queso, aguacate y espinacas. Enrollar firmemente y cortar por la mitad. Ideal para llevar como almuerzo o merienda.'),(5,'subir de peso','Granola Casera con Yogur y Frutas',620,'22g','80g','25g','12g','1 taza de granola casera (avena, miel, frutos secos), 1 taza de yogur griego entero, 1 platano, 1/2 taza de fresas, 2 cucharadas de mantequilla de almendras, 2 cucharadas de semillas de chía, 1 cucharada de miel','Desayuno o merienda energética rica en calorías de calidad y proteínas','Preparar la granola mezclando avena, miel y frutos secos, horneando por 20 minutos a 160°C. En un bowl, disponer el yogur, añadir la granola y las frutas cortadas. Incorporar la mantequilla de almendras y espolvorear con semillas de chía.'),(6,'mantener peso','Pollo al Horno con Batata y Brócoli',420,'35g','40g','12g','8g','150g de pechuga de pollo, 1 batata mediana, 1 taza de brocoli, 1 cucharada de aceite de oliva, 1 diente de ajo, romero y tomillo, sal marina y pimienta','Comida balanceada con proteínas magras y carbohidratos complejos','Precalentar el horno a 200°C. Cortar la batata en cubos y el brócoli en floretes. Disponer en una bandeja junto con el pollo. Mezclar el aceite con ajo y hierbas y rociar sobre los ingredientes. Hornear por 25 minutos.'),(7,'mantener peso','Ensalada de Quinoa con Garbanzos',380,'15g','50g','14g','12g','1 taza de quinoa cocida, 1/2 taza de garbanzos cocidos, 1/4 de pimiento rojo, 1/4 de pimiento amarillo, 1/2 pepino, 10 aceitunas, 2 cucharadas de aceite de oliva, jugo de medio limón, perejil fresco picado','Ensalada completa con proteínas vegetales y fibra para mantener la saciedad','Mezclar la quinoa cocida con los garbanzos. Añadir los pimientos y el pepino cortados en dados pequeños. Incorporar las aceitunas cortadas. Aliñar con aceite, limón, sal y pimienta. Decorar con perejil picado.'),(8,'mantener peso','Salmón con Espárragos y Arroz Integral',450,'30g','40g','20g','6g','120g de filete de salmón, 100g de esparragos, 1/2 taza de arroz integral cocido, 1 cucharada de aceite de oliva, 1 limón, eneldo fresco, sal y pimienta','Plato equilibrado con grasas saludables','Precalentar el horno a 180°C. Colocar el salmón en papel de aluminio con rodajas de limón y eneldo. Hornear por 15 minutos. Cocinar los espárragos al vapor 5 minutos. Servir con el arroz integral cocido.'),(9,'mantener peso','Burrito Bowl de Fajitas de Pollo',430,'32g','45g','15g','9g','120g de pechuga de pollo en tiras, 1/2 taza de arroz integral, 1/4 taza de frijoles negros, 1/2 pimiento, 1/2 cebolla, 1/4 aguacate, 2 cucharadas de salsa de tomate casera, 1 cucharadita de comino y paprika, cilantro fresco','Bowl mexicano equilibrado con proporción ideal de macronutrientes','Cocinar el arroz según instrucciones. Saltear el pollo con las especias. En otra sartén saltear pimiento y cebolla. Montar el bowl con arroz, frijoles, pollo, vegetales y aguacate. Decorar con salsa y cilantro.'),(10,'mantener peso','Tortilla de Vegetales con Tostada Integral',350,'18g','30g','18g','5g','2 huevos, 1/2 calabacin, 1/2 pimiento rojo, 1/4 cebolla, 30g de queso feta desmenuzado, 1 rebanada de pan integral, 1 cucharadita de aceite de oliva, hierbas frescas','Desayuno o cena ligera y nutritiva con buen aporte de proteínas','Saltear los vegetales picados. Batir los huevos e incorporar las verduras y el queso. Verter en una sartén caliente y cocinar a fuego medio-bajo. Tostar el pan y servir junto a la tortilla.');

UNLOCK TABLES;

/*Table structure for table `dieta_personalizados` */

DROP TABLE IF EXISTS `dieta_personalizados`;

CREATE TABLE `dieta_personalizados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dieta_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha_dieta` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `dieta_id` (`dieta_id`),
  CONSTRAINT `dieta_personalizados_ibfk_1` FOREIGN KEY (`dieta_id`) REFERENCES `dieta` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dieta_personalizados_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dieta_personalizados` */

LOCK TABLES `dieta_personalizados` WRITE;

UNLOCK TABLES;

/*Table structure for table `ent_personalizados` */

DROP TABLE IF EXISTS `ent_personalizados`;

CREATE TABLE `ent_personalizados` (
  `entrenamiento_id` int(11) NOT NULL AUTO_INCREMENT,
  `ejercicio_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha_entrenamiento` date NOT NULL,
  PRIMARY KEY (`entrenamiento_id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `ejercicio_id` (`ejercicio_id`),
  CONSTRAINT `ent_personalizados_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE,
  CONSTRAINT `ent_personalizados_ibfk_3` FOREIGN KEY (`ejercicio_id`) REFERENCES `entrenamientos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ent_personalizados` */

LOCK TABLES `ent_personalizados` WRITE;

insert  into `ent_personalizados`(`entrenamiento_id`,`ejercicio_id`,`usuario_id`,`fecha_entrenamiento`) values (53,8,17,'2025-03-31'),(54,8,17,'2025-03-31'),(55,8,17,'2025-03-31'),(56,15,17,'2025-03-26'),(57,8,17,'2025-03-29'),(58,8,17,'2025-03-29'),(59,8,17,'2025-03-28'),(60,9,17,'2025-03-27'),(61,15,17,'2025-03-14'),(62,8,17,'2025-03-30'),(63,8,17,'2025-03-27'),(64,8,17,'2025-03-28'),(65,8,17,'2025-03-28'),(66,8,17,'2025-03-21'),(67,8,17,'2025-03-21'),(68,24,20,'2025-03-28');

UNLOCK TABLES;

/*Table structure for table `entrenamientos` */

DROP TABLE IF EXISTS `entrenamientos`;

CREATE TABLE `entrenamientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_objetivo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `series` int(11) NOT NULL,
  `repeticiones` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `guia` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `entrenamientos` */

LOCK TABLES `entrenamientos` WRITE;

insert  into `entrenamientos`(`id`,`tipo_objetivo`,`nombre`,`series`,`repeticiones`,`descripcion`,`guia`) values (7,'Aumentar fuerza','Press de Banca',4,4,'Ejercicio para pecho donde te recuestas en un banco plano y presionas una barra hacia arriba','Acuéstate en un banco plano, agarra la barra con las manos separadas ligeramente más que el ancho de los hombros, baja la barra hasta el pecho y luego empuja hacia arriba'),(8,'Aumentar fuerza','Sentadilla',5,8,'Ejercicio compuesto que trabaja principalmente piernas y glúteos','Párate con los pies al ancho de hombros, baja flexionando rodillas manteniendo la espalda recta hasta que los muslos queden paralelos al suelo, luego regresa a la posición inicial'),(9,'Aumentar fuerza','Peso Muerto',4,6,'Ejercicio compuesto que trabaja espalda baja, glúteos y piernas','Con pies a la anchura de caderas, flexiona las rodillas ligeramente, inclina el torso hacia adelante manteniendo la espalda recta, agarra la barra y levántala extendiendo caderas y rodillas'),(10,'Aumentar resistencia','Curl de Bíceps',3,12,'Ejercicio de aislamiento para bíceps','De pie con mancuernas, brazos extendidos a los lados, flexiona los codos llevando las mancuernas hacia los hombros manteniendo los codos cerca del cuerpo'),(11,'Aumentar resistencia','Copa Tríceps',3,12,'Ejercicio de aislamiento para tríceps','Sostén una mancuerna con ambas manos sobre la cabeza, baja la mancuerna detrás de la cabeza flexionando los codos y luego extiende los brazos hacia arriba'),(12,'Equilibrado','Dominadas',4,8,'Ejercicio para espalda y bíceps que utiliza el peso corporal','Cuelga de una barra con agarre prono (palmas mirando hacia adelante), jala el cuerpo hacia arriba hasta que la barbilla supere la barra, luego baja controladamente'),(13,'Equilibrado','Zancadas',3,10,'Ejercicio para piernas y glúteos que trabaja unilateralmente.','Da un paso hacia adelante flexionando ambas rodillas hasta 90 grados, luego empuja con el pie delantero para volver a la posición inicial'),(14,'Equilibrado','Plancha Abdominal',3,30,'Ejercicio isométrico para el core.','Apóyate sobre los antebrazos y las puntas de los pies, manteniendo el cuerpo recto y alineado de cabeza a talones, contrae el abdomen y mantén la posición'),(15,'Aumentar fuerza','Remo con Barra',4,6,'Ejercicio compuesto para espalda media y bíceps','Inclina el torso hacia adelante con rodillas ligeramente flexionadas, agarra la barra con brazos extendidos, jala la barra hacia el abdomen manteniendo la espalda recta'),(16,'Equilibrado','Sentadilla con Barra',5,8,'Ejercicio compuesto fundamental para cuádriceps, glúteos e isquiotibiales','Coloca la barra en la parte posterior de los hombros, separa los pies al ancho de hombros, desciende flexionando las rodillas hasta que los muslos queden paralelos al suelo, mantén la espalda recta y empuja hacia arriba'),(17,'Equilibrado','Prensa de Piernas',4,10,'Ejercicio en máquina que trabaja cuádriceps, glúteos e isquiotibiales con menos estrés en la espalda.','Siéntate en la máquina con los pies separados al ancho de hombros, empuja la plataforma alejándola de ti extendiendo las rodillas, luego regresa controladamente'),(18,'Aumentar resistencia','Extensión de Cuádriceps',3,12,'Ejercicio de aislamiento para cuádriceps.','Siéntate en la máquina con los pies bajo los rodillos, extiende las piernas hasta que estén completamente rectas, luego baja controladamente'),(19,'Aumentar resistencia','Curl Femoral Acostado',3,12,'Ejercicio de aislamiento para isquiotibiales.','Acuéstate boca abajo en la máquina con los talones bajo los rodillos, flexiona las rodillas llevando los talones hacia los glúteos, luego baja lentamente'),(20,'Equilibrado','Elevación de Pantorrillas de Pie',4,15,'Ejercicio para los gemelos que trabaja principalmente el gastrocnemio.','De pie en una máquina o con mancuernas, levanta los talones del suelo lo más alto posible, mantén brevemente y luego baja controladamente'),(21,'Equilibrado','Aductores en Máquina',3,12,'Ejercicio de aislamiento para los músculos aductores del muslo interno.','Siéntate en la máquina con las piernas abiertas, presiona las almohadillas juntando las piernas, luego regresa controladamente a la posición inicial'),(22,'Equilibrado','Abductores en Máquina',3,12,'Ejercicio de aislamiento para los músculos abductores del muslo externo.','Siéntate en la máquina con las piernas juntas, separa las piernas presionando contra las almohadillas, luego regresa controladamente'),(23,'Aumentar resistencia','Elevación de Talones Sentado',3,15,'Ejercicio para los gemelos que enfatiza el sóleo.','Siéntate en la máquina con las rodillas flexionadas a 90 grados, levanta los talones lo más alto posible, mantén brevemente y luego baja controladamente'),(24,'Aumentar fuerza','Puente de Glúteos',3,10,'Ejercicio que aísla y fortalece los glúteos','Acuéstate boca arriba con rodillas flexionadas y pies apoyados en el suelo, levanta las caderas formando una línea recta desde los hombros hasta las rodillas, aprieta los glúteos en la parte superior y baja controladamente');

UNLOCK TABLES;

/*Table structure for table `objetivos` */

DROP TABLE IF EXISTS `objetivos`;

CREATE TABLE `objetivos` (
  `objetivo_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `altura` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  `tipo_objetivo` varchar(255) DEFAULT NULL,
  `preferencia` enum('Subir de peso','Bajar de peso','Mantener peso') NOT NULL,
  `genero` enum('Masculino','Femenino','Otros') NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`objetivo_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE,
  CONSTRAINT `objetivos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `objetivos` */

LOCK TABLES `objetivos` WRITE;

insert  into `objetivos`(`objetivo_id`,`usuario_id`,`altura`,`peso`,`tipo_objetivo`,`preferencia`,`genero`,`fecha_nacimiento`) values (4,1,180,75,'Aumentar fuerza','Mantener peso','Masculino','1998-01-01'),(6,17,168,78,'Aumentar resistencia','Bajar de peso','Masculino','2025-03-05'),(7,20,180,68,'Aumentar fuerza','Subir de peso','Masculino','1999-10-04');

UNLOCK TABLES;

/*Table structure for table `plan_nutricionales` */

DROP TABLE IF EXISTS `plan_nutricionales`;

CREATE TABLE `plan_nutricionales` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `preferencia_id` int(11) NOT NULL,
  `receta_id` int(11) NOT NULL,
  `fecha_plan` date NOT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `plan_nutricionales_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `plan_nutricionales` */

LOCK TABLES `plan_nutricionales` WRITE;

UNLOCK TABLES;

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` enum('Administrador','Nutricionista','Entrenador','Usuario') NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(64) NOT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `usuarios` */

LOCK TABLES `usuarios` WRITE;

insert  into `usuarios`(`usuario_id`,`rol`,`nombre`,`correo`,`contrasena`) values (1,'Administrador','Maac','maac410@gmail.com','1234'),(17,'Usuario','gi','gi@hotmail.com','12'),(20,'Usuario','maac410','maac4101@gmail.com','1234'),(21,'Entrenador','entrenador','entrenafor@gmail.com','1234'),(22,'Nutricionista','nutricionista','nutricion@gmail.com','1234');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
