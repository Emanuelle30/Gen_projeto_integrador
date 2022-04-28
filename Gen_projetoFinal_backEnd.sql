CREATE SCHEMA IF NOT EXISTS mydb;
USE `mydb` ;


CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `login` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `endereco` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(255) NOT NULL,
  `cnpj` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`produtos` (
  `nome_do_produto` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `preco` DOUBLE NOT NULL,
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `foto` VARCHAR(255) NOT NULL,
  `tamanho` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`nota_fiscal` (
  `id` BIGINT NOT NULL,
  `quantidade` BIGINT NOT NULL,
  `preco_total` BIGINT NOT NULL,
  `data` DATETIME NOT NULL,
  `usuario_id` BIGINT NOT NULL,
  `produtos_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_nota_fiscal_usuario_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_nota_fiscal_produtos1_idx` (`produtos_id` ASC) VISIBLE,
  CONSTRAINT `fk_nota_fiscal_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nota_fiscal_produtos1`
    FOREIGN KEY (`produtos_id`)
    REFERENCES `mydb`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
