use ecommerce;

-- ================================================
-- INSERINDO CLIENTES
-- ================================================
insert into clients (Fname, Minit, Lname, CPF, Address)
values
  ('Carlos',   'A', 'Ferreira',  11122233300, 'rua das palmeiras 45, Jardim América - SP'),
  ('Fernanda', 'B', 'Oliveira',  22233344411, 'avenida brasil 1200, Centro - RJ'),
  ('Lucas',    'C', 'Mendonça',  33344455522, 'rua sete de setembro 300, Bairro Novo - MG'),
  ('Beatriz',  'D', 'Carvalho',  44455566633, 'rua das acácias 87, Centro - SP'),
  ('Eduardo',  'E', 'Souza',     55566677744, 'avenida atlântica 500, Copacabana - RJ'),
  ('Amanda',   'F', 'Ribeiro',   66677788855, 'rua XV de novembro 210, Centro - PR');

-- ================================================
-- INSERINDO PRODUTOS
-- ================================================
insert into product (Pname, Classification_kids, Category, Feedback, Size)
values
  ('Teclado Mecânico',    false, 'Eletrônico',  '5', null),
  ('Boneco Homem-Aranha', true,  'Brinquedos',  '4', null),
  ('Camiseta Infantil',   true,  'Vestimenta',  '5', null),
  ('Câmera Fotográfica',  false, 'Eletrônico',  '5', null),
  ('Mesa de Escritório',  false, 'Móveis',      '4', '120x60x75'),
  ('Arroz Integral',      false, 'Alimentos',   '3', null),
  ('Smart TV 50"',        false, 'Eletrônico',  '5', null);

-- ================================================
-- INSERINDO PEDIDOS
-- ================================================
insert into orders (idOrderClient, OrderStatus, OrderDescription, ShippingCost)
values
  (1, default,      'compra via aplicativo',  null),
  (2, default,      'compra via aplicativo',  30),
  (3, 'Confirmado', null,                     null),
  (5, default,      'compra via web site',    80);

-- ================================================
-- INSERINDO ITENS DOS PEDIDOS
-- ================================================
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
values
  (1, 1, 1, null),
  (4, 2, 2, null),
  (7, 3, 1, null);

-- ================================================
-- INSERINDO ESTOQUES
-- ================================================
insert into productStorage (StorageLocation, Quantity)
values
  ('São Paulo',      800),
  ('São Paulo',      400),
  ('Rio de Janeiro', 200),
  ('Rio de Janeiro', 150),
  ('Curitiba',       90),
  ('Belo Horizonte', 50);

-- ================================================
-- INSERINDO LOCALIZAÇÃO DE ESTOQUE
-- ================================================
insert into storeagelocation (idLproduct, idLstorage, location)
values
  (1, 1, 'SP'),
  (4, 3, 'RJ');

-- ================================================
-- INSERINDO FORNECEDORES
-- ================================================
insert into supplier (SocialName, CNPJ, contact)
values
  ('Tech Imports Ltda',     11122233300011, '11988776655'),
  ('Distribuidora Norte',   22233344411122, '21977665544'),
  ('Global Eletronics SA',  33344455522233, '41966554433');

-- ================================================
-- INSERINDO VENDEDORES
-- ================================================
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact)
values
  ('Nova Tech',       null, 11122233344455, null,        'São Paulo',      1198765432),
  ('Moda Kids',       null, null,           99988877766, 'Curitiba',       4133445566),
  ('Casa & Cia',      null, 55566677788899, null,        'Belo Horizonte', 3199887766);

-- ================================================
-- INSERINDO PRODUTOS POR VENDEDOR
-- ================================================
insert into productSeller (idPseller, idPproduct, prodQuantity)
values
  (1, 1, 50),
  (2, 3, 30),
  (3, 5, 20);

-- ================================================
-- CONSULTAS DE VERIFICAÇÃO
-- ================================================
select * from clients;
select count(*) as total_clientes from clients;

select c.idClient, c.Fname as Cliente, count(o.idOrder) as Total_Pedidos
from clients c
inner join orders o on c.idClient = o.idOrderClient
group by c.idClient, c.Fname;

select * from product;
select * from orders;