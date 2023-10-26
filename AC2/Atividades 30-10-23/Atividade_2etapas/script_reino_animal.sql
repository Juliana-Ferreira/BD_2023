CREATE DATABASE reino_animal;
USE reino_animal;

CREATE TABLE animais (
  id integer PRIMARY KEY AUTO_INCREMENT,
  nome varchar (50) NOT NULL,
  data_nascimento date,
  peso decimal (6,2) CHECK (peso > 0),
  id_especie int,
  FOREIGN KEY(id_especie) REFERENCES especie(id)
);

CREATE TABLE especie (
  id integer PRIMARY KEY AUTO_INCREMENT,
  nome varchar (60) NOT NULL,
  descricao varchar (200)
);

INSERT INTO especie (nome, descricao)
VALUES ('Ave', 'Animal com asas e corpo coberto por penas'),
('Mamífero', 'As fêmeas da espécie alimentam os filhotes por meio das glândulas mamárias'),
('Réptil', 'Respiração pulmonar e corpo coberto por escamas ou por uma carapaça');

INSERT INTO animais (nome, data_nascimento, peso, id_especie) 
VALUES ('Piu Piu', '2021-06-30', 0.7, 1),
('Pingu', '2018-08-14', 4.25, 1),
('Louro José', '2019-01-31', 1.86, 1),
('Thor', '2022-04-16', 7.3, 2),
('Julius', '2020-02-14', 1.12, 3),
('Camarada', '2019-11-23', 2.60, 3),
('Belinha', '2020-09-18', 3.65, 2),
('Ana Maria', '2017-03-04', 8.35, 2);
  
SELECT * FROM animais a INNER JOIN especie e on e.id = a.id_especie;