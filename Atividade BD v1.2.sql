CREATE DATABASE atividade;
USE atividade;
 
CREATE TABLE tributacao (
    id_tributacao INT NOT NULL PRIMARY KEY,
    nome_tributacao VARCHAR(255) NOT NULL
);
 
CREATE TABLE icms (
    id_situacao_icms INT NOT NULL PRIMARY KEY,
    nome_situacao_icms VARCHAR(255) NOT NULL
);
 
CREATE TABLE sexo (
    id_sexo INT NOT NULL PRIMARY KEY,
    nome_sexo VARCHAR(255) NOT NULL
);
 
CREATE TABLE tabela_preco (
    id_tabela_preco INT NOT NULL PRIMARY KEY,
    nome_tabela_preco VARCHAR(255) NOT NULL
);
 
CREATE TABLE modo_de_frete (
    id_mod_frete_padrao INT NOT NULL PRIMARY KEY,
    nome_modo_de_frete VARCHAR(255) NOT NULL
);
 
CREATE TABLE situacao_cadastro (
    id_sit_cadastro INT NOT NULL PRIMARY KEY,
    nome_sit_cadastro VARCHAR(255) NOT NULL
);
 
 
CREATE TABLE usuarios (
    id_user INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    senha VARCHAR(255) NOT NULL
);
 
 
CREATE TABLE cadastro (
    id_cadastro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    caminho_foto VARCHAR(255),
    regime_de_tributacao INT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    email_danfe VARCHAR(255) NOT NULL,
    email_cobranca VARCHAR(255) NOT NULL,
    email_loja VARCHAR(255) NOT NULL,
    telefone_com VARCHAR(20) NOT NULL,
    ramal VARCHAR(20),
    telefone_res VARCHAR(20) NOT NULL,
    telefone_cel VARCHAR(20) NOT NULL,
    fax VARCHAR(20) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    rg VARCHAR(20) NOT NULL,
    indicou VARCHAR(50),
    id_cidade INT,
    situacao_icms INT,
    insc_estadual INT,
    insc_suframa INT,
    sexo INT NOT NULL,
    data_nasc DATE NOT NULL,
    transportadora1 VARCHAR(50),
    transportadora2 VARCHAR(50),
    tabela_preco INT,
    mod_frete_padrao INT,
    sit_cadastro INT,
    linha_do_pef VARCHAR(255),
    aliquota DECIMAL(5, 2),
    FOREIGN KEY (regime_de_tributacao) REFERENCES tributacao(id_tributacao),
    FOREIGN KEY (situacao_icms) REFERENCES icms(id_situacao_icms),
    FOREIGN KEY (sexo) REFERENCES sexo(id_sexo),
    FOREIGN KEY (tabela_preco) REFERENCES tabela_preco(id_tabela_preco),
    FOREIGN KEY (id_cidade) REFERENCES cidade (id_cidade),
    FOREIGN KEY (mod_frete_padrao) REFERENCES modo_de_frete(id_mod_frete_padrao),
    FOREIGN KEY (sit_cadastro) REFERENCES situacao_cadastro(id_sit_cadastro)
);
 
 
CREATE TABLE enderecos (
    id_endereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    endereco VARCHAR(255) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    id_cidade INT,
    pais VARCHAR(50) NOT NULL,
    tipo_endereco ENUM('Residencial', 'Comercial', 'Entrega', 'Cobrança') NOT NULL,
    FOREIGN KEY (id_cidade) REFERENCES cidade (id_cidade),
    FOREIGN KEY (id_cliente) REFERENCES cadastro(id_cadastro)
);



 
 
