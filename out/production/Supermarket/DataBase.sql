DROP DATABASE IF EXISTS GreenSupermarket;
CREATE DATABASE IF NOT EXISTS GreenSupermarket;
SHOW DATABASES ;
USE GreenSupermarket;

DROP TABLE IF EXISTS Item;
CREATE TABLE IF NOT EXISTS Item(
    ItemCode VARCHAR(6),
    Discription VARCHAR(50),
    PackSize VARCHAR(20),
    UnitPrice DOUBLE DEFAULT 0.00,
    QtyOnHand INT DEFAULT 0,
    discount INT DEFAULT 0,
    CONSTRAINT PRIMARY KEY (ItemCode)
    );
SHOW TABLES ;
DESCRIBE Item;


DROP TABLE IF EXISTS Customer;
CREATE TABLE IF NOT EXISTS Customer(
    id VARCHAR(6),
    custTitle VARCHAR(5),
    name VARCHAR(30) NOT NULL DEFAULT 'Unknown',
    address VARCHAR(30),
    city VARCHAR(20),
    province VARCHAR(20),
    postalCode VARCHAR(9),
    CONSTRAINT PRIMARY KEY (id)
    );
SHOW TABLES ;
DESCRIBE Customer;


DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order`(
    orderId VARCHAR(6),
    orderDate DATE,
    cId VARCHAR(15),
    CONSTRAINT PRIMARY KEY (`orderId`),
    CONSTRAINT FOREIGN KEY (`cId`) REFERENCES Customer(`id`) ON DELETE CASCADE ON UPDATE CASCADE
    );
SHOW TABLES ;
DESCRIBE Order;


DROP TABLE IF EXISTS `Order Detail`;
CREATE TABLE IF NOT EXISTS `order detail`(
    itemCode VARCHAR(6),
    orderId VARCHAR(6),
    orderQTY INT(11),
    discount INT DEFAULT 0,
    CONSTRAINT PRIMARY KEY (`itemCode`, `orderId`),
    CONSTRAINT FOREIGN KEY (`itemCode`) REFERENCES `Item`(`ItemCode`) ON DELETE CASCADE ON UPDATE CASCADE ,
    CONSTRAINT FOREIGN KEY (`orderId`) REFERENCES `order`(`orderId`) ON DELETE CASCADE ON UPDATE CASCADE
    );
SHOW TABLES ;
DESCRIBE Order Detail;