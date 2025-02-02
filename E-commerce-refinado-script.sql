-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `Fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fornecedor` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Fornecedor` (
  `idFornecedor` INT NOT NULL,
  `RazaoSocial` VARCHAR(45) NULL,
  `CNPJ` VARCHAR(14) NULL,
  `Endereco` VARCHAR(100) NULL,
  `Telefone` VARCHAR(15) NULL,
  PRIMARY KEY (`idFornecedor`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Produto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Produto` (
  `idProduto` INT NOT NULL,
  `Categoria` VARCHAR(45) NULL,
  `Descricao` VARCHAR(100) NULL,
  `Valor` FLOAT NULL,
  `Estoque` INT NULL,
  `DataCadastro` DATE NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Fornecedor_Produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fornecedor_Produto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Fornecedor_Produto` (
  `Fornecedor_idFornecedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `PrecoFornecedor` FLOAT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`, `Produto_idProduto`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Vendedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vendedor` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Vendedor` (
  `idVendedor` INT NOT NULL,
  `RazaoSocial` VARCHAR(45) NULL,
  `CNPJ` VARCHAR(14) NULL,
  `Local` VARCHAR(45) NULL,
  `Telefone` VARCHAR(15) NULL,
  `Email` VARCHAR(100) NULL,
  PRIMARY KEY (`idVendedor`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cliente` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Endereco` VARCHAR(100) NULL,
  `Telefone` VARCHAR(15) NULL,
  `Email` VARCHAR(100) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Cliente_PJ`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cliente_PJ` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Cliente_PJ` (
  `idCliente_PJ` INT NOT NULL,
  `RazaoSocial` VARCHAR(45) NULL,
  `CNPJ` VARCHAR(14) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Telefone` VARCHAR(15) NULL,
  `Email` VARCHAR(100) NULL,
  PRIMARY KEY (`idCliente_PJ`, `Cliente_idCliente`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `CNPJ_UNIQUE` ON `Cliente_PJ` (`CNPJ` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Cliente_idCliente_UNIQUE` ON `Cliente_PJ` (`Cliente_idCliente` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Cliente_PF`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cliente_PF` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Cliente_PF` (
  `idCliente_PF` INT NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `DataNascimento` DATE NULL,
  PRIMARY KEY (`idCliente_PF`, `Cliente_idCliente`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `CPF_UNIQUE` ON `Cliente_PF` (`CPF` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Cliente_idCliente_UNIQUE` ON `Cliente_PF` (`Cliente_idCliente` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pedido` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pedido` (
  `idPedido` INT NOT NULL,
  `DataPedido` DATE NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Status` VARCHAR(45) NULL,
  PRIMARY KEY (`idPedido`, `Cliente_idCliente`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `FormaPagamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FormaPagamento` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `FormaPagamento` (
  `idFormaPagamento` INT NOT NULL,
  `Cartao` VARCHAR(45) NOT NULL,
  `Boleto` VARCHAR(45) NOT NULL,
  `Pix` VARCHAR(45) NOT NULL,
  `Dinheiro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFormaPagamento`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pagamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pagamento` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pagamento` (
  `idPagamento` INT NOT NULL,
  `Metodo` VARCHAR(45) NULL,
  `Valor` FLOAT NULL,
  `Pedido_idPedido` INT NOT NULL,
  `FormaPagamento_idFormaPagamento` INT NOT NULL,
  `DataPagamento` DATE NULL,
  PRIMARY KEY (`idPagamento`, `Pedido_idPedido`, `FormaPagamento_idFormaPagamento`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Entrega`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Entrega` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Entrega` (
  `idEntrega` INT NOT NULL,
  `Status` VARCHAR(45) NULL,
  `CodigoRastreio` VARCHAR(45) NULL,
  `Pedido_idPedido` INT NOT NULL,
  PRIMARY KEY (`idEntrega`, `Pedido_idPedido`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Vendedor_idVendedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vendedor_idVendedor` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Vendedor_idVendedor` (
  `Vendedor_idVendedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`Vendedor_idVendedor`, `Produto_idProduto`))
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
