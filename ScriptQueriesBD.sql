use oficina;

-- Detalhes OS (Cliente, Produto e Servico)
select 
os.idOrdem_Servico as 'Numero OS',
c.Nome as 'Nome', 
v.Modelo as 'Veiculo',
v.placa as 'Placa',
os.OS_Problema,
os.OS_Solucao,
os.OS_Status,
p.P_Descricao as 'Produto',
p.P_Valor as 'Valor Produto',
s.S_Descricao as 'Servico',
s.S_Valor as 'Valor Servico'
from ordem_servico os
inner join veiculo v on v.idVeiculo = os.Veiculo_idVeiculo
inner join cliente c on c.idCliente = os.Cliente_idCliente
left join produto_has_ordem_servico pos on pos.Ordem_Servico_idOrdem_Servico = os.idOrdem_Servico
left join produto p on p.idProduto = pos.Produto_idProduto
left join servico_has_ordem_servico sos on sos.Ordem_Servico_idOrdem_Servico = os.idOrdem_Servico
left join servico s on s.idServico = sos.Servico_idServico;

-- Filtro OS Por status
select 
os.idOrdem_Servico as 'Numero OS',
c.Nome as 'Nome', 
v.Modelo as 'Veiculo',
v.placa as 'Placa',
os.OS_Problema,
os.OS_Solucao,
os.OS_Status,
p.P_Descricao as 'Produto',
p.P_Valor as 'Valor Produto',
s.S_Descricao as 'Servico',
s.S_Valor as 'Valor Servico'
from ordem_servico os
inner join veiculo v on v.idVeiculo = os.Veiculo_idVeiculo
inner join cliente c on c.idCliente = os.Cliente_idCliente
left join produto_has_ordem_servico pos on pos.Ordem_Servico_idOrdem_Servico = os.idOrdem_Servico
left join produto p on p.idProduto = pos.Produto_idProduto
left join servico_has_ordem_servico sos on sos.Ordem_Servico_idOrdem_Servico = os.idOrdem_Servico
left join servico s on s.idServico = sos.Servico_idServico
where os.OS_Status = 'Concluida';

-- Filtro OS por cliente
select 
os.idOrdem_Servico as 'Numero OS',
c.Nome as 'Nome', 
v.Modelo as 'Veiculo',
v.placa as 'Placa',
os.OS_Problema,
os.OS_Solucao,
os.OS_Status,
p.P_Descricao as 'Produto',
p.P_Valor as 'Valor Produto',
s.S_Descricao as 'Servico',
s.S_Valor as 'Valor Servico'
from ordem_servico os
inner join veiculo v on v.idVeiculo = os.Veiculo_idVeiculo
inner join cliente c on c.idCliente = os.Cliente_idCliente
left join produto_has_ordem_servico pos on pos.Ordem_Servico_idOrdem_Servico = os.idOrdem_Servico
left join produto p on p.idProduto = pos.Produto_idProduto
left join servico_has_ordem_servico sos on sos.Ordem_Servico_idOrdem_Servico = os.idOrdem_Servico
left join servico s on s.idServico = sos.Servico_idServico
where `Nome` = 'Joao Gabriel Carvalho';

-- quantidade de OS por cliente
select 
c.Nome as 'Nome', 
count(*) as 'QTD OS'
from ordem_servico os
inner join cliente c on c.idCliente = os.Cliente_idCliente
group by `Nome`;

-- Filtro Clientes com mais de 2 OS
select 
c.Nome as 'Nome', 
count(*) as 'QTD OS'
from ordem_servico os
inner join cliente c on c.idCliente = os.Cliente_idCliente
group by `Nome`
having count(*) > 2;

-- Top 3 clientes
select 
c.Nome as 'Nome', 
count(*) as 'QTD OS'
from ordem_servico os
inner join cliente c on c.idCliente = os.Cliente_idCliente
group by `Nome`
order by `QTD OS` desc
limit 3

