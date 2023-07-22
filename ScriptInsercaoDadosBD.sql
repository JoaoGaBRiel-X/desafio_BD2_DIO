use oficina;

insert into Cliente (
	Nome,
    CPF,
    Endereco)
values
	('Joao Gabriel Carvalho', '12345678978', 'Rua das Camelias, 36 - Jd Paulista - São Paulo - SP'),
    ('Pedro Alvares', '12685678978', 'Rua das Flores, 25 - Jd Pinheirs - São Paulo - SP'),
    ('Carlos Alberto', '12336678978', 'Rua das Orquideas, 16 - Jd Camelia - São Paulo - SP'),
    ('Janaina Silva', '12345699978', 'Rua dos Girassois, 996 - Jd Laranjeiras - São Paulo - SP'),
    ('Lais Almeida', '12345671278', 'Rua dos Lirios, 568 - Centro - São Paulo - SP'),
    ('Larissa de Alcantara', '12345668978', 'Rua dos Arbustos, 254 - Centro - São Paulo - SP'),
    ('Ingrid Silva Batista', '12345678888', 'Rua das Camelias, 395 - Jd Paulista - São Paulo - SP');
    
-- select * from cliente;

insert into Veiculo (
	Tipo,
    Placa,
    Marca,
    Modelo)
values
	('Moto', 'abc1234', 'Yamaha', 'CG250'),
    ('Carro', 'abc2563', 'Chevrolet', 'Celta'),
    ('Carro', 'abc1478', 'Ford', 'Ranger'),
    ('Carro', 'abc2369', 'Fiat', 'Argo'),
    ('Caminhao', 'abc7895', 'Mercedes', 'ABCD');
    
-- select * from Veiculo;
    
insert into Produto (
	P_Descricao,
    P_Categoria,
    P_Valor)
values
	('Correia Dentada', 'Peças', 150.00),
    ('Oleo Motor', 'Oleos', 89.00),
    ('Fluido de Freio', 'Fluidos', 45.00),
    ('Limpador Parabrisa', 'Peças', 39.90),
    ('Pneu', 'Pneus', 369.50),
    ('Desingripante', 'Oleos', 150.00);
  
  
insert into Servico (
	S_Descricao,
    S_Valor,
    S_Categoria)
values
	('Troca de Oleo', 150.00, default),
    ('Troca Fluido de Freio', 69.00, default),
    ('Troca Pneu', 60.00, 'Terceirizado'),
    ('Troca Correia', 0.00, 'Garantia');
    

insert into Ordem_Servico(
	OS_Problema,
    OS_Solucao,
    OS_Status,
    Veiculo_idVeiculo,
    Cliente_idCliente)
values
	('Entrada para troca de oleo motor', null, default, 1, 6),
    ('Furou pneu, analise para recuperacao ou troca', 'Pneu não teve como recuperar, será necessário trocar por um novo.', 'Aguardando Aprovação Orçamento', 4, 2),
    ('Barulho estranho no motor ao acelerar', 'Verificado problema na correia, será necessário a substituição em garantia', 'Concluida', 3, 1),
    ('Cliente reclamou que freio está fraco', 'Localizado vazamento de fluido de freio, foi realizado a troca da mangueira e troca do fluido', 'Aguardando Entrega', 2, 3),
    ('Entrada para troca de oleo motor', 'Troca finalizada', 'Concluida', 4, 2),
    ('Entrada para troca de oleo motor', 'Troca finalizada', 'Aguardando Aprovação Orçamento', 2, 3),
    ('Entrada para troca de oleo motor', 'Troca finalizada', 'Concluida', 4, 2),
    ('Entrada para troca de oleo motor', 'Troca finalizada', 'Concluida', 3, 1),
    ('Entrada para troca de oleo motor', 'Troca finalizada', 'Aguardando Aprovação Orçamento', 3, 1),
    ('Entrada para troca de oleo motor', 'Troca finalizada', 'Concluida', 5, 4),
    ('Entrada para troca de oleo motor', 'Troca finalizada', 'Aguardando Entrega', 4, 2);

insert into Servico_has_Ordem_Servico 
values
	(3, 2),
    (4, 3),
    (2, 4),
    (1, 5),
    (1, 6),
    (1, 7),
    (1, 8),
    (1, 9),
    (1, 10),
    (1, 11);
    
insert into Produto_has_Ordem_Servico 
values
	(5, 2),
    (1, 3),
    (3, 4),
    (2, 5),
    (2, 6),
    (2, 7),
    (2, 8),
    (2, 9),
    (2, 10),
    (2, 11);