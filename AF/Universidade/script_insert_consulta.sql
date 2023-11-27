call InserirCurso ('Análise e Desenvolvimento de Sistemas', 'Tecnologia');
call InserirCurso ('Psicologia', 'Saúde');
call InserirCurso ('Medicina', 'Saúde');
call InserirCurso ('Engenharia de Software', 'Tecnologia');
call InserirCurso ('Matemática', 'Exatas');
call SelecionarCursos();

call InserirAluno ('Maria', 'Clara', '2002-04-05');
call InserirAluno ('Joana', 'Pereira', '2002-11-23');
call InserirAluno ('Lucas', 'Pontes', '2001-12-26');
call InserirAluno ('George', 'Matos', '2003-02-02');
call InserirAluno ('Sabrina', 'Oliveira', '2004-08-09');
call InserirAluno ('Carlos', 'Bittencourt', '2002-07-14');
call InserirAluno ('Henrique', 'Ferreira', '2004-09-27');
select * from alunos;

select BuscarIdCurso('Psicologia', 'Saúde') as IdCurso;

call MatricularAluno(1, 1);
call MatricularAluno(2, 1);
call MatricularAluno(3, 1);
call MatricularAluno(4, 2);
call MatricularAluno(5, 3);
call MatricularAluno(6, 4);
call MatricularAluno(7, 5);

select * from matriculas;

call MatricularAluno(1, 1);