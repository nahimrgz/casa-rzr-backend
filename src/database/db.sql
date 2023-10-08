CREATE DATABASE  IF NOT EXISTS `casa_rzr_development` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `casa_rzr_development`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: casa_rzr_development
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `idCategoriaProd` int NOT NULL AUTO_INCREMENT,
  `categoria` longtext,
  PRIMARY KEY (`idCategoriaProd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudades` (
  `idCiudad` int NOT NULL AUTO_INCREMENT,
  `idEstadoRep` int NOT NULL,
  `nombre` longtext,
  PRIMARY KEY (`idCiudad`),
  KEY `fk_ciudades_estado_republica_idx` (`idEstadoRep`),
  CONSTRAINT `fk_ciudades_estado_republica` FOREIGN KEY (`idEstadoRep`) REFERENCES `estados_republica` (`idEstadoRep`)
) ENGINE=InnoDB AUTO_INCREMENT=2389 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,1,'Mexico City'),(6,1,'Aguascalientes'),(7,1,'Asientos'),(8,1,'Calvillo'),(9,1,'Cosío'),(10,1,'Jesús María'),(11,1,'Pabellón de Arteaga'),(12,1,'Rincón de Romos'),(13,1,'San José de Gracia'),(14,1,'Tepezalá'),(15,2,'Ensenada'),(16,2,'Mexicali'),(17,2,'Playas de Rosarito'),(18,2,'Tecate'),(19,2,'Tijuana'),(20,3,'Comondú'),(21,3,'La Paz'),(22,3,'Loreto'),(23,3,'Los Cabos'),(24,3,'Mulegé'),(25,4,'Calakmul'),(26,4,'Campeche'),(27,4,'Candelaria'),(28,4,'Carmen'),(29,4,'Champotón'),(30,4,'Escárcega'),(31,4,'Hecelchakán'),(32,4,'Hopelchén'),(33,4,'Palizada'),(34,4,'Tenabo'),(35,5,'Álvaro Obregón'),(36,5,'Azcapotzalco'),(37,5,'Benito Juárez'),(38,5,'Coyoacán'),(39,5,'Cuajimalpa de Morelos'),(40,5,'Cuauhtémoc'),(41,5,'Gustavo A. Madero'),(42,5,'Iztacalco'),(43,5,'Iztapalapa'),(44,5,'La Magdalena Contreras'),(45,5,'Milpa Alta'),(46,5,'Tláhuac'),(47,5,'Tlalpan'),(48,5,'Venustiano Carranza'),(49,5,'Xochimilco'),(50,6,'Acacoyagua'),(51,6,'Acala'),(52,6,'Acapetahua'),(53,6,'Altamirano'),(54,6,'Amatán'),(55,6,'Amatenango de la Frontera'),(56,6,'Amatenango del Valle'),(57,6,'Angel Albino Corzo'),(58,6,'Arriaga'),(59,6,'Bejucal de Ocampo'),(60,6,'Bella Vista'),(61,6,'Berriozábal'),(62,6,'Bochil'),(63,6,'Cacahoatán'),(64,6,'Catazajá'),(65,6,'Chalchihuitán'),(66,6,'Chamula'),(67,6,'Chanal'),(68,6,'Chapultenango'),(69,6,'Chenalhó'),(70,6,'Chiapa de Corzo'),(71,6,'Chiapilla'),(72,6,'Chicoasén'),(73,6,'Chicomuselo'),(74,6,'Chilón'),(75,6,'Cintalapa'),(76,6,'Coapilla'),(77,6,'Comitán de Domínguez'),(78,6,'Copainalá'),(79,6,'El Bosque'),(80,6,'El Porvenir'),(81,6,'Escuintla'),(82,6,'Francisco León'),(83,6,'Frontera Comalapa'),(84,6,'Frontera Hidalgo'),(85,6,'Huehuetán'),(86,6,'Huitiupán'),(87,6,'Huixtán'),(88,6,'Huixtla'),(89,6,'Ixhuatán'),(90,6,'Ixtacomitán'),(91,6,'Ixtapa'),(92,6,'Ixtapangajoya'),(93,6,'Jiquipilas'),(94,6,'Jitotol'),(95,6,'Juárez'),(96,6,'La Concordia'),(97,6,'La Grandeza'),(98,6,'La Independencia'),(99,6,'La Libertad'),(100,6,'La Trinitaria'),(101,6,'Larráinzar'),(102,6,'Las Margaritas'),(103,6,'Las Rosas'),(104,6,'Mapastepec'),(105,6,'Maravilla Tenejapa'),(106,6,'Marqués de Comillas'),(107,6,'Mazapa de Madero'),(108,6,'Mazatán'),(109,6,'Metapa'),(110,6,'Mitontic'),(111,6,'Montecristo de Guerrero'),(112,6,'Motozintla'),(113,6,'Nicolás Ruíz'),(114,6,'Ocosingo'),(115,6,'Ocotepec'),(116,6,'Ocozocoautla de Espinosa'),(117,6,'Ostuacán'),(118,6,'Oxchuc'),(119,6,'Palenque'),(120,6,'Pantelhó'),(121,6,'Pantepec'),(122,6,'Pichucalco'),(123,6,'Pijijiapan'),(124,6,'Pueblo Nuevo Solistahuacán'),(125,6,'Rayón'),(126,6,'Reforma'),(127,6,'Sabanilla'),(128,6,'Salto de Agua'),(129,6,'San Andrés Duraznal'),(130,6,'San Cristóbal de las Casas'),(131,6,'San Fernando'),(132,6,'San Juan Cancuc'),(133,6,'San Lucas'),(134,6,'Santiago el Pinar'),(135,6,'Siltepec'),(136,6,'Simojovel'),(137,6,'Sitalá'),(138,6,'Socoltenango'),(139,6,'Solosuchiapa'),(140,6,'Soyaló'),(141,6,'Suchiapa'),(142,6,'Suchiate'),(143,6,'Sunuapa'),(144,6,'Tapachula'),(145,6,'Tapalapa'),(146,6,'Tapilula'),(147,6,'Tecpatán'),(148,6,'Tenejapa'),(149,6,'Teopisca'),(150,6,'Tila'),(151,6,'Tonalá'),(152,6,'Totolapa'),(153,6,'Tumbalá'),(154,6,'Tuxtla Chico'),(155,6,'Tuxtla Gutiérrez'),(156,6,'Tuzantán'),(157,6,'Tzimol'),(158,6,'Unión Juárez'),(159,6,'Venustiano Carranza'),(160,6,'Villa Comaltitlán'),(161,6,'Villa Corzo'),(162,6,'Villaflores'),(163,6,'Yajalón'),(164,6,'Zinacantán'),(165,6,'Ángel Albino Corzo'),(166,7,'Ahumada'),(167,7,'Aldama'),(168,7,'Allende'),(169,7,'Aquiles Serdán'),(170,7,'Ascensión'),(171,7,'Bachíniva'),(172,7,'Balleza'),(173,7,'Batopilas'),(174,7,'Bocoyna'),(175,7,'Buenaventura'),(176,7,'Camargo'),(177,7,'Carichí'),(178,7,'Casas Grandes'),(179,7,'Chihuahua'),(180,7,'Chínipas'),(181,7,'Coronado'),(182,7,'Coyame del Sotol'),(183,7,'Cuauhtémoc'),(184,7,'Cusihuiriachi'),(185,7,'Delicias'),(186,7,'Dr. Belisario Domínguez'),(187,7,'Galeana'),(188,7,'Santa Isabel'),(189,7,'Gómez Farías'),(190,7,'Gran Morelos'),(191,7,'Guachochi'),(192,7,'Guadalupe'),(193,7,'Guadalupe y Calvo'),(194,7,'Guazapares'),(195,7,'Guerrero'),(196,7,'Hidalgo del Parral'),(197,7,'Huejotitán'),(198,7,'Ignacio Zaragoza'),(199,7,'Janos'),(200,7,'Jiménez'),(201,7,'Juárez'),(202,7,'Julimes'),(203,7,'López'),(204,7,'Madera'),(205,7,'Maguarichi'),(206,7,'Manuel Benavides'),(207,7,'Matachí'),(208,7,'Matamoros'),(209,7,'Meoqui'),(210,7,'Morelos'),(211,7,'Moris'),(212,7,'Namiquipa'),(213,7,'Nonoava'),(214,7,'Nuevo Casas Grandes'),(215,7,'Ocampo'),(216,7,'Ojinaga'),(217,7,'Praxedis G. Guerrero'),(218,7,'Riva Palacio'),(219,7,'Rosales'),(220,7,'Rosario'),(221,7,'San Francisco de Borja'),(222,7,'San Francisco de Conchos'),(223,7,'San Francisco del Oro'),(224,7,'Santa Bárbara'),(225,7,'Satevó'),(226,7,'Saucillo'),(227,7,'Temósachic'),(228,7,'El Tule'),(229,7,'Urique'),(230,7,'Uruachi'),(231,7,'Valle de Zaragoza'),(232,8,'Abasolo'),(233,8,'Acuña'),(234,8,'Allende'),(235,8,'Arteaga'),(236,8,'Candela'),(237,8,'Castaños'),(238,8,'Cuatro Ciénegas'),(239,8,'Escobedo'),(240,8,'Francisco I. Madero'),(241,8,'Frontera'),(242,8,'General Cepeda'),(243,8,'Guerrero'),(244,8,'Hidalgo'),(245,8,'Jiménez'),(246,8,'Juárez'),(247,8,'Lamadrid'),(248,8,'Matamoros'),(249,8,'Monclova'),(250,8,'Morelos'),(251,8,'Múzquiz'),(252,8,'Nadadores'),(253,8,'Nava'),(254,8,'Ocampo'),(255,8,'Parras'),(256,8,'Piedras Negras'),(257,8,'Progreso'),(258,8,'Ramos Arizpe'),(259,8,'Sabinas'),(260,8,'Sacramento'),(261,8,'Saltillo'),(262,8,'San Buenaventura'),(263,8,'San Juan de Sabinas'),(264,8,'San Pedro'),(265,8,'Sierra Mojada'),(266,8,'Torreón'),(267,8,'Viesca'),(268,8,'Villa Unión'),(269,8,'Zaragoza'),(270,9,'Armería'),(271,9,'Colima'),(272,9,'Comala'),(273,9,'Coquimatlán'),(274,9,'Cuauhtémoc'),(275,9,'Ixtlahuacán'),(276,9,'Manzanillo'),(277,9,'Minatitlán'),(278,9,'Tecomán'),(279,9,'Villa de Álvarez'),(280,11,'Acambay'),(281,11,'Acolman'),(282,11,'Aculco'),(283,11,'Almoloya de Alquisiras'),(284,11,'Almoloya de Juárez'),(285,11,'Almoloya del Río'),(286,11,'Amanalco'),(287,11,'Amatepec'),(288,11,'Amecameca'),(289,11,'Apaxco'),(290,11,'Atenco'),(291,11,'Atizapán'),(292,11,'Atizapán de Zaragoza'),(293,11,'Atlacomulco'),(294,11,'Atlautla'),(295,11,'Axapusco'),(296,11,'Ayapango'),(297,11,'Calimaya'),(298,11,'Capulhuac'),(299,11,'Coacalco de Berriozábal'),(300,11,'Coatepec Harinas'),(301,11,'Cocotitlán'),(302,11,'Coyotepec'),(303,11,'Cuautitlán'),(304,11,'Cuautitlán Izcalli'),(305,11,'Donato Guerra'),(306,11,'Ecatepec de Morelos'),(307,11,'Ecatzingo'),(308,11,'El Oro'),(309,11,'Huehuetoca'),(310,11,'Hueypoxtla'),(311,11,'Huixquilucan'),(312,11,'Isidro Fabela'),(313,11,'Ixtapaluca'),(314,11,'Ixtapan de la Sal'),(315,11,'Ixtapan del Oro'),(316,11,'Ixtlahuaca'),(317,11,'Jaltenco'),(318,11,'Jilotepec'),(319,11,'Jilotzingo'),(320,11,'Jiquipilco'),(321,11,'Jocotitlán'),(322,11,'Joquicingo'),(323,11,'Juchitepec'),(324,11,'La Paz'),(325,11,'Lerma'),(326,11,'Luvianos'),(327,11,'Malinalco'),(328,11,'Melchor Ocampo'),(329,11,'Metepec'),(330,11,'Mexicaltzingo'),(331,11,'Morelos'),(332,11,'Naucalpan de Juárez'),(333,11,'Nextlalpan'),(334,11,'Nezahualcóyotl'),(335,11,'Nicolás Romero'),(336,11,'Nopaltepec'),(337,11,'Ocoyoacac'),(338,11,'Ocuilan'),(339,11,'El Oro'),(340,11,'Otumba'),(341,11,'Otzoloapan'),(342,11,'Otzolotepec'),(343,11,'Ozumba'),(344,11,'Papalotla'),(345,11,'La Paz'),(346,11,'Polotitlán'),(347,11,'Rayón'),(348,11,'San Antonio la Isla'),(349,11,'San Felipe del Progreso'),(350,11,'San José del Rincón'),(351,11,'San Martín de las Pirámides'),(352,11,'San Mateo Atenco'),(353,11,'San Simón de Guerrero'),(354,11,'Santo Tomás'),(355,11,'Soyaniquilpan de Juárez'),(356,11,'Sultepec'),(357,11,'Tecámac'),(358,11,'Tejupilco'),(359,11,'Temamatla'),(360,11,'Temascalapa'),(361,11,'Temascalcingo'),(362,11,'Temascaltepec'),(363,11,'Temoaya'),(364,11,'Tenancingo'),(365,11,'Tenango del Aire'),(366,11,'Tenango del Valle'),(367,11,'Teoloyucan'),(368,11,'Teotihuacán'),(369,11,'Tepetlaoxtoc'),(370,11,'Tepetlixpa'),(371,11,'Tepotzotlán'),(372,11,'Tequixquiac'),(373,11,'Texcaltitlán'),(374,11,'Texcalyacac'),(375,11,'Texcoco'),(376,11,'Tezoyuca'),(377,11,'Tianguistenco'),(378,11,'Timilpan'),(379,11,'Tlalmanalco'),(380,11,'Tlalnepantla de Baz'),(381,11,'Tlatlaya'),(382,11,'Toluca'),(383,11,'Tonatico'),(384,11,'Tultepec'),(385,11,'Tultitlán'),(386,11,'Valle de Bravo'),(387,11,'Villa de Allende'),(388,11,'Villa del Carbón'),(389,11,'Villa Guerrero'),(390,11,'Villa Victoria'),(391,11,'Xalatlaco'),(392,11,'Xonacatlán'),(393,11,'Zacazonapan'),(394,11,'Zacualpan'),(395,11,'Zinacantepec'),(396,11,'Zumpahuacán'),(397,11,'Zumpango'),(398,12,'Abasolo'),(399,12,'Acámbaro'),(400,12,'San Miguel de Allende'),(401,12,'Apaseo el Alto'),(402,12,'Apaseo el Grande'),(403,12,'Atarjea'),(404,12,'Celaya'),(405,12,'Manuel Doblado'),(406,12,'Comonfort'),(407,12,'Coroneo'),(408,12,'Cortazar'),(409,12,'Cuerámaro'),(410,12,'Doctor Mora'),(411,12,'Dolores Hidalgo'),(412,12,'Guanajuato'),(413,12,'Huanímaro'),(414,12,'Irapuato'),(415,12,'Jaral del Progreso'),(416,12,'Jerécuaro'),(417,12,'León'),(418,12,'Moroleón'),(419,12,'Ocampo'),(420,12,'Pénjamo'),(421,12,'Pueblo Nuevo'),(422,12,'Purísima del Rincón'),(423,12,'Romita'),(424,12,'Salamanca'),(425,12,'Salvatierra'),(426,12,'San Diego de la Unión'),(427,12,'San Felipe'),(428,12,'San Francisco del Rincón'),(429,12,'San José Iturbide'),(430,12,'San Luis de la Paz'),(431,12,'Santa Catarina'),(432,12,'Santa Cruz de Juventino Rosas'),(433,12,'Santiago Maravatío'),(434,12,'Silao'),(435,12,'Tarandacuao'),(436,12,'Tarimoro'),(437,12,'Tierra Blanca'),(438,12,'Uriangato'),(439,12,'Valle de Santiago'),(440,12,'Victoria'),(441,12,'Villagrán'),(442,12,'Xichú'),(443,12,'Yuriria'),(444,13,'Acapulco de Juárez'),(445,13,'Ajuchitlán del Progreso'),(446,13,'Alcozauca de Guerrero'),(447,13,'Alpoyeca'),(448,13,'Apaxtla'),(449,13,'Arcelia'),(450,13,'Atenango del Río'),(451,13,'Atlamajalcingo del Monte'),(452,13,'Atlixtac'),(453,13,'Atoyac de Álvarez'),(454,13,'Ayutla de los Libres'),(455,13,'Azoyú'),(456,13,'Benito Juárez'),(457,13,'Buenavista de Cuéllar'),(458,13,'Coahuayutla de José María Izazaga'),(459,13,'Cocula'),(460,13,'Copala'),(461,13,'Copalillo'),(462,13,'Copanatoyac'),(463,13,'Coyuca de Benítez'),(464,13,'Coyuca de Catalán'),(465,13,'Cuajinicuilapa'),(466,13,'Cualác'),(467,13,'Cuautepec'),(468,13,'Cuetzala del Progreso'),(469,13,'Cutzamala de Pinzón'),(470,13,'Chilapa de Álvarez'),(471,13,'Chilpancingo de los Bravo'),(472,13,'Florencio Villarreal'),(473,13,'General Canuto A. Neri'),(474,13,'General Heliodoro Castillo'),(475,13,'Huamuxtitlán'),(476,13,'Huitzuco de los Figueroa'),(477,13,'Iguala de la Independencia'),(478,13,'Igualapa'),(479,13,'Iliatenco'),(480,13,'Ixcateopan de Cuauhtémoc'),(481,13,'Zihuatanejo de Azueta'),(482,13,'Juan R. Escudero'),(483,13,'Leonardo Bravo'),(484,13,'Malinaltepec'),(485,13,'Mártir de Cuilapan'),(486,13,'Metlatónoc'),(487,13,'Mochitlán'),(488,13,'Olinalá'),(489,13,'Ometepec'),(490,13,'Pedro Ascencio Alquisiras'),(491,13,'Petatlán'),(492,13,'Pilcaya'),(493,13,'Pungarabato'),(494,13,'Quechultenango'),(495,13,'San Luis Acatlán'),(496,13,'San Marcos'),(497,13,'San Miguel Totolapan'),(498,13,'Taxco de Alarcón'),(499,13,'Tecoanapa'),(500,13,'Técpan de Galeana'),(501,13,'Teloloapan'),(502,13,'Tepecoacuilco de Trujano'),(503,13,'Tetipac'),(504,13,'Tixtla de Guerrero'),(505,13,'Tlacoachistlahuaca'),(506,13,'Tlacoapa'),(507,13,'Tlalchapa'),(508,13,'Tlalixtaquilla de Maldonado'),(509,13,'Tlapa de Comonfort'),(510,13,'Tlapehuala'),(511,13,'La Unión de Isidoro Montes de Oca'),(512,13,'Xalpatláhuac'),(513,13,'Xochihuehuetlán'),(514,13,'Xochistlahuaca'),(515,13,'Zapotitlán Tablas'),(516,13,'Zirándaro'),(517,13,'Zitlala'),(518,13,'Eduardo Neri'),(519,14,'Acatlán'),(520,14,'Acaxochitlán'),(521,14,'Actopan'),(522,14,'Agua Blanca de Iturbide'),(523,14,'Ajacuba'),(524,14,'Alfajayucan'),(525,14,'Almoloya'),(526,14,'Apan'),(527,14,'El Arenal'),(528,14,'Atitalaquia'),(529,14,'Atlapexco'),(530,14,'Atotonilco el Grande'),(531,14,'Atotonilco de Tula'),(532,14,'Calnali'),(533,14,'Cardonal'),(534,14,'Cuautepec de Hinojosa'),(535,14,'Chapantongo'),(536,14,'Chilcuautla'),(537,14,'Eloxochitlán'),(538,14,'Emiliano Zapata'),(539,14,'Epazoyucan'),(540,14,'Francisco I. Madero'),(541,14,'Huasca de Ocampo'),(542,14,'Huautla'),(543,14,'Huazalingo'),(544,14,'Huehuetla'),(545,14,'Huejutla de Reyes'),(546,14,'Huichapan'),(547,14,'Ixmiquilpan'),(548,14,'Jacala de Ledezma'),(549,14,'Jaltocán'),(550,14,'Juárez Hidalgo'),(551,14,'Lolotla'),(552,14,'Metepec'),(553,14,'San Agustín Metzquititlán'),(554,14,'Metztitlán'),(555,14,'Mineral del Chico'),(556,14,'Mineral del Monte'),(557,14,'La Misión'),(558,14,'Mixquiahuala de Juárez'),(559,14,'Molango de Escamilla'),(560,14,'Nicolás Flores'),(561,14,'Nopala de Villagrán'),(562,14,'Omitlán de Juárez'),(563,14,'San Felipe Orizatlán'),(564,14,'Pacula'),(565,14,'Pachuca de Soto'),(566,14,'Pisaflores'),(567,14,'Progreso de Obregón'),(568,14,'Mineral de la Reforma'),(569,14,'San Agustín Tlaxiaca'),(570,14,'San Bartolo Tutotepec'),(571,14,'San Salvador'),(572,14,'Santiago de Anaya'),(573,14,'Santiago Tulantepec de Lugo Guerrero'),(574,14,'Singuilucan'),(575,14,'Tasquillo'),(576,14,'Tecozautla'),(577,14,'Tenango de Doria'),(578,14,'Tepeapulco'),(579,14,'Tepehuacán de Guerrero'),(580,14,'Tepeji del Río de Ocampo'),(581,14,'Tepetitlán'),(582,14,'Tlaxcoapan'),(583,14,'Tula de Allende'),(584,14,'Tulancingo de Bravo'),(585,14,'Xochiatipan'),(586,14,'Xochicoatlán'),(587,14,'Yahualica'),(588,14,'Zapotlán de Juárez'),(589,14,'Zempoala'),(590,14,'Zimapán'),(591,15,'Acatic'),(592,15,'Acatlán de Juárez'),(593,15,'Ahualulco de Mercado'),(594,15,'Amacueca'),(595,15,'Amatitán'),(596,15,'Ameca'),(597,15,'San Juanito de Escobedo'),(598,15,'Arandas'),(599,15,'El Arenal'),(600,15,'Atemajac de Brizuela'),(601,15,'Atengo'),(602,15,'Atenguillo'),(603,15,'Atotonilco el Alto'),(604,15,'Atoyac'),(605,15,'Autlán de Navarro'),(606,15,'Ayotlán'),(607,15,'Ayutla'),(608,15,'La Barca'),(609,15,'Bolaños'),(610,15,'Cabo Corrientes'),(611,15,'Casimiro Castillo'),(612,15,'Cihuatlán'),(613,15,'Zapopan'),(614,15,'Cocula'),(615,15,'Colotlán'),(616,15,'Concepción de Buenos Aires'),(617,15,'Cuautitlán de García Barragán'),(618,15,'Cuautla'),(619,15,'Cuquío'),(620,15,'Chapala'),(621,15,'Chimaltitán'),(622,15,'Chiquilistlán'),(623,15,'Degollado'),(624,15,'Ejutla'),(625,15,'Encarnación de Díaz'),(626,15,'Etzatlán'),(627,15,'El Grullo'),(628,15,'Guachinango'),(629,15,'Guadalajara'),(630,15,'Hostotipaquillo'),(631,15,'Huejúcar'),(632,15,'Huejuquilla el Alto'),(633,15,'La Huerta'),(634,15,'Ixtlahuacán de los Membrillos'),(635,15,'Ixtlahuacán del Río'),(636,15,'Jalostotitlán'),(637,15,'Jamay'),(638,15,'Jesús María'),(639,15,'Jilotlán de los Dolores'),(640,15,'Jocotepec'),(641,15,'Juanacatlán'),(642,15,'Juchitlán'),(643,15,'Lagos de Moreno'),(644,15,'El Limón'),(645,15,'Magdalena'),(646,15,'Santa María del Oro'),(647,15,'La Manzanilla de la Paz'),(648,15,'Mascota'),(649,15,'Mazamitla'),(650,15,'Mexticacán'),(651,15,'Mezquitic'),(652,15,'Mixtlán'),(653,15,'Ocotlán'),(654,15,'Ojuelos de Jalisco'),(655,15,'Pihuamo'),(656,15,'Poncitlán'),(657,15,'Puerto Vallarta'),(658,15,'Villa Purificación'),(659,15,'Quitupan'),(660,15,'El Salto'),(661,15,'San Cristóbal de la Barranca'),(662,15,'San Diego de Alejandría'),(663,15,'San Juan de los Lagos'),(664,15,'San Julián'),(665,15,'San Marcos'),(666,15,'San Martín de Bolaños'),(667,15,'San Martín Hidalgo'),(668,15,'San Miguel el Alto'),(669,15,'Gómez Farías'),(670,15,'San Sebastián del Oeste'),(671,15,'Santa María de los Ángeles'),(672,15,'Sayula'),(673,15,'Tala'),(674,15,'Talpa de Allende'),(675,15,'Tamazula de Gordiano'),(676,15,'Tapalpa'),(677,15,'Tecalitlán'),(678,15,'Tecolotlán'),(679,15,'Techaluta de Montenegro'),(680,15,'Tenamaxtlán'),(681,15,'Teocaltiche'),(682,15,'Teocuitatlán de Corona'),(683,15,'Tepatitlán de Morelos'),(684,15,'Tequila'),(685,15,'Teuchitlán'),(686,15,'Tizapán el Alto'),(687,15,'Tlajomulco de Zúñiga'),(688,15,'Tlaquepaque'),(689,15,'Tolimán'),(690,15,'Tomatlán'),(691,15,'Tonalá'),(692,15,'Tonaya'),(693,15,'Tonila'),(694,15,'Totatiche'),(695,15,'Tototlán'),(696,15,'Tuxcacuesco'),(697,15,'Tuxcueca'),(698,15,'Tuxpan'),(699,15,'Unión de San Antonio'),(700,15,'Unión de Tula'),(701,15,'Valle de Guadalupe'),(702,15,'Valle de Juárez'),(703,15,'San Gabriel'),(704,15,'Villa Corona'),(705,15,'Villa Guerrero'),(706,15,'Villa Hidalgo'),(707,15,'Cañadas de Obregón'),(708,15,'Yahualica de González Gallo'),(709,15,'Zacoalco de Torres'),(710,15,'Zapotiltic'),(711,15,'Zapotitlán de Vadillo'),(712,15,'Zapotlán del Rey'),(713,15,'Zapotlanejo'),(714,16,'Acuitzio'),(715,16,'Aguililla'),(716,16,'Álvaro Obregón'),(717,16,'Angamacutiro'),(718,16,'Angangueo'),(719,16,'Apatzingán'),(720,16,'Aporo'),(721,16,'Aquila'),(722,16,'Ario'),(723,16,'Arteaga'),(724,16,'Briseñas'),(725,16,'Buenavista'),(726,16,'Carácuaro'),(727,16,'Coahuayana'),(728,16,'Coalcomán de Vázquez Pallares'),(729,16,'Coeneo'),(730,16,'Contepec'),(731,16,'Copándaro'),(732,16,'Cotija'),(733,16,'Cuitzeo'),(734,16,'Charapan'),(735,16,'Charo'),(736,16,'Cherán'),(737,16,'Chilchota'),(738,16,'Chinicuila'),(739,16,'Chucándiro'),(740,16,'Churintzio'),(741,16,'Churumuco'),(742,16,'Ecuandureo'),(743,16,'Epitacio Huerta'),(744,16,'Erongarícuaro'),(745,16,'Gabriel Zamora'),(746,16,'Hidalgo'),(747,16,'La Huacana'),(748,16,'Huandacareo'),(749,16,'Huaniqueo'),(750,16,'Huetamo'),(751,16,'Huiramba'),(752,16,'Indaparapeo'),(753,16,'Irimbo'),(754,16,'Ixtlán'),(755,16,'Jacona'),(756,16,'Jiménez'),(757,16,'Jiquilpan'),(758,16,'Juárez'),(759,16,'Jungapeo'),(760,16,'Lagunillas'),(761,16,'Madero'),(762,16,'Maravatío'),(763,16,'Marcos Castellanos'),(764,16,'Lázaro Cárdenas'),(765,16,'Morelia'),(766,16,'Morelos'),(767,16,'Múgica'),(768,16,'Nahuatzen'),(769,16,'Nocupétaro'),(770,16,'Nuevo Parangaricutiro'),(771,16,'Nuevo Urecho'),(772,16,'Numarán'),(773,16,'Ocampo'),(774,16,'Pajacuarán'),(775,16,'Panindícuaro'),(776,16,'Parácuaro'),(777,16,'Paracho'),(778,16,'Pátzcuaro'),(779,16,'Penjamillo'),(780,16,'Peribán'),(781,16,'La Piedad'),(782,16,'Purépero'),(783,16,'Puruándiro'),(784,16,'Queréndaro'),(785,16,'Quiroga'),(786,16,'Cojumatlán de Régules'),(787,16,'Los Reyes'),(788,16,'Sahuayo'),(789,16,'San Lucas'),(790,16,'Santa Ana Maya'),(791,16,'Salvador Escalante'),(792,16,'Senguio'),(793,16,'Susupuato'),(794,16,'Tacámbaro'),(795,16,'Tancítaro'),(796,16,'Tangamandapio'),(797,16,'Tangancícuaro'),(798,16,'Tanhuato'),(799,16,'Taretan'),(800,16,'Tarímbaro'),(801,16,'Tepalcatepec'),(802,16,'Tingambato'),(803,16,'Tingüindín'),(804,16,'Tiquicheo de Nicolás Romero'),(805,16,'Tlalpujahua'),(806,16,'Tlazazalca'),(807,16,'Tocumbo'),(808,16,'Tumbiscatío'),(809,16,'Turicato'),(810,16,'Tuxpan'),(811,16,'Tuzantla'),(812,16,'Tzintzuntzan'),(813,16,'Tzitzio'),(814,16,'Uruapan'),(815,16,'Venustiano Carranza'),(816,16,'Villamar'),(817,16,'Vista Hermosa'),(818,16,'Yurécuaro'),(819,16,'Zacapu'),(820,16,'Zamora'),(821,16,'Zináparo'),(822,16,'Zinapécuaro'),(823,16,'Ziracuaretiro'),(824,16,'Zitácuaro'),(825,17,'Amacuzac'),(826,17,'Atlatlahucan'),(827,17,'Axochiapan'),(828,17,'Ayala'),(829,17,'Coatlán del Río'),(830,17,'Cuautla'),(831,17,'Cuernavaca'),(832,17,'Emiliano Zapata'),(833,17,'Huitzilac'),(834,17,'Jantetelco'),(835,17,'Jiutepec'),(836,17,'Jojutla'),(837,17,'Jonacatepec'),(838,17,'Mazatepec'),(839,17,'Miacatlán'),(840,17,'Ocuituco'),(841,17,'Puente de Ixtla'),(842,17,'Temixco'),(843,17,'Tepalcingo'),(844,17,'Tepoztlán'),(845,17,'Tetecala'),(846,17,'Tetela del Volcán'),(847,17,'Tlalnepantla'),(848,17,'Tlaltizapán de Zapata'),(849,17,'Tlaquiltenango'),(850,17,'Tlayacapan'),(851,17,'Totolapan'),(852,17,'Xochitepec'),(853,17,'Yautepec'),(854,17,'Yecapixtla'),(855,17,'Zacatepec'),(856,17,'Zacualpan de Amilpas'),(857,17,'Temoac'),(858,18,'Acaponeta'),(859,18,'Ahuacatlán'),(860,18,'Amatlán de Cañas'),(861,18,'Compostela'),(862,18,'Huajicori'),(863,18,'Ixtlán del Río'),(864,18,'Jala'),(865,18,'Xalisco'),(866,18,'Del Nayar'),(867,18,'Rosamorada'),(868,18,'Ruíz'),(869,18,'San Blas'),(870,18,'San Pedro Lagunillas'),(871,18,'Santa María del Oro'),(872,18,'Santiago Ixcuintla'),(873,18,'Tecuala'),(874,18,'Tepic'),(875,18,'Tuxpan'),(876,18,'La Yesca'),(877,19,'Abasolo'),(878,19,'Agualeguas'),(879,19,'Los Aldamas'),(880,19,'Allende'),(881,19,'Anáhuac'),(882,19,'Apodaca'),(883,19,'Aramberri'),(884,19,'Bustamante'),(885,19,'Cadereyta Jiménez'),(886,19,'El Carmen'),(887,19,'Cerralvo'),(888,19,'China'),(889,19,'Dr. Arroyo'),(890,19,'Dr. Coss'),(891,19,'Dr. González'),(892,19,'Galeana'),(893,19,'García'),(894,19,'San Pedro Garza García'),(895,19,'Gral. Bravo'),(896,19,'Gral. Escobedo'),(897,19,'Gral. Terán'),(898,19,'Gral. Treviño'),(899,19,'Gral. Zaragoza'),(900,19,'Gral. Zuazua'),(901,19,'Guadalupe'),(902,19,'Los Herreras'),(903,19,'Higueras'),(904,19,'Hualahuises'),(905,19,'Iturbide'),(906,19,'Juárez'),(907,19,'Lampazos de Naranjo'),(908,19,'Linares'),(909,19,'Marín'),(910,19,'Melchor Ocampo'),(911,19,'Mier y Noriega'),(912,19,'Mina'),(913,19,'Montemorelos'),(914,19,'Monterrey'),(915,19,'Parás'),(916,19,'Pesquería'),(917,19,'Los Ramones'),(918,19,'Rayones'),(919,19,'Sabinas Hidalgo'),(920,19,'Salinas Victoria'),(921,19,'San Nicolás de los Garza'),(922,19,'Hidalgo'),(923,19,'Santa Catarina'),(924,19,'Santiago'),(925,19,'Vallecillo'),(926,19,'Villaldama'),(927,20,'Abejones'),(928,20,'Acatlán de Pérez Figueroa'),(929,20,'Asunción Cacalotepec'),(930,20,'Asunción Cuyotepeji'),(931,20,'Asunción Ixtaltepec'),(932,20,'Asunción Nochixtlán'),(933,20,'Asunción Ocotlán'),(934,20,'Asunción Tlacolulita'),(935,20,'Ayotzintepec'),(936,20,'El Barrio de la Soledad'),(937,20,'Calihualá'),(938,20,'Candelaria Loxicha'),(939,20,'Ciénega de Zimatlán'),(940,20,'Ciudad Ixtepec'),(941,20,'Coatecas Altas'),(942,20,'Coicoyán de las Flores'),(943,20,'La Compañía'),(944,20,'Concepción Buenavista'),(945,20,'Concepción Pápalo'),(946,20,'Constancia del Rosario'),(947,20,'Cosolapa'),(948,20,'Cosoltepec'),(949,20,'Cuilápam de Guerrero'),(950,20,'Cuyamecalco Villa de Zaragoza'),(951,20,'Chahuites'),(952,20,'Chalcatongo de Hidalgo'),(953,20,'Chiquihuitlán de Benito Juárez'),(954,20,'Heroica Ciudad de Ejutla de Crespo'),(955,20,'Eloxochitlán de Flores Magón'),(956,20,'El Espinal'),(957,20,'Tamazulápam del Espíritu Santo'),(958,20,'Fresnillo de Trujano'),(959,20,'Guadalupe Etla'),(960,20,'Guadalupe de Ramírez'),(961,20,'Guelatao de Juárez'),(962,20,'Guevea de Humboldt'),(963,20,'Mesones Hidalgo'),(964,20,'Villa Hidalgo'),(965,20,'Heroica Ciudad de Huajuapan de León'),(966,20,'Huautepec'),(967,20,'Huautla de Jiménez'),(968,20,'Ixtlán de Juárez'),(969,20,'Juchitán de Zaragoza'),(970,20,'Loma Bonita'),(971,20,'Magdalena Apasco'),(972,20,'Magdalena Jaltepec'),(973,20,'Santa Magdalena Jicotlá'),(974,20,'Magdalena Mixtepec'),(975,20,'Magdalena Ocotlán'),(976,20,'Magdalena Peñasco'),(977,20,'Magdalena Teitipac'),(978,20,'Magdalena Tequisistlán'),(979,20,'Magdalena Tlacotepec'),(980,20,'Magdalena Zahuatlán'),(981,20,'Mariscala de Juárez'),(982,20,'Mártires de Tacubaya'),(983,20,'Matías Romero Avendaño'),(984,20,'Mazatlán Villa de Flores'),(985,20,'Miahuatlán de Porfirio Díaz'),(986,20,'Mixistlán de la Reforma'),(987,20,'Monjas'),(988,20,'Natividad'),(989,20,'Nazareno Etla'),(990,20,'Nejapa de Madero'),(991,20,'Ixpantepec Nieves'),(992,20,'Santiago Niltepec'),(993,20,'Oaxaca de Juárez'),(994,20,'Ocotlán de Morelos'),(995,20,'La Pe'),(996,20,'Pinotepa de Don Luis'),(997,20,'Pluma Hidalgo'),(998,20,'San José del Progreso'),(999,20,'Putla Villa de Guerrero'),(1000,20,'Santa Catarina Quioquitani'),(1001,20,'Reforma de Pineda'),(1002,20,'La Reforma'),(1003,20,'Reyes Etla'),(1004,20,'Rojas de Cuauhtémoc'),(1005,20,'Salina Cruz'),(1006,20,'San Agustín Amatengo'),(1007,20,'San Agustín Atenango'),(1008,20,'San Agustín Chayuco'),(1009,20,'San Agustín de las Juntas'),(1010,20,'San Agustín Etla'),(1011,20,'San Agustín Loxicha'),(1012,20,'San Agustín Tlacotepec'),(1013,20,'San Agustín Yatareni'),(1014,20,'San Andrés Cabecera Nueva'),(1015,20,'San Andrés Dinicuiti'),(1016,20,'San Andrés Huaxpaltepec'),(1017,20,'San Andrés Huayápam'),(1018,20,'San Andrés Ixtlahuaca'),(1019,20,'San Andrés Lagunas'),(1020,20,'San Andrés Nuxiño'),(1021,20,'San Andrés Paxtlán'),(1022,20,'San Andrés Sinaxtla'),(1023,20,'San Andrés Solaga'),(1024,20,'San Andrés Teotilálpam'),(1025,20,'San Andrés Tepetlapa'),(1026,20,'San Andrés Yaá'),(1027,20,'San Andrés Zabache'),(1028,20,'San Andrés Zautla'),(1029,20,'San Antonino Castillo Velasco'),(1030,20,'San Antonino el Alto'),(1031,20,'San Antonino Monte Verde'),(1032,20,'San Antonio Acutla'),(1033,20,'San Antonio de la Cal'),(1034,20,'San Antonio Huitepec'),(1035,20,'San Antonio Nanahuatípam'),(1036,20,'San Antonio Sinicahua'),(1037,20,'San Antonio Tepetlapa'),(1038,20,'San Baltazar Chichicápam'),(1039,20,'San Baltazar Loxicha'),(1040,20,'San Baltazar Yatzachi el Bajo'),(1041,20,'San Bartolo Coyotepec'),(1042,20,'San Bartolomé Ayautla'),(1043,20,'San Bartolomé Loxicha'),(1044,20,'San Bartolomé Quialana'),(1045,20,'San Bartolomé Yucuañe'),(1046,20,'San Bartolomé Zoogocho'),(1047,20,'San Bartolo Soyaltepec'),(1048,20,'San Bartolo Yautepec'),(1049,20,'San Bernardo Mixtepec'),(1050,20,'San Blas Atempa'),(1051,20,'San Carlos Yautepec'),(1052,20,'San Cristóbal Amatlán'),(1053,20,'San Cristóbal Amoltepec'),(1054,20,'San Cristóbal Lachirioag'),(1055,20,'San Cristóbal Suchixtlahuaca'),(1056,20,'San Dionisio del Mar'),(1057,20,'San Dionisio Ocotepec'),(1058,20,'San Dionisio Ocotlán'),(1059,20,'San Esteban Atatlahuca'),(1060,20,'San Felipe Jalapa de Díaz'),(1061,20,'San Felipe Tejalápam'),(1062,20,'San Felipe Usila'),(1063,20,'San Francisco Cahuacuá'),(1064,20,'San Francisco Cajonos'),(1065,20,'San Francisco Chapulapa'),(1066,20,'San Francisco Chindúa'),(1067,20,'San Francisco del Mar'),(1068,20,'San Francisco Huehuetlán'),(1069,20,'San Francisco Ixhuatán'),(1070,20,'San Francisco Jaltepetongo'),(1071,20,'San Francisco Lachigoló'),(1072,20,'San Francisco Logueche'),(1073,20,'San Francisco Nuxaño'),(1074,20,'San Francisco Ozolotepec'),(1075,20,'San Francisco Sola'),(1076,20,'San Francisco Telixtlahuaca'),(1077,20,'San Francisco Teopan'),(1078,20,'San Francisco Tlapancingo'),(1079,20,'San Gabriel Mixtepec'),(1080,20,'San Ildefonso Amatlán'),(1081,20,'San Ildefonso Sola'),(1082,20,'San Ildefonso Villa Alta'),(1083,20,'San Jacinto Amilpas'),(1084,20,'San Jacinto Tlacotepec'),(1085,20,'San Jerónimo Coatlán'),(1086,20,'San Jerónimo Silacayoapilla'),(1087,20,'San Jerónimo Sosola'),(1088,20,'San Jerónimo Taviche'),(1089,20,'San Jerónimo Tecóatl'),(1090,20,'San Jorge Nuchita'),(1091,20,'San José Ayuquila'),(1092,20,'San José Chiltepec'),(1093,20,'San José del Peñasco'),(1094,20,'San José Estancia Grande'),(1095,20,'San José Independencia'),(1096,20,'San José Lachiguiri'),(1097,20,'San José Tenango'),(1098,20,'San Juan Achiutla'),(1099,20,'San Juan Atepec'),(1100,20,'Ánimas Trujano'),(1101,20,'San Juan Bautista Atatlahuca'),(1102,20,'San Juan Bautista Coixtlahuaca'),(1103,20,'San Juan Bautista Cuicatlán'),(1104,20,'San Juan Bautista Guelache'),(1105,20,'San Juan Bautista Jayacatlán'),(1106,20,'San Juan Bautista Lo de Soto'),(1107,20,'San Juan Bautista Suchitepec'),(1108,20,'San Juan Bautista Tlacoatzintepec'),(1109,20,'San Juan Bautista Tlachichilco'),(1110,20,'San Juan Bautista Tuxtepec'),(1111,20,'San Juan Cacahuatepec'),(1112,20,'San Juan Cieneguilla'),(1113,20,'San Juan Coatzóspam'),(1114,20,'San Juan Colorado'),(1115,20,'San Juan Comaltepec'),(1116,20,'San Juan Cotzocón'),(1117,20,'San Juan Chicomezúchil'),(1118,20,'San Juan Chilateca'),(1119,20,'San Juan del Estado'),(1120,20,'San Juan del Río'),(1121,20,'San Juan Diuxi'),(1122,20,'San Juan Evangelista Analco'),(1123,20,'San Juan Guelavía'),(1124,20,'San Juan Guichicovi'),(1125,20,'San Juan Ihualtepec'),(1126,20,'San Juan Juquila Mixes'),(1127,20,'San Juan Juquila Vijanos'),(1128,20,'San Juan Lachao'),(1129,20,'San Juan Lachigalla'),(1130,20,'San Juan Lajarcia'),(1131,20,'San Juan Lalana'),(1132,20,'San Juan de los Cués'),(1133,20,'San Juan Mazatlán'),(1134,20,'San Juan Mixtepec'),(1135,20,'San Juan Mixtepec.'),(1136,20,'San Juan Ñumí'),(1137,20,'San Juan Ozolotepec'),(1138,20,'San Juan Petlapa'),(1139,20,'San Juan Quiahije'),(1140,20,'San Juan Quiotepec'),(1141,20,'San Juan Sayultepec'),(1142,20,'San Juan Tabaá'),(1143,20,'San Juan Tamazola'),(1144,20,'San Juan Teita'),(1145,20,'San Juan Teitipac'),(1146,20,'San Juan Tepeuxila'),(1147,20,'San Juan Teposcolula'),(1148,20,'San Juan Yaeé'),(1149,20,'San Juan Yatzona'),(1150,20,'San Juan Yucuita'),(1151,20,'San Lorenzo'),(1152,20,'San Lorenzo Albarradas'),(1153,20,'San Lorenzo Cacaotepec'),(1154,20,'San Lorenzo Cuaunecuiltitla'),(1155,20,'San Lorenzo Texmelúcan'),(1156,20,'San Lorenzo Victoria'),(1157,20,'San Lucas Camotlán'),(1158,20,'San Lucas Ojitlán'),(1159,20,'San Lucas Quiaviní'),(1160,20,'San Lucas Zoquiápam'),(1161,20,'San Luis Amatlán'),(1162,20,'San Marcial Ozolotepec'),(1163,20,'San Marcos Arteaga'),(1164,20,'San Martín de los Cansecos'),(1165,20,'San Martín Huamelúlpam'),(1166,20,'San Martín Itunyoso'),(1167,20,'San Martín Lachilá'),(1168,20,'San Martín Peras'),(1169,20,'San Martín Tilcajete'),(1170,20,'San Martín Toxpalan'),(1171,20,'San Martín Zacatepec'),(1172,20,'San Mateo Cajonos'),(1173,20,'Capulálpam de Méndez'),(1174,20,'San Mateo del Mar'),(1175,20,'San Mateo Yoloxochitlán'),(1176,20,'San Mateo Etlatongo'),(1177,20,'San Mateo Nejápam'),(1178,20,'San Mateo Peñasco'),(1179,20,'San Mateo Piñas'),(1180,20,'San Mateo Río Hondo'),(1181,20,'San Mateo Sindihui'),(1182,20,'San Mateo Tlapiltepec'),(1183,20,'San Melchor Betaza'),(1184,20,'San Miguel Achiutla'),(1185,20,'San Miguel Ahuehuetitlán'),(1186,20,'San Miguel Aloápam'),(1187,20,'San Miguel Amatitlán'),(1188,20,'San Miguel Amatlán'),(1189,20,'San Miguel Coatlán'),(1190,20,'San Miguel Chicahua'),(1191,20,'San Miguel Chimalapa'),(1192,20,'San Miguel del Puerto'),(1193,20,'San Miguel del Río'),(1194,20,'San Miguel Ejutla'),(1195,20,'San Miguel el Grande'),(1196,20,'San Miguel Huautla'),(1197,20,'San Miguel Mixtepec'),(1198,20,'San Miguel Panixtlahuaca'),(1199,20,'San Miguel Peras'),(1200,20,'San Miguel Piedras'),(1201,20,'San Miguel Quetzaltepec'),(1202,20,'San Miguel Santa Flor'),(1203,20,'Villa Sola de Vega'),(1204,20,'San Miguel Soyaltepec'),(1205,20,'San Miguel Suchixtepec'),(1206,20,'Villa Talea de Castro'),(1207,20,'San Miguel Tecomatlán'),(1208,20,'San Miguel Tenango'),(1209,20,'San Miguel Tequixtepec'),(1210,20,'San Miguel Tilquiápam'),(1211,20,'San Miguel Tlacamama'),(1212,20,'San Miguel Tlacotepec'),(1213,20,'San Miguel Tulancingo'),(1214,20,'San Miguel Yotao'),(1215,20,'San Nicolás'),(1216,20,'San Nicolás Hidalgo'),(1217,20,'San Pablo Coatlán'),(1218,20,'San Pablo Cuatro Venados'),(1219,20,'San Pablo Etla'),(1220,20,'San Pablo Huitzo'),(1221,20,'San Pablo Huixtepec'),(1222,20,'San Pablo Macuiltianguis'),(1223,20,'San Pablo Tijaltepec'),(1224,20,'San Pablo Villa de Mitla'),(1225,20,'San Pablo Yaganiza'),(1226,20,'San Pedro Amuzgos'),(1227,20,'San Pedro Apóstol'),(1228,20,'San Pedro Atoyac'),(1229,20,'San Pedro Cajonos'),(1230,20,'San Pedro Coxcaltepec Cántaros'),(1231,20,'San Pedro Comitancillo'),(1232,20,'San Pedro el Alto'),(1233,20,'San Pedro Huamelula'),(1234,20,'San Pedro Huilotepec'),(1235,20,'San Pedro Ixcatlán'),(1236,20,'San Pedro Ixtlahuaca'),(1237,20,'San Pedro Jaltepetongo'),(1238,20,'San Pedro Jicayán'),(1239,20,'San Pedro Jocotipac'),(1240,20,'San Pedro Juchatengo'),(1241,20,'San Pedro Mártir'),(1242,20,'San Pedro Mártir Quiechapa'),(1243,20,'San Pedro Mártir Yucuxaco'),(1244,20,'San Pedro Mixtepec'),(1245,20,'San Pedro Mixtepec'),(1246,20,'San Pedro Molinos'),(1247,20,'San Pedro Nopala'),(1248,20,'San Pedro Ocopetatillo'),(1249,20,'San Pedro Ocotepec'),(1250,20,'San Pedro Pochutla'),(1251,20,'San Pedro Quiatoni'),(1252,20,'San Pedro Sochiápam'),(1253,20,'San Pedro Tapanatepec'),(1254,20,'San Pedro Taviche'),(1255,20,'San Pedro Teozacoalco'),(1256,20,'San Pedro Teutila'),(1257,20,'San Pedro Tidaá'),(1258,20,'San Pedro Topiltepec'),(1259,20,'San Pedro Totolápam'),(1260,20,'Villa de Tututepec'),(1261,20,'San Pedro Yaneri'),(1262,20,'San Pedro Yólox'),(1263,20,'San Pedro y San Pablo Ayutla'),(1264,20,'Villa de Etla'),(1265,20,'San Pedro y San Pablo Teposcolula'),(1266,20,'San Pedro y San Pablo Tequixtepec'),(1267,20,'San Pedro Yucunama'),(1268,20,'San Raymundo Jalpan'),(1269,20,'San Sebastián Abasolo'),(1270,20,'San Sebastián Coatlán'),(1271,20,'San Sebastián Ixcapa'),(1272,20,'San Sebastián Nicananduta'),(1273,20,'San Sebastián Río Hondo'),(1274,20,'San Sebastián Tecomaxtlahuaca'),(1275,20,'San Sebastián Teitipac'),(1276,20,'San Sebastián Tutla'),(1277,20,'San Simón Almolongas'),(1278,20,'San Simón Zahuatlán'),(1279,20,'Santa Ana'),(1280,20,'Santa Ana Ateixtlahuaca'),(1281,20,'Santa Ana Cuauhtémoc'),(1282,20,'Santa Ana del Valle'),(1283,20,'Santa Ana Tavela'),(1284,20,'Santa Ana Tlapacoyan'),(1285,20,'Santa Ana Yareni'),(1286,20,'Santa Ana Zegache'),(1287,20,'Santa Catalina Quierí'),(1288,20,'Santa Catarina Cuixtla'),(1289,20,'Santa Catarina Ixtepeji'),(1290,20,'Santa Catarina Juquila'),(1291,20,'Santa Catarina Lachatao'),(1292,20,'Santa Catarina Loxicha'),(1293,20,'Santa Catarina Mechoacán'),(1294,20,'Santa Catarina Minas'),(1295,20,'Santa Catarina Quiané'),(1296,20,'Santa Catarina Tayata'),(1297,20,'Santa Catarina Ticuá'),(1298,20,'Santa Catarina Yosonotú'),(1299,20,'Santa Catarina Zapoquila'),(1300,20,'Santa Cruz Acatepec'),(1301,20,'Santa Cruz Amilpas'),(1302,20,'Santa Cruz de Bravo'),(1303,20,'Santa Cruz Itundujia'),(1304,20,'Santa Cruz Mixtepec'),(1305,20,'Santa Cruz Nundaco'),(1306,20,'Santa Cruz Papalutla'),(1307,20,'Santa Cruz Tacache de Mina'),(1308,20,'Santa Cruz Tacahua'),(1309,20,'Santa Cruz Tayata'),(1310,20,'Santa Cruz Xitla'),(1311,20,'Santa Cruz Xoxocotlán0'),(1312,20,'Santa Cruz Zenzontepec'),(1313,20,'Santa Gertrudis'),(1314,20,'Santa Inés del Monte'),(1315,20,'Santa Inés Yatzeche'),(1316,20,'Santa Lucía del Camino'),(1317,20,'Santa Lucía Miahuatlán'),(1318,20,'Santa Lucía Monteverde'),(1319,20,'Santa Lucía Ocotlán'),(1320,20,'Santa María Alotepec'),(1321,20,'Santa María Apazco'),(1322,20,'Santa María la Asunción'),(1323,20,'Heroica Ciudad de Tlaxiaco'),(1324,20,'Ayoquezco de Aldama'),(1325,20,'Santa María Atzompa'),(1326,20,'Santa María Camotlán'),(1327,20,'Santa María Colotepec'),(1328,20,'Santa María Cortijo'),(1329,20,'Santa María Coyotepec'),(1330,20,'Santa María Chachoápam'),(1331,20,'Villa de Chilapa de Díaz'),(1332,20,'Santa María Chilchotla'),(1333,20,'Santa María Chimalapa'),(1334,20,'Santa María del Rosario'),(1335,20,'Santa María del Tule'),(1336,20,'Santa María Ecatepec'),(1337,20,'Santa María Guelacé'),(1338,20,'Santa María Guienagati'),(1339,20,'Santa María Huatulco'),(1340,20,'Santa María Huazolotitlán'),(1341,20,'Santa María Ipalapa'),(1342,20,'Santa María Ixcatlán'),(1343,20,'Santa María Jacatepec'),(1344,20,'Santa María Jalapa del Marqués'),(1345,20,'Santa María Jaltianguis'),(1346,20,'Santa María Lachixío'),(1347,20,'Santa María Mixtequilla'),(1348,20,'Santa María Nativitas'),(1349,20,'Santa María Nduayaco'),(1350,20,'Santa María Ozolotepec'),(1351,20,'Santa María Pápalo'),(1352,20,'Santa María Peñoles'),(1353,20,'Santa María Petapa'),(1354,20,'Santa María Quiegolani'),(1355,20,'Santa María Sola'),(1356,20,'Santa María Tataltepec'),(1357,20,'Santa María Tecomavaca'),(1358,20,'Santa María Temaxcalapa'),(1359,20,'Santa María Temaxcaltepec'),(1360,20,'Santa María Teopoxco'),(1361,20,'Santa María Tepantlali'),(1362,20,'Santa María Texcatitlán'),(1363,20,'Santa María Tlahuitoltepec'),(1364,20,'Santa María Tlalixtac'),(1365,20,'Santa María Tonameca'),(1366,20,'Santa María Totolapilla'),(1367,20,'Santa María Xadani'),(1368,20,'Santa María Yalina'),(1369,20,'Santa María Yavesía'),(1370,20,'Santa María Yolotepec'),(1371,20,'Santa María Yosoyúa'),(1372,20,'Santa María Yucuhiti'),(1373,20,'Santa María Zacatepec'),(1374,20,'Santa María Zaniza'),(1375,20,'Santa María Zoquitlán'),(1376,20,'Santiago Amoltepec'),(1377,20,'Santiago Apoala'),(1378,20,'Santiago Apóstol'),(1379,20,'Santiago Astata'),(1380,20,'Santiago Atitlán'),(1381,20,'Santiago Ayuquililla'),(1382,20,'Santiago Cacaloxtepec'),(1383,20,'Santiago Camotlán'),(1384,20,'Santiago Comaltepec'),(1385,20,'Villa de Santiago Chazumba'),(1386,20,'Santiago Choápam'),(1387,20,'Santiago del Río'),(1388,20,'Santiago Huajolotitlán'),(1389,20,'Santiago Huauclilla'),(1390,20,'Santiago Ihuitlán Plumas'),(1391,20,'Santiago Ixcuintepec'),(1392,20,'Santiago Ixtayutla'),(1393,20,'Santiago Jamiltepec'),(1394,20,'Santiago Jocotepec'),(1395,20,'Santiago Juxtlahuaca'),(1396,20,'Santiago Lachiguiri'),(1397,20,'Santiago Lalopa'),(1398,20,'Santiago Laollaga'),(1399,20,'Santiago Laxopa'),(1400,20,'Santiago Llano Grande'),(1401,20,'Santiago Matatlán'),(1402,20,'Santiago Miltepec'),(1403,20,'Santiago Minas'),(1404,20,'Santiago Nacaltepec'),(1405,20,'Santiago Nejapilla'),(1406,20,'Santiago Nundiche'),(1407,20,'Santiago Nuyoó'),(1408,20,'Santiago Pinotepa Nacional'),(1409,20,'Santiago Suchilquitongo'),(1410,20,'Santiago Tamazola'),(1411,20,'Santiago Tapextla'),(1412,20,'Villa Tejúpam de la Unión'),(1413,20,'Santiago Tenango'),(1414,20,'Santiago Tepetlapa'),(1415,20,'Santiago Tetepec'),(1416,20,'Santiago Texcalcingo'),(1417,20,'Santiago Textitlán'),(1418,20,'Santiago Tilantongo'),(1419,20,'Santiago Tillo'),(1420,20,'Santiago Tlazoyaltepec'),(1421,20,'Santiago Xanica'),(1422,20,'Santiago Xiacuí'),(1423,20,'Santiago Yaitepec'),(1424,20,'Santiago Yaveo'),(1425,20,'Santiago Yolomécatl'),(1426,20,'Santiago Yosondúa'),(1427,20,'Santiago Yucuyachi'),(1428,20,'Santiago Zacatepec'),(1429,20,'Santiago Zoochila'),(1430,20,'Nuevo Zoquiápam'),(1431,20,'Santo Domingo Ingenio'),(1432,20,'Santo Domingo Albarradas'),(1433,20,'Santo Domingo Armenta'),(1434,20,'Santo Domingo Chihuitán'),(1435,20,'Santo Domingo de Morelos'),(1436,20,'Santo Domingo Ixcatlán'),(1437,20,'Santo Domingo Nuxaá'),(1438,20,'Santo Domingo Ozolotepec'),(1439,20,'Santo Domingo Petapa'),(1440,20,'Santo Domingo Roayaga'),(1441,20,'Santo Domingo Tehuantepec'),(1442,20,'Santo Domingo Teojomulco'),(1443,20,'Santo Domingo Tepuxtepec'),(1444,20,'Santo Domingo Tlatayápam'),(1445,20,'Santo Domingo Tomaltepec'),(1446,20,'Santo Domingo Tonalá'),(1447,20,'Santo Domingo Tonaltepec'),(1448,20,'Santo Domingo Xagacía'),(1449,20,'Santo Domingo Yanhuitlán'),(1450,20,'Santo Domingo Yodohino'),(1451,20,'Santo Domingo Zanatepec'),(1452,20,'Santos Reyes Nopala'),(1453,20,'Santos Reyes Pápalo'),(1454,20,'Santos Reyes Tepejillo'),(1455,20,'Santos Reyes Yucuná'),(1456,20,'Santo Tomás Jalieza'),(1457,20,'Santo Tomás Mazaltepec'),(1458,20,'Santo Tomás Ocotepec'),(1459,20,'Santo Tomás Tamazulapan'),(1460,20,'San Vicente Coatlán'),(1461,20,'San Vicente Lachixío'),(1462,20,'San Vicente Nuñú'),(1463,20,'Silacayoápam'),(1464,20,'Sitio de Xitlapehua'),(1465,20,'Soledad Etla'),(1466,20,'Villa de Tamazulápam del Progreso'),(1467,20,'Tanetze de Zaragoza'),(1468,20,'Taniche'),(1469,20,'Tataltepec de Valdés'),(1470,20,'Teococuilco de Marcos Pérez'),(1471,20,'Teotitlán de Flores Magón'),(1472,20,'Teotitlán del Valle'),(1473,20,'Teotongo'),(1474,20,'Tepelmeme Villa de Morelos'),(1475,20,'Heroica Villa Tezoatlán de Segura y Luna'),(1476,20,'San Jerónimo Tlacochahuaya'),(1477,20,'Tlacolula de Matamoros'),(1478,20,'Tlacotepec Plumas'),(1479,20,'Tlalixtac de Cabrera'),(1480,20,'Totontepec Villa de Morelos'),(1481,20,'Trinidad Zaachila'),(1482,20,'La Trinidad Vista Hermosa'),(1483,20,'Unión Hidalgo'),(1484,20,'Valerio Trujano'),(1485,20,'San Juan Bautista Valle Nacional'),(1486,20,'Villa Díaz Ordaz'),(1487,20,'Yaxe'),(1488,20,'Magdalena Yodocono de Porfirio Díaz'),(1489,20,'Yogana'),(1490,20,'Yutanduchi de Guerrero'),(1491,20,'Villa de Zaachila'),(1492,20,'San Mateo Yucutindoo'),(1493,20,'Zapotitlán Lagunas'),(1494,20,'Zapotitlán Palmas'),(1495,20,'Santa Inés de Zaragoza'),(1496,20,'Zimatlán de Álvarez'),(1497,21,'Acajete'),(1498,21,'Acateno'),(1499,21,'Acatlán'),(1500,21,'Acatzingo'),(1501,21,'Acteopan'),(1502,21,'Ahuacatlán'),(1503,21,'Ahuatlán'),(1504,21,'Ahuatlán de Guadalupe'),(1505,21,'Ahuatlán de Libreros'),(1506,21,'Ajalpan'),(1507,21,'Albino Zertuche'),(1508,21,'Aljojuca'),(1509,21,'Altepexi'),(1510,21,'Amixtlán'),(1511,21,'Amozoc'),(1512,21,'Aquixtla'),(1513,21,'Atempan'),(1514,21,'Atexcal'),(1515,21,'Atlixco'),(1516,21,'Atoyatempan'),(1517,21,'Atzala'),(1518,21,'Atzitzihuacán'),(1519,21,'Atzitzintla'),(1520,21,'Axutla'),(1521,21,'Ayotoxco de Guerrero'),(1522,21,'Calpan'),(1523,21,'Caltepec'),(1524,21,'Camocuautla'),(1525,21,'Caxhuacan'),(1526,21,'Coatepec'),(1527,21,'Coatzingo'),(1528,21,'Cohetzala'),(1529,21,'Cohuecán'),(1530,21,'Coronango'),(1531,21,'Coxcatlán'),(1532,21,'Coyomeapan'),(1533,21,'Coyotepec'),(1534,21,'Cuapiaxtla de Madero'),(1535,21,'Cuautempan'),(1536,21,'Cuautinchán'),(1537,21,'Cuautlancingo'),(1538,21,'Cuayuca de Andrade'),(1539,21,'Cuetzalan del Progreso'),(1540,21,'Cuyoaco'),(1541,21,'Chalchicomula de Sesma'),(1542,21,'Chapulco'),(1543,21,'Chiautla'),(1544,21,'Chiautzingo'),(1545,21,'Chiconcuautla'),(1546,21,'Chichiquila'),(1547,21,'Chietla'),(1548,21,'Chigmecatitlán'),(1549,21,'Chignahuapan'),(1550,21,'Chignautla'),(1551,21,'Chila'),(1552,21,'Chila de la Sal'),(1553,21,'Huaquechula'),(1554,21,'Chilchotla'),(1555,21,'Chinantla'),(1556,21,'Coatzintla'),(1557,21,'Eloxochitlán'),(1558,21,'Epatlán'),(1559,21,'Esperanza'),(1560,21,'Francisco Z. Mena'),(1561,21,'General Felipe Ángeles'),(1562,21,'Guadalupe'),(1563,21,'Guadalupe Victoria'),(1564,21,'Hermenegildo Galeana'),(1565,21,'Honey'),(1566,21,'Huaquechula'),(1567,21,'Huatlatlauca'),(1568,21,'Huauchinango'),(1569,21,'Huehuetla'),(1570,21,'Huehuetlán el Chico'),(1571,21,'Huehuetlán el Grande'),(1572,21,'Huejotzingo'),(1573,21,'Hueyapan'),(1574,21,'Hueytamalco'),(1575,21,'Hueytlalpan'),(1576,21,'Huitzilan de Serdán'),(1577,21,'Huitziltepec'),(1578,21,'Ixcamilpa de Guerrero'),(1579,21,'Ixcaquixtla'),(1580,21,'Ixtacamaxtitlán'),(1581,21,'Ixtepec'),(1582,21,'Izúcar de Matamoros'),(1583,21,'Jalpan'),(1584,21,'Jolalpan'),(1585,21,'Jonotla'),(1586,21,'Jopala'),(1587,21,'Juan C. Bonilla'),(1588,21,'Juan Galindo'),(1589,21,'Juan N. Méndez'),(1590,21,'Lafragua'),(1591,21,'Libres'),(1592,21,'Los Reyes de Juárez'),(1593,21,'Mazapiltepec de Juárez'),(1594,21,'Mixtla'),(1595,21,'Molcaxac'),(1596,21,'Naupan'),(1597,21,'Nauzontla'),(1598,21,'Nealtican'),(1599,21,'Nicolás Bravo'),(1600,21,'Nopalucan'),(1601,21,'Ocotepec'),(1602,21,'Ocoyucan'),(1603,21,'Olintla'),(1604,21,'Oriental'),(1605,21,'Pahuatlán'),(1606,21,'Palmar de Bravo'),(1607,21,'Pantepec'),(1608,21,'Petlalcingo'),(1609,21,'Piaxtla'),(1610,21,'Puebla'),(1611,21,'Quecholac'),(1612,21,'Quimixtlán'),(1613,21,'Rafael Lara Grajales'),(1614,21,'Los Reyes de Juárez'),(1615,21,'San Andrés Cholula'),(1616,21,'San Antonio Cañada'),(1617,21,'San Diego la Mesa Tochimiltzingo'),(1618,21,'San Felipe Teotlalcingo'),(1619,21,'San Felipe Tepatlán'),(1620,21,'San Gabriel Chilac'),(1621,21,'San Gregorio Atzompa'),(1622,21,'San Jerónimo Tecuanipan'),(1623,21,'San Jerónimo Xayacatlán'),(1624,21,'San José Chiapa'),(1625,21,'San José Miahuatlán'),(1626,21,'San Juan Atenco'),(1627,21,'San Juan Atzompa'),(1628,21,'San Martín Texmelucan'),(1629,21,'San Martín Totoltepec'),(1630,21,'San Matías Tlalancaleca'),(1631,21,'San Miguel Ixitlán'),(1632,21,'San Miguel Xoxtla'),(1633,21,'San Nicolás Buenos Aires'),(1634,21,'San Nicolás de los Ranchos'),(1635,21,'San Pablo Anicano'),(1636,21,'San Pedro Cholula'),(1637,21,'San Pedro Yeloixtlahuaca'),(1638,21,'San Salvador el Seco'),(1639,21,'San Salvador el Verde'),(1640,21,'San Salvador Huixcolotla'),(1641,21,'San Sebastián Tlacotepec'),(1642,21,'Santa Catarina Tlaltempan'),(1643,21,'Santa Inés Ahuatempan'),(1644,21,'Santa Isabel Cholula'),(1645,21,'Santiago Miahuatlán'),(1646,21,'Santo Tomás Hueyotlipan'),(1647,21,'Soltepec'),(1648,21,'Tecomatlán'),(1649,21,'Tecpán de Galeana'),(1650,21,'Tehuacán'),(1651,21,'Tehuitzingo'),(1652,21,'Tenampulco'),(1653,21,'Teopantlán'),(1654,21,'Teotlalco'),(1655,21,'Tepanco de López'),(1656,21,'Tepango de Rodríguez'),(1657,21,'Tepatlaxco de Hidalgo'),(1658,21,'Tepeaca'),(1659,21,'Tepemaxalco'),(1660,21,'Tepeojuma'),(1661,21,'Tepetzintla'),(1662,21,'Tepexco'),(1663,21,'Tepexi de Rodríguez'),(1664,21,'Tepeyahualco'),(1665,21,'Tepeyahualco de Cuauhtémoc'),(1666,21,'Tetela de Ocampo'),(1667,21,'Teteles de Avila Castillo'),(1668,21,'Teziutlán'),(1669,21,'Tianguismanalco'),(1670,21,'Tlatlauquitepec'),(1671,21,'Tlachichuca'),(1672,21,'Tlacotepec de Benito Juárez'),(1673,21,'Tlacuilotepec'),(1674,21,'Tlahuapan'),(1675,21,'Tlaltenango'),(1676,21,'Tlanepantla'),(1677,21,'Tlaola'),(1678,21,'Tlapacoya'),(1679,21,'Tlapanalá'),(1680,21,'Tlatlauquitepec'),(1681,21,'Tlaxco'),(1682,21,'Tochimilco'),(1683,21,'Tochtepec'),(1684,21,'Totoltepec de Guerrero'),(1685,21,'Tulcingo'),(1686,21,'Tuzamapan de Galeana'),(1687,21,'Tzicatlacoyan'),(1688,21,'Venustiano Carranza'),(1689,21,'Vicente Guerrero'),(1690,21,'Xayacatlán de Bravo'),(1691,21,'Xicotepec'),(1692,21,'Xicotlán'),(1693,21,'Xiutetelco'),(1694,21,'Xochiapulco'),(1695,21,'Xochiltepec'),(1696,21,'Xochitlán de Vicente Suárez'),(1697,21,'Xochitlán Todos Santos'),(1698,21,'Yaonáhuac'),(1699,21,'Yehualtepec'),(1700,21,'Zacapala'),(1701,21,'Zacapoaxtla'),(1702,21,'Zacatlán'),(1703,21,'Zapotitlán'),(1704,21,'Zapotitlán de Méndez'),(1705,21,'Zapotitlán Salinas'),(1706,21,'Zacatepec'),(1707,21,'Zaragoza'),(1708,21,'Zautla'),(1709,21,'Zihuateutla'),(1710,21,'Zinacatepec'),(1711,21,'Zoquitlán'),(1712,21,'Zotoluca'),(1713,21,'Zoquiapan'),(1714,21,'Zoquiapam'),(1715,21,'Zaragoza'),(1716,22,'Amealco de Bonfil'),(1717,22,'Arroyo Seco'),(1718,22,'Cadereyta de Montes'),(1719,22,'Colón'),(1720,22,'Corregidora'),(1721,22,'El Marqués'),(1722,22,'Ezequiel Montes'),(1723,22,'Huimilpan'),(1724,22,'Jalpan de Serra'),(1725,22,'Landa de Matamoros'),(1726,22,'Pedro Escobedo'),(1727,22,'Peñamiller'),(1728,22,'Pinal de Amoles'),(1729,22,'Querétaro'),(1730,22,'San Joaquín'),(1731,22,'San Juan del Río'),(1732,22,'Tequisquiapan'),(1733,22,'Tolimán'),(1734,23,'Cozumel'),(1735,23,'Felipe Carrillo Puerto'),(1736,23,'Isla Mujeres'),(1737,23,'Othón P. Blanco'),(1738,23,'Benito Juárez'),(1739,23,'José María Morelos'),(1740,23,'Lázaro Cárdenas'),(1741,23,'Solidaridad'),(1742,23,'Tulum'),(1743,23,'Bacalar'),(1744,23,'Puerto Morelos'),(1745,24,'Ahualulco'),(1746,24,'Alaquines'),(1747,24,'Aquismón'),(1748,24,'Armadillo de los Infante'),(1749,24,'Axtla de Terrazas'),(1750,24,'Cárdenas'),(1751,24,'Catorce'),(1752,24,'Cedral'),(1753,24,'Cerritos'),(1754,24,'Cerro de San Pedro'),(1755,24,'Ciudad del Maíz'),(1756,24,'Ciudad Fernández'),(1757,24,'Ciudad Valles'),(1758,24,'Coxcatlán'),(1759,24,'Charcas'),(1760,24,'Ebano'),(1761,24,'Guadalcázar'),(1762,24,'Huehuetlán'),(1763,24,'Lagunillas'),(1764,24,'Matehuala'),(1765,24,'Mexquitic de Carmona'),(1766,24,'Moctezuma'),(1767,24,'Rayón'),(1768,24,'Rioverde'),(1769,24,'Salinas'),(1770,24,'San Antonio'),(1771,24,'San Ciro de Acosta'),(1772,24,'San Luis Potosí'),(1773,24,'San Martín Chalchicuautla'),(1774,24,'San Nicolás Tolentino'),(1775,24,'Santa Catarina'),(1776,24,'Santa María del Río'),(1777,24,'Santiago Tlapacoya'),(1778,24,'Santo Domingo'),(1779,24,'San Vicente Tancuayalab'),(1780,24,'Soledad de Graciano Sánchez'),(1781,24,'Tamasopo'),(1782,24,'Tamazunchale'),(1783,24,'Tampacán'),(1784,24,'Tampamolón Corona'),(1785,24,'Tamuín'),(1786,24,'Tancanhuitz'),(1787,24,'Tanlajás'),(1788,24,'Tanquián de Escobedo'),(1789,24,'Tierra Nueva'),(1790,24,'Vanegas'),(1791,24,'Venado'),(1792,24,'Villa de Arista'),(1793,24,'Villa de Arriaga'),(1794,24,'Villa de Guadalupe'),(1795,24,'Villa de la Paz'),(1796,24,'Villa de Ramos'),(1797,24,'Villa de Reyes'),(1798,24,'Villa Hidalgo'),(1799,24,'Villa Juárez'),(1800,24,'Xilitla'),(1801,24,'Zaragoza'),(1802,25,'Ahome'),(1803,25,'Angostura'),(1804,25,'Badiraguato'),(1805,25,'Concordia'),(1806,25,'Cosalá'),(1807,25,'Culiacán'),(1808,25,'Choix'),(1809,25,'Elota'),(1810,25,'Escuinapa'),(1811,25,'El Fuerte'),(1812,25,'Guasave'),(1813,25,'Mazatlán'),(1814,25,'Mocorito'),(1815,25,'Rosario'),(1816,25,'Salvador Alvarado'),(1817,25,'San Ignacio'),(1818,25,'Sinaloa'),(1819,25,'Navolato'),(1820,26,'Aconchi'),(1821,26,'Agua Prieta'),(1822,26,'Alamos'),(1823,26,'Altar'),(1824,26,'Arivechi'),(1825,26,'Arizpe'),(1826,26,'Atil'),(1827,26,'Bacadéhuachi'),(1828,26,'Bacanora'),(1829,26,'Bacerac'),(1830,26,'Bacoachi'),(1831,26,'Bácum'),(1832,26,'Banámichi'),(1833,26,'Baviácora'),(1834,26,'Bavispe'),(1835,26,'Benjamín Hill'),(1836,26,'Caborca'),(1837,26,'Cajeme'),(1838,26,'Cananea'),(1839,26,'Carbó'),(1840,26,'La Colorada'),(1841,26,'Cucurpe'),(1842,26,'Cumpas'),(1843,26,'Divisaderos'),(1844,26,'Empalme'),(1845,26,'Etchojoa'),(1846,26,'Fronteras'),(1847,26,'Granados'),(1848,26,'Guaymas'),(1849,26,'Hermosillo'),(1850,26,'Huachinera'),(1851,26,'Huásabas'),(1852,26,'Huatabampo'),(1853,26,'Huépac'),(1854,26,'Imuris'),(1855,26,'Magdalena'),(1856,26,'Mazatán'),(1857,26,'Moctezuma'),(1858,26,'Naco'),(1859,26,'Nácori Chico'),(1860,26,'Nacozari de García'),(1861,26,'Navojoa'),(1862,26,'Nogales'),(1863,26,'Ónavas'),(1864,26,'Opodepe'),(1865,26,'Oquitoa'),(1866,26,'Pitiquito'),(1867,26,'Puerto Peñasco'),(1868,26,'Quiriego'),(1869,26,'Rayón'),(1870,26,'Rosario'),(1871,26,'Sahuaripa'),(1872,26,'San Felipe de Jesús'),(1873,26,'San Javier'),(1874,26,'San Luis Río Colorado'),(1875,26,'San Miguel de Horcasitas'),(1876,26,'San Pedro de la Cueva'),(1877,26,'Santa Ana'),(1878,26,'Santa Cruz'),(1879,26,'Sáric'),(1880,26,'Soyopa'),(1881,26,'Suaqui Grande'),(1882,26,'Tepache'),(1883,26,'Trincheras'),(1884,26,'Tubutama'),(1885,26,'Ures'),(1886,26,'Villa Hidalgo'),(1887,26,'Villa Pesqueira'),(1888,26,'Yécora'),(1889,26,'General Plutarco Elías Calles'),(1890,26,'Benito Juárez'),(1891,26,'San Ignacio Río Muerto'),(1892,27,'Balancán'),(1893,27,'Cárdenas'),(1894,27,'Centla'),(1895,27,'Centro'),(1896,27,'Comalcalco'),(1897,27,'Cunduacán'),(1898,27,'Emiliano Zapata'),(1899,27,'Huimanguillo'),(1900,27,'Jalapa'),(1901,27,'Jalpa de Méndez'),(1902,27,'Jonuta'),(1903,27,'Macuspana'),(1904,27,'Nacajuca'),(1905,27,'Paraíso'),(1906,27,'Tacotalpa'),(1907,27,'Teapa'),(1908,27,'Tenosique'),(1909,28,'Abasolo'),(1910,28,'Aldama'),(1911,28,'Altamira'),(1912,28,'Antiguo Morelos'),(1913,28,'Burgos'),(1914,28,'Bustamante'),(1915,28,'Camargo'),(1916,28,'Casas'),(1917,28,'Ciudad Madero'),(1918,28,'Cruillas'),(1919,28,'Gómez Farías'),(1920,28,'González'),(1921,28,'Güémez'),(1922,28,'Guerrero'),(1923,28,'Gustavo Díaz Ordaz'),(1924,28,'Hidalgo'),(1925,28,'Jaumave'),(1926,28,'Jiménez'),(1927,28,'Llera'),(1928,28,'Mainero'),(1929,28,'El Mante'),(1930,28,'Matamoros'),(1931,28,'Méndez'),(1932,28,'Mier'),(1933,28,'Miguel Alemán'),(1934,28,'Miquihuana'),(1935,28,'Nuevo Laredo'),(1936,28,'Nuevo Morelos'),(1937,28,'Ocampo'),(1938,28,'Padilla'),(1939,28,'Palmillas'),(1940,28,'Reynosa'),(1941,28,'Río Bravo'),(1942,28,'San Carlos'),(1943,28,'San Fernando'),(1944,28,'San Nicolás'),(1945,28,'Soto la Marina'),(1946,28,'Tampico'),(1947,28,'Tula'),(1948,28,'Valle Hermoso'),(1949,28,'Victoria'),(1950,28,'Villagrán'),(1951,28,'Xicoténcatl'),(1952,29,'Amaxac de Guerrero'),(1953,29,'Apetatitlán de Antonio Carvajal'),(1954,29,'Atlangatepec'),(1955,29,'Atltzayanca'),(1956,29,'Apizaco'),(1957,29,'Calpulalpan'),(1958,29,'El Carmen Tequexquitla'),(1959,29,'Cuapiaxtla'),(1960,29,'Cuaxomulco'),(1961,29,'Chiautempan'),(1962,29,'Muñoz de Domingo Arenas'),(1963,29,'Españita'),(1964,29,'Huamantla'),(1965,29,'Hueyotlipan'),(1966,29,'Ixtacuixtla de Mariano Matamoros'),(1967,29,'Ixtenco'),(1968,29,'Mazatecochco de José María Morelos'),(1969,29,'Contla de Juan Cuamatzi'),(1970,29,'Tepetitla de Lardizábal'),(1971,29,'Sanctórum de Lázaro Cárdenas'),(1972,29,'Nanacamilpa de Mariano Arista'),(1973,29,'Acuamanala de Miguel Hidalgo'),(1974,29,'Natívitas'),(1975,29,'Panotla'),(1976,29,'San Pablo del Monte'),(1977,29,'Santa Cruz Tlaxcala'),(1978,29,'Tenancingo'),(1979,29,'Teolocholco'),(1980,29,'Tepeyanco'),(1981,29,'Terrenate'),(1982,29,'Tetla de la Solidaridad'),(1983,29,'Tetlatlahuca'),(1984,29,'Tlaxcala'),(1985,29,'Tlaxco'),(1986,29,'Tocatlán'),(1987,29,'Totolac'),(1988,29,'Ziltlaltépec de Trinidad Sánchez Santos'),(1989,29,'Tzompantepec'),(1990,29,'Xaloztoc'),(1991,29,'Xaltocan'),(1992,29,'Papalotla de Xicohténcatl'),(1993,29,'Xicohtzinco'),(1994,29,'Yauhquemehcan'),(1995,29,'Zacatelco'),(1996,29,'Benito Juárez'),(1997,29,'Emiliano Zapata'),(1998,29,'Lázaro Cárdenas'),(1999,29,'La Magdalena Tlaltelulco'),(2000,29,'San Damián Texóloc'),(2001,29,'San Francisco Tetlanohcan'),(2002,29,'San Jerónimo Zacualpan'),(2003,29,'San José Teacalco'),(2004,29,'San Juan Huactzinco'),(2005,29,'San Lorenzo Axocomanitla'),(2006,29,'San Lucas Tecopilco'),(2007,29,'Santa Ana Nopalucan'),(2008,29,'Santa Apolonia Teacalco'),(2009,29,'Santa Catarina Ayometla'),(2010,29,'Santa Cruz Quilehtla'),(2011,29,'Santa Isabel Xiloxoxtla'),(2012,30,'Acajete'),(2013,30,'Acatlán'),(2014,30,'Acayucan'),(2015,30,'Actopan'),(2016,30,'Acula'),(2017,30,'Acultzingo'),(2018,30,'Camarón de Tejeda'),(2019,30,'Alpatláhuac'),(2020,30,'Alto Lucero de Gutiérrez Barrios'),(2021,30,'Altotonga'),(2022,30,'Alvarado'),(2023,30,'Amatitlán'),(2024,30,'Naranjos Amatlán'),(2025,30,'Amatlán de los Reyes'),(2026,30,'Angel R. Cabada'),(2027,30,'La Antigua'),(2028,30,'Apazapan'),(2029,30,'Aquila'),(2030,30,'Astacinga'),(2031,30,'Atlahuilco'),(2032,30,'Atoyac'),(2033,30,'Atzacan'),(2034,30,'Atzalan'),(2035,30,'Tlaltetela'),(2036,30,'Ayahualulco'),(2037,30,'Banderilla'),(2038,30,'Benito Juárez'),(2039,30,'Boca del Río'),(2040,30,'Calcahualco'),(2041,30,'Camerino Z. Mendoza'),(2042,30,'Carrillo Puerto'),(2043,30,'Catemaco'),(2044,30,'Cazones de Herrera'),(2045,30,'Cerro Azul'),(2046,30,'Citlaltépetl'),(2047,30,'Coacoatzintla'),(2048,30,'Coahuitlán'),(2049,30,'Coatepec'),(2050,30,'Coatzacoalcos'),(2051,30,'Coatzintla'),(2052,30,'Coetzala'),(2053,30,'Colipa'),(2054,30,'Comapa'),(2055,30,'Córdoba'),(2056,30,'Cosamaloapan de Carpio'),(2057,30,'Cosautlán de Carvajal'),(2058,30,'Coscomatepec'),(2059,30,'Cosoleacaque'),(2060,30,'Cotaxtla'),(2061,30,'Coxquihui'),(2062,30,'Coyutla'),(2063,30,'Cuichapa'),(2064,30,'Cuitláhuac'),(2065,30,'Chacaltianguis'),(2066,30,'Chalma'),(2067,30,'Chiconamel'),(2068,30,'Chiconquiaco'),(2069,30,'Chicontepec'),(2070,30,'Chinameca'),(2071,30,'Chinampa de Gorostiza'),(2072,30,'Las Choapas'),(2073,30,'Chocamán'),(2074,30,'Chontla'),(2075,30,'Chumatlán'),(2076,30,'Emiliano Zapata'),(2077,30,'Espinal'),(2078,30,'Filomeno Mata'),(2079,30,'Fortín'),(2080,30,'Gutiérrez Zamora'),(2081,30,'Hidalgotitlán'),(2082,30,'Huatusco'),(2083,30,'Huayacocotla'),(2084,30,'Hueyapan de Ocampo'),(2085,30,'Huiloapan de Cuauhtémoc'),(2086,30,'Ignacio de la Llave'),(2087,30,'Ilamatlán'),(2088,30,'Isla'),(2089,30,'Ixcatepec'),(2090,30,'Ixhuacán de los Reyes'),(2091,30,'Ixhuatlán del Café'),(2092,30,'Ixhuatlancillo'),(2093,30,'Ixhuatlán del Sureste'),(2094,30,'Ixhuatlán de Madero'),(2095,30,'Ixmatlahuacan'),(2096,30,'Ixtaczoquitlán'),(2097,30,'Jalacingo'),(2098,30,'Xalapa'),(2099,30,'Jalcomulco'),(2100,30,'Jáltipan'),(2101,30,'Jamapa'),(2102,30,'Jesús Carranza'),(2103,30,'Xico'),(2104,30,'Jilotepec'),(2105,30,'Juan Rodríguez Clara'),(2106,30,'Juchique de Ferrer'),(2107,30,'Landero y Coss'),(2108,30,'Lerdo de Tejada'),(2109,30,'Magdalena'),(2110,30,'Maltrata'),(2111,30,'Manlio Fabio Altamirano'),(2112,30,'Mariano Escobedo'),(2113,30,'Martínez de la Torre'),(2114,30,'Mecatlán'),(2115,30,'Mecayapan'),(2116,30,'Medellín de Bravo'),(2117,30,'Miahuatlán'),(2118,30,'Las Minas'),(2119,30,'Minatitlán'),(2120,30,'Misantla'),(2121,30,'Mixtla de Altamirano'),(2122,30,'Moloacán'),(2123,30,'Naolinco'),(2124,30,'Naranjal'),(2125,30,'Nautla'),(2126,30,'Nogales'),(2127,30,'Oluta'),(2128,30,'Omealca'),(2129,30,'Orizaba'),(2130,30,'Otatitlán'),(2131,30,'Oteapan'),(2132,30,'Ozuluama de Mascareñas'),(2133,30,'Pajapan'),(2134,30,'Pánuco'),(2135,30,'Papantla'),(2136,30,'Paso del Macho'),(2137,30,'Paso de Ovejas'),(2138,30,'La Perla'),(2139,30,'Perote'),(2140,30,'Platón Sánchez'),(2141,30,'Playa Vicente'),(2142,30,'Poza Rica de Hidalgo'),(2143,30,'Las Vigas de Ramírez'),(2144,30,'Pueblo Viejo'),(2145,30,'Puente Nacional'),(2146,30,'Rafael Delgado'),(2147,30,'Rafael Lucio'),(2148,30,'Los Reyes'),(2149,30,'Río Blanco'),(2150,30,'Saltabarranca'),(2151,30,'San Andrés Tenejapan'),(2152,30,'San Andrés Tuxtla'),(2153,30,'San Juan Evangelista'),(2154,30,'Santiago Tuxtla'),(2155,30,'Sayula de Alemán'),(2156,30,'Soconusco'),(2157,30,'Sochiapa'),(2158,30,'Soledad Atzompa'),(2159,30,'Soledad de Doblado'),(2160,30,'Soteapan'),(2161,30,'Tamalín'),(2162,30,'Tamiahua'),(2163,30,'Tampico Alto'),(2164,30,'Tancoco'),(2165,30,'Tantima'),(2166,30,'Tantoyuca'),(2167,30,'Tatatila'),(2168,30,'Castillo de Teayo'),(2169,30,'Tecolutla'),(2170,30,'Tehuipango'),(2171,30,'Álamo Temapache'),(2172,30,'Tempoal'),(2173,30,'Tenampa'),(2174,30,'Tenochtitlán'),(2175,30,'Teocelo'),(2176,30,'Tepatlaxco'),(2177,30,'Tepetlán'),(2178,30,'Tepetzintla'),(2179,30,'Tequila'),(2180,30,'José Azueta'),(2181,30,'Texcatepec'),(2182,30,'Texhuacán'),(2183,30,'Texistepec'),(2184,30,'Tezonapa'),(2185,30,'Tierra Blanca'),(2186,30,'Tihuatlán'),(2187,30,'Tlacojalpan'),(2188,30,'Tlacolulan'),(2189,30,'Tlacotalpan'),(2190,30,'Tlacotepec de Mejía'),(2191,30,'Tlachichilco'),(2192,30,'Tlalixcoyan'),(2193,30,'Tlalnelhuayocan'),(2194,30,'Tlapacoyan'),(2195,30,'Tlaquilpa'),(2196,30,'Tlilapan'),(2197,30,'Tomatlán'),(2198,30,'Tonayán'),(2199,30,'Totutla'),(2200,30,'Tuxpan'),(2201,30,'Tuxtilla'),(2202,30,'Ursulo Galván'),(2203,30,'Vega de Alatorre'),(2204,30,'Veracruz'),(2205,30,'Villa Aldama'),(2206,30,'Xoxocotla'),(2207,30,'Yanga'),(2208,30,'Yecuatla'),(2209,30,'Zacualpan'),(2210,30,'Zaragoza'),(2211,30,'Zentla'),(2212,30,'Zongolica'),(2213,30,'Zontecomatlán de López y Fuentes'),(2214,30,'Zozocolco de Hidalgo'),(2215,30,'Agua Dulce'),(2216,30,'El Higo'),(2217,30,'Nanchital de Lázaro Cárdenas del Río'),(2218,30,'Tres Valles'),(2219,30,'Carlos A. Carrillo'),(2220,30,'Tatahuicapan de Juárez'),(2221,30,'Uxpanapa'),(2222,30,'San Rafael'),(2223,30,'Santiago Sochiapan'),(2224,31,'Abalá'),(2225,31,'Acanceh'),(2226,31,'Akil'),(2227,31,'Baca'),(2228,31,'Bokobá'),(2229,31,'Buctzotz'),(2230,31,'Cacalchén'),(2231,31,'Calotmul'),(2232,31,'Cansahcab'),(2233,31,'Cantamayec'),(2234,31,'Celestún'),(2235,31,'Cenotillo'),(2236,31,'Conkal'),(2237,31,'Cuncunul'),(2238,31,'Cuzamá'),(2239,31,'Chacsinkín'),(2240,31,'Chankom'),(2241,31,'Chapab'),(2242,31,'Chemax'),(2243,31,'Chicxulub Pueblo'),(2244,31,'Chichimilá'),(2245,31,'Chikindzonot'),(2246,31,'Chocholá'),(2247,31,'Chumayel'),(2248,31,'Dzán'),(2249,31,'Dzemul'),(2250,31,'Dzidzantún'),(2251,31,'Dzilam de Bravo'),(2252,31,'Dzilam González'),(2253,31,'Dzitás'),(2254,31,'Dzoncauich'),(2255,31,'Espita'),(2256,31,'Halachó'),(2257,31,'Hocabá'),(2258,31,'Hoctún'),(2259,31,'Homún'),(2260,31,'Huhí'),(2261,31,'Hunucmá'),(2262,31,'Ixil'),(2263,31,'Izamal'),(2264,31,'Kanasín'),(2265,31,'Kantunil'),(2266,31,'Kaua'),(2267,31,'Kinchil'),(2268,31,'Kopomá'),(2269,31,'Mama'),(2270,31,'Maní'),(2271,31,'Maxcanú'),(2272,31,'Mayapán'),(2273,31,'Mérida'),(2274,31,'Mocochá'),(2275,31,'Motul'),(2276,31,'Muna'),(2277,31,'Muxupip'),(2278,31,'Opichén'),(2279,31,'Oxkutzcab'),(2280,31,'Panabá'),(2281,31,'Peto'),(2282,31,'Progreso'),(2283,31,'Quintana Roo'),(2284,31,'Río Lagartos'),(2285,31,'Sacalum'),(2286,31,'Samahil'),(2287,31,'Sanahcat'),(2288,31,'San Felipe'),(2289,31,'Santa Elena'),(2290,31,'Seyé'),(2291,31,'Sinanché'),(2292,31,'Sotuta'),(2293,31,'Sucilá'),(2294,31,'Sudzal'),(2295,31,'Suma'),(2296,31,'Tahdziú'),(2297,31,'Tahmek'),(2298,31,'Teabo'),(2299,31,'Tecoh'),(2300,31,'Tekal de Venegas'),(2301,31,'Tekantó'),(2302,31,'Tekax'),(2303,31,'Tekit'),(2304,31,'Tekom'),(2305,31,'Telchac Pueblo'),(2306,31,'Telchac Puerto'),(2307,31,'Temax'),(2308,31,'Temozón'),(2309,31,'Tepakán'),(2310,31,'Tetiz'),(2311,31,'Teya'),(2312,31,'Ticul'),(2313,31,'Timucuy'),(2314,31,'Tinum'),(2315,31,'Tixcacalcupul'),(2316,31,'Tixkokob'),(2317,31,'Tixmehuac'),(2318,31,'Tixpéhual'),(2319,31,'Tizimín'),(2320,31,'Tunkás'),(2321,31,'Tzucacab'),(2322,31,'Uayma'),(2323,31,'Ucú'),(2324,31,'Umán'),(2325,31,'Valladolid'),(2326,31,'Xocchel'),(2327,31,'Yaxcabá'),(2328,31,'Yaxkukul'),(2329,31,'Yobaín'),(2330,32,'Apozol'),(2331,32,'Apulco'),(2332,32,'Atolinga'),(2333,32,'Benito Juárez'),(2334,32,'Calera'),(2335,32,'Cañitas de Felipe Pescador'),(2336,32,'Concepción del Oro'),(2337,32,'Cuauhtémoc'),(2338,32,'Chalchihuites'),(2339,32,'Fresnillo'),(2340,32,'Trinidad García de la Cadena'),(2341,32,'Genaro Codina'),(2342,32,'General Enrique Estrada'),(2343,32,'General Francisco R. Murguía'),(2344,32,'El Plateado de Joaquín Amaro'),(2345,32,'General Pánfilo Natera'),(2346,32,'Guadalupe'),(2347,32,'Huanusco'),(2348,32,'Jalpa'),(2349,32,'Jerez'),(2350,32,'Jiménez del Teul'),(2351,32,'Juan Aldama'),(2352,32,'Juchipila'),(2353,32,'Loreto'),(2354,32,'Luis Moya'),(2355,32,'Mazapil'),(2356,32,'Melchor Ocampo'),(2357,32,'Mezquital del Oro'),(2358,32,'Miguel Auza'),(2359,32,'Momax'),(2360,32,'Monte Escobedo'),(2361,32,'Morelos'),(2362,32,'Moyahua de Estrada'),(2363,32,'Nochistlán de Mejía'),(2364,32,'Noria de Ángeles'),(2365,32,'Ojocaliente'),(2366,32,'Pánuco'),(2367,32,'Pinos'),(2368,32,'Río Grande'),(2369,32,'Sain Alto'),(2370,32,'El Salvador'),(2371,32,'Sombrerete'),(2372,32,'Susticacán'),(2373,32,'Tabasco'),(2374,32,'Tepechitlán'),(2375,32,'Tepetongo'),(2376,32,'Teúl de González Ortega'),(2377,32,'Tlaltenango de Sánchez Román'),(2378,32,'Valparaíso'),(2379,32,'Vetagrande'),(2380,32,'Villa de Cos'),(2381,32,'Villa García'),(2382,32,'Villa González Ortega'),(2383,32,'Villa Hidalgo'),(2384,32,'Villanueva'),(2385,32,'Zacatecas'),(2386,32,'Trancoso'),(2387,32,'Santa María de la Paz'),(2388,23,'Cancún');
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nombreCliente` varchar(100) DEFAULT NULL,
  `descripcionCliente` longtext,
  `telefonoCliente` varchar(45) DEFAULT NULL,
  `emailCliente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `idDetalleVenta` int NOT NULL AUTO_INCREMENT,
  `idVenta` bigint NOT NULL,
  `idProducto` bigint NOT NULL,
  `cantidad` int DEFAULT '1',
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idDetalleVenta`,`idVenta`),
  KEY `fk_detalle_venta_ventas1_idx` (`idVenta`),
  KEY `fk_detalle_venta_productos1_idx` (`idProducto`),
  CONSTRAINT `fk_detalle_venta_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  CONSTRAINT `fk_detalle_venta_ventas1` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_republica`
--

DROP TABLE IF EXISTS `estados_republica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_republica` (
  `idEstadoRep` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idEstadoRep`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_republica`
--

LOCK TABLES `estados_republica` WRITE;
/*!40000 ALTER TABLE `estados_republica` DISABLE KEYS */;
INSERT INTO `estados_republica` VALUES (1,'Aguascalientes'),(2,'Baja California'),(3,'Baja California Sur'),(4,'Campeche'),(5,'CDMX'),(6,'Chiapas'),(7,'Chihuahua'),(8,'Coahuila'),(9,'Colima'),(10,'Durango'),(11,'Estado de México'),(12,'Guanajuato'),(13,'Guerrero'),(14,'Hidalgo'),(15,'Jalisco'),(16,'Michoacán'),(17,'Morelos'),(18,'Nayarit'),(19,'Nuevo León'),(20,'Oaxaca'),(21,'Puebla'),(22,'Querétaro'),(23,'Quintana Roo'),(24,'San Luis Potosí'),(25,'Sinaloa'),(26,'Sonora'),(27,'Tabasco'),(28,'Tamaulipas'),(29,'Tlaxcala'),(30,'Veracruz'),(31,'Yucatán'),(32,'Zacatecas');
/*!40000 ALTER TABLE `estados_republica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventarios`
--

DROP TABLE IF EXISTS `inventarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventarios` (
  `idProducto` bigint NOT NULL,
  `idSucursal` int NOT NULL,
  `cantidadDisponible` bigint DEFAULT '0',
  `idTipoCantidad` int DEFAULT '1',
  PRIMARY KEY (`idProducto`,`idSucursal`),
  KEY `fk_inventarios_sucursales1_idx` (`idSucursal`),
  KEY `fk_inventarios_tipoCantidades1_idx` (`idTipoCantidad`),
  CONSTRAINT `fk_inventarios_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  CONSTRAINT `fk_inventarios_sucursales1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`),
  CONSTRAINT `fk_inventarios_tipoCantidades1` FOREIGN KEY (`idTipoCantidad`) REFERENCES `tipocantidades` (`idTipoCantidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventarios`
--

LOCK TABLES `inventarios` WRITE;
/*!40000 ALTER TABLE `inventarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles_usuario`
--

DROP TABLE IF EXISTS `perfiles_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfiles_usuario` (
  `idPerfilUsuario` int NOT NULL AUTO_INCREMENT,
  `perfilUsuario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idPerfilUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles_usuario`
--

LOCK TABLES `perfiles_usuario` WRITE;
/*!40000 ALTER TABLE `perfiles_usuario` DISABLE KEYS */;
INSERT INTO `perfiles_usuario` VALUES (1,'Administrador'),(2,'Gerente'),(3,'Vendedor');
/*!40000 ALTER TABLE `perfiles_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProducto` bigint NOT NULL AUTO_INCREMENT,
  `idCategoria` int DEFAULT NULL,
  `nombreProducto` varchar(45) DEFAULT NULL,
  `descripcionProducto` longtext,
  `precioTaller` decimal(10,2) DEFAULT NULL,
  `precioPublico` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `fk_productos_categorias1_idx` (`idCategoria`),
  CONSTRAINT `fk_productos_categorias1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoriaProd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_has_proveedores`
--

DROP TABLE IF EXISTS `productos_has_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_has_proveedores` (
  `idProducto` bigint NOT NULL,
  `idProveedor` int NOT NULL,
  PRIMARY KEY (`idProducto`,`idProveedor`),
  KEY `fk_productos_has_proveedores_proveedores1_idx` (`idProveedor`),
  KEY `fk_productos_has_proveedores_productos1_idx` (`idProducto`),
  CONSTRAINT `fk_productos_has_proveedores_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  CONSTRAINT `fk_productos_has_proveedores_proveedores1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_has_proveedores`
--

LOCK TABLES `productos_has_proveedores` WRITE;
/*!40000 ALTER TABLE `productos_has_proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_has_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idProveedor` int NOT NULL AUTO_INCREMENT,
  `nombreProveedor` varchar(100) DEFAULT NULL,
  `descripcionProveedor` longtext,
  `telefonoProveedor` varchar(45) DEFAULT NULL,
  `emailProveedor` varchar(100) DEFAULT NULL,
  `urlSitioProveedor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursales` (
  `idSucursal` int NOT NULL AUTO_INCREMENT,
  `nombreSucursal` longtext,
  `idCiudad` int DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` longtext,
  `codigoPostal` int DEFAULT NULL,
  PRIMARY KEY (`idSucursal`),
  KEY `fk_sucursales_ciudades1_idx` (`idCiudad`),
  CONSTRAINT `fk_sucursales_ciudades1` FOREIGN KEY (`idCiudad`) REFERENCES `ciudades` (`idCiudad`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` VALUES (1,'Chihuahua',179,'6143824161','C. Gonzalez Cossio #6711',31100),(2,'Monterrey',914,NULL,NULL,NULL),(6,'Los Cabos',23,'6147893434','C. Av Vallarta #59329',31101),(7,'Parral 2',23,'6147893434','C. Av Vallarta #59329',31101),(8,'Parral 3',321,'6147893434','C. Av Vallarta #59329',31101),(9,'sucursal 4',32,'6147893434','C. Av Vallarta #59329',31101),(10,'sucursal 5',432,'6147893434','C. Av Vallarta #59329',31101),(14,'sucursal 6',42,'6147893434','C. Av Vallarta #59329',31101);
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocantidades`
--

DROP TABLE IF EXISTS `tipocantidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipocantidades` (
  `idTipoCantidad` int NOT NULL AUTO_INCREMENT,
  `tipoCantidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoCantidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocantidades`
--

LOCK TABLES `tipocantidades` WRITE;
/*!40000 ALTER TABLE `tipocantidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipocantidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipospago`
--

DROP TABLE IF EXISTS `tipospago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipospago` (
  `idTipoPago` int NOT NULL AUTO_INCREMENT,
  `tipoPago` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipospago`
--

LOCK TABLES `tipospago` WRITE;
/*!40000 ALTER TABLE `tipospago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipospago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` bigint NOT NULL AUTO_INCREMENT,
  `idPerfilUsuario` int NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contrasena` longtext NOT NULL,
  `nombre` longtext NOT NULL,
  `fechaCreacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `fechaActualizacion` datetime DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `fechaIngreso` datetime DEFAULT CURRENT_TIMESTAMP,
  `nss` varchar(45) DEFAULT NULL,
  `activo` tinyint DEFAULT '1',
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `idUsuario` (`idUsuario`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `fk_usuarios_perfiles_usuario1_idx` (`idPerfilUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,'admin@lacasadelrzr.com','','Admin','2023-10-01 11:39:10',NULL,'6143824161',NULL,NULL,1),(2,2,'gerente1@lacasadelrzr.com','','Gerente 1','2023-10-01 14:04:05',NULL,'6143824161',NULL,NULL,1),(3,3,'vendedor1@lacasadelrzr.com','','Vendedor 1','2023-10-01 14:04:05',NULL,'6143824161',NULL,NULL,1),(5,3,'vendedor3@lacasadelrzr.com','12345678','Vendedor #3','2023-10-02 15:55:34',NULL,'689-098-3567','2023-10-02 00:00:00','69869027745',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_has_sucursales`
--

DROP TABLE IF EXISTS `usuarios_has_sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_has_sucursales` (
  `idUsuario` bigint NOT NULL,
  `idSucursal` int NOT NULL,
  PRIMARY KEY (`idUsuario`,`idSucursal`),
  KEY `fk_usuarios_has_sucursales_sucursales1_idx` (`idSucursal`),
  KEY `fk_usuarios_has_sucursales_usuarios1_idx` (`idUsuario`),
  CONSTRAINT `fk_uhs_sucursales-1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`),
  CONSTRAINT `fk_uhs_usuarios_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_has_sucursales`
--

LOCK TABLES `usuarios_has_sucursales` WRITE;
/*!40000 ALTER TABLE `usuarios_has_sucursales` DISABLE KEYS */;
INSERT INTO `usuarios_has_sucursales` VALUES (1,1),(5,1),(1,14),(5,14);
/*!40000 ALTER TABLE `usuarios_has_sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `idVenta` bigint NOT NULL AUTO_INCREMENT,
  `idVendedor` bigint NOT NULL,
  `idCliente` int DEFAULT NULL,
  `idTipoPago` int DEFAULT '1',
  `fechaVenta` datetime DEFAULT CURRENT_TIMESTAMP,
  `totalVenta` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `fk_ventas_clientes1_idx` (`idCliente`),
  KEY `fk_ventas_usuarios1_idx` (`idVendedor`),
  KEY `fk_ventas_tiposPago1_idx` (`idTipoPago`),
  CONSTRAINT `fk_ventas_clientes1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  CONSTRAINT `fk_ventas_tiposPago1` FOREIGN KEY (`idTipoPago`) REFERENCES `tipospago` (`idTipoPago`),
  CONSTRAINT `fk_ventas_usuarios_1` FOREIGN KEY (`idVendedor`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'casa_rzr_development'
--

--
-- Dumping routines for database 'casa_rzr_development'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-08 10:30:11