CREATE TABLE perfil (
    id_perfil INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    nome_perfil VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ativo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_user) REFERENCES usuarios(id_user)
);
 
 
CREATE TABLE dados_adicionais (
    id_dado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    tipo_dado VARCHAR(50) NOT NULL,
    valor TEXT NOT NULL,
    descricao VARCHAR(255),
    data_adicao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES cadastro(id_cadastro)
);
 

 
CREATE TABLE cliente_relacionado (
    id_relacionamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente1 INT NOT NULL,
    id_cliente2 INT NOT NULL,
    quem_indicou VARCHAR(255),
    tipo_relacionamento ENUM('Parceiro', 'Referência', 'Fornecedor', 'Cliente') NOT NULL,
    data_inicio DATE,
    FOREIGN KEY (id_cliente1) REFERENCES cadastro(id_cadastro),
    FOREIGN KEY (id_cliente2) REFERENCES cadastro(id_cadastro)
);
 
 
CREATE TABLE contatos (
    id_contato INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    nome_contato VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(255),
    cargo VARCHAR(100),
    tipo_contato ENUM('Principal', 'Secundário') NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cadastro(id_cadastro)
);
 
 
CREATE TABLE vendedores (
    id_vendedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_vendedor VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(255),
    area_de_vendas VARCHAR(100),
    data_contratacao DATE,
    ativo BOOLEAN DEFAULT TRUE
);
 
 
CREATE TABLE comunicacao (
    id_comunicacao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    tipo_comunicacao ENUM('Email', 'Telefone', 'Reunião', 'Outro') NOT NULL,
    data_comunicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    assunto VARCHAR(255),
    mensagem TEXT,
    FOREIGN KEY (id_cliente) REFERENCES cadastro(id_cadastro),
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
);
 
 
CREATE TABLE financeiro (
    id_atividade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    data_atividade TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    pagamentos_aceitos VARCHAR (50),
    descricao VARCHAR(255),
    FOREIGN KEY (id_user) REFERENCES usuarios(id_user)
);
 
 
CREATE TABLE extras (
    id_hist INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cadastro INT NOT NULL,
    nome VARCHAR(255),
    email VARCHAR(255),
    data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    acao VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_cadastro) REFERENCES cadastro(id_cadastro)
);

CREATE TABLE estado (
    id_estado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_estado VARCHAR(100) NOT NULL UNIQUE,
    sigla_estado CHAR(2) NOT NULL UNIQUE
);

CREATE TABLE cidade (
    id_cidade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_cidade VARCHAR(100) NOT NULL,
    id_estado INT NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES estado(id_estado)
);

SELECT c.nome, c.telefone_com, c.telefone_res, c.cpf, cr.quem_indicou FROM cadastro c, cliente_relacionado cr ;
-- **Inserir dados na tabela usuarios**
INSERT INTO usuarios (usuario, senha) 
VALUES ('johndoe', 'senha_segura');

INSERT INTO usuarios (usuario, senha) 
VALUES ('janedoe', 'senha123');

INSERT INTO usuarios (usuario, senha) 
VALUES ('admin', 'admin123');

INSERT INTO usuarios (usuario, senha) 
VALUES ('manager', 'manager2024');

INSERT INTO usuarios (usuario, senha) 
VALUES ('sales', 'sales@2024');

-- **Editar dados na tabela usuarios**
UPDATE usuarios 
SET senha = 'nova_senha_segura' 
WHERE id_user = 1;

UPDATE usuarios 
SET senha = 'nova_senha123' 
WHERE id_user = 2;

UPDATE usuarios 
SET usuario = 'administrator' 
WHERE id_user = 3;

UPDATE usuarios 
SET senha = 'novo_manager2024' 
WHERE id_user = 4;

UPDATE usuarios 
SET usuario = 'sales_manager' 
WHERE id_user = 5;

-- **Mostrar dados da tabela usuarios**
SELECT * FROM usuarios;

-- **Excluir dados na tabela usuarios**
DELETE FROM usuarios 
WHERE id_user = 1;

DELETE FROM usuarios 
WHERE id_user = 2;

DELETE FROM usuarios 
WHERE id_user = 3;

DELETE FROM usuarios 
WHERE id_user = 4;

DELETE FROM usuarios 
WHERE id_user = 5;

-- **Inserir dados na tabela cadastro**
INSERT INTO cadastro (
    caminho_foto, regime_de_tributacao, nome, email, email_danfe, email_cobranca, 
    email_loja, telefone_com, ramal, telefone_res, telefone_cel, fax, cpf, rg, 
    indicou, id_cidade, situacao_icms, insc_estadual, insc_suframa, sexo, data_nasc, 
    transportadora1, transportadora2, tabela_preco, mod_frete_padrao, sit_cadastro, 
    linha_do_pef, aliquota
) VALUES (
    'foto1.jpg', 1, 'Empresa Exemplo 1', 'contato1@exemplo.com', 'danfe1@exemplo.com', 
    'cobranca1@exemplo.com', 'loja1@exemplo.com', '123456789', '101', '987654321', 
    '912345678', '1234', '12345678900', 'MG123456', 'John Doe', 1, 12345678, 
    87654321, 1, '1980-01-01', 'Transportadora A', 'Transportadora B', 1, 
    1, 1, 'Linha A', 18.00
);

