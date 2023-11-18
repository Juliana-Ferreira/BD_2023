select p.*, c.totalPedidos from PedidosClientes p
inner join clientes c on p.idClientePedido = c.idCliente;