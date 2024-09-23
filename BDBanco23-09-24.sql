CREATE DATABASE banco;
USE banco;

CREATE TABLE estados (
    idestado INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE cidades (
    idcidade INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idestado INT,
    FOREIGN KEY (idestado) REFERENCES estados(idestado)
);

CREATE TABLE generos (
    idgenero INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE racas (
    idraca INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE religioes (
    idreligiao INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE estadocivis (
    idestadocivil INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE agencias (
    idagencia INT AUTO_INCREMENT PRIMARY KEY,
    numeroagencia VARCHAR(20) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    idcidade INT,
    idestado INT,
    FOREIGN KEY (idcidade) REFERENCES cidades(idcidade),
    FOREIGN KEY (idestado) REFERENCES estados(idestado)
);

CREATE TABLE clientes (
    idcliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    rg VARCHAR(20),
    datanascimento DATE,
    fone VARCHAR(20),
    endereco VARCHAR(255),
    idcidade INT,
    idestado INT,
    idgenero INT,
    idraca INT,
    idreligiao INT,
    idestadocivil INT,
    agencias INT,
    saldo DECIMAL(10, 2) DEFAULT 0,
    numeroconta VARCHAR(20) NOT NULL,
    FOREIGN KEY (idcidade) REFERENCES cidades(idcidade),
    FOREIGN KEY (idestado) REFERENCES estados(idestado),
    FOREIGN KEY (idgenero) REFERENCES generos(idgenero),
    FOREIGN KEY (idraca) REFERENCES racas(idraca),
    FOREIGN KEY (idreligiao) REFERENCES religioes(idreligiao),
    FOREIGN KEY (idestadocivil) REFERENCES estadocivis(idestadocivil),
    FOREIGN KEY (agencias) REFERENCES agencias(idagencia)
);

CREATE TABLE saques (
    idoperacao INT AUTO_INCREMENT PRIMARY KEY,
    idagencia INT,
    idcontacliente INT,
    valordosaque DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idagencia) REFERENCES agencias(idagencia),
    FOREIGN KEY (idcontacliente) REFERENCES clientes(idcliente)
);

CREATE TABLE depositos (
    idoperacao INT AUTO_INCREMENT PRIMARY KEY,
    idagencia INT,
    idcontacliente INT,
    valordodeposito DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idagencia) REFERENCES agencias(idagencia),
    FOREIGN KEY (idcontacliente) REFERENCES clientes(idcliente)
);



INSERT INTO estados (nome) VALUES 
('São Paulo'), 
('Rio de Janeiro');


INSERT INTO cidades (nome, idestado) VALUES 
('São Paulo', 1), 
('Rio de Janeiro', 2);


INSERT INTO generos (descricao) VALUES 
('Masculino'), 
('Feminino');


INSERT INTO racas (descricao) VALUES 
('Branca'), 
('Parda');


INSERT INTO religioes (descricao) VALUES 
('Cristã'), 
('Espírita');


INSERT INTO estadocivis (descricao) VALUES 
('Solteiro'), 
('Casado');


INSERT INTO agencias (numeroagencia, endereco, idcidade, idestado) VALUES 
('001', 'Rua A, 123', 1, 1), 
('002', 'Rua B, 456', 2, 2);


INSERT INTO clientes (nome, cpf, rg, datanascimento, fone, endereco, idcidade, idestado, idgenero, idraca, idreligiao, idestadocivil, agencias, saldo, numeroconta) VALUES 
('João Silva', '12345678909', 'MG1234567', '1980-01-01', '11987654321', 'Rua A, 123', 1, 1, 1, 1, 1, 1, 1, 1000.00, '00001'),
('Maria Oliveira', '98765432100', 'MG7654321', '1990-05-15', '21987654321', 'Rua B, 456', 2, 2, 2, 2, 2, 2, 2, 2000.00, '00002');


INSERT INTO saques (idagencia, idcontacliente, valordosaque) VALUES 
(1, 1, 200.00), 
(2, 2, 300.00);


INSERT INTO depositos (idagencia, idcontacliente, valordodeposito) VALUES 
(1, 1, 500.00), 
(2, 2, 700.00);

SELECT nome, saldo FROM clientes;
DELIMITER $
CREATE TRIGGER triggersaque AFTER INSERT ON saques
FOR EACH ROW
BEGIN
    UPDATE clientes
    SET saldo = saldo - NEW.valordosaque
    WHERE idcliente = NEW.idcontacliente;
END;
$
CREATE TRIGGER triggerdeposito AFTER INSERT ON depositos
FOR EACH ROW
BEGIN
    UPDATE clientes
    SET saldo = saldo + NEW.valordodeposito
    WHERE idcliente = NEW.idcontacliente;
END;
$
DELIMITER ;
SELECT nome, saldo FROM clientes;
SELECT * FROM saques WHERE idcontacliente = 1;
SELECT SUM(valordodeposito) AS total_de_depositos FROM depositos WHERE idagencia = 1;

