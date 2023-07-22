-- Criacao do bando de dados para o cenario de uma oficina
-- drop database oficina;
create database oficina;
use oficina;

-- criar tabela cliente
CREATE TABLE `Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `CPF` CHAR(11) NOT NULL,
  `Endereco` VARCHAR(100) NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE);
  
-- criar tabela veiculo
CREATE TABLE `Veiculo` (
  `idVeiculo` INT NOT NULL AUTO_INCREMENT,
  `Tipo` ENUM('Moto', 'Carro', 'Caminhao') NOT NULL DEFAULT 'Carro',
  `Placa` CHAR(7) NULL,
  `Marca` VARCHAR(25) NULL,
  `Modelo` VARCHAR(25) NULL,
  PRIMARY KEY (`idVeiculo`),
  UNIQUE INDEX `Placa_UNIQUE` (`Placa` ASC) VISIBLE);
  
-- criar tabela produto
CREATE TABLE `Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `P_Descricao` VARCHAR(45) NOT NULL,
  `P_Categoria` VARCHAR(45),
  `P_Valor` FLOAT NOT NULL DEFAULT 0,
  PRIMARY KEY (`idProduto`));
  
-- criar tabela servico
CREATE TABLE `Servico` (
  `idServico` INT NOT NULL AUTO_INCREMENT,
  `S_Descricao` VARCHAR(45) NOT NULL,
  `S_Valor` FLOAT NOT NULL DEFAULT 0,
  `S_Categoria` ENUM('Garantia', 'Conserto', 'Terceirizado') NOT NULL DEFAULT 'Conserto',
  PRIMARY KEY (`idServico`));

-- criar tabela Ordem_Servico
CREATE TABLE `Ordem_Servico` (
  `idOrdem_Servico` INT NOT NULL AUTO_INCREMENT,
  `OS_Problema` TEXT(255) NOT NULL,
  `OS_Solucao` TEXT(255) NULL,
  `OS_Status` ENUM('Aguardando Analise', 'Em andamento', 'Aguardando Aprovação Orçamento', 'Aguardando Entrega', 'Concluida') NOT NULL DEFAULT 'Aguardando Analise',
  `Veiculo_idVeiculo` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idOrdem_Servico`, `Veiculo_idVeiculo`, `Cliente_idCliente`),
  INDEX `fk_Ordem_Servico_Veiculo1_idx` (`Veiculo_idVeiculo` ASC) VISIBLE,
  INDEX `fk_Ordem_Servico_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem_Servico_Veiculo1`
    FOREIGN KEY (`Veiculo_idVeiculo`)
    REFERENCES `Veiculo` (`idVeiculo`),
  CONSTRAINT `fk_Ordem_Servico_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `Cliente` (`idCliente`)
);

-- criar tabela de relacionamento ordem_servico/produto
CREATE TABLE `Produto_has_Ordem_Servico` (
  `Produto_idProduto` INT NOT NULL,
  `Ordem_Servico_idOrdem_Servico` INT NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Ordem_Servico_idOrdem_Servico`),
  INDEX `fk_Produto_has_Ordem_Servico_Ordem_Servico1_idx` (`Ordem_Servico_idOrdem_Servico` ASC) VISIBLE,
  INDEX `fk_Produto_has_Ordem_Servico_Produto_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Ordem_Servico_Produto`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `Produto` (`idProduto`),
  CONSTRAINT `fk_Produto_has_Ordem_Servico_Ordem_Servico1`
    FOREIGN KEY (`Ordem_Servico_idOrdem_Servico`)
    REFERENCES `Ordem_Servico` (`idOrdem_Servico`)
);
    
-- criar tabela de relacionamento ordem_servico/servico
CREATE TABLE `Servico_has_Ordem_Servico` (
  `Servico_idServico` INT NOT NULL,
  `Ordem_Servico_idOrdem_Servico` INT NOT NULL,
  PRIMARY KEY (`Servico_idServico`, `Ordem_Servico_idOrdem_Servico`),
  INDEX `fk_Servico_has_Ordem_Servico_Ordem_Servico1_idx` (`Ordem_Servico_idOrdem_Servico` ASC) VISIBLE,
  INDEX `fk_Servico_has_Ordem_Servico_Servico1_idx` (`Servico_idServico` ASC) VISIBLE,
  CONSTRAINT `fk_Servico_has_Ordem_Servico_Servico1`
    FOREIGN KEY (`Servico_idServico`)
    REFERENCES `Servico` (`idServico`),
  CONSTRAINT `fk_Servico_has_Ordem_Servico_Ordem_Servico1`
    FOREIGN KEY (`Ordem_Servico_idOrdem_Servico`)
    REFERENCES `Ordem_Servico` (`idOrdem_Servico`)
);
