create database atividaded3;
use atividaded3;

create table funcionario(
Pnome varchar(200), Minicial varchar(1), Unome varchar(200),  cpf varchar(30),datanasc varchar(20), endereco varchar(300),
sexo varchar(20), salario float, cpf_supervisor varchar(30), Dnr int,
constraint funcionario_pk primary key(cpf)
);
insert into funcionario values ('João', 'B', 'Silva', '12345678966', '09-01-1965', 'Rua das Flores 751 São Paulo SP', 'M', 30.000, '33344555587' ,5); 
insert into funcionario values ('Fernando', 'T','Wong', '33344555587', '08-12-1955', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40.000, '88866555576', 5 );
insert into funcionario values ('Alice', 'J', 'Zelaya', '99988777767', '19-01-1968', 'Rua Souza Lima, 35, Curitiba, PR', 'F', 25.000 ,'98765432168', 4 );
insert into funcionario values ('Jennifer', 'S', 'Souza', '98765432168', '20-06-1941', 'Av. Arthur de Lima, 54, Santo André, SP', 'F', 43.000, '88866555576', 4) ;
insert into funcionario values ('Ronaldo', 'K', 'Lima', '66688444476', '15-09-1962', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38.000, '33344555587', 5 );
insert into funcionario values ('Joice' ,'A' ,'Leite' ,'45345345376',  '31-07-1972' ,'Av. Lucas Obes, 74, São Paulo, SP' ,'F' ,25.000 ,'33344555587', 5) ;
insert into funcionario values ('André', 'V', 'Pereira', '98798798733', '29-03-1969', 'Rua Timbira, 35, São Paulo, SP', 'M', 25.000, '98765432168' ,4 );
insert into funcionario values ('Jorge', 'E', 'Brito', '88866555576', '10-11-1937', 'Rua do Horto, 35, São Paulo, SP' ,'M' ,55.000, NULL, 1);

create table departamento(
Dnome varchar(100), Dnumero int, cpf_gerente varchar(30), data_inicio_gerente varchar(20),
constraint departamento_pk primary key(Dnumero)
);
insert into departamento values ('Pesquisa', 5, '33344555587', '22-05-1988');
insert into departamento values ('Administração', 4, '98765432168', '01-01-1995'); 
insert into departamento values ('Matriz' ,1, '88866555576', '19-06-1981');

create table localizacao_dep(
Dnumero int, Dlocal varchar(300),
constraint localizao_pk primary key(Dnumero, Dlocal),
constraint localizacao_numero_fk foreign key(Dnumero) references departamento(Dnumero)
);
insert into localizacao_dep values(1, 'São Paulo');
insert into localizacao_dep values(4, 'Mauá');
insert into localizacao_dep values(5, 'Santo André');
insert into localizacao_dep values(5, 'Itu');
insert into localizacao_dep values(5, 'São Paulo');

create table projeto(
Projnome varchar(100), Projnumero int, Projlocal varchar(200), Dnum int,
constraint projeto_pk primary key (Projnumero),
constraint projeto_fk foreign key (Dnum) references departamento(Dnumero)
);
insert into projeto values('ProdutoX' ,1, 'Santo André', 5);
insert into projeto values('ProdutoY', 2 ,'Itu', 5 );
insert into projeto values('ProdutoZ', 3 ,'São Paulo', 5 );
insert into projeto values('Informatização', 10, 'Mauá', 4);
insert into projeto values('Reorganização', 20 ,'São Paulo', 1);
insert into projeto values('Novosbenefícios', 30 ,'Mauá', 4);

