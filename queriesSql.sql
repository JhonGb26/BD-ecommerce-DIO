use ecommerce;

-- Quantos fornecedores a empresa tem?
select count(*) as Fornecedores from fornecedor;

-- Quantos vendendores a empresa tem?
select count(*) as Vendedores from vendedor;

-- Quem são os vendedores e suas localidades?
select nomeSocial, AbsNome, localizacao from vendedor;

-- Quais produtos são classificado para crianças ?
select nome_prod as Produtos from produtos
	where Classificação_kids = true;
 
-- Quais desses produtos são briquedos?
select nome_prod as Briquedos from produtos
	where Categoria = 'Brinquedos';
 
-- Como a tabela de Cliente tá organizada e ordene por ordem alfabetica?
select * from Clients;

select * from Clients 
	order by Pname asc;
 
 -- Quais produtos com valores acime de 500?
SELECT nome_prod as Produto, preco FROM Produtos
	WHERE preco > 500;
    
-- Identifique quais produtos são caro, barato e médio e ordene?
SELECT nome_prod,
  preco,
  CASE
    WHEN preco > 500 THEN 'Caro'
    WHEN preco > 30 THEN 'Médio'
    ELSE 'Barato'
  END AS categoria_preco
FROM Produtos
	order by categoria_preco;

-- Quais categoria de produto e suas quantidades?
SELECT Categoria, SUM(quantidade) AS TotalQuantidade FROM ProdutoEstoque
	JOIN Produtos 
		ON ProdutoEstoque.produto_id = Produtos.produto_id
			GROUP BY Categoria;

-- Cite alguns produtos que os quatros primeiros clientes compraram?
SELECT Pedido.idPedido, Clients.Pname, Produtos.nome_prod
	FROM Pedido
	JOIN Clients ON Pedido.idClient = Clients.idClient
	JOIN ProdutoPedido ON Pedido.idPedido = ProdutoPedido.idPedido
	JOIN Produtos ON ProdutoPedido.produto_id = Produtos.produto_id;

-- Quais os fornecedores que têm produtos com uma quantidade total superior a 90 no estoque?
SELECT Fornecedor.idFornecedor, Fornecedor.nomeSocial, SUM(ProdutoFornecedor.quantidade) AS TotalQuantidade
	FROM Fornecedor
	JOIN ProdutoFornecedor ON Fornecedor.idFornecedor = ProdutoFornecedor.idFornecedor
	GROUP BY Fornecedor.idFornecedor, Fornecedor.nomeSocial
	HAVING TotalQuantidade > 90;