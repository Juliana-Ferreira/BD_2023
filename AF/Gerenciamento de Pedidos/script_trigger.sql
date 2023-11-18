delimiter $$
create trigger AtualizarTotalPedidos
after insert on pedidos
for each row
begin
	update clientes set totalPedidos = totalPedidos + NEW.valorTotal
	WHERE idCliente = NEW.idClientePedido;
end $$
delimiter ;

call InserirPedido (1, '3 panos de prato bordados', 45, now());

select * from clientes;