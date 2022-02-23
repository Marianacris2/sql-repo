create database lista08;
use lista08;

create table funcionario(
matricula int, nome varchar(40),endereco varchar(40), telefone varchar(20),
constraint matricula_pk primary key(matricula)
);

create table produto(
codigo int, nome varchar(20), preco float,
constraint codigo_pk primary key(codigo)
);

create table cliente(
id int, nome varchar(30), endereco varchar(30),
constraint id_pk primary key(id)
);

insert into funcionario values(123, "Joao da Silva", "Av Caruaru","08765454123");
insert into funcionario values(456,"Vanessa Brandao","Av Rui Barbosa","08145678945");
insert into funcionario values(789,"Lucas Barbosa","Rua Afonso Pena","08162193189");
insert into funcionario values(144,"Gabriel Araujo","Av Ceci Cunha","08284216488");
insert into funcionario values(757,"Pedro Batista","Rua Mauricio Pereira","08218648486");

insert into produto values(872819,"Computador",1200);
insert into produto values(123451,"TV LED", 3000);
insert into produto values(723512,"Impressora",800);
insert into produto values(87819,"Tablet",1500);
insert into produto values(142351,"Notebook",5600);
insert into produto values(456487,"Tv LCD", 2000);

insert into cliente values(985,"Fabio da Silva","Rua Severino Peixoto");
insert into clinete values(839,"Igor Torres","Rua Sao Domingos");
insert into cliente values(789,"Tiago Lopes","Rua Joaquim Branco");
insert into cliente values(367,"Fabiano de Souza","Rua Severino Peixoto");
insert into cliente values(089,"Carlos Eduardo", "Av. Rio Branco");

select * from cliente;
select id from cliente where nome like ("%Tiago%Lopes%");
select * from cliente where nome like ("%Lopes%");
select endereco from cliente;
select nome from cliente where endereco = ("%Rua%Severino%Peixoto%");
select nome from funcionario where endereco like("%Av%");
select telefone from funcionario where nome like ("%Pedro%Batista%");
select endereco from funcionario where nome like ("%Lucas%Barbosa%");
select nome, endereco from funcionario where matricula = 456;
select nome from funcionario where telefone like "%087" and telefone like "%081";
select preco from produto where nome like("%TV%LED");
select * from produto where nome like("%TV%");
select nome,preco from produto where codigo = 87819;
select nome from produto where preco>500;
select nome from produto where preco >500 and preco<1500;

alter table cliente rename to clientes;
alter table clientes rename to cliente;
alter table cliente drop nome;
alter table cliente add nome 