INSERT INTO cadastro (
    caminho_foto, regime_de_tributacao, nome, email, email_danfe, email_cobranca, 
    email_loja, telefone_com, ramal, telefone_res, telefone_cel, fax, cpf, rg, 
    indicou, id_cidade, situacao_icms, insc_estadual, insc_suframa, sexo, data_nasc, 
    transportadora1, transportadora2, tabela_preco, mod_frete_padrao, sit_cadastro, 
    linha_do_pef, aliquota
) VALUES (
    'foto2.jpg', 2, 'Empresa Exemplo 2', 'contato2@exemplo.com', 'danfe2@exemplo.com', 
    'cobranca2@exemplo.com', 'loja2@exemplo.com', '223456789', '102', '887654321', 
    '822345678', '2234', '22345678901', 'SP123456', 'Jane Smith', 2, 22345678, 
    77654321, 2, '1990-05-15', 'Transportadora C', 'Transportadora D', 2, 
    2, 2, 'Linha B', 15.00
);

INSERT INTO cadastro (
    caminho_foto, regime_de_tributacao, nome, email, email_danfe, email_cobranca, 
    email_loja, telefone_com, ramal, telefone_res, telefone_cel, fax, cpf, rg, 
    indicou, id_cidade, situacao_icms, insc_estadual, insc_suframa, sexo, data_nasc, 
    transportadora1, transportadora2, tabela_preco, mod_frete_padrao, sit_cadastro, 
    linha_do_pef, aliquota
) VALUES (
    'foto3.jpg', 1, 'Empresa Exemplo 3', 'contato3@exemplo.com', 'danfe3@exemplo.com', 
    'cobranca3@exemplo.com', 'loja3@exemplo.com', '323456789', '103', '787654321', 
    '732345678', '3234', '32345678902', 'RJ123456', 'Mark Johnson', 3, 32345678, 
    67654321, 3, '1985-08-20', 'Transportadora E', 'Transportadora F', 3, 
    3, 3, 'Linha C', 12.00
);

INSERT INTO cadastro (
    caminho_foto, regime_de_tributacao, nome, email, email_danfe, email_cobranca, 
    email_loja, telefone_com, ramal, telefone_res, telefone_cel, fax, cpf, rg, 
    indicou, id_cidade, situacao_icms, insc_estadual, insc_suframa, sexo, data_nasc, 
    transportadora1, transportadora2, tabela_preco, mod_frete_padrao, sit_cadastro, 
    linha_do_pef, aliquota
) VALUES (
    'foto4.jpg', 2, 'Empresa Exemplo 4', 'contato4@exemplo.com', 'danfe4@exemplo.com', 
    'cobranca4@exemplo.com', 'loja4@exemplo.com', '423456789', '104', '687654321', 
    '642345678', '4234', '42345678903', 'BA123456', 'Emily Davis', 4, 42345678, 
    57654321, 4, '1992-12-01', 'Transportadora G', 'Transportadora H', 4, 
    4, 4, 'Linha D', 20.00
);

INSERT INTO cadastro (
    caminho_foto, regime_de_tributacao, nome, email, email_danfe, email_cobranca, 
    email_loja, telefone_com, ramal, telefone_res, telefone_cel, fax, cpf, rg, 
    indicou, id_cidade, situacao_icms, insc_estadual, insc_suframa, sexo, data_nasc, 
    transportadora1, transportadora2, tabela_preco, mod_frete_padrao, sit_cadastro, 
    linha_do_pef, aliquota
) VALUES (
    'foto5.jpg', 1, 'Empresa Exemplo 5', 'contato5@exemplo.com', 'danfe5@exemplo.com', 
    'cobranca5@exemplo.com', 'loja5@exemplo.com', '523456789', '105', '587654321', 
    '552345678', '5234', '52345678904', 'PR123456', 'Michael Brown', 5, 52345678, 
    47654321, 5, '1988-03-10', 'Transportadora I', 'Transportadora J', 5, 
    5, 5, 'Linha E', 22.00
);

