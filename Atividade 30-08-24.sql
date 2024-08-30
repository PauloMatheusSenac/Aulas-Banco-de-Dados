CREATE TABLE estado(
	id_estado INT AUTO_INCREMENT PRIMARY KEY,
    nome_estado VARCHAR (255) NOT NULL
);

CREATE TABLE cidade(
	id_cidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_cidade VARCHAR (255) NOT NULL,
    id_estado INT NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES estado(id_estado)
);

CREATE TABLE sexo(
	id_sexo INT AUTO_INCREMENT PRIMARY KEY,
    nome_sexo VARCHAR (255) NOT NULL
);

CREATE TABLE nacionalidade(
	id_nacionalidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_nacionalidade VARCHAR (255) NOT NULL
);

CREATE TABLE raca(
	id_raca INT AUTO_INCREMENT PRIMARY KEY,
    nome_raca VARCHAR (255) NOT NULL
);


CREATE TABLE escolaridade(
	id_escolaridade INT AUTO_INCREMENT PRIMARY KEY,
    nome_escolaridade VARCHAR (255) NOT NULL
);

CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR (14) UNIQUE NOT null,
    nome VARCHAR (255) NOT NULL,
    rg VARCHAR (14) NOT NULL,
    id_cidade INT NOT NULL,
    id_sexo INT NOT NULL,
    id_nacionalidade INT NOT NULL,
    fone VARCHAR (20),
    id_raca INT NOT NULL,
    id_escolaridade INT NOT NULL,
    FOREIGN KEY (id_cidade) REFERENCES cidade(id_cidade),
    FOREIGN KEY (id_sexo) REFERENCES sexo(id_sexo),
    FOREIGN KEY (id_nacionalidade) REFERENCES nacionalidade(id_nacionalidade),
    FOREIGN KEY (id_raca) REFERENCES raca(id_raca),
    FOREIGN KEY (id_escolaridade) REFERENCES escolaridade(id_escolaridade)
);


INSERT INTO estado (nome_estado) VALUES
('Acre'),
('Alagoas'),
('Amapá'),
('Amazonas'),
('Bahia'),
('Ceará'),
('Distrito Federal'),
('Espírito Santo'),
('Goiás'),
('Maranhão'),
('Mato Grosso'),
('Mato Grosso do Sul'),
('Minas Gerais'),
('Pará'),
('Paraíba'),
('Paraná'),
('Pernambuco'),
('Piauí'),
('Rio de Janeiro'),
('Rio Grande do Norte'),
('Rio Grande do Sul'),
('Rondônia'),
('Roraima'),
('Santa Catarina'),
('São Paulo'),
('Sergipe'),
('Tocantins');

-- Inserir cidades para o estado do Acre (id_estado = 1)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Rio Branco', 1),
('Cruzeiro do Sul', 1),
('Senador Guiomard', 1),
('Tarauacá', 1),
('Feijó', 1);

-- Inserir cidades para o estado de Alagoas (id_estado = 2)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Maceió', 2),
('Arapiraca', 2),
('Palmeira dos Índios', 2),
('São Miguel dos Campos', 2),
('Penedo', 2);

-- Inserir cidades para o estado do Amapá (id_estado = 3)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Macapá', 3),
('Santana', 3),
('Laranjal do Jari', 3),
('Oiapoque', 3),
('Calçoene', 3);

-- Inserir cidades para o estado do Amazonas (id_estado = 4)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Manaus', 4),
('Parintins', 4),
('Itacoatiara', 4),
('Tefé', 4),
('Manacapuru', 4);

-- Inserir cidades para o estado da Bahia (id_estado = 5)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Salvador', 5),
('Feira de Santana', 5),
('Vitória da Conquista', 5),
('Ilhéus', 5),
('Juazeiro', 5);

-- Inserir cidades para o estado do Ceará (id_estado = 6)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Fortaleza', 6),
('Juazeiro do Norte', 6),
('Sobral', 6),
('Crato', 6),
('Maracanaú', 6);

-- Inserir cidades para o estado do Distrito Federal (id_estado = 7)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Brasília', 7),
('Ceilândia', 7),
('Taguatinga', 7),
('Samambaia', 7),
('Gama', 7);

-- Inserir cidades para o estado do Espírito Santo (id_estado = 8)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Vitória', 8),
('Vila Velha', 8),
('Serra', 8),
('Cariacica', 8),
('Guarapari', 8);

-- Inserir cidades para o estado de Goiás (id_estado = 9)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Goiânia', 9),
('Aparecida de Goiânia', 9),
('Anápolis', 9),
('Catalão', 9),
('Rio Verde', 9);

