use atvdd;

/*CREATE TABLE departamento (
  Dnumero INT NOT NULL,
  Dnome VARCHAR(100) NULL,
  Cpf_gerente VARCHAR(11)  NULL,
  Data_inicio_gerente DATETIME  NULL,
  PRIMARY KEY (Dnumero)
); 

CREATE TABLE dependente (
  Fcpf VARCHAR(11) NOT NULL,
  Nome_dependente VARCHAR(200) NOT NULL,
  Sexo char(1)  NULL,
  Datanasc DATETIME  NULL,
  Parentesco VARCHAR(100)  NULL,
  PRIMARY KEY (Fcpf,Nome_dependente),
  CONSTRAINT F1 FOREIGN KEY (Fcpf) REFERENCES funcionario (cpf)
); 

CREATE TABLE funcionario (
  Pnome VARCHAR(200)  NULL,
  Minicial VARCHAR(45)  NULL,
  Unome VARCHAR(200)  NULL,
  cpf VARCHAR(11) NOT NULL,
  Datanasc date  NULL,
  Endereco VARCHAR(500)  NULL,
  Sexo char(1)  NULL,
  Salario double  NULL,
  Cpf_supervidor VARCHAR(11)  NULL,
  Dnr INT  NULL,
  PRIMARY KEY (cpf),
  KEY F6_idx (Cpf_supervidor),
  KEY F7_idx (Dnr),
  CONSTRAINT F6 FOREIGN KEY (Cpf_supervidor) REFERENCES funcionario (cpf),
  CONSTRAINT F7 FOREIGN KEY (Dnr) REFERENCES departamento (Dnumero)
); 

CREATE TABLE localizacao_dep (
  Dnumero INT NOT NULL,
  Dlocal VARCHAR(100) NOT NULL,
  PRIMARY KEY (Dnumero,Dlocal),
  CONSTRAINT F5 FOREIGN KEY (Dnumero) REFERENCES departamento (Dnumero)
); 

CREATE TABLE projeto (
  Projnumero INT NOT NULL,
  Projnome VARCHAR(200)  NULL,
  Projlocal VARCHAR(100)  NULL,
  Dnum INT  NULL,
  PRIMARY KEY (Projnumero),
  KEY F4_idx (Dnum),
  CONSTRAINT F4 FOREIGN KEY (Dnum) REFERENCES departamento (Dnumero)
); 

CREATE TABLE trabalha_em (
  Fcpf VARCHAR(11) NOT NULL,
  Pnr INT NOT NULL,
  Horas double  NULL,
  PRIMARY KEY (Fcpf,Pnr),
  KEY F3_idx (Pnr),
  CONSTRAINT F2 FOREIGN KEY (Fcpf) REFERENCES funcionario (cpf),
  CONSTRAINT F3 FOREIGN KEY (Pnr) REFERENCES projeto (Projnumero)
); 
1. Crie uma procedure que insere um Funcionário na Tabela funcionario. Adicione todos os parâmetros necessários na procedure. 

2. Crie uma stored procedure que recebe um CPF de um funcionário como parâmetro e seleciona os nomes dos projetos e a quantidade de horas que esse funcionário trabalha.

3. Crie uma stored procedure que recebe um CPF de um funcionário como parâmetro e  seleciona os nomes dos dependentes e grau de parentesco deles para com o funcionário.
*/

DELIMITER $$
CREATE PROCEDURE INSERIRFUNCIONARIO (IN Pnome VARCHAR(200), IN Minicial VARCHAR(45), Unome VARCHAR(200), IN cpf VARCHAR(11), IN Datanasc date, Endereco VARCHAR(500), IN Sexo char(1),
  IN Salario double, IN Cpf_supervidor VARCHAR(11), IN Dnr INT)
  BEGIN
		INSERT INTO FUNCIONARIO VALUES(PNOME, MINICIAL, UNOME, CPF, DATANASC, ENDERECO, SEXO, SALARIO, CPF_SUPERVISOR);
  END $$
DELIMITER $$

DELIMITER $$ 
CREATE PROCEDURE FUNCIONARIOTRABALHA(IN CPF VARCHAR(11))
BEGIN
	SELECT PROJNOME, SUM(HORAS) FROM PROJETO, TRABALHA_EM, FUNCIONARIO WHERE CPF.FUNCIONARIO = CPF AND FCP = CPF AND PROJNUM = PNR;
END $$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE FUNCIONARIODEPENDENTE(IN CPF VARCHAR(11))
BEGIN
	SELECT NOME_DEPENDENTE, PARENTESCO FROM DEPENDENTE, FUNCIONARIO WHERE CPF.FUNCIONARIO = CPF AND FCPF = CPF;
END $$
DELIMITER ;

/*2. Crie uma stored procedure para: (a) inserir um funcionário na tabela "funcionario" do BD empresa e  
(b) que também atribua o funcionário inserido a um projeto qualquer. Por fim, (c) crie um handler do tipo
 CONTINUE que monitore a ocorrência de SQLExceptions. Caso um erro ocorra, a procedure deve retornar uma mensagem de erro. */
 
 /*3. Crie uma stored procedure para: (a) inserir um projeto na tabela "projeto" do BD empresa e  (b) crie um handler do 
 tipo EXIT nessa procedure que monitore a ocorrência de SQLExceptions. Caso um erro ocorra, a procedure deve retornar uma mensagem de erro.*/
 
DELIMITER $$
CREATE PROCEDURE  INCLUIR_FUNCIONARIO(IN Pnome VARCHAR(200), IN Minicial VARCHAR(45), Unome VARCHAR(200), IN cpf VARCHAR(11), IN Datanasc date, Endereco VARCHAR(500), IN Sexo char(1),
  IN Salario double, IN Cpf_supervidor VARCHAR(11), IN Dnr INT, IN NPROJETO INT, IN HORAS DOUBLE)
  BEGIN
		DECLARE ERRO INT;
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET ERRO = 1;
		INSERT INTO FUNCIONARIO VALUES(PNOME, MINICIAL, UNOME, CPF, DATANASC, ENDERECO, SEXO, SALARIO, CPF_SUPERVISOR); /*A*/
        INSERT INTO TRABALHA_EM VALUES(CPF, NPROJETO, HORAS); /*B*/
        
        IF ERRO = 1 THEN
			SELECT "HA ALGUM ERRO" AS MESSAGE;
		END IF;

  END $$
DELIMITER ;

CALL INCLUIR_FUNCIONARIO('MARIANA', 'M', 'AA', '212121', 08/12, 'RUA', 'F', 200.0, '222111', 3, 2, 12);

DELIMITER $$
CREATE PROCEDURE  INCLUIR_PROJETO(IN Projnumero INT, IN Projnome VARCHAR(200) ,IN Projlocal VARCHAR(100),IN Dnum INT)
  BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION 
        BEGIN
			SELECT CONCAT ('UM ERRO OCOREU') AS MESSAGE;
        END;
		INSERT INTO PROJETO VALUES(PROJNUMERO, PROJNOME, PROJLOCAL, DNUM); 

  END $$
DELIMITER ;;
CALL INCLUIR_PROJETO( 2, 'PRO', 'SAOPAULO', 2);