-- **Editar dados na tabela cadastro**
UPDATE cadastro 
SET email = 'novoemail1@exemplo.com', telefone_cel = '934567890'
WHERE id_cadastro = 1;

UPDATE cadastro 
SET nome = 'Empresa Atualizada 2', telefone_com = '234567890'
WHERE id_cadastro = 2;

UPDATE cadastro 
SET rg = 'RJ789456', data_nasc = '1991-07-15'
WHERE id_cadastro = 3;

UPDATE cadastro 
SET cpf = '11111111111', transportadora1 = 'Nova Transportadora E'
WHERE id_cadastro = 4;

UPDATE cadastro 
SET telefone_res = '654321098', indicou = 'Novo Indicador'
WHERE id_cadastro = 5;

-- **Mostrar dados da tabela cadastro**
SELECT * FROM cadastro;

-- **Excluir dados na tabela cadastro**
DELETE FROM cadastro 
WHERE id_cadastro = 1;

DELETE FROM cadastro 
WHERE id_cadastro = 2;

DELETE FROM cadastro 
WHERE id_cadastro = 3;

DELETE FROM cadastro 
WHERE id_cadastro = 4;

DELETE FROM cadastro 
WHERE id_cadastro = 5;

-- **Inserir dados na tabela enderecos**
INSERT INTO enderecos (
    id_cliente, endereco, id_cidade, cep, pais, tipo_endereco
) VALUES (
    1, 'Rua Exemplo, 123', 1, '12345-678', 'Brasil', 'Residencial'
);

INSERT INTO enderecos (
    id_cliente, endereco, id_cidade, cep, pais, tipo_endereco
) VALUES (
     2, 'Avenida Exemplo, 456', 2, '23456-789', 'Brasil', 'Comercial'
);

INSERT INTO enderecos (
    id_cliente, endereco, id_cidade, cep, pais, tipo_endereco
) VALUES (
    3, 'Praça Exemplo, 789', 3, '34567-890', 'Brasil', 'Entrega'
);

INSERT INTO enderecos (
    id_cliente, endereco, id_cidade, cep, pais, tipo_endereco
) VALUES (
    4, 'Estrada Exemplo, 101', 4, '45678-901', 'Brasil', 'Cobrança'
);

INSERT INTO enderecos (
    id_cliente, endereco, id_cidade, cep, pais, tipo_endereco
) VALUES (
    5, 'Rua Nova, 202', 5, '56789-012', 'Brasil', 'Residencial'
);

-- **Editar dados na tabela enderecos**
UPDATE enderecos 
SET endereco = 'Rua Atualizada, 123', tipo_endereco = 'Comercial'
WHERE id_endereco = 1;

UPDATE enderecos 
SET cep = '23456-000', pais = 'Brasil Atualizado'
WHERE id_endereco = 2;

UPDATE enderecos 
SET tipo_endereco = 'Cobrança'
WHERE id_endereco = 3;

UPDATE enderecos 
SET endereco = 'Avenida Atualizada, 456'
WHERE id_endereco = 4;

UPDATE enderecos 
SET cidade = 'Cidade Atualizada'
WHERE id_endereco = 5;

-- **Mostrar dados da tabela enderecos**
SELECT * FROM enderecos;

-- **Excluir dados na tabela enderecos**
DELETE FROM enderecos 
WHERE id_endereco = 1;

DELETE FROM enderecos 
WHERE id_endereco = 2;

DELETE FROM enderecos 
WHERE id_endereco = 3;

DELETE FROM enderecos 
WHERE id_endereco = 4;

DELETE FROM enderecos 
WHERE id_endereco = 5;

-- **Inserir dados na tabela vendedores**
INSERT INTO vendedores (
    nome_vendedor, telefone, email, area_de_vendas, data_contratacao, ativo
) VALUES (
    'Maria Silva', '987654321', 'maria@exemplo.com', 'Norte', '2023-06-01', TRUE
);

INSERT INTO vendedores (
    nome_vendedor, telefone, email, area_de_vendas, data_contratacao, ativo
) VALUES (
    'Pedro Santos', '876543210', 'pedro@exemplo.com', 'Sul', '2023-07-15', TRUE
);

INSERT INTO vendedores (
    nome_vendedor, telefone, email, area_de_vendas, data_contratacao, ativo
) VALUES (
    'Laura Lima', '765432109', 'laura@exemplo.com', 'Leste', '2023-08-10', TRUE
);

