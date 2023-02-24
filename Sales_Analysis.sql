Create database if not exists `Sales_Analysis`;
use `Sales_Analysis`;
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `age` INT NULL,
  `gender` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mydb`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`products` (
  `product_id` INT NOT NULL,
  `product_name` VARCHAR(45) NULL,
  `price` DOUBLE NULL,
  `category` VARCHAR(45) NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`transactions` (
  `transaction_id` INT NOT NULL,
  `date` DATE NULL,
  `quantity` INT NULL,
  `customers_customer_id` INT NOT NULL,
  `products_product_id` INT NOT NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX `fk_transactions_customers_idx` (`customers_customer_id` ASC) VISIBLE,
  INDEX `fk_transactions_products1_idx` (`products_product_id` ASC) VISIBLE,
  CONSTRAINT `fk_transactions_customers`
    FOREIGN KEY (`customers_customer_id`)
    REFERENCES `mydb`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_products1`
    FOREIGN KEY (`products_product_id`)
    REFERENCES `mydb`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