create table trabalha_em(
Fcpf varchar(20), Pnr int, horas float,
constraint trabalha_pk primary key (Fcpf, Pnr),
constraint trabalha_fk foreign key (Pnr) references projeto(Projnumero)
);
insert into trabalha_em values('12345678966', 1, 32.5);
insert into trabalha_em values('12345678966', 2, 7.5);
insert into trabalha_em values('45345345376', 1, 20.0);
insert into trabalha_em values('45345345376', 2, 20.0);
insert into trabalha_em values('33344555587', 2 ,10.0);
insert into trabalha_em values('33344555587', 3, 10.0);
insert into trabalha_em values('33344555587', 10,10.0);
insert into trabalha_em values('33344555587', 20,10.0);
insert into trabalha_em values('99988777767', 30, 30.0);
insert into trabalha_em values('99988777767', 10, 10.0);
insert into trabalha_em values('98798798733', 10, 35.0);
insert into trabalha_em values('98798798733', 30 ,5.0);
insert into trabalha_em values('98765432168', 30, 20.0);
insert into trabalha_em values('98765432168', 20, 15.0);
insert into trabalha_em values('188866555576', 20, NULL);


create table dependente(
Fcpf varchar(20), nome_dependente varchar(100), sexo varchar(10), datanasc varchar(10), parentesco varchar(20),
constraint dependente_pk primary key(Fcpf, nome_dependente),
constraint dependente_fk foreign key (Fcpf) references funcionario(cpf)
);
insert into dependente values('33344555587', 'Alicia', 'F', '05-04-1986', 'Filha');
insert into dependente values('33344555587', 'Tiago', 'M', '25-10-1983', 'Filho');
insert into dependente values('33344555587' ,'Janaína' ,'F' ,'03-05-1958' ,'Esposa');
insert into dependente values('98765432168' ,'Antonio', 'M' ,'28-02-1942', 'Marido');
insert into dependente values('12345678966' ,'Michael' ,'M','04-01-1988', 'Filho');
insert into dependente values('12345678966' ,'Alicia', 'F' ,'30-12-1988', 'Filha');
insert into dependente values('12345678966', 'Elizabeth', 'F' ,'05-05-1967', 'Esposa');

								/*SELECTS*/

/*5.5-a)*/ select Dnome, count(Pnome) as NumeroFuncionarios from  departamento, funcionario where salario>=30.000 and Dnr=Dnumero group by Dnome; 	
/*5.5-b)*/ select  Dnome, count(Pnome) as NFuncionariosMasculinos from departamento, funcionario where salario>=30.000 and Dnr=Dnumero and sexo='M'group by Dnome;   
/*5.7-a)*/ select Pnome from departamento, funcionario where  MAX(salario)>salario and Dnr=Dnumero and cpf=cpf_gerente;
/*5.7-b)*/ select Pnome from departamento, funcionario where cpf_supervisor='88866555576' and cpf_gerente = cpf_supervisor;
/*5.7-c)*/ select Pnome from departamento, funcionario where(salario-25.000) >=10.000 group by Pnome;
/*6.16-a)*/ select DISTINCT Pnome from funcionario, departamento, projeto, trabalha_em where Dnr=5 and horas>'10' and Projnome = 'ProdutoX' and Pnr = Projnumero;
/*6.16-b)*/ select Pnome from funcionario, dependente where nome_dependente like 'Mariana' and cpf=Fcpf;
/*6.16-c)*/ select Pnome from funcionario, departamento where Dnr=Dnumero and cpf_supervisor=cpf_gerente and Pnome ='Fernando' and Unome='Wong';
/*6.16-d)*/ select Projnome, sum(horas) from projeto, trabalha_em where  Projnumero=pnr group by Projnome;
/*6.16-e)*/ select DISTINCT Projnome, Pnome from projeto, trabalha_em, funcionario where cpf=fcpf and Projnumero = Pnr;
/*6.16-f)*/ select DISTINCT Projnome, Pnome from projeto, trabalha_em, funcionario where fcpf=NULL;
/*6.16-g)*/ select Dnome, AVG(salario) from departamento, funcionario where Dnr = Dnumero;
/*6.16-h)*/ select AVG(salario) from funcionario where sexo='F';
/*6.16-i)*/ select DISTINCT  Pnome, endereco from funcionario, departamento, projeto, localizacao_dep where Dlocal!='São Paulo' and projlocal='São Paulo';
/*6.16-j)*/ select DISTINCT Pnome from funcionario, dependente where cpf!=fcpf;