INSERT INTO vendedores (
    nome_vendedor, telefone, email, area_de_vendas, data_contratacao, ativo
) VALUES (
    'Carlos Oliveira', '654321098', 'carlos@exemplo.com', 'Oeste', '2023-09-05', FALSE
);

INSERT INTO vendedores (
    nome_vendedor, telefone, email, area_de_vendas, data_contratacao, ativo
) VALUES (
    'Ana Costa', '543210987', 'ana@exemplo.com', 'Centro', '2023-10-01', TRUE
);

-- **Editar dados na tabela vendedores**
UPDATE vendedores 
SET email = 'maria.nova@exemplo.com', ativo = FALSE
WHERE id_vendedor = 1;

UPDATE vendedores 
SET telefone = '123456789', area_de_vendas = 'Noroeste'
WHERE id_vendedor = 2;

UPDATE vendedores 
SET data_contratacao = '2023-08-20'
WHERE id_vendedor = 3;

UPDATE vendedores 
SET nome_vendedor = 'Carlos Alberto'
WHERE id_vendedor = 4;

UPDATE vendedores 
SET ativo = TRUE
WHERE id_vendedor = 5;

-- **Mostrar dados da tabela vendedores**
SELECT * FROM vendedores;

-- **Excluir dados na tabela vendedores**
DELETE FROM vendedores 
WHERE id_vendedor = 1;

DELETE FROM vendedores 
WHERE id_vendedor = 2;

DELETE FROM vendedores 
WHERE id_vendedor = 3;

DELETE FROM vendedores 
WHERE id_vendedor = 4;

DELETE FROM vendedores 
WHERE id_vendedor = 5;

-- **Inserir dados na tabela dados_adicionais**
INSERT INTO dados_adicionais (
    id_cliente, tipo_dado, valor, descricao
) VALUES (
    1, 'Informação Adicional', 'Detalhes importantes', 'Descrição detalhada do dado adicional'
);

INSERT INTO dados_adicionais (
    id_cliente, tipo_dado, valor, descricao
) VALUES (
    2, 'Observação', 'Observação sobre cliente', 'Observação específica'
);

INSERT INTO dados_adicionais (
    id_cliente, tipo_dado, valor, descricao
) VALUES (
    3, 'Nota', 'Nota especial', 'Nota sobre o cliente'
);

INSERT INTO dados_adicionais (
    id_cliente, tipo_dado, valor, descricao
) VALUES (
    4, 'Comentário', 'Comentário sobre a negociação', 'Comentário específico'
);

INSERT INTO dados_adicionais (
    id_cliente, tipo_dado, valor, descricao
) VALUES (
    5, 'Histórico', 'Histórico do cliente', 'Histórico detalhado'
);

-- **Editar dados na tabela dados_adicionais**
UPDATE dados_adicionais 
SET valor = 'Novo Valor Importante', descricao = 'Nova descrição detalhada'
WHERE id_dado = 1;

UPDATE dados_adicionais 
SET tipo_dado = 'Observação Atualizada', valor = 'Nova Observação'
WHERE id_dado = 2;

UPDATE dados_adicionais 
SET descricao = 'Nota revisada'
WHERE id_dado = 3;

UPDATE dados_adicionais 
SET valor = 'Comentário atualizado', descricao = 'Comentário modificado'
WHERE id_dado = 4;

UPDATE dados_adicionais 
SET valor = 'Histórico atualizado', descricao = 'Histórico revisado'
WHERE id_dado = 5;

-- **Mostrar dados da tabela dados_adicionais**
SELECT * FROM dados_adicionais;

-- **Excluir dados na tabela dados_adicionais**
DELETE FROM dados_adicionais 
WHERE id_dado = 1;

DELETE FROM dados_adicionais 
WHERE id_dado = 2;

DELETE FROM dados_adicionais 
WHERE id_dado = 3;

DELETE FROM dados_adicionais 
WHERE id_dado = 4;

DELETE FROM dados_adicionais 
WHERE id_dado = 5;

-- **Inserir dados na tabela cliente_relacionado**
INSERT INTO cliente_relacionado (
    id_cliente1, id_cliente2, quem_indicou, tipo_relacionamento, data_inicio
) VALUES (
    1, 2, 'João', 'Parceiro', '2023-01-01'
);

