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

INSERT INTO `employees` (`name`, `title`, `email`, `phone`) VALUES
('Michael Scott', 'Regional Manager', 'mscott@dunder.com', '123-456-7891'),
('Dwight Schrute', 'Assistant to the Regional Manager', 'dschrute@dunder.com', '777-777-7777'),
('Jim Halpert', 'Salesman', 'jhalpert@dunder.com', '999-999-9999'),
('Pam Beasley', 'Receptionist', 'pbeasley@dunder.com', '444-444-4444')


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

INSERT INTO `customers` (`name`, `email`, `phone`, `cart_id`, `employee_id`) VALUES
('Zaki Ahmed', 'Software Engineer', 'ahmedza@oregonstate.edu', '888-888-888', (SELECT `employee_id` FROM `employees` WHERE `name` = 'Michael Scott'))
('Dwight Schrute', 'Assistant to the Regional Manager', 'dschrute@dunder.com', '777-777-7777'),
('Jim Halpert', 'Salesman', 'jhalpert@dunder.com', '999-999-9999'),
('Pam Beasley', 'Receptionist', 'pbeasley@dunder.com', '444-444-4444')


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

INSERT INTO `products` (`product_id`, `name`, `price`, `inventory`, `description`, `category`) VALUES
(`38 Pound Bond`, 100.00, 3000, `Not some Cumberland Mills crap`, `Paper`),
(`40 Pound Letter Stock`, 50.00, 5000, `Great for marketing party planning committe parties`, `Paper`),
(`Airstream Deluxe A4`, 25.00, 8000, `May contain accidental graphic watermark`, `Paper`),
(`Premium Copy Paper`, 5.00, 15000, `You may find a golden ticket in a ream`, `Paper`),
(`Ultra-White Cardstock`, 1.00, 20000, `Great for hiring interns`, `Paper`),
(`Sticky Quips`, 0.50, 1000, `Sticky Quips are fun, they are safe, they are handy`, `Other`)

SELECT * from `products` WHERE `name` = `form_name_input`
SELECT * from `products` WHERE `category` = `form_`


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
`processed` boolean NOT NULL,
PRIMARY KEY (`cart_id`),
FOREIGN KEY(`customer_id`) REFERENCES `customers`(`customer_id`)
) ENGINE=InnoDB;


-- Table 6
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `cart_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`cart_item_id`),
  FOREIGN KEY (`cart_id`) REFERENCES `carts`(`cart_id`),
  FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`)
) ENGINE=InnoDB;



--example
INSERT INTO `customers` (`id`, `name`, `population`, `language`, `capital`) VALUES
(1, 'Gemenon', 2800000000, 'Old Gemenese', 'Oranu'),
(2, 'Leonis', 2600000000, 'Leonese', 'Luminere'),
(3, 'Caprica', 4900000000, 'Caprican', 'Caprica City'),
(7, 'Sagittaron', 1700000000, NULL, 'Tawa'),