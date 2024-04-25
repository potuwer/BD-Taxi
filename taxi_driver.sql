--comandos DDL; create, alter e drop 19/02

create database TAXI_DRIVE
go


use TAXI_DRIVE;
go


create table cliente(
nome varchar(50) not null,
endereco varchar(100) not null,
telefone bigint not null,
email varchar(40),
cpf bigint not null
constraint pk_cliente_cpf primary key (cpf)
)

create table taxi(
id int not null,
placa varchar(10) not null,
ano_fabricacao smallint not null,
modelo varchar(20) not null,
marca varchar(10) not null,
constraint pk_taxi_id primary key (id)
)


create table motorista (
matricula bigint not null,
nome varchar(50) not null,
endereco varchar(100) not null,
telefone bigint not null,
cnh bigint not null,
constraint pk_motorista_matricula primary key (matricula)
)

create table corrida (
data_corrida datetime not null,
valor money not null,
destino varchar(100) not null,
forma_de_pagamento varchar(20),
id int not null,
cpf_cliente bigint not null,
taxi_id int not null,
motorista_matricula bigint not null,
constraint pk_id_corrida primary key (id),
constraint fk_cliente_cpf foreign key (cpf_cliente) references cliente (cpf),
constraint fk_taxi_id foreign key (taxi_id) references taxi (id),
constraint fk_motorista_matricula foreign key (motorista_matricula) references motorista (matricula)
)

--todos os ajustes feitos(add, drop, alter)

alter table taxi
alter column ano_fabricacao smallint not null

--COMANDOS INSERT DELETE E UPDATE 26/02

insert into cliente (nome, endereco, telefone, email, cpf) values ('Pablo Man', 'rua tramontina', 912080000, 'pablo@gmail.com', 12345678910)
insert into cliente (nome, endereco, telefone, email, cpf) values ('João Santos', 'Rua das Flores', 998877664, 'joao_santos@example.com', 98765432108);
insert into cliente (nome, endereco, telefone, email, cpf) values ('Ana Oliveira', 'Av. Paulista', 998877663, 'ana_oliveira@example.com', 98765432107);
insert into cliente (nome, endereco, telefone, email, cpf) values ('Pedro Costa', 'Rua do Rosário', 998877662, 'pedro_costa@example.com', 98765432106);
insert into cliente (nome, endereco, telefone, email, cpf) values ('Carla Souza', 'Av. 7 de Setembro', 998877661, 'carla_souza@example.com', 98765432105);
insert into cliente (nome, endereco, telefone, email, cpf) values ('Marcos Pereira', 'Rua dos Girassóis', 998877660, 'marcos_pereira@example.com', 98765432104);
insert into cliente (nome, endereco, telefone, email, cpf) values ('Juliana Lima', 'Av. das Américas', 998877659, 'juliana_lima@example.com', 98765432103);

--deletados
insert into cliente (nome, endereco, telefone, email, cpf) values ('Lucas Fernandes', 'Rua do Comércio', 998877658, 'lucas_fernandes@example.com', 98765432102);
insert into cliente (nome, endereco, telefone, email, cpf) values ('Fernanda Rocha', 'Av. Nossa Senhora', 998877657, 'fernanda_rocha@example.com', 98765432101);
insert into cliente (nome, endereco, telefone, email, cpf) values ('Rafaela Almeida', 'Rua das Palmeiras', 998877656, 'rafaela_almeida@example.com', 98765432100);

insert into motorista (matricula, nome, endereco, telefone, cnh) values (10101010, 'Carlin da mata', 'Rua dos Pneus, 290', 999678425, 77777777)
insert into motorista (matricula, nome, endereco, telefone, cnh) values (20202020, 'Lucas Santos', 'Av. das Árvores, 123', 999123456, 88888888);
insert into motorista (matricula, nome, endereco, telefone, cnh) values (30303030, 'Ana Oliveira', 'Rua das Flores, 456', 999654321, 99999999);
insert into motorista (matricula, nome, endereco, telefone, cnh) values (40404040, 'Pedro Alves', 'Av. dos Pássaros, 789', 999987654, 11111111);
insert into motorista (matricula, nome, endereco, telefone, cnh) values (50505050, 'Bryan da Silva Pinto', 'Rua das Pedras, 987', 999111222, 22222222);

insert into taxi (id, placa, ano_fabricacao, modelo, marca) values (265789, 'ALVINN', 2012, 'Onix', 'Chevrolet')
insert into taxi (id, placa, ano_fabricacao, modelo, marca) values (123456, 'CAR001', 2015, 'Corolla', 'Toyota');
insert into taxi (id, placa, ano_fabricacao, modelo, marca) values (987654, 'CAR002', 2018, 'Civic', 'Honda');
insert into taxi (id, placa, ano_fabricacao, modelo, marca) values (456789, 'CAR003', 2016, 'Fiesta', 'Ford');
insert into taxi (id, placa, ano_fabricacao, modelo, marca) values (789123, 'CAR004', 2019, 'Fusion', 'Ford');
insert into taxi (id, placa, ano_fabricacao, modelo, marca) values (321654, 'CAR005', 2017, 'Camry', 'Toyota');