INSERT INTO cliente_relacionado (
    id_cliente1, id_cliente2, quem_indicou, tipo_relacionamento, data_inicio
) VALUES (
    2, 3, 'Maria', 'Referência', '2023-02-01'
);

INSERT INTO cliente_relacionado (
    id_cliente1, id_cliente2, quem_indicou, tipo_relacionamento, data_inicio
) VALUES (
    3, 4, 'Pedro', 'Fornecedor', '2023-03-01'
);

INSERT INTO cliente_relacionado (
    id_cliente1, id_cliente2, quem_indicou, tipo_relacionamento, data_inicio
) VALUES (
    4, 5, 'Laura', 'Cliente', '2023-04-01'
);

INSERT INTO cliente_relacionado (
    id_cliente1, id_cliente2, quem_indicou, tipo_relacionamento, data_inicio
) VALUES (
    5, 1, 'Carlos', 'Parceiro', '2023-05-01'
);

-- **Editar dados na tabela cliente_relacionado**
UPDATE cliente_relacionado 
SET tipo_relacionamento = 'Fornecedor', data_inicio = '2023-06-01'
WHERE id_relacionamento = 1;

UPDATE cliente_relacionado 
SET quem_indicou = 'Joana', data_inicio = '2023-07-01'
WHERE id_relacionamento = 2;

UPDATE cliente_relacionado 
SET tipo_relacionamento = 'Cliente', data_inicio = '2023-08-01'
WHERE id_relacionamento = 3;

UPDATE cliente_relacionado 
SET id_cliente1 = 2, data_inicio = '2023-09-01'
WHERE id_relacionamento = 4;

UPDATE cliente_relacionado 
SET data_inicio = '2023-10-01'
WHERE id_relacionamento = 5;

-- **Mostrar dados da tabela cliente_relacionado**
SELECT * FROM cliente_relacionado;

-- **Excluir dados na tabela cliente_relacionado**
DELETE FROM cliente_relacionado 
WHERE id_relacionamento = 1;

DELETE FROM cliente_relacionado 
WHERE id_relacionamento = 2;

DELETE FROM cliente_relacionado 
WHERE id_relacionamento = 3;

DELETE FROM cliente_relacionado 
WHERE id_relacionamento = 4;

DELETE FROM cliente_relacionado 
WHERE id_relacionamento = 5;

-- **Inserir dados na tabela contatos**
INSERT INTO contatos (
    id_cliente, nome_contato, telefone, email, cargo, tipo_contato
) VALUES (
    1, 'Carlos Alberto', '123456789', 'carlos@exemplo.com', 'Gerente', 'Principal'
);

INSERT INTO contatos (
    id_cliente, nome_contato, telefone, email, cargo, tipo_contato
) VALUES (
    2, 'Ana Souza', '234567890', 'ana@exemplo.com', 'Assistente', 'Secundário'
);

INSERT INTO contatos (
    id_cliente, nome_contato, telefone, email, cargo, tipo_contato
) VALUES (
    3, 'Bruno Pereira', '345678901', 'bruno@exemplo.com', 'Analista', 'Principal'
);

INSERT INTO contatos (
    id_cliente, nome_contato, telefone, email, cargo, tipo_contato
) VALUES (
    4, 'Fernanda Lima', '456789012', 'fernanda@exemplo.com', 'Coordenador', 'Secundário'
);

INSERT INTO contatos (
    id_cliente, nome_contato, telefone, email, cargo, tipo_contato
) VALUES (
    5, 'Mariana Costa', '567890123', 'mariana@exemplo.com', 'Diretor', 'Principal'
);

-- **Editar dados na tabela contatos**
UPDATE contatos 
SET telefone = '987654321', email = 'carlos.novo@exemplo.com'
WHERE id_contato = 1;

UPDATE contatos 
SET nome_contato = 'Ana Oliveira', cargo = 'Secretária'
WHERE id_contato = 2;

UPDATE contatos 
SET tipo_contato = 'Secundário'
WHERE id_contato = 3;

UPDATE contatos 
SET telefone = '876543210'
WHERE id_contato = 4;

UPDATE contatos 
SET email = 'mariana.nova@exemplo.com', cargo = 'CEO'
WHERE id_contato = 5;

-- **Mostrar dados da tabela contatos**
SELECT * FROM contatos;

