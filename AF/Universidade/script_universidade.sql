create database universidade;
use universidade;

create table alunos (
	ra int primary key auto_increment,
    nome varchar(80) not null,
    sobrenome varchar(80) not null,
    dataNascimento date not null,
    email varchar(100)
);

create table cursos (
	idCurso int primary key auto_increment,
    nomeCurso varchar(60),
    areaCurso varchar(60)
);

create table matriculas (
	idmatricula int primary key auto_increment,
    alunos_ra int references alunos(ra),
    cursos_id int references cursos(idCurso)
);

delimiter $
create procedure InserirCurso (nomeCurso varchar(60), areaCurso varchar(60))
begin
    insert into cursos (nomeCurso, areaCurso) values (nomeCurso, areaCurso);
end$
delimiter ;

delimiter $
create procedure SelecionarCursos()
begin
    select * from cursos;
end$
delimiter ;

delimiter $
create procedure InserirAluno (nome varchar(80), sobrenome varchar(80), dataNascimento date)
begin
    insert into alunos (nome, sobrenome, dataNascimento) values (nome, sobrenome, dataNascimento);
end$
delimiter ;

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
create function BuscarIdCurso(nomeCurso varchar(60), areaCurso varchar(60))
	returns int deterministic
begin
	select idCurso INTO @curso_id from cursos
		where cursos.nomeCurso = nomeCurso AND cursos.areaCurso = areaCurso;
	return @curso_id;
end $
delimiter ;

delimiter $
create procedure MatricularAluno(ra int, idCurso int)
begin
	if exists (select 1 from matriculas where ra = alunos_ra and idCurso = cursos_id) then
		SIGNAL SQLSTATE '45000'
		set message_text = 'Aluno já matriculado neste curso.';
	else
		insert into matriculas (idmatricula, alunos_ra, cursos_id)
		values (null, ra, idCurso);
	end if;
end $
delimiter ;
