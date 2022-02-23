create database lojacarros;
use lojacarros;

create table cliente (
cpf int,  endereco varchar(20),  estado varchar(20),  cidade varchar(20),
constraint cpf_pk primary key (cpf)
);
create table telefone(
cpf_cl int, telefone varchar(10),
constraint telefone_pk primary key (cpf_cl, telefone),
constraint telefone_fk foreign key(cpf_cl) references cliente(cpf)
);
create table emails(
cpf_cl int, email varchar(10),
constraint email_pk primary key (cpf_cl, email),
constraint email_fk foreign key(cpf_cl) references cliente(cpf)
);

create table funcionario(
cpf int, identidade int, endereco varchar(20),
constraint cpf_pk_f primary key (cpf)
);

create table cargo(
cod int, descricao varchar(30), salario int,
constraint cod_pk primary key(cod)
);

create table dependentes(
cpf_f int, nome varchar(10), grau int, dat_a date,
constraint dependentes_pk primary key (cpf_f,nome),
constraint dependentes_fk foreign key(cpf_f) references funcionario(cpf)
);

create table aluga(
cpf_c int, cpf_f int, id int, dat_a date, km float,
constraint aluga_pk primary key (cpf_C,cpf_f,id),
constraint cpf_c_fk foreign key(cpf_c) references cliente(cpf),
constraint cpf_f_fk foreign key(cpf_f) references funcionario(cpf)
);

create table possui(
cpf_f int, cod_cargo int,
constraint possui primary key(cpf_f, cod),
constraint cpf_fk foreign key(cpf_f) references funcionario(cpf),
constraint cod_fk foreign key(cod_v) references veiculo(cod)
);

create table devolve(
cpf_c int, cpf_f int, id_v int, data_a date,
constraint devolve_pk primary key (cpf_c,cpf_f,id_v),
constraint cpf_c_fk foreign key (cpf_c) references cliente(cpf),
constraint cpf_f_fk foreign key (cpf_f) references funcionario(cpf),
constraint id_v_fk foreign key (id_v) references veculo(id)
);