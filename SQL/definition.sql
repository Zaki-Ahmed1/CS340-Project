-- Table 1
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB;


-- Table 2
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255),
  `phone` varchar(255) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  FOREIGN KEY (`cart_id`) REFERENCES `carts`(`cart_id`),
  FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`)
) ENGINE=InnoDB;


-- Table 3
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` FLOAT NOT NULL,
  `inventory` int(11) NOT NULL,
  `description` varchar(100),
  `category` varchar(50) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB;


-- Table 4
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customers`(`customer_id`),
  FOREIGN KEY (`cart_id`) REFERENCES `carts`(`cart_id`)
) ENGINE=InnoDB;


-- Table 5
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
`cart_id` int(11) NOT NULL AUTO_INCREMENT,
`customer_id` int(11) NOT NULL,
`cart_total` float DEFAULT NULL,
`email` varchar(255) DEFAULT NULL,
`processed` boolean DEFAULT false,
PRIMARY KEY (`cart_id`),
FOREIGN KEY(`customer_id`) REFERENCES `customers`(`customer_id`)
) ENGINE=InnoDB;


-- Table 6
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `cart_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`cart_item_id`),
  FOREIGN KEY (`cart_id`) REFERENCES `carts`(`cart_id`),
  FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`)
) ENGINE=InnoDB;


-- Creations Table 1
INSERT INTO `employees` (`name`, `title`, `email`, `phone`) VALUES
('Michael Scott', 'Regional Manager', 'mscott@dunder.com', '123-456-7891'),
('Dwight Schrute', 'Assistant to the Regional Manager', 'dschrute@dunder.com', '777-777-7777'),
('Jim Halpert', 'Salesman', 'jhalpert@dunder.com', '999-999-9999'),
('Andy Bernard', 'Salesman', 'abernard@dunder.com', '123-000-8877'),
('Stanley Hutchison', 'Salesman', 'ahutch@dunder.com', '444-555-6666'),
('Pam Beasley', 'Receptionist', 'pbeasley@dunder.com', '444-444-4444');


-- Creations Table 2 & 5
INSERT INTO `customers` (`name`, `email`, `phone`, `employee_id`) VALUES
('Zaki Ahmed', 'ahmedza@oregonstate.edu', '888-888-888', (SELECT `employee_id` FROM `employees` WHERE `name` = 'Jim Halpert'));
INSERT INTO `carts` (`email`, `customer_id`) VALUES
('ahmedza@oregonstate.edu', (SELECT `customer_id` FROM `customers` WHERE `email` = 'ahmedza@oregonstate.edu'));
UPDATE `customers` SET `cart_id` = ((SELECT `cart_id` FROM `carts` WHERE `email` = 'ahmedza@oregonstate.edu' and `processed`=false)) WHERE `email` = 'ahmedza@oregonstate.edu';

INSERT INTO `customers` (`name`, `email`, `phone`, `employee_id`) VALUES
('Bryan Rodriguez', 'brod@oregonstate.edu', '222-222-2222', (SELECT `employee_id` FROM `employees` WHERE `name` = 'Dwight Schrute'));
INSERT INTO `carts` (`email`, `customer_id`) VALUES
('brod@oregonstate.edu', (SELECT `customer_id` FROM `customers` WHERE `email` = 'brod@oregonstate.edu'));
UPDATE `customers` SET `cart_id` = ((SELECT `cart_id` FROM `carts` WHERE `email` = 'brod@oregonstate.edu' and `processed`=false)) WHERE `email` = 'brod@oregonstate.edu';

INSERT INTO `customers` (`name`, `email`, `phone`, `employee_id`) VALUES
('Beaver', 'beaver@oregonstate.edu', '000-000-0000', (SELECT `employee_id` FROM `employees` WHERE `name` = 'Michael Scott'));
INSERT INTO `carts` (`email`, `customer_id`) VALUES
('beaver@oregonstate.edu', (SELECT `customer_id` FROM `customers` WHERE `email` = 'beaver@oregonstate.edu'));
UPDATE `customers` SET `cart_id` = ((SELECT `cart_id` FROM `carts` WHERE `email` = 'beaver@oregonstate.edu' and `processed`=false)) WHERE `email` = 'beaver@oregonstate.edu';


-- Creations Table 3
INSERT INTO `products` (`name`, `price`, `inventory`, `description`, `category`) VALUES
('38 Pound Bond', 100.00, 3000, 'Not some Cumberland Mills crap', 'Paper'),
('40 Pound Letter Stock', 49.99, 5000, 'Great for marketing party planning committe parties', 'Paper'),
('Airstream Deluxe A4', 25.00, 8000, 'May contain accidental graphic watermark', 'Paper'),
('Premium Copy Paper', 5.50, 15000, 'You may find a golden ticket in a ream', 'Paper'),
('Ultra-White Cardstock', 1.00, 20000, 'Great for hiring interns', 'Paper'),
('Sticky Quips', 0.50, 1000, 'Sticky Quips are fun, they are safe, they are handy', 'Other');

-- Creations Table 4


-- Creations Table 6
INSERT INTO `cart_items` (`cart_id`, `product_id`, `name`, `quantity`) VALUES
((SELECT `cart_id` FROM `carts` WHERE `email` = 'ahmedza@oregonstate.edu' and `processed` = false), (SELECT `product_id` FROM `products` WHERE `product_id` = 1), (SELECT `name` FROM `products` WHERE `product_id` = 1), 4);
INSERT INTO `cart_items` (`cart_id`, `product_id`, `name`, `quantity`) VALUES
((SELECT `cart_id` FROM `carts` WHERE `email` = 'ahmedza@oregonstate.edu' and `processed` = false), (SELECT `product_id` FROM `products` WHERE `product_id` = 3), (SELECT `name` FROM `products` WHERE `product_id` = 3), 10);
INSERT INTO `cart_items` (`cart_id`, `product_id`, `name`, `quantity`) VALUES
((SELECT `cart_id` FROM `carts` WHERE `email` = 'ahmedza@oregonstate.edu' and `processed` = false), (SELECT `product_id` FROM `products` WHERE `product_id` = 5), (SELECT `name` FROM `products` WHERE `product_id` = 5), 47);
INSERT INTO `cart_items` (`cart_id`, `product_id`, `name`, `quantity`) VALUES
((SELECT `cart_id` FROM `carts` WHERE `email` = 'brod@oregonstate.edu' and `processed` = false), (SELECT `product_id` FROM `products` WHERE `product_id` = 1), (SELECT `name` FROM `products` WHERE `product_id` = 1), 25);
INSERT INTO `cart_items` (`cart_id`, `product_id`, `name`, `quantity`) VALUES
((SELECT `cart_id` FROM `carts` WHERE `email` = 'beaver@oregonstate.edu' and `processed` = false), (SELECT `product_id` FROM `products` WHERE `product_id` = 2), (SELECT `name` FROM `products` WHERE `product_id` = 2), 35);
