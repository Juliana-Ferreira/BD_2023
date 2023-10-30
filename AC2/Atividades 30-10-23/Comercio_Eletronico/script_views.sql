CREATE VIEW historico_pedidos AS
SELECT c.nome, p.*, ip.qtd_pedido, pd.nome AS produto FROM clientes c
	INNER JOIN pedidos p ON c.id_cliente = p.id_cliente_pedido
	RIGHT JOIN itens_pedido ip ON ip.fk_id_pedido = p.id_pedido
    RIGHT JOIN produtos pd ON pd.id_produto = ip.id_produto_pedido
	WHERE c.id_cliente = 3;
    
CREATE VIEW produtos_disponiveis AS
SELECT * FROM produtos WHERE qtd_estoque > 0;