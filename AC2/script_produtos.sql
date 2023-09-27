-- Criando o banco de dados
create database exercicio;

-- Criando a tabela de produtos com as respectivas colunas
create table Produtos (
	id_produto int(8) primary key auto_increment,
    nome varchar(50) not null,
    preco decimal(10,2) not null,
    estoque int(10) not null,
    perecivel char not null,
    marca varchar(50),
    nacionalidade varchar(80)
);

-- Inserindo dados na tabela
insert into Produtos(nome, preco, estoque, perecivel, marca, nacionalidade)
values ("Arroz branco", 28.50, 135, 'N', "Tio João", "Brasileiro"),
("Feijão preto", 8.45, 240, 'N', "Kicaldo", "Brasileiro"),
("Leite", 5.20, 786, 'S', "Itambé", "Brasileiro"),
("Macarrão", 14.80, 314, 'N', "Barilla", "Italiano"),
("Tomate", 8.90, 863, 'S', null, null);

-- Verificando quantos produtos estão cadastrados
select count(id_produto) from produtos;

-- Verificando o preço médio dos produtos
select avg(preco) as preco_medio from produtos;

-- Selecionando a média dos preços dos produtos em 2 grupos: perecíveis e não perecíveis
select perecivel, avg(preco) as preco_medio from produtos group by perecivel;

-- Selecionando a média dos preços dos produtos agrupados pelo nome do produto
select nome, avg(preco) as preco_medio from produtos group by nome;

-- Selecionando a média dos preços e total em estoque dos produtos
select avg(preco) as preco_medio, sum(estoque) as total_estoque from produtos;

-- Selecionando o nome, marca e quantidade em estoque do produto mais caro
select nome, marca, estoque from produtos having max(preco);

-- Selecionando os produtos com preço acima da média
select * from produtos having preco > (select avg(preco) from produtos);

-- Selecionando a quantidade de produtos de cada nacionalidade
select nacionalidade, sum(estoque) from produtos group by nacionalidade;