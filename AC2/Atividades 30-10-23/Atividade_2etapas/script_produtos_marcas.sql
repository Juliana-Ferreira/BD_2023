create database produtos_marcas;
use produtos_marcas;

create table marcas (
	id int auto_increment primary key,
    nome varchar(50) not null,
    site varchar(200),
    telefone varchar(11)
);

create table produtos (
	id int auto_increment primary key,
    nome varchar(50) not null,
    custo decimal(10,2),
    venda decimal(10,2),
    data_validade date,
    marca_id int,
    constraint fk_marcas foreign key(marca_id) references marcas(id)
);

insert into marcas (nome, site, telefone)
values ('Gourmet da Bê', 'gourmetdabe.com.br', '15999999898'),
('Pastel da Bel', 'pasteldabel.com.br', '15998989999'), ('Docinho de Mel', 'docinhodemel.com.br', '11996669999');

insert into produtos (nome, custo, venda, data_validade, marca_id)
values ('Brigadeiro', 1.98, 3.50, '2023-10-31', 1), ('Beijinho', 1.30, 3.50, '2023-10-31', 1),
('Pastel de carne', 4.45, 8.50, '2023-11-02', 2), ('Pastel de queijo', 4.07, 8.00, '2023-11-04', 2),
('Pastel de pizza', 4.25, 8.50, '2023-11-04', 2), ('Brownie clássico', 3.22, 7.00, '2023-11-10', 3),
('Cupcake de baunilha', 2.37, 5.50, '2023-11-05', 3), ('Pão de mel', 1.85, 5.00, '2023-11-08', 3);

select * from produtos p join marcas m on m.id = p.marca_id;