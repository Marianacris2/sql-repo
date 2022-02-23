create database lista07;
use lista07;

create table produto(
codigo int, nome varchar(20), preco float,
constraint codigo_pk primary key(codigo)
);
create table cliente(
cpf varchar(30), nome varchar(30),
constraint id_pk primary key(id)
);
create table telefone(
telefone varchar(20), cliente varchar(30),
constraint telefone_pk primary key(telefone,cliente),
constraint telefone_fk foreign key(cliente) references cliente(nome)
);
create table funcionario(
id int, endereco varchar(30), nome varchar(30),
constraint vendedor_pk primary key(id)
);
create table vendedor(
id_f int, endereco varchar(30), nome varchar(30),
constraint vendedor_pk primary key(id_f),
constraint vendedor_fk foreign key(id_f) references funcionario(id)
);
create table gerente(
id_f int, endereco varchar(30), nome varchar(30),
constraint gerente_pk primary key(id_f),
constraint vendedor_fk foreign key(id_f) references funcionario(id)
);

create table dependete(
nome varchar(30), id_f int,
constraint dependente_pk primary key(nome,id_f),
constraint dependente_fk foreign key(id_f) references funcionario(id)
);
create table vende(
cpf_c varchar(30), cod_p int, id_f int,
constraint vende_pk primary key (cpf_c,cod_p,id_f),
constraint vende_c_fk foreign key(cpf_c) references cliente(cpf),
constraint vende_p_fk foreign key(cod_p) references produto(cod),
constraint vende_f_fk foreign key(id_f) references funcionario(id)
);

alter table cliente drop column nome;
alter table cliente add column nome varchar(30);
alter table cliente change column nome coco varchar(20);






