create database ecommerce;
use ecommerce;

-- CRIANDO A TABELA CLIENTE
create table Clients(
		idClient int auto_increment primary key,
        Pname varchar(10),
        Nmeio char(3),
        Sname varchar(20),
        CPF char(11) not null,
        DataAniver date not null,
        Endereco varchar(45),
        constraint unique_cpf_client unique (CPF)
);



CREATE TABLE Produtos (
    produto_id INT auto_increment PRIMARY KEY,
    nome_prod VARCHAR(50) not null,
    Classificação_kids BOOL DEFAULT FALSE,
    Categoria ENUM('Eletrônico', 'Vestimenta', 'Brinquedos') not null,
    Avaliação FLOAT DEFAULT 0,
    Tamanho varchar(10),
    Preco float not null
);

create table Pagamento (
	idPagamento int auto_increment primary key,
    idClient int,
    tipoPagamento enum('Debito', 'Cartão de credito', 'Pix', 'Boleto') not null,
    limiteAvaliado float,
    foreign key (idClient) references Clients (idClient)

);
 create table Pedido(
	idPedido int auto_increment primary key,
    idClient int,
    idPagamento int,
    pedido_status enum('Em andamento', 'Cancelado', 'Finalizado', 'Confirmado') default 'Em andamento',
    constraint fk_odr_cliente foreign key (idClient) references Clients (idClient),
    constraint fk_odr_pagamento foreign key (idPagamento) references Pagamento (idPagamento)
    
 );
 
 create table Estoque(
	idEstoque int auto_increment primary key,
    localizacao varchar(225),
    quantidade int default 0
 
 );
 
 create table Fornecedor(
	idFornecedor int auto_increment primary key,
    nomeSocial varchar(225) not null,
    CNPJ char(14) not null,
    Contato char(11) not null,
    constraint unique_fornecedor unique(CNPJ)
 
 );
 
 create table Vendedor( 
	idVendedor int auto_increment primary key,
    nomeSocial varchar(225) not null,
    AbsNome varchar(255) not null,
    CNPJ char(14) not null,
    CPF char(11) not null,
    localizacao varchar(225),
    Contato char(11) not null,
    constraint unique_cnpj_vendedor UNIQUE (CNPJ),
    constraint unique_cpf_vendedor UNIQUE (CPF) 
 );
 
 
 create table ProdutoVendedor(
	idProdutoVendedor int auto_increment primary key,
    idVendedor int,
    produto_id INT,
    quantidade int not null,
    constraint fk_produtoVendedor_produto foreign key (produto_id) references Produtos (produto_id),
    constraint fk_produtoVendedor_vendendor foreign key (idVendedor) references Vendedor (idVendedor)
 
 );
 
 create table ProdutoPedido(
	produto_id INT,
    idPedido int,
    status_P enum('Disponivel', 'Sem estoque') default 'Disponivel',
    primary key (produto_id, idPedido),
    constraint fk_produtoPedido_produto foreign key (produto_id) references Produtos (produto_id),
    constraint fk_produtoPedido_pedido foreign key (idPedido) references Pedido (idPedido)
 
 );

create table ProdutoFornecedor(
	idProdutoFornecedor int auto_increment primary key,
    produto_id INT,
    idFornecedor int,
    quantidade int not null,
    constraint fk_produtoFonecedor_produto foreign key (produto_id) references Produtos (produto_id),
    constraint fk_produtoFonecedor_fornecedor foreign key (idFornecedor) references Fornecedor (idFornecedor)

);

create table ProdutoEstoque(
	produto_id INT,
	idEstoque int,
    localizacao varchar(225),
	quantidade int default 0,
    primary key(produto_id, idEstoque),
    constraint fk_produtoEstoque_produto foreign key (produto_id) references Produtos (produto_id),
    constraint fk_produtoEstoque_Estoque foreign key (idEstoque) references Estoque (idEstoque)
);




