create database aula17;

create table categoria ( 
categoria_id serial,
nome varchar(80),
ultima_atualizacao timestamp
);

create table categoria_filme (
filme_id int,
categoria_id int,
ultima_atualizacao timestamp
);

create table filme (
film_id serial,
titulo varchar(80),
descricao text,
ano_lancamento char(4),
linguagem_id int,
duracao_aluguel int,
taxa_aluguel numeric(4,2),
duracao time,
multa numeric(4,2),
classificacao_indicativa int,
ultima_atualizacao timestamp,
aparicoes_especiais varchar(90),
sinopse text
);

create table linguagem (
linguagem_id serial,
nome varchar(20),
ultima_atualizacao timestamp
);

create table ator_filme (
ator_id int,
filme_id int,
ultima_atualizacao timestamp
);

create table inventario (
inventario_id serial,
filme_id int,
loja_id int,
ultima_atualizacao timestamp
);

create table aluguel ( 
aluguel_id serial,
data_aluguel date,
inventario_id int,
cliente_id int,
devolucao date,
funcionario_id int,
ultima_atualizacao timestamp
);

create table pagamento ( 
pagamento_id serial,
cliente_id int,
funcionario_id int,
aluguel_id int,
preco_total numeric(5,2),
data_pagamento timestamp
);

create table funcionario (
funcionario_id serial,
primeiro_nome varchar(15),
sobrenome varchar(30),
endereco_id int,
email varchar(15),
loja_id int,
ativo bool,
nome_usuario varchar(15),
senha varchar(15),
ultima_atualizacao timestamp,
foto bytea
);

create table ator ( 
ator_id serial,
primeiro_nome varchar(15),
sobrenome varchar(30),
ultima_atualizacao timestamp
);

create table cliente (
cliente_id serial,
loja_id int,
primeiro_nome varchar(15),
sobrenome varchar(30),
email varchar(15),
endereco_id int,
ativo bool,
data_criacao timestamp,
ultima_atualizacao timestamp
);

create table endereco ( 
endereco_id serial,
endereco_1 varchar(30),
endereco_2 varchar(30),
distrito varchar(15),
cidade_id int,
cep char(8),
telefone varchar(11),
ultima_atualizacao timestamp
);

create table cidade (
cidade_id serial,
cidade varchar(15),
pais_id int,
ultima_atualizacao timestamp
);

create table pais (
pais_id serial,
pais varchar(15),
ultima_atualizacao timestamp
);

create table loja (
loja_id serial,
gerente_funcionario_id int,
endereco_id int,
ultima_atualizacao timestamp
);

alter table categoria add primary key (categoria_id);
alter table filme add primary key (filme_id);
alter table linguagem add primary key (linguagem_id);
alter table inventario add primary key (inventario_id);
alter table pais add primary key (pais_id);
alter table ator add primary key (ator_id);
alter table cidade add primary key (cidade_id);
alter table loja add primary key (loja_id);
alter table pagamento add primary key (pagamento_id)
alter table endereco add primary key (endereco_id);
alter table cliente add primary key (cliente_id);
alter table funcionario add primary key (funcionario_id);
alter table aluguel add primary key (aluguel_id);

alter table filme_categoria
add constraint fk_categoria
foreign key (categoria_id)
references categoria(categoria_id);

alter table filme_categoria
add constraint fk_filme
foreign key (filme_id)
references filme(filme_id);

alter table filme
add constraint fk_language
foreign key (language_id)
references language(language_id);

alter table ator_filme
add constraint fk_ator
foreign key (ator_id)
references ator(ator_id);

alter table ator_filme
add constraint fk_filme
foreign key (filme_id)
references filme(filme_id);

alter table inventario -- tabela que possui a chave estrangeira
add constraint fk_filme -- adiciona restrição na tabela a ser alterada
foreign key (filme_id) -- define a chave estrangeira na tabela a ser alterada
references filme(filme_id); -- referencia a tabela que possui a chave primária

alter table aluguel
add constraint fk_inventario
foreign key (inventario_id)
references inventario(inventario_id);

alter table aluguel
add constraint fk_funcionario
foreign key (funcionario_id)
references funcionario(funcionario_id);

alter table pagamento
add constraint fk_funcionario
foreign key (funcionario_id)
references funcionario(funcionario_id);