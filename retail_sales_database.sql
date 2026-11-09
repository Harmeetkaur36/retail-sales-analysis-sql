-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: retail_sales_project
-- ------------------------------------------------------
-- Server version	8.4.11-0ubuntu0.26.04.1

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (101,'Rahul Sharma','Delhi','India','Male'),(102,'Priya Singh','Mumbai','India','Female'),(103,'Aman Verma','Bangalore','India','Male'),(104,'Simran Kaur','Chandigarh','India','Female'),(105,'Rohit Mehta','Pune','India','Male'),(106,'Neha Gupta','Delhi','India','Female'),(107,'Arjun Patel','Ahmedabad','India','Male'),(108,'Kavya Reddy','Hyderabad','India','Female'),(109,'Vikram Singh','Jaipur','India','Male'),(110,'Anjali Sharma','Mumbai','India','Female'),(111,'Karan Malhotra','Bangalore','India','Male'),(112,'Pooja Das','Kolkata','India','Female'),(113,'Sahil Kapoor','Chandigarh','India','Male'),(114,'Meera Nair','Chennai','India','Female'),(115,'Dev Patel','Ahmedabad','India','Male');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `detail_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,5001,201,2,55000.00),(2,5001,205,1,500.00),(3,5002,202,1,25000.00),(4,5002,203,2,1500.00),(5,5003,204,2,800.00),(6,5003,209,3,120.00),(7,5004,206,1,7500.00),(8,5004,210,2,350.00),(9,5005,207,1,6000.00),(10,5005,208,5,80.00),(11,5006,201,1,55000.00),(12,5006,212,1,4500.00),(13,5007,211,2,1200.00),(14,5007,209,4,120.00),(15,5008,214,1,12000.00),(16,5008,203,1,1500.00),(17,5009,213,1,8500.00),(18,5009,208,10,80.00),(19,5010,202,2,25000.00),(20,5010,205,2,500.00),(21,5011,206,2,7500.00),(22,5011,210,3,350.00),(23,5012,215,2,600.00),(24,5012,208,5,80.00),(25,5013,201,1,55000.00),(26,5013,204,1,800.00),(27,5014,212,2,4500.00),(28,5014,211,1,1200.00),(29,5015,207,2,6000.00),(30,5015,209,5,120.00);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `payment_mode` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (5001,101,'2026-01-05','UPI'),(5002,102,'2026-01-08','Credit Card'),(5003,103,'2026-01-12','Cash'),(5004,104,'2026-01-15','UPI'),(5005,105,'2026-01-20','Debit Card'),(5006,106,'2026-02-02','UPI'),(5007,107,'2026-02-05','Cash'),(5008,108,'2026-02-10','Credit Card'),(5009,109,'2026-02-14','UPI'),(5010,110,'2026-02-18','Debit Card'),(5011,111,'2026-03-01','UPI'),(5012,112,'2026-03-05','Cash'),(5013,113,'2026-03-09','Credit Card'),(5014,114,'2026-03-15','UPI'),(5015,115,'2026-03-20','Debit Card'),(5016,101,'2026-03-25','Credit Card'),(5017,103,'2026-04-02','UPI'),(5018,105,'2026-04-08','Cash'),(5019,108,'2026-04-12','Debit Card'),(5020,110,'2026-04-18','UPI');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (201,'Laptop','Electronics',55000.00,20),(202,'Mobile Phone','Electronics',25000.00,35),(203,'Headphones','Electronics',1500.00,50),(204,'Keyboard','Electronics',800.00,40),(205,'Mouse','Electronics',500.00,60),(206,'Office Chair','Furniture',7500.00,15),(207,'Study Table','Furniture',6000.00,12),(208,'Notebook','Stationery',80.00,200),(209,'Pen Pack','Stationery',120.00,150),(210,'Water Bottle','Accessories',350.00,80),(211,'Backpack','Accessories',1200.00,45),(212,'Smart Watch','Electronics',4500.00,25),(213,'Bookshelf','Furniture',8500.00,10),(214,'Printer','Electronics',12000.00,8),(215,'Calculator','Stationery',600.00,30);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-09 21:57:02
