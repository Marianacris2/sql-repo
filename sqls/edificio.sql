 use prova;
create table edificio(
cod int, end varchar(20),data_cons date, data_vistoria date,
constraint cod_pk primary key(cod)
);
create table apartamentos(
cod_end int, area float, numero int,
constraint apart_pk primary key (cod_end, numero),
constraint cod_fk foreign key (cod_end) references edificio(cod)
);
create table pessoa(
cpf int, nome varchar(20),data_nasc date, sexo varchar(1),
constraint cpf_pk primary key(cpf)
);
create table morar(
cod_end_fk int, num_fk int, cpf_fk int, dt_inicio date, tipo_moradia varchar(20),
constraint morar_pk primary key(cod_end_fk, num_fk, cpf_fk),
constraint morar_fk foreign key(cod_end_fk) REFERENCES edificio(cod),
constraint morar_num_fk foreign key (num_fk) references apartamentos(numero),
constraint morar_cpf_fk foreign key (cpf_fk) references pessoa(cpf)
);