--deletados
insert into taxi (id, placa, ano_fabricacao, modelo, marca) values (654321, 'CAR006', 2014, 'Accord', 'Honda');
insert into taxi (id, placa, ano_fabricacao, modelo, marca) values (555555, 'CAR007', 2013, 'Sentra', 'Nissan');
insert into taxi (id, placa, ano_fabricacao, modelo, marca) values (666666, 'CAR008', 2016, 'Fusca', 'Volkswagen');
insert into taxi (id, placa, ano_fabricacao, modelo, marca) values (777777, 'CAR009', 2017, 'Focus', 'Ford');
insert into taxi (id, placa, ano_fabricacao, modelo, marca) values (888888, 'CAR010', 2020, 'Cruze', 'Chevrolet');

insert into corrida (id, data_corrida, valor, destino, forma_de_pagamento, cpf_cliente, taxi_id, motorista_matricula) values (00001, '04-02-2024 15:00:00', 17.00, 'Rua das Capivaras, 2', 'Dinheiro', 12345678910, 265789, 50505050)
insert into corrida (id, data_corrida, valor, destino, forma_de_pagamento, cpf_cliente, taxi_id, motorista_matricula) values (00002, '04-02-2024 15:00:00', 14.00, 'Rua das Capivaras, 2', 'Dinheiro', 12345678910, 265789, 50505050)

insert into corrida (id, data_corrida, valor, destino, forma_de_pagamento, cpf_cliente, taxi_id, motorista_matricula) values (00003, '04-02-2024 15:00:00', 14.00, 'Rua das Capivaras, 2', 'Dinheiro', 98765432105, 265789, 50505050)
insert into corrida (id, data_corrida, valor, destino, forma_de_pagamento, cpf_cliente, taxi_id, motorista_matricula) values (00004, '04-02-2024 15:00:00', 14.00, 'Rua das Capivaras, 2', 'Dinheiro', 98765432105, 265789, 50505050)

insert into corrida (id, data_corrida, valor, destino, forma_de_pagamento, cpf_cliente, taxi_id, motorista_matricula) values (00005, '04-02-2024 15:00:00', 25.00, 'Rua das Capivaras, 2', 'Dinheiro',  98765432104, 265789, 50505050)
insert into corrida (id, data_corrida, valor, destino, forma_de_pagamento, cpf_cliente, taxi_id, motorista_matricula) values (00006, '04-02-2024 15:00:00', 12.00, 'Rua das Capivaras, 2', 'Dinheiro',  98765432104, 265789, 50505050)


update corrida set valor = 19.00 where id = 4

delete from taxi where id = 654321 or id = 555555 or id = 666666 or id = 777777 or id = 888888
delete from cliente where cpf = 98765432100 or nome = 'Lucas Fernandes' or telefone =  998877657
delete from cliente where cpf = 98765432103 and nome = 'Juliana Lima'
update taxi set id = 000001 where placa = 'CAR001'
update taxi set id = 000002 where placa = 'CAR002'
update taxi set id = 000003 where placa = 'CAR003'
update taxi set id = 000004 where placa = 'CAR004'
update taxi set id = 005 where placa = 'CAR005'



--COMANDOS SELECT 04/03

select cpf, nome from cliente
select id, placa from taxi
select placa from taxi where ano_fabricacao = 2017
select * from corrida
select * from taxi
select * from cliente
select * from motorista

--LÓGICO E COMPARAÇÃO 11/03

select placa from taxi where ano_fabricacao between 2019 AND 2020
select * from taxi where id >= 3
select * from taxi where id <> 2

select cpf, nome from cliente where nome like 'joão'
select max(valor) from corrida group by cpf_cliente
select id, placa from taxi order by id 


-- COMANDOS JOIN 18/03

select cpf from cliente right join motorista on matricula = matricula

select nome, cpf, data_corrida, destino from cliente inner join corrida on cpf = cpf_cliente

select * from cliente left join corrida on cpf = cpf_cliente

-- COMANDOS TRIGGER E PROCEDURE 12/04

create trigger motraCorrida -- Mostra todas as corridas quando uma nova é feita
on corrida
after insert
as
begin
	select * from corrida
end

insert into corrida(id, data_corrida, valor, destino, forma_de_pagamento, cpf_cliente, taxi_id, motorista_matricula)
values (00020, '05-02-2024 20:00:00', 19.00, 'Rua das Capivaras, 7', 'Dinheiro', 98765432105, 265789, 50505050)

delete from corrida where id = 20

create procedure novaCorrida
	@data_corrida datetime,
	@valor money,
	@destino varchar(100),
	@forma_de_pagamento varchar(20),
	@cpf_cliente bigint, 
	@taxi_id int, 
	@motorista_matricula bigint
as
begin
	declare @novoId int; --Cria um novo Id, pegando o maior que existe em corrida e aumenta 1
	select @novoId = ISNULL(max(id), 0) + 1 from corrida;

	INSERT INTO corrida (id, data_corrida, valor, destino, forma_de_pagamento, cpf_cliente, taxi_id, motorista_matricula)
    VALUES (@novoId, @data_corrida, @valor, @destino, @forma_de_pagamento, @cpf_cliente, @taxi_id, @motorista_matricula); --Cria a nova corrida

	select * from corrida where id = @novoId; --Mostra a nova corrida
end;

drop procedure novaCorrida

exec novaCorrida '05-02-2024 20:00:00', 20.00, 'Rua das luas, 7', 'cartão', 98765432105, 265789, 50505050
