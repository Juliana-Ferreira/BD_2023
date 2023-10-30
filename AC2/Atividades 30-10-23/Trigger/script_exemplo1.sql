CREATE DATABASE atividade_trigger;
USE atividade_trigger;

CREATE TABLE Pedidos (
	IDPedido INT AUTO_INCREMENT PRIMARY KEY,
	DataPedido DATETIME,
	NomeCliente VARCHAR(100)
);

INSERT INTO Pedidos (DataPedido, NomeCliente) VALUES
(NOW(), 'Cliente 1'),
(NOW(), 'Cliente 2'),
(NOW(), 'Cliente 3');

DELIMITER $
CREATE TRIGGER RegistroDataCriacaoPedido
BEFORE INSERT ON Pedidos
FOR EACH ROW
BEGIN
	SET NEW. DataPedido = NOW();
END;
$
DELIMITER ;

INSERT INTO Pedidos (NomeCliente) values ('Novo Cliente');

SELECT * FROM Pedidos;