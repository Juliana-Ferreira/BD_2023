# Banco de Dados

### AC1
- Crie um modelo de dados para os cenários a seguir. Após a criação dos MER, crie as bases de dados de cada um dos exercícios dados, inserindo também os dados necessários para compor a base de dados criada.


#### 1. PETSHOP
Um petshop deseja manter cadastrados seus clientes bem como seus pets. Um cliente deve informar seu nome, cpf, email e telefone além do nome, espécie e data de nascimento de seu pet.

![MER Petshop](img_MER/MER_petshop.png)

` Aqui vai o script SQL ` 

#### 2. Produtora de Games
Em uma produtora de games, há desenvolvedores, que possuem um nome, cpf, data de nascimento. Cada projeto tem um nome, data de lançamento, gênero e faixa etária. Segundo o gerente de projetos, “cada desenvolvedor deve estar envolvido em um projeto”.

![MER Produtora de Games](img_MER/MER_produtora_games.png)

` Aqui vai o script SQL ` 

#### 3. Biblioteca
Uma biblioteca faz registro de autores e livros. Um autor é cadastrado com seu nome, e-mail, nacionalidade e data de nascimento. Já um livro é registrado com o título, quantidade de páginas, acabamento e editora.

![MER Biblioteca](img_MER/MER_biblioteca.png)

` Aqui vai o script SQL ` 

#### 4. Locadora de Automóveis
Uma locadora de automóveis, mantém registro dos automóveis. Um automóvel é cadastrado com placa, modelo, ano, nome da montadora, site da montadora,  logotipo da montadora.

![MER Locadora de Automóveis](img_MER/MER_locadora_automoveis.png)

` Aqui vai o script SQL ` 

#### 5. Supermercado
Um supermercado cadastra seus produtos. Um produto é identificado por seu nome, preço, quantidade em estoque, nome da marca, SAC da marca, nacionalidade da marca.

![MER Supermercado](img_MER/MER_supermercado.png)

` Aqui vai o script SQL ` 

#### 6. Videoteca
Uma videoteca precisa cadastrar o título, duração, idioma original e preço de cada filme. É necessário cadastrar também o elenco de cada filme onde se registra o nome, data de nascimento, nacionalidade de cada ator/atriz. Opcionalmente, inclua o cadastro de diretores com atributos que julgar necessários.

![MER Supermercado](img_MER/MER_videoteca.png)

` Aqui vai o script SQL ` 

### Exercícios disponibilizados na aula do dia 04/09/2023:

1 — Crie um banco de dados para armazenar dados de alunos. Um aluno deve ter RA, nome, data de nascimento, endereço e e-mail;

2 — Crie um banco de dados para armazenar dados de colaboradores de uma empresa. Um colaborador deve ter um código de identificação, nome, CPF, cargo e salário;

Insira pelo menos 5 registros em cada tabela;

Selecione os dados.

#### 1 - Tabela Aluno

```
CREATE TABLE aluno (
  RA varchar (6),
  nome varchar (50),
  data_nascimento varchar (10),
  endereco varchar (120),
  email varchar (50)
  );
  
  INSERT INTO aluno (RA, nome, data_nascimento, endereco, email) 
  VALUES ('172008', 'Juliana', '15/02/1999', 'alameda franca, 1071 - Nova Sorocaba', 'juliana@gmail.com'),
  ('172009', 'Camila', '20/01/1999', 'francisco bueno, 472 - Ana Maria', 'camila@gmail.com'),
  ('172010', 'André Felipe', '02/04/1997', 'rua das flores, 83 - Vila jardim', 'andrefelipe@gmail.com'),
  ('172011', 'Jorge Henrique', '14/12/2000', 'rua principal, 12 - Jd. Cidade', 'jorge@hotmail.com'),
  ('172012', 'Priscila', '28/05/1998', 'avenida carreto, 54 - Bairro 13', 'priscila@hotmail.com');
  
  SELECT * FROM aluno;
  ```

#### 2 - Tabela Colaboradores

```
CREATE TABLE colaboradores (
  id int(6),
  nome varchar(50),
  cpf varchar(12),
  cargo varchar(50),
  salario decimal(10,2)
);

INSERT INTO colaboradores (id, nome, cpf, cargo, salario)
VALUES (101010, 'Ana Paula Padrão', '00011122233', 'Assistente', 3200.00),
(111111, 'Marcia Teixeira', '11122233344', 'Gerente', 15000.00),
(121212, 'Paulo André Alves', '22233344455', 'Assistente', 3000.00),
(131313, 'Joao Marcelo Silva', '33344455566', 'Auxiliar I', 4350.50),
(141414, 'Luis Felipe Ferreira', '44455566677', 'Auxiliar II', 4730.20);

SELECT * FROM colaboradores;
```