-- Inserir cidades para o estado do Maranhão (id_estado = 10)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('São Luís', 10),
('Imperatriz', 10),
('Caxias', 10),
('Timon', 10),
('Bacabal', 10);

-- Inserir cidades para o estado do Mato Grosso (id_estado = 11)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Cuiabá', 11),
('Várzea Grande', 11),
('Rondonópolis', 11),
('Sinop', 11),
('Tangará da Serra', 11);

-- Inserir cidades para o estado do Mato Grosso do Sul (id_estado = 12)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Campo Grande', 12),
('Dourados', 12),
('Três Lagoas', 12),
('Corumbá', 12),
('Ponta Porã', 12);

-- Inserir cidades para o estado de Minas Gerais (id_estado = 13)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Belo Horizonte', 13),
('Uberlândia', 13),
('Contagem', 13),
('Juiz de Fora', 13),
('Betim', 13);

-- Inserir cidades para o estado do Pará (id_estado = 14)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Belém', 14),
('Ananindeua', 14),
('Santarém', 14),
('Marabá', 14),
('Paragominas', 14);

-- Inserir cidades para o estado da Paraíba (id_estado = 15)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('João Pessoa', 15),
('Campina Grande', 15),
('Santa Rita', 15),
('Patos', 15),
('Bayeux', 15);

-- Inserir cidades para o estado do Paraná (id_estado = 16)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Curitiba', 16),
('Londrina', 16),
('Maringá', 16),
('Ponta Grossa', 16),
('Foz do Iguaçu', 16);

-- Inserir cidades para o estado de Pernambuco (id_estado = 17)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Recife', 17),
('Olinda', 17),
('Jaboatão dos Guararapes', 17),
('Caruaru', 17),
('Petrolina', 17);

-- Inserir cidades para o estado do Piauí (id_estado = 18)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Teresina', 18),
('Parnaíba', 18),
('Picos', 18),
('Floriano', 18),
('Oeiras', 18);

-- Inserir cidades para o estado do Rio de Janeiro (id_estado = 19)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Rio de Janeiro', 19),
('Niterói', 19),
('São Gonçalo', 19),
('Duque de Caxias', 19),
('Nova Iguaçu', 19);

-- Inserir cidades para o estado do Rio Grande do Norte (id_estado = 20)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Natal', 20),
('Mossoró', 20),
('Parnamirim', 20),
('Santa Cruz', 20),
('Caicó', 20);

-- Inserir cidades para o estado do Rio Grande do Sul (id_estado = 21)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Porto Alegre', 21),
('Caxias do Sul', 21),
('Pelotas', 21),
('Santa Maria', 21),
('Gravataí', 21);

-- Inserir cidades para o estado de Rondônia (id_estado = 22)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Porto Velho', 22),
('Ji-Paraná', 22),
('Vilhena', 22),
('Rolim de Moura', 22),
('Guajará-Mirim', 22);

-- Inserir cidades para o estado de Roraima (id_estado = 23)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Boa Vista', 23),
('Rorainópolis', 23),
('Caracaraí', 23),
('Mucajaí', 23),
('São João da Baliza', 23);

-- Inserir cidades para o estado de Santa Catarina (id_estado = 24)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Florianópolis', 24),
('Joinville', 24),
('Blumenau', 24),
('Chapecó', 24),
('Criciúma', 24);

-- Inserir cidades para o estado de São Paulo (id_estado = 25)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('São Paulo', 25),
('Campinas', 25),
('Sorocaba', 25),
('Santos', 25),
('São Bernardo do Campo', 25);

-- Inserir cidades para o estado de Sergipe (id_estado = 26)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Aracaju', 26),
('Nossa Senhora do Socorro', 26),
('Lagarto', 26),
('Itabaiana', 26),
('Estância', 26);

-- Inserir cidades para o estado do Tocantins (id_estado = 27)
INSERT INTO cidade (nome_cidade, id_estado) VALUES
('Palmas', 27),
('Araguaína', 27),
('Gurupi', 27),
('Paraíso do Tocantins', 27),
('Porto Nacional', 27);

INSERT INTO sexo (nome_sexo) VALUES
('Masculino'),
('Feminino'),
('Outro');

INSERT INTO nacionalidade (nome_nacionalidade) VALUES
('Brasileira'),
('Estrangeira');

INSERT INTO raca (nome_raca) VALUES
('Branca'),
('Negra'),
('Parda'),
('Amarela'),
('Indígena');


