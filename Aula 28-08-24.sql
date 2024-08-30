CREATE DATABASE IF NOT EXISTS cadastro;
USE cadastro;


CREATE TABLE estado (
    id_estado INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);


CREATE TABLE cidade (
    id_cidade INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES estado(id_estado)
);


CREATE TABLE pessoa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_estado INT,
    id_cidade INT,
    FOREIGN KEY (id_cidade) REFERENCES cidade(id_cidade),
    FOREIGN KEY (id_estado) REFERENCES estado(id_estado)
);


INSERT INTO estado (nome) VALUES 
('Mato Grosso do Sul'),
('Goiás'),
('Mato Grosso'),
('São Paulo'),
('Rio Grande do Sul'),
('Paraná');


INSERT INTO cidade (nome, id_estado) VALUES 
('Campo Grande', 1),
('Dourados', 1),
('Três Lagoas', 1),
('Corumbá', 1),
('Cuiabá', 3),
('Goiânia', 2),
('Mato Grosso', 3),
('Goiás', 2),
('São Paulo', 4),
('Rio Grande do Sul', 5),
('Curitiba', 6);


INSERT INTO pessoa (nome, id_estado, id_cidade) VALUES 
('Ederson da Costa', 1, 1),
('Maria Aparecida', 1, 2),
('Pedro Correa', 3, 5),
('Michael Jackson', 2, 7),
('Fredie Mercury', 4, 9);

select * from pessoa;
SELECT * FROM pessoa JOIN cidade ON pessoa.id_cidade = cidade.id_cidade;
SELECT pessoa.nome, cidade.nome, estado.nome FROM pessoa JOIN cidade ON pessoa.id_cidade = cidade.id_cidade join estado on pessoa.id_estado = estado.id_estado;
SELECT * FROM pessoa LEFT JOIN cidade ON pessoa.id_cidade = cidade.id_cidade;
SELECT * FROM pessoa RIGHT JOIN cidade ON pessoa.id_cidade = cidade.id_cidade;
SELECT * FROM pessoa CROSS JOIN cidade, estado;
select nome from cidade UNION select nome FROM estado;
SELECT * FROM pessoa LEFT JOIN cidade ON pessoa.id_cidade = cidade.id_cidade UNION SELECT * FROM pessoa RIGHT JOIN cidade ON pessoa.id_cidade = cidade.id_cidade;





