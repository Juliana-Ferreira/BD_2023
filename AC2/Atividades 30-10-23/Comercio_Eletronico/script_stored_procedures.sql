delimiter $
CREATE PROCEDURE carrinho_de_compras (id_cliente INT, id_produto INT, quantidade INT)
BEGIN
	INSERT INTO pedidos VALUES (NULL, NOW(), id_cliente, 'Pedido criado');
    INSERT INTO itens_pedido VALUES (NULL, (SELECT MAX(id_pedido) FROM pedidos), id_produto, quantidade);
END$
delimiter ;

call carrinho_de_compras (9, 15, 2);

select * from pedidos p inner join itens_pedido ip on ip.fk_id_pedido = p.id_pedido
inner join clientes c on p.id_cliente_pedido = c.id_cliente
where c.id_cliente = 9;

delimiter $
CREATE PROCEDURE valor_do_pedido (id_pedido INT)
BEGIN
	SELECT SUM(pd.preco * ip.qtd_pedido) AS valor_total FROM pedidos p
		LEFT JOIN itens_pedido ip ON ip.fk_id_pedido = p.id_pedido
		LEFT JOIN produtos pd ON pd.id_produto = ip.id_produto_pedido
		WHERE p.id_pedido = id_pedido;
END$
delimiter ;

call valor_do_pedido (5);