-- **Excluir dados na tabela contatos**
DELETE FROM contatos 
WHERE id_contato = 1;

DELETE FROM contatos 
WHERE id_contato = 2;

DELETE FROM contatos 
WHERE id_contato = 3;

DELETE FROM contatos 
WHERE id_contato = 4;

DELETE FROM contatos 
WHERE id_contato = 5;

-- **Inserir dados na tabela comunicacao**
INSERT INTO comunicacao (
    id_cliente, id_vendedor, tipo_comunicacao, assunto, mensagem
) VALUES (
    1, 1, 'Email', 'Assunto 1', 'Mensagem do cliente 1 para o vendedor 1'
);

INSERT INTO comunicacao (
    id_cliente, id_vendedor, tipo_comunicacao, assunto, mensagem
) VALUES (
    2, 2, 'Telefone', 'Assunto 2', 'Mensagem do cliente 2 para o vendedor 2'
);

INSERT INTO comunicacao (
    id_cliente, id_vendedor, tipo_comunicacao, assunto, mensagem
) VALUES (
    3, 3, 'Reunião', 'Assunto 3', 'Mensagem do cliente 3 para o vendedor 3'
);

INSERT INTO comunicacao (
    id_cliente, id_vendedor, tipo_comunicacao, assunto, mensagem
) VALUES (
    4, 4, 'Outro', 'Assunto 4', 'Mensagem do cliente 4 para o vendedor 4'
);

INSERT INTO comunicacao (
    id_cliente, id_vendedor, tipo_comunicacao, assunto, mensagem
) VALUES (
    5, 5, 'Email', 'Assunto 5', 'Mensagem do cliente 5 para o vendedor 5'
);

-- **Editar dados na tabela comunicacao**
UPDATE comunicacao 
SET mensagem = 'Mensagem atualizada para o cliente 1'
WHERE id_comunicacao = 1;

UPDATE comunicacao 
SET assunto = 'Assunto atualizado 2'
WHERE id_comunicacao = 2;

UPDATE comunicacao 
SET tipo_comunicacao = 'Telefone', mensagem = 'Mensagem atualizada para o cliente 3'
WHERE id_comunicacao = 3;

UPDATE comunicacao 
SET assunto = 'Novo Assunto 4'
WHERE id_comunicacao = 4;

UPDATE comunicacao 
SET mensagem = 'Mensagem atualizada para o cliente 5'
WHERE id_comunicacao = 5;

-- **Mostrar dados da tabela comunicacao**
SELECT * FROM comunicacao;

-- **Excluir dados na tabela comunicacao**
DELETE FROM comunicacao 
WHERE id_comunicacao = 1;

DELETE FROM comunicacao 
WHERE id_comunicacao = 2;

DELETE FROM comunicacao 
WHERE id_comunicacao = 3;

DELETE FROM comunicacao 
WHERE id_comunicacao = 4;

DELETE FROM comunicacao 
WHERE id_comunicacao = 5;

-- **Inserir dados na tabela financeiro**
INSERT INTO financeiro (
    id_user, pagamentos_aceitos, descricao
) VALUES (
    1, 'Cartão de Crédito', 'Pagamento referente à fatura de julho'
);

INSERT INTO financeiro (
    id_user, pagamentos_aceitos, descricao
) VALUES (
    2, 'Boleto', 'Pagamento referente à fatura de agosto'
);

INSERT INTO financeiro (
    id_user, pagamentos_aceitos, descricao
) VALUES (
    3, 'Transferência Bancária', 'Pagamento referente à fatura de setembro'
);

INSERT INTO financeiro (
    id_user, pagamentos_aceitos, descricao
) VALUES (
    4, 'Dinheiro', 'Pagamento referente à fatura de outubro'
);

INSERT INTO financeiro (
    id_user, pagamentos_aceitos, descricao
) VALUES (
    5, 'Cheque', 'Pagamento referente à fatura de novembro'
);

-- **Editar dados na tabela financeiro**
UPDATE financeiro 
SET descricao = 'Novo pagamento referente à fatura de julho'
WHERE id_atividade = 1;

UPDATE financeiro 
SET pagamentos_aceitos = 'Transferência Bancária'
WHERE id_atividade = 2;

UPDATE financeiro 
SET descricao = 'Pagamento referente à fatura de setembro revisada'
WHERE id_atividade = 3;

