delimiter $
create procedure inserirCurso(nome VARCHAR(50))
begin
	insert into cursos values (null, nome);
end$
delimiter ;

delimiter $
create procedure listarCursos()
begin
	select * from cursos;
end$
delimiter ;

call inserirCurso('Análise e Desenvolvimento de Sistemas');
call inserirCurso('Recursos Humanos');
call inserirCurso('Tecnologia da Informação');
call inserirCurso('Engenharia de Software');

delimiter $
create procedure inserirProfessor(nome VARCHAR(80), salario DECIMAL(10,2))
begin
	insert into professores values (null, nome, salario);
end$
delimiter ;

delimiter $
create procedure listarProfessores()
begin
	select * from professores;
end$
delimiter ;

call inserirProfessor('Antônio Marques', 3540.00);
call inserirProfessor('Paula Fernandes', 3700.00);
call inserirProfessor('Rafael Ferreira', 4150.00);
call inserirProfessor('Gustavo Munhoz', 3330.00);
call inserirProfessor('Débora Oliveira', 5120.00);

delimiter $
create trigger gerarEmail before insert on alunos for each row
begin
	declare contadorEmail int;
	set contadorEmail = 0;
  
	select count(*) into contadorEmail from alunos where email = CONCAT(NEW.nome, '.', NEW.sobrenome, '@facens.br');
  
	if contadorEmail > 0 then
		set NEW.email = CONCAT(NEW.nome, '.', NEW.sobrenome, contadorEmail, '@facens.br');
	else
		set NEW.email = CONCAT(NEW.nome, '.', NEW.sobrenome, '@facens.br');
	end if;
end $
delimiter ;

delimiter $
create procedure inserirAluno(nome VARCHAR(80), sobrenome VARCHAR(80), ra INT(4), data_nascimento DATE)
begin
	insert into alunos(nome, sobrenome, ra, data_nascimento) values (nome, sobrenome, ra, data_nascimento);
end$
delimiter ;

delimiter $
create procedure listarAlunos()
begin
	select * from alunos;
end$
delimiter ;

call inserirAluno('Juliana', 'Ferreira', 1123, '1999-02-15');
call inserirAluno('Juliana', 'Ferreira', 1124, '2001-12-14');
call inserirAluno('Felipe', 'Alves', 1125, '1999-04-28');
call inserirAluno('Carla', 'Dias', 1126, '1998-07-14');
call inserirAluno('Eduardo', 'Oliveira', 1127, '2000-11-02');

call listarAlunos;
call listarCursos;
call listarProfessores;
