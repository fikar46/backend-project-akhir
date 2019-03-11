-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: warehousenesia
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Table structure for table `alamat`
--

DROP TABLE IF EXISTS `alamat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alamat` (
  `id_alamat` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `address2` varchar(45) NOT NULL,
  `kota` varchar(45) NOT NULL,
  `profinsi` varchar(45) NOT NULL,
  `kodepos` varchar(45) NOT NULL,
  PRIMARY KEY (`id_alamat`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alamat`
--

LOCK TABLES `alamat` WRITE;
/*!40000 ALTER TABLE `alamat` DISABLE KEYS */;
INSERT INTO `alamat` VALUES (16,'rosy','fikar','meylendra','jl jati 2 no 37 cluster jati ','','tangerang','banten','15119'),(17,'fikar46','m zulfikar ','meylendra','jl jati 2 no 37 cluster jati ','','tangerang','banten','15119');
/*!40000 ALTER TABLE `alamat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bukti_pembayaran`
--

DROP TABLE IF EXISTS `bukti_pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bukti_pembayaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `bank` varchar(45) NOT NULL,
  `norek` varchar(45) NOT NULL,
  `id_order` varchar(45) NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bukti_pembayaran`
--

LOCK TABLES `bukti_pembayaran` WRITE;
/*!40000 ALTER TABLE `bukti_pembayaran` DISABLE KEYS */;
INSERT INTO `bukti_pembayaran` VALUES (11,'rosy','BNI','24323123','warehouse-TW3XDnesia','/brand/images/PRD1551150630501.png','Sudah terverifikasi','2/26/2019, 10:10:20 AM'),(12,'fikar46','MANDIRI','24323123','warehouse-cnGh4nesia','/brand/images/PRD1551162630874.png','Sudah terverifikasi','2/26/2019, 1:29:34 PM');
/*!40000 ALTER TABLE `bukti_pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `id_product` varchar(45) NOT NULL,
  `qty` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (4,'rosy','1','10','2019-02-26T06:41:30.892Z'),(6,'rosy','5','1','2019-02-26T07:06:35.476Z'),(7,'david','1','1','2019-02-26T07:19:35.853Z');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  `image` varchar(450) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Japan','http://warehousenesia.id/image/negara/Japan@2x.jpg'),(2,'Singapore','http://warehousenesia.id/image/negara/Singapore@2x.jpg'),(3,'South Korea','http://warehousenesia.id/image/negara/South%20Korea@2x.jpg'),(4,'Hongkong','http://warehousenesia.id/image/negara/Hong%20Kong@2x.jpg'),(5,'Malaysia','http://warehousenesia.id/image/negara/Malaysia@2x.jpg'),(6,'United State','http://warehousenesia.id/image/negara/United%20States@2x.jpg');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gambar_produk`
--

DROP TABLE IF EXISTS `gambar_produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gambar_produk` (
  `id_produk` int(11) NOT NULL,
  `gambar1` varchar(545) NOT NULL,
  `gambar2` varchar(545) NOT NULL,
  `gambar3` varchar(455) NOT NULL,
  PRIMARY KEY (`id_produk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gambar_produk`
--

LOCK TABLES `gambar_produk` WRITE;
/*!40000 ALTER TABLE `gambar_produk` DISABLE KEYS */;
INSERT INTO `gambar_produk` VALUES (1,'https://mm-imgs.s3.amazonaws.com/p/2018/04/24/21/nike-tanjun-sepatu-sneakers-pria-26-wanita_4549718_1_79602.jpg','https://s0.bukalapak.com/img/5183480011/w-1000/sepatu_nike_nike_Tajun_black_sneakers_nike_original.jpg',''),(2,'https://stockx.imgix.net/Adidas-Yeezy-Boost-350-V2-Core-Black-Red-2017-Product.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&q=90&dpr=2&trim=color&updated_at=1538080256','',''),(3,'https://ae01.alicdn.com/kf/HTB1YzeoeEcKL1JjSZFzq6AfJXXaa/2017-Women-Running-Shoes-Breathable-Women-Sneaker-Outdoor-Sports-Shoes-Ladies-White-Shoes-Comfortable-Sports-Athletic.jpg_640x640.jpg','',''),(4,'https://ii.worldmarket.com/fcgi-bin/iipsrv.fcgi?FIF=/images/worldmarket/source/60341_XXX_v1.tif&wid=650&cvt=jpeg','',''),(5,'https://s.pacn.ws/640/9n/pa.173987.2.jpg?o3b11j','',''),(6,'https://cdn.shopify.com/s/files/1/0033/7333/4643/products/product-image-646300959_800x.jpg?v=1529725719','',''),(14,'https://i.pinimg.com/originals/a7/95/45/a7954575f186a36485f732d9777c8c41.jpg','',''),(15,'https://ae01.alicdn.com/kf/HTB1phcdKpXXXXbQXXXXq6xXFXXXr/25-cm-Kualitas-Tinggi-Model-NARUTO-Action-Figure-Naruto-Cosplay-Yondaime-Hokage-Yondaime-Hokage-Cloak-Naruto.jpg','',''),(16,'http://3.bp.blogspot.com/_oxCW9xixeMY/TMkB0GxrNAI/AAAAAAAAABg/-fq7oR5dX84/s1600/gantungankunci1b.jpg','http://3.bp.blogspot.com/_oxCW9xixeMY/TMkB0GxrNAI/AAAAAAAAABg/-fq7oR5dX84/s1600/gantungankunci1b.jpg','http://3.bp.blogspot.com/_oxCW9xixeMY/TMkB0GxrNAI/AAAAAAAAABg/-fq7oR5dX84/s1600/gantungankunci1b.jpg'),(17,'http://3.bp.blogspot.com/_oxCW9xixeMY/TMkB0GxrNAI/AAAAAAAAABg/-fq7oR5dX84/s1600/gantungankunci1b.jpg','','');
/*!40000 ALTER TABLE `gambar_produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (1,'men\'s fashion'),(2,'woman\'s fashion'),(3,'Collection and hobby'),(4,'Food');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_user`
--

DROP TABLE IF EXISTS `order_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_user` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `id_product` varchar(45) NOT NULL,
  `qty` varchar(45) NOT NULL,
  `date` varchar(145) NOT NULL,
  `status` varchar(45) NOT NULL,
  `orderId` varchar(45) NOT NULL,
  PRIMARY KEY (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_user`
--

LOCK TABLES `order_user` WRITE;
/*!40000 ALTER TABLE `order_user` DISABLE KEYS */;
INSERT INTO `order_user` VALUES (24,'rosy','2','1','2019-02-26T03:10:16.180Z','done','warehouse-TW3XDnesia'),(25,'rosy','3','1','2019-02-26T03:10:16.182Z','done','warehouse-TW3XDnesia'),(26,'fikar46','1','1','2019-02-26T06:27:08.857Z','done','warehouse-cnGh4nesia'),(27,'fikar46','1','2','2019-02-26T06:29:24.493Z','pending','warehouse-NraCunesia');
/*!40000 ALTER TABLE `order_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produk`
--

DROP TABLE IF EXISTS `produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  `harga` varchar(45) NOT NULL,
  `deskripsi` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `kategori` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk`
--

LOCK TABLES `produk` WRITE;
/*!40000 ALTER TABLE `produk` DISABLE KEYS */;
INSERT INTO `produk` VALUES (1,'sepatu nike','1500000','sepatunya anjay','1','1'),(2,'adidas yeezy','56000000','yoooooo yeezy gueee siapppp yoooooooo','2','1'),(3,'running shoes girl','350000','sepatu cewe','1','2'),(4,'kit kat green tea','100000','coklatnya yahud','1','4'),(5,'cd akb 48','2500000','untuk para wota','1','3'),(6,'luffy one pieced','750000','gomu gomu no','1','3'),(14,'kurama','50000000','action figure kurama yang besar','1','3'),(15,'naruto','250000','narutoneh','1','3'),(16,'gantungan kunci','50000','gantungan kuncinya gokil','2','3'),(17,'sepatu reebok','450000','sepatu aja','2','1');
/*!40000 ALTER TABLE `produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promo`
--

DROP TABLE IF EXISTS `promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promo` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `potongan` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promo`
--

LOCK TABLES `promo` WRITE;
/*!40000 ALTER TABLE `promo` DISABLE KEYS */;
INSERT INTO `promo` VALUES (1,'SELASACERIA','0.2');
/*!40000 ALTER TABLE `promo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(45) NOT NULL,
  `harga` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
INSERT INTO `transaksi` VALUES (6,'warehouse-TW3XDnesia','Rp 56.350.000,00'),(7,'warehouse-cnGh4nesia','Rp 1.200.000,00'),(8,'warehouse-NraCunesia','Rp 3.000.000,00');
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(145) NOT NULL,
  `email` varchar(145) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'fikar','mzulfikarm@gmail.com','082210996848','fikar123'),(2,'rosy','rosyradika@gmail.com','082210996848','rosy123'),(3,'admin','mzulfikarm@gmail.com','082210996848','admin'),(4,'fikar46','mzulfikarm@outlook.com','082210996848','fikar123'),(5,'david','david@gmail.com','0822109921','david123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-11 12:51:50
