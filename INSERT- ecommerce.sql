use ecommerce;

insert into Clients(Pname, Nmeio, Sname, CPF,  Endereco, DataAniver)
values
	('Jhon', 'S.', 'Silva', '12345678901', 'Rua Marilia, 123', '1990-05-15'),
    ('Carla', 'V.', 'Santos', '23456789012', 'Cond. Bela, 456', '1985-09-20'),
    ('Iris', 'C.', 'Oliveira', '34567890123', 'Rua Car, 789', '1995-02-10'),
    ('Jorda', 'C.', 'Pereira', '45678901234', 'Praça SP, 987', '2000-11-30'),
    ('Yan', 'S.', 'Rodrigues', '56789012345', 'Entrocamento B, 654', '1992-07-25');

select * from Clients;
    
insert into Produtos(nome_prod, Classificação_kids, Categoria, Avaliação, Tamanho, Preco)
values
	('SmartPhone', false, 'Eletrônico', 4.5, '15x7.8 cm', 899.99),
    ('Blusa V', true, 'Vestimenta', 3.8, 'M', 29.99),
    ('Caminhão de Gado', true, 'Brinquedos', 4.2, '20x15 cm', 29.99),
    ('Notebook', false, 'Eletrônico', 4.8, '35x25 cm', 3299.99),
    ('Kit-Fitness', true, 'Vestimenta', 4.5, 'L', 49.99),
    ('Caça-Palavras', true, 'Brinquedos', 4.6, '30x30 cm', 9.99),
    ('Fone de Ouvido bluetooth', false, 'Eletrônico', 4.4, '20x15 cm', 89.99);
	
select * from Produtos;
    
insert into Pagamento(idClient, tipoPagamento, limiteAvaliado)
values
	(1, 'Debito', 350),
    (2, 'Cartão de credito', 5000),
    (3, 'Pix', 950),
    (4, 'Boleto', 1560),
    (5, 'Pix', 200);

select * from Pagamento;

insert into Pedido(idClient, idPagamento, pedido_status)
values
	(1, 1, 'Em andamento'),
    (2, 2, 'Finalizado'),
    (3, 3,'Confirmado' ),
    (4, null, 'Cancelado' ),
    (4, 4, 'Finalizado' ),
    (5, 5, 'Confirmado' );
  
  
INSERT INTO Fornecedor (nomeSocial, CNPJ, Contato)
VALUES
    ('Fabrica de Brinquedos LTDA', '445894015567', '75988364575'),
    ('F-Eletron LTDA', '087956471239', '71936314547'),
    ('Custura e Borda', '798546321875', '76992445859'),
    ('Em forma', '05497538165801', '83963645873'),
    ('Tem tudo', '558877996633', '11986572358');

select * from Fornecedor;

INSERT INTO Vendedor (nomeSocial, AbsNome, CNPJ, CPF, localizacao, Contato)
VALUES
    ('Jene Santos', 'Vendedor Ele.', '08459675891325', '56375986123', 'Rua Mei , N. 65, B. S Jorge , C. Feira', '76985846587'),
    ('Carlos S. Souza', 'Vendedor Ger.', '07589743581275', '00856973482', 'Rua A, N. 99, B. Meireles , C. Feira', '76543210923'),
    ('William G. Guilda', 'Vendedor Vest.', '75987563745599', '09456038912', 'Rua C , N. 52, B. Pituba , C. Salvador', '77986523469'),
    ('Karme D. Vieira', 'Vendedor Toy.', '09894575632449', '85640786630', 'Rua V, N. 96, B. Prima , C. SV', '66937825656'),
    ('Raquel V. Villas', 'Vendedor Sul.', '67689657442395', '75986341205', 'Rua S, N. 36, B. Guaru , C. SP', '11923568412'),
    ('Bruno S. Cerqueira', 'Vendedor Br.', '75559885664423', '95175385246', 'Rua T, N. 44, B. Paulo , C. SAJ', '78966539658');
    
insert into Estoque(localizacao, quantidade)
values
('Armazém 1', 100),
('Armazém 2', 200),
('Armazém 3', 300),
('Armazém 4', 400),
('Armazém 5', 500);

INSERT INTO ProdutoVendedor (idVendedor, produto_id, quantidade)
VALUES
(1, 1, 10),
(2, 2, 5),
(3, 3, 20),
(4, 4, 15),
(5, 5, 10);

INSERT INTO ProdutoPedido (produto_id, idPedido, status_P)
VALUES
(1, 1, 'Disponível'),
(2, 2, 'Disponível'),
(3, 3, 'Disponível'),
(4, 4, 'Sem estoque'),
(5, 4, 'Disponível');

INSERT INTO ProdutoFornecedor (produto_id, idFornecedor, quantidade)
VALUES
(1, 6, 100),
(2, 7, 50),
(3, 8, 200),
(4, 9, 150),
(5, 10, 100);

INSERT INTO ProdutoEstoque (produto_id, idEstoque, localizacao, quantidade)
VALUES
(1, 1, 'Armazém 1', 100),
(2, 2, 'Armazém 2', 50),
(3, 3, 'Armazém 3', 200),
(4, 4, 'Armazém 4', 150),
(5, 5, 'Armazém 5', 100);