INSERT INTO escolaridade (nome_escolaridade) VALUES
('Ensino Fundamental Completo'),
('Ensino Fundamental Incompleto'),
('Ensino Médio Completo'),
('Ensino Médio Incompleto'),
('Ensino Superior Completo'),
('Ensino Superior Incompleto'),
('Pós-Graduação'),
('Mestrado');

INSERT INTO clientes (cpf, nome, rg, id_cidade, id_sexo, id_nacionalidade, fone, id_raca, id_escolaridade) VALUES
('123.456.789-00', 'João da Silva', '12345678', 1, 1, 1, '(11) 99999-0000', 1, 5),
('234.567.890-11', 'Maria Oliveira', '23456789', 2, 2, 1, '(11) 99999-0001', 2, 4),
('345.678.901-22', 'Pedro Santos', '34567890', 3, 1, 1, '(11) 99999-0002', 3, 6),
('456.789.012-33', 'Ana Souza', '45678901', 4, 2, 2, '(11) 99999-0003', 4, 7),
('567.890.123-44', 'Carlos Pereira', '56789012', 5, 1, 1, '(11) 99999-0004', 5, 8),
('678.901.234-55', 'Patrícia Lima', '67890123', 6, 2, 1, '(11) 99999-0005', 1, 5),
('789.012.345-66', 'Felipe Costa', '78901234', 7, 1, 2, '(11) 99999-0006', 2, 4),
('890.123.456-77', 'Juliana Fernandes', '89012345', 8, 2, 1, '(11) 99999-0007', 3, 6),
('901.234.567-88', 'Ricardo Almeida', '90123456', 9, 1, 2, '(11) 99999-0008', 4, 7),
('012.345.678-99', 'Larissa Martins', '01234567', 10, 2, 1, '(11) 99999-0009', 5, 8),
('123.456.789-01', 'André Oliveira', '12345679', 11, 1, 2, '(11) 99999-0010', 1, 5),
('234.567.890-12', 'Fernanda Silva', '23456780', 12, 2, 1, '(11) 99999-0011', 2, 4),
('345.678.901-23', 'Gustavo Santos', '34567801', 13, 1, 1, '(11) 99999-0012', 3, 6),
('456.789.012-34', 'Camila Souza', '45678902', 14, 2, 2, '(11) 99999-0013', 4, 7),
('567.890.123-45', 'Lucas Pereira', '56789023', 15, 1, 1, '(11) 99999-0014', 5, 8),
('678.901.234-56', 'Roberta Lima', '67890134', 16, 2, 1, '(11) 99999-0015', 1, 5),
('789.012.345-67', 'Ricardo Costa', '78901245', 17, 1, 2, '(11) 99999-0016', 2, 4),
('890.123.456-78', 'Juliana Martins', '89012356', 18, 2, 1, '(11) 99999-0017', 3, 6),
('901.234.567-89', 'Gabriel Almeida', '90123467', 19, 1, 2, '(11) 99999-0018', 4, 7),
('012.345.678-10', 'Mariana Fernandes', '01234578', 20, 2, 1, '(11) 99999-0019', 5, 8);



 
-- 1 
SELECT c.nome, ci.nome_cidade FROM clientes c JOIN cidade ci ON c.id_cidade = ci.id_cidade;  
-- 2
SELECT c.nome, e.nome_estado FROM clientes c JOIN cidade ci ON c.id_cidade = ci.id_cidade JOIN estado e ON ci.id_estado = e.id_estado;
-- 3
SELECT c.nome, c.cpf, r.nome_raca FROM clientes c JOIN raca r ON c.id_raca = r.id_raca; 
-- 4
SELECT c.nome, n.nome_nacionalidade FROM clientes c JOIN nacionalidade n ON c.id_nacionalidade = n.id_nacionalidade;
-- 5
SELECT c.nome, e.nome_escolaridade FROM clientes c JOIN escolaridade e ON c.id_escolaridade = e.id_escolaridade;
-- 6
SELECT c.nome, ci.nome_cidade, e.nome_estado FROM clientes c JOIN cidade ci ON c.id_cidade = ci.id_cidade JOIN estado e ON ci.id_estado = e.id_estado;
-- 7
SELECT c.nome, ci.nome_cidade, e.nome_estado, c.fone, c.rg, s.nome_sexo, n.nome_nacionalidade, r.nome_raca, es.nome_escolaridade FROM clientes c JOIN cidade ci ON c.id_cidade = ci.id_cidade JOIN estado e ON ci.id_estado = e.id_estado JOIN sexo s ON c.id_sexo = s.id_sexo JOIN nacionalidade n on c.id_nacionalidade = n.id_nacionalidade JOIN raca r ON c.id_raca = r.id_raca JOIN escolaridade es ON c.id_escolaridade = es.id_escolaridade;





