create view PedidosClientes as
	select p.idPedido, p.idClientePedido, c.nome, p.descricao, p.valorTotal, p.dataPedido
	from pedidos p inner join clientes c on p.idClientePedido = c.idCliente
	order by c.nome;
