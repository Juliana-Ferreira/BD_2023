create database gerenciamento_pedidos;
use gerenciamento_pedidos;

create table clientes (
	idCliente int primary key auto_increment,
    nome varchar (80) not null,
    email varchar (100) not null,
    telefone varchar (11),
    endereco varchar (200) not null,
    totalPedidos decimal (10,2) default 0
);

create table pedidos (
	idPedido int primary key auto_increment,
    idClientePedido int references clientes (idCliente),
    descricao varchar (200) not null,
    valorTotal decimal (10,2) not null,
    dataPedido date
);

insert into clientes (nome, email, telefone, endereco)
values ('Maria Luiza', 'maria.luiza@dominio.com', '11999999999', 'Rua Bandeira, 104 - Bairro, Cidade - SP'),
('José Carlos', 'jose.carlos@dominio.com', '11999999998', 'Rua das Conchas, 12 - Bairro, Cidade - SP'),
('Tereza Camargo', 'tereza.camargo@dominio.com', '11999999997', 'Avenida Colombina, 361 - Bairro, Cidade - SP'),
('Vanessa Ferreira', 'vanessa.ferreira@dominio.com', '11999999996', 'Alameda Amarela, 1071 - Bairro, Cidade - SP');

insert into pedidos (idClientePedido, descricao, valorTotal, dataPedido)
values (1, '1 pano de prato bordado e 1 boneco de feltro', 85.50, '2023-03-14'),
(1, '2 panos de prato bordados', 30, '2023-07-07'), (2, '5 panos de prato bordados', 75, '2023-08-02'),
(3, '1 amigurumi de princesa', 90, '2023-09-23'), (3, '1 chaveiro de feltro e 1 pano de prato bordado', 22.50, '2023-11-06');

update clientes set totalPedidos = 115.5 where idCliente = 1;
update clientes set totalPedidos = 75 where idCliente = 2;
update clientes set totalPedidos = 112.5 where idCliente = 3;

select * from clientes;
select * from pedidos;