UPDATE financeiro 
SET pagamentos_aceitos = 'Cartão de Crédito'
WHERE id_atividade = 4;

UPDATE financeiro 
SET descricao = 'Pagamento referente à fatura de novembro revisada'
WHERE id_atividade = 5;

-- **Mostrar dados da tabela financeiro**
SELECT * FROM financeiro;

-- **Excluir dados na tabela financeiro**
DELETE FROM financeiro 
WHERE id_atividade = 1;

DELETE FROM financeiro 
WHERE id_atividade = 2;

DELETE FROM financeiro 
WHERE id_atividade = 3;

DELETE FROM financeiro 
WHERE id_atividade = 4;

DELETE FROM financeiro 
WHERE id_atividade = 5;

-- **Inserir dados na tabela extras**
INSERT INTO extras (
    id_cadastro, nome, email, acao
) VALUES (
    1, 'Registro 1', 'registro1@exemplo.com', 'Inserido'
);

INSERT INTO extras (
    id_cadastro, nome, email, acao
) VALUES (
    2, 'Registro 2', 'registro2@exemplo.com', 'Atualizado'
);

INSERT INTO extras (
    id_cadastro, nome, email, acao
) VALUES (
    3, 'Registro 3', 'registro3@exemplo.com', 'Deletado'
);

INSERT INTO extras (
    id_cadastro, nome, email, acao
) VALUES (
    4, 'Registro 4', 'registro4@exemplo.com', 'Inserido'
);

INSERT INTO extras (
    id_cadastro, nome, email, acao
) VALUES (
    5, 'Registro 5', 'registro5@exemplo.com', 'Atualizado'
);

-- **Editar dados na tabela extras**
UPDATE extras 
SET email = 'novoemail1@exemplo.com', acao = 'Atualizado'
WHERE id_hist = 1;

UPDATE extras 
SET nome = 'Registro Atualizado 2', acao = 'Inserido'
WHERE id_hist = 2;

UPDATE extras 
SET acao = 'Revisado'
WHERE id_hist = 3;

UPDATE extras 
SET email = 'novoemail4@exemplo.com'
WHERE id_hist = 4;

UPDATE extras 
SET nome = 'Registro Atualizado 5', acao = 'Deletado'
WHERE id_hist = 5;

-- **Mostrar dados da tabela extras**
SELECT * FROM extras;

-- **Excluir dados na tabela extras**
DELETE FROM extras 
WHERE id_hist = 1;

DELETE FROM extras 
WHERE id_hist = 2;

DELETE FROM extras 
WHERE id_hist = 3;

DELETE FROM extras 
WHERE id_hist = 4;

DELETE FROM extras 
WHERE id_hist = 5;

-- **Inserir dados na tabela estado**
INSERT INTO estado (nome_estado, sigla_estado) 
VALUES ('São Paulo', 'SP');

INSERT INTO estado (nome_estado, sigla_estado) 
VALUES ('Rio de Janeiro', 'RJ');

INSERT INTO estado (nome_estado, sigla_estado) 
VALUES ('Minas Gerais', 'MG');

INSERT INTO estado (nome_estado, sigla_estado) 
VALUES ('Espírito Santo', 'ES');

INSERT INTO estado (nome_estado, sigla_estado) 
VALUES ('Bahia', 'BA');

-- **Editar dados na tabela estado**
UPDATE estado 
SET nome_estado = 'São Paulo Atualizado'
WHERE id_estado = 1;

UPDATE estado 
SET sigla_estado = 'RJ-Atualizado'
WHERE id_estado = 2;

UPDATE estado 
SET nome_estado = 'Minas Gerais Atualizado'
WHERE id_estado = 3;

UPDATE estado 
SET sigla_estado = 'ES-Atualizado'
WHERE id_estado = 4;

UPDATE estado 
SET nome_estado = 'Bahia Atualizada'
WHERE id_estado = 5;

-- **Mostrar dados da tabela estado**
SELECT * FROM estado;

-- **Excluir dados na tabela estado**
DELETE FROM estado 
WHERE id_estado = 1;

DELETE FROM estado 
WHERE id_estado = 2;

DELETE FROM estado 
WHERE id_estado = 3;

DELETE FROM estado 
WHERE id_estado = 4;

DELETE FROM estado 
WHERE id_estado = 5;
