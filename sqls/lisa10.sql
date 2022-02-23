
CREATE DATABASE AULA;
USE AULA;

CREATE TABLE CLIENTE (NUMERO VARCHAR(10), NOME VARCHAR(200), TELEFONE VARCHAR(12),
 ENDERECO  VARCHAR(50), CONSTRAINT CLIENTE_PK PRIMARY KEY (NUMERO));

CREATE TABLE FILME (ID VARCHAR(10), TITULO VARCHAR(200), CATEGORIA VARCHAR(50),
CONSTRAINT FILME_PK PRIMARY KEY (ID));

CREATE TABLE DVD (ID VARCHAR(10), ID_FILME_FK VARCHAR(10), 
CONSTRAINT DVD_PK PRIMARY KEY (ID), 
CONSTRAINT DVD_FK FOREIGN KEY (ID_FILME_FK) REFERENCES FILME(ID));

CREATE TABLE DIRETOR (ID VARCHAR(10), NOME VARCHAR(200), SEXO VARCHAR(20), PAIS VARCHAR(50),
CONSTRAINT DIRETOR_PK PRIMARY KEY (ID));

CREATE TABLE ATOR (ID VARCHAR(10), NOME VARCHAR(200), SEXO VARCHAR(20), PAIS VARCHAR(50),
CONSTRAINT ATOR_PK PRIMARY KEY (ID));

CREATE TABLE POSSUI_DIRETOR (ID_DIRETOR_FK VARCHAR(10), ID_FILME_FK VARCHAR(10),
CONSTRAINT POSSUI_DIRETOR_PK PRIMARY KEY (ID_DIRETOR_FK, ID_FILME_FK),
CONSTRAINT POSSUI_DIRETOR_FK FOREIGN KEY (ID_DIRETOR_FK) REFERENCES DIRETOR(ID),
CONSTRAINT POSSUI_DIRETOR_FK2 FOREIGN KEY (ID_FILME_FK) REFERENCES FILME(ID));

CREATE TABLE POSSUI_ATOR (ID_ATOR_FK VARCHAR(10), ID_FILME_FK VARCHAR(10),
CONSTRAINT POSSUI_ATOR_PK PRIMARY KEY (ID_ATOR_FK, ID_FILME_FK),
CONSTRAINT POSSUI_ATOR_FK FOREIGN KEY (ID_ATOR_FK) REFERENCES ATOR(ID),
CONSTRAINT POSSUI_ATOR_FK2 FOREIGN KEY (ID_FILME_FK) REFERENCES FILME(ID));

CREATE TABLE ALUGA (ID_DVD_FK VARCHAR(10), NUM_CLIENTE_FK VARCHAR(10), DT_EMP VARCHAR(10), DT_DEVOLUCAO VARCHAR(10), DT_PREV_DEVOLUCAO VARCHAR(10),
CONSTRAINT ALUGA_PK PRIMARY KEY (ID_DVD_FK, NUM_CLIENTE_FK),
CONSTRAINT ALUGA_FK FOREIGN KEY (ID_DVD_FK) REFERENCES DVD(ID),
CONSTRAINT ALUGA_FK2 FOREIGN KEY (NUM_CLIENTE_FK) REFERENCES CLIENTE(NUMERO));

INSERT INTO CLIENTE VALUES ('1234', 'JOSÉ DA SILVA', '8299953451', 'RUA SÃO FRANCISCO');
INSERT INTO CLIENTE VALUES ('4564', 'MARIANA GOMES', '8188953789', 'RUA 15 DE NOVEMBRO');
INSERT INTO CLIENTE VALUES ('4651', 'PEDRO DE GOIS', '8755551451', 'AV RIO BRANCO');
INSERT INTO CLIENTE VALUES ('1521', 'JOSEFINA DOS SANTOS', '8299990150', 'RUA SÃO FRANCISCO');

INSERT INTO FILME VALUES ('1101', '10 COISAS QUE EU ODEIO EM VOCÊ', 'COMÉDIA');
INSERT INTO FILME VALUES ('1451', 'PSICOSE', 'SUSPENSE');
INSERT INTO FILME VALUES ('4517', 'LARANJA MECÂNICA', 'FICÇÃO CIENTÍFICA');
INSERT INTO FILME VALUES ('4518', 'O PODEROSO CHEFÃO', 'DRAMA');
INSERT INTO FILME VALUES ('3123', 'Monty Python em busca do Cálice Sagrado', 'COMÉDIA');

INSERT INTO DVD VALUES ('1233','1101');
INSERT INTO DVD VALUES ('1244','1451');
INSERT INTO DVD VALUES ('1789','4517');
INSERT INTO DVD VALUES ('1854','4518');
INSERT INTO DVD VALUES ('7222','3123');

INSERT INTO ALUGA VALUES ( '1233', '1234','12-12-2019',' ','17-12-2019');
INSERT INTO ALUGA VALUES ('1244','4564','09-10-2019',' ','14-10-2019');
INSERT INTO ALUGA VALUES ('1789','4651','06-03-2019','15-03-2019','11-03-2019');
INSERT INTO ALUGA VALUES ('1854','1521','04-02-2019','10-02-2019','09-02-2019');
INSERT INTO ALUGA VALUES ('7222','1521','21-05-2019','26-05-2019','26-05-2019');

INSERT INTO ATOR VALUES ('1125', 'AL PACINO', 'MASC', 'EUA'); 
INSERT INTO ATOR VALUES ('1443', 'Marlon Brando', 'MASC', 'EUA'); 
INSERT INTO ATOR VALUES ('3124', 'Malcolm McDowell', 'MASC', 'UK'); 
INSERT INTO ATOR VALUES ('1543', 'Heath Ledger', 'MASC', 'AUS'); 
INSERT INTO ATOR VALUES ('5142', 'Julia Stiles', 'FEM', 'EUA'); 
INSERT INTO ATOR VALUES ('8762', 'Janet Leigh', 'FEM', 'EUA'); 
INSERT INTO ATOR VALUES ('9875', 'Adrienne Corri', 'FEM', 'UK'); 
INSERT INTO ATOR VALUES ('1235', 'John Cleese', 'MASC', 'EUA'); 

INSERT INTO DIRETOR VALUES ('8673', 'Stanley Kubrick', 'MASC', 'EUA'); 
INSERT INTO DIRETOR VALUES ('8133', 'Terrence Vance Gilliam', 'MASC', 'EUA'); 
INSERT INTO DIRETOR VALUES ('3193', 'FRANCIS FORD COPPOLA', 'MASC', 'EUA'); 
INSERT INTO DIRETOR VALUES ('3861', 'Gil Junger', 'MASC', 'EUA'); 
INSERT INTO DIRETOR VALUES ('2340', 'Alfred Hitchcock', 'MASC', 'UK'); 

INSERT INTO POSSUI_ATOR VALUES ('1235', '3123');
INSERT INTO POSSUI_DIRETOR VALUES ('8133','3123');

INSERT INTO POSSUI_ATOR VALUES ('8762', '1451');
INSERT INTO POSSUI_DIRETOR VALUES ('2340','1451');

INSERT INTO POSSUI_ATOR VALUES ('1543', '1101');
INSERT INTO POSSUI_ATOR VALUES ('5142', '1101');
INSERT INTO POSSUI_DIRETOR VALUES ('3861','1101');

INSERT INTO POSSUI_ATOR VALUES ('3124', '4517');
INSERT INTO POSSUI_ATOR VALUES ('9875', '4517');
INSERT INTO POSSUI_DIRETOR VALUES ('8673','4517');

INSERT INTO POSSUI_ATOR VALUES ('1125','4518');
INSERT INTO POSSUI_ATOR VALUES ('1443','4518');
INSERT INTO POSSUI_DIRETOR VALUES ('3193','4518');


SELECT NOME FROM ATOR WHERE NOME LIKE("%Leigh%");


#1
SELECT NUM_CLIENTE_FK AS ID_CLIENTE
FROM ALUGA
WHERE DT_EMP = '12-12-2019';

#2
SELECT NUM_CLIENTE_FK
FROM ALUGA
WHERE DT_DEVOLUCAO <> DT_PREV_DEVOLUCAO;

SELECT NUM_CLIENTE_FK
FROM ALUGA
WHERE DT_DEVOLUCAO <> DT_PREV_DEVOLUCAO AND
DT_DEVOLUCAO <> ' ';

#11
SELECT CLIENTE.NOME
FROM CLIENTE, ALUGA
WHERE CLIENTE.NUMERO = ALUGA.NUM_CLIENTE_FK AND DT_DEVOLUCAO = ' ';

#12
SELECT A.NOME
FROM ATOR A, POSSUI_ATOR PA, FILME F
WHERE A.ID = PA.ID_ATOR_FK AND PA.ID_FILME_FK = F.ID AND
F.TITULO = 'Monty Python em busca do Cálice Sagrado';

