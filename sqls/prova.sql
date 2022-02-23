CREATE DATABASE questao3; USE questao3;
CREATE TABLE funcionario(id INT, nome VARCHAR(20), salario FLOAT, CONSTRAINT id_pk PRIMARY KEY(id) );

CREATE TABLE gerente ( ID_fk INT, CONSTRAINT ID_fk PRIMARY KEY (ID),CONSTRAINT ID_fk FOREIGN KEY (id)REFERENCES funcionario (ID));

CREATE TABLE atendente (id_fk INT, CONSTRAINT id_fk PRIMARY KEY (id),CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES funcionario (id) );

CREATE TABLE produto(cod INT, nome VARCHAR(20), preco FLOAT, CONSTRAINT cod_pk PRIMARY KEY(cod));

CREATE TABLE cliente(cpf INT, nome VARCHAR(20), endereco INT, CONSTRAINT cpf_pk PRIMARY KEY(cpf));

CREATE TABLE telefones_cliente(cpf_cli INT, telefone INT,CONSTRAINT telefone_pk PRIMARY KEY(cpf_cli, telefone),
CONSTRAINT telefone_fk FOREIGN KEY(cpf_cli) REFERENCES cliente(cpf));

CREATE TABLE dependentes(id_func INT, nome VARCHAR(20), data_n DATE,CONSTRAINT dependentes_pk PRIMARY KEY (id_func, nome),
CONSTRAINT dependentes_fk FOREIGN KEY(id) REFERENCES funcionario(id));

CREATE TABLE vende(
id_func INT, cpf_cli INT, cod_p INT, data_compra DATE, valor FLOAT,
CONSTRAINT vende_pk PRIMARY KEY (id_func, cpf_cli, cod_p),
CONSTRAINT funcionario_fk FOREIGN KEY(id_func) REFERENCES funcionario(id),
 CONSTRAINT cliente_fk FOREIGN KEY(cpf_clie) REFERENCES cliente(cpf),
 CONSTRAINT produto_fk FOREIGN KEY(cod_p) REFERENCES produto(cod)
 )