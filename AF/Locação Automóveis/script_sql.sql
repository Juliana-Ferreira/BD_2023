create database locadora_automovel;
use locadora_automovel;

create table Clientes (
	idCliente int primary key auto_increment,
    nome varchar(80) not null,
    cpf varchar(14) not null,
    dataNascimento date
);

create table Veiculos (
	idVeiculo int primary key auto_increment,
    placa varchar(8) not null,
    modelo varchar(30) not null,
    cor varchar(30) not null,
    valorDiaria decimal(12,2)
);

create table Locacao (
	codLocacao int primary key,
    diasLocacao int(30) not null,
    cliente_id int references Clientes(idCliente),
    veiculo_id int references Veiculos(idVeiculo)
);

insert into Clientes(nome, cpf, dataNascimento)
values ('Ariano Suassuna', '123.456.789-01', '1997-05-21'),
('Grace Hopper', '543.765.987-23', '2002-04-29'),
('Richard Feynman', '987.654.231-90', '2001-10-12'),
('Edgar Poe', '432.765.678-67', '1998-12-14'),
('Gordon Freeman', '927.384.284-44', '1984-11-26');

insert into Veiculos(placa, modelo, cor, valorDiaria)
values ('WER-3456', 'Fusca', 'Preto', 30.0), ('FDS-8384', 'Variante', 'Rosa', 60.0),
('CVB-9933', 'Comodoro', 'Preto', 20.0), ('FGH-2256', 'Deloriam', 'Azul', 80.0),
('DDI-3948', 'Brasilia', 'Amarelo', 45.0);

insert into Locacao(codLocacao, diasLocacao, cliente_id, veiculo_id)
values (101, 3, 1, 1), (102, 7, 2, 2), (103, 1, 3, 3), (104, 3, 4, 4), (105, 7, 5, 5);

create view LocacaoVeiculosClientes as
	select l.codLocacao, v.idVeiculo, v.placa, v.modelo, v.cor, c.idCliente,
    c.nome, c.cpf, c.dataNascimento, v.valorDiaria, l.diasLocacao
	from Locacao l inner join Veiculos v
		on l.veiculo_id = v.idVeiculo
	inner join Clientes c on l.cliente_id = c.idCliente;

select lvc.*, (select (lvc.valorDiaria * lvc.diasLocacao)) as total from LocacaoVeiculosClientes lvc;