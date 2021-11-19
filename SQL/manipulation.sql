-- Customer Use Only Search Product By
SELECT * from `products` WHERE `name` = `form_name_input`;
SELECT * from `products` WHERE `category` = `form_category_input`;

-- Employee Use Only Add Product
INSERT INTO `products` (:form_product_name_input, 
  :form_product_price_input, 
  :form_product_inventory_input, 
  :form_product_description_input, 
  :form_product_category_input)

-- Employee Use Only Update Product
UPDATE `products`
SET `name` = :product_name_input, `price` = :product_price_input, `inventory` = :product_inventory_input, `description`, = :product_description_input, `category` = :product_category_input
WHERE `product_id` = :product_product_id_input; 

-- Employee Use Only Delete Product
DELETE FROM `products` WHERE `product_id` = :product_delete_input


-- Customer Use Only Search Product By
SELECT * from `products` WHERE `name` = `form_name_input`;
SELECT * from `products` WHERE `category` = `form_category_input`;

-- Employee Use Only Add Product
INSERT INTO `products` (:form_product_name_input, 
  :form_product_price_input, 
  :form_product_inventory_input, 
  :form_product_description_input, 
  :form_product_category_input)

-- Employee Use Only Update Product
UPDATE `products`
SET `name` = :product_name_input, `price` = :product_price_input, `inventory` = :product_inventory_input, `description`, = :product_description_input, `category` = :product_category_input
WHERE `product_id` = :product_product_id_input; 

-- Employee Use Only Delete Product
DELETE FROM `products` WHERE `product_id` = :product_delete_input


-- Customer Use Only Search Product By
SELECT * from `products` WHERE `name` = `form_name_input`;
SELECT * from `products` WHERE `category` = `form_category_input`;

-- Employee Use Only Add Product
INSERT INTO `products` (:form_product_name_input, 
  :form_product_price_input, 
  :form_product_inventory_input, 
  :form_product_description_input, 
  :form_product_category_input)

-- Employee Use Only Update Product
UPDATE `products`
SET `name` = :product_name_input, `price` = :product_price_input, `inventory` = :product_inventory_input, `description`, = :product_description_input, `category` = :product_category_input
WHERE `product_id` = :product_product_id_input; 

-- Employee Use Only Delete Product
DELETE FROM `products` WHERE `product_id` = :product_delete_input