CREATE DATABASE comercio_eletronico;
USE comercio_eletronico;

CREATE TABLE produtos (
  id_produto INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(200) NULL,
  preco DECIMAL(10,2) NOT NULL,
  qtd_estoque INT DEFAULT 0
);

CREATE TABLE clientes (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  endereco VARCHAR(200) NULL,
  telefone VARCHAR(12) NULL,
  email VARCHAR(100) NULL
);

CREATE TABLE pedidos (
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE NOT NULL,
    id_cliente_pedido INT REFERENCES clientes(id_cliente),
    status_pedido VARCHAR(50) NOT NULL
);

CREATE TABLE itens_pedido (
  id_item_pedido INT PRIMARY KEY AUTO_INCREMENT,
  fk_id_pedido INT REFERENCES pedidos(id_pedido),
  id_produto_pedido INT REFERENCES produtos(id_produto),
  qtd_pedido INT DEFAULT 0
);