use ibge;
select * from senso where estado = 'Mato Grosso do Sul'; 
select * from senso where populacao < 1000 ; 
select * from senso where nome_mun = 'Terenos' or nome_mun = 'Campo Grande'; 
select * from senso where populacao > 100000 and estado = 'Mato Grosso do Sul';
select estado, nome_mun from senso order by nome_mun;
select * from senso where pib = (select max(pib) from senso);
select nome_mun from senso where pib_per_cap = (select max(pib_per_cap) from senso);
select nome_mun from senso where populacao = (select max(populacao) from senso);
select nome_mun from senso where populacao = (select min(populacao) from senso);
select * from senso where pib = (select max(pib) from senso);
select count(nome_mun) from senso;
select avg(pib) from senso;
select nome_mun from senso where nome_mun like 'c%';
select nome_mun from senso where nome_mun like 'a%';
select nome_mun from senso where nome_mun like 'b%';
select nome_mun from senso where nome_mun like 'd%';
select nome_mun from senso where nome_mun like 'e%';
select nome_mun from senso where nome_mun like 'f%';