#13
SELECT F.TITULO
FROM CLIENTE C, ALUGA A, DVD D, FILME F
WHERE C.NUMERO = A.NUM_CLIENTE_FK AND A.ID_DVD_FK = D.ID AND
D.ID_FILME_FK = F.ID AND C.NOME = 'Mariana Gomes';

#14
SELECT DI.NOME
FROM CLIENTE C, ALUGA A, DVD D, FILME F, POSSUI_DIRETOR PD, DIRETOR DI
WHERE C.NUMERO = A.NUM_CLIENTE_FK AND A.ID_DVD_FK = D.ID AND
D.ID_FILME_FK = F.ID AND F.ID = PD.ID_FILME_FK AND PD.ID_DIRETOR_FK = DI.ID
AND C.NOME = 'Pedro de Gois';





SELECT CLIENTE.COD, PRODUTO.NOME FROM CLIENTE, PRODUTO WHERE CLIENTE.COD = PRODUTO.COD_CLIENTE AND PRODUTO.NOME LIKE ("JOSE");
SELECT * FROM CLIENTE C,PRODUTO P WHERE C.COD = P.COD_CLIENTE;
select nome,cidade,estado from cliente order by nome desc, cidade desc;

select max(nota) AS maiorNota, min(nota) AS menorNota from estudante; 	#askdad
/*asdada*/

select SUM(salario) as somaMq300 from funcionario where salario>300;
select AVG(salario) as media from funcionario where salario>50;

select distinct cargo from pessoa;
select count(distinct cidade) as n_cidades from funcionario;

#2
select num_cliente_fk from aluga,cliente where num_cliente_fk = cliente.numero and dt_emp = '12-12-2019';
#3
select ID_FILME_FK from possui_diretor, diretor where ID_DIRETOR_FK = diretor.id and diretor.nome = 'Francis Ford Coppola';

select id_filme_fk from possui_ator, ator where possui_ator.id_ator_fk = ator.id and ator.nome = 'Heath Ledger';

select ID_DVD_FK from aluga, cliente where  NUM_CLIENTE_FK = cliente.numero and cliente.nome = 'Josefina dos Santos';

select num_cliente_fk from aluga, cliente where num_cliente_fk= cliente.numero and dt_devolucao != dt_prev_devolucao;

select titulo from filme, dvd where dvd.id=1244 and filme.titulo=titulo;  #7

#8
select titulo from filme, possui_diretor, diretor where possui_diretor.ID_FILME_FK= filme.id and  possui_diretor.ID_DIRETOR_FK = diretor.id and diretor.nome='Stanley Kubrick';

#9
select titulo from filme, possui_ator, ator where possui_ator.id_ator_fk = ator.id and possui_ator.id_filme_fk = filme.id and ator.nome = 'Adrienne Corri';

#10
select nome from ator, possui_ator, filme where possui_ator.id_filme_fk = filme.id and possui_ator.id_ator_fk = ator.id and filme.titulo = '10 coisas que eu odeio em voce';

#11
select nome from cliente, aluga where aluga.DT_DEVOLUCAO =' ' and aluga.NUM_CLIENTE_FK=cliente.numero;

#12
select ator.nome from ator,possui_ator,filme where possui_ator.id_ator_fk = ator.id and possui_ator.id_filme_fk = filme.id and filme.titulo = 'Monty Python em busca do cálice sagrado';

#13
select titulo from filme,aluga,cliente,dvd where aluga.id_dvd_fk = dvd.id and dvd.id_filme_fk = filme.id and cliente.numero = aluga.num_cliente_fk and cliente.nome = 'Mariana Gomes';

#14
select diretor.nome from diretor,filme,aluga,possui_diretor,dvd,cliente where aluga.num_cliente_fk = cliente.numero and 
cliente.nome='Pedro de Gois' and aluga.id_dvd_fk = dvd.id and dvd.id_filme_fk = filme.id and  possui_diretor.id_filme_fk = filme.id and possui_diretor.id_diretor_fk = diretor.id;

#15
select ator.nome from ator,filme,dvd,aluga,cliente,possui_ator where aluga.num_cliente_fk = cliente.numero and cliente.nome = 'José da Silva' and 
aluga.id_dvd_fk = dvd.id and dvd.id_filme_fk = filme.id and possui_ator.id_filme_fk = filme.id and possui_ator.id_ator_fk = ator.id;








