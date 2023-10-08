/* Criando tabela Animais */
CREATE TABLE animais (
  id int PRIMARY KEY,
  nome varchar (50) NOT NULL,
  nasc date,
  peso decimal (6,2) CHECK (peso > 0),
  cor varchar (50),
  id_especie int,
  FOREIGN KEY(id_especie) REFERENCES especies(id)
);

/* Criando tabela Especies */
CREATE TABLE especies (
  id int PRIMARY KEY,
  nome varchar (60) NOT NULL
);
  
/* Inserindo dados nas tabelas */
INSERT INTO especies (id, nome)
VALUES (1, 'Gato'), (2, 'Cachorro'), (3, 'Coelho'), (4, 'Peixe'), (5, 'Tartaruga');

INSERT INTO animais (id, nome, nasc, peso, cor, id_especie) 
VALUES (01, 'Ágata', '2015-04-09', 13.9, 'branco', 3), (02, 'Félix', '2016-06-06', 14.3, 'preto', 1),
(03, 'Tom', '2013-02-08', 11.2, 'azul', 4), (04, 'Garfield', '2015-07-06', 17.1, 'laranja', 1),
(05, 'Frajola', '2013-08-01', 13.7, 'preto', 1), (06, 'Manda-chuva', '2012-02-03', 12.3, 'amarelo', 2),
(07, 'Snowball', '2014-04-06', 13.2, 'preto', 2), (10, 'Ágata', '2015-08-03', 11.9, 'azul', 5),
(11, 'Gato de Botas', '2012-12-10', 11.6, 'amarelo', 1), (12, 'Kitty', '2020-04-06', 11.6, 'amarelo', 3),
(13, 'Milu', '2013-02-04', 17.9, 'branco', 3), (14, 'Pluto', '2012-01-03', 12.3, 'amarelo', 2),
(15, 'Pateta', '2015-05-01', 17.7, 'preto', 2), (16, 'Snoopy', '2013-07-02', 18.2, 'branco', 2),
(17, 'Rex', '2019-11-03', 19.7, 'beje', 5), (20, 'Bidu', '2012-09-08', 12.4, 'azul', 2),
(21, 'Dum Dum', '2015-04-06', 11.2, 'laranja', 1), (22, 'Muttley', '2011-02-03', 14.3, 'laranja', 4),
(23, 'Scooby', '2012-01-02', 19.9, 'marrom', 2), (24, 'Rufus', '2014-04-05', 19.7, 'branco', 3),
(25, 'Rex', '2021-08-19', 19.7, 'branco', 2);
  
/* Altere o nome do Pateta para Goofy */
UPDATE animais SET nome = 'Goofy' WHERE nome = 'Pateta';

/* Altere o peso do Garfield para 10 quilogramas */
UPDATE animais SET peso = 10 WHERE nome = 'Garfield';

/* Altere a cor de todos os gatos para laranja */
UPDATE animais SET cor = 'laranja' WHERE id_especie = 1;

/* Crie um campo altura para os animais */
ALTER TABLE animais ADD altura DECIMAL(4, 2);

/* Crie um campo observação para os animais */
ALTER TABLE animais ADD observacao varchar(2000);

/* Remova todos os animais que pesam mais que 200 quilogramas */
DELETE FROM animais WHERE peso > 200;

/* Remova todos os animais que o nome inicie com a letra ‘C’ */
DELETE FROM animais WHERE nome LIKE 'C%';

/* Remova o campo cor dos animais */
ALTER TABLE animais DROP cor;

/* Aumente o tamanho do campo nome dos animais para 80 caracteres */
ALTER TABLE animais MODIFY nome varchar (80);

/* Remova todos os gatos e cachorros */
DELETE FROM animais WHERE id_especie IN (1, 2);

/* Remova o campo data de nascimento dos animais */
ALTER TABLE animais DROP nasc;

/* Remova todos os animais */
DELETE FROM animais;

/* Remova a tabela especies */
DROP TABLE especies;