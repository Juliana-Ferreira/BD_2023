delimiter $$
create procedure InserirPedido (
	in cliente int,
    in descricaoPedido varchar (200),
    in valorPedido decimal (10,2),
    in data_pedido date
)
begin
  insert into pedidos (idClientePedido, descricao, valorTotal, dataPedido)
  values (cliente, descricaoPedido, valorPedido, data_pedido);
end $$
delimiter ;

call InserirPedido (4, '1 amigurumi de herói', 115, now());

select * from pedidos;
