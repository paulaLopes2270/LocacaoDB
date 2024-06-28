-- Tabela endereco
create table endereco (
    cod_end int primary key,
    logradouro varchar(40),
    tipo_log varchar(40),
    complemento varchar(20),
    cidade varchar(60),
    uf char(1),
    cep char(8),
    numero varchar(10),
    bairro varchar(60)
);

-- Tabela cliente
create table cliente (
    cod_cli int primary key,
    cpf char(11),
    nome varchar(60),
    telefone varchar(10),
    cod_prof int,
    foreign key (cod_prof) references profissao(cod_prof)
);

-- Tabela cli_endereco
create table cli_endereco (
    cod_end int not null,
    cod_cli int not null,
    primary key (cod_end, cod_cli),
    foreign key (cod_end) references endereco(cod_end),
    foreign key (cod_cli) references cliente(cod_cli)
);

-- Tabela profissao
create table profissao (
    cod_prof int primary key,
    nome varchar(60)
);

-- Tabela categoria
create table categoria (
    cod_cat int primary key,
    nome varchar(60),
    valor numeric(15,2)
);

-- Tabela genero
create table genero (
    cod_gen int primary key,
    nome varchar(60)
);

-- Tabela ator
create table ator (
    cod_ator int primary key,
    nome varchar(60)
);

-- Tabela filme_ator
create table filme_ator (
    cod_ator int not null,
    cod_filme int not null,
    diretor char(1),
    primary key (cod_ator, cod_filme),
    foreign key (cod_ator) references ator(cod_ator),
    foreign key (cod_filme) references filmes(cod_filme)
);

-- Tabela dependente
create table dependente (
    cod_cli int not null,
    cod_dep int not null,
    parentesco varchar(20),
    primary key (cod_cli, cod_dep),
    foreign key (cod_cli) references cliente(cod_cli)
);

-- Tabela locacao
create table locacao (
    cod_loc int primary key,
    data_loc date,
    desconto numeric(15,2),
    multa numeric(15,2),
    sub_total numeric(15,2),
    cod_cli int not null,
    foreign key (cod_cli) references cliente(cod_cli)
);

-- Tabela locacao_filme
create table locacao_filme (
    cod_loc int not null,
    cod_filme int not null,
    num_dias int,
    data_devol date,
    primary key (cod_loc, cod_filme),
    foreign key (cod_loc) references locacao(cod_loc),
    foreign key (cod_filme) references filmes(cod_filme)
);


-- Inserir dados na tabela profissao
insert into profissao (cod_prof, nome) values 
(1, 'engenheiro'),
(2, 'médico'),
(3, 'advogado');


-- Inserir dados na tabela cliente
insert into cliente (cod_cli, cpf, nome, telefone, cod_prof) values 
(1, '12345678901', 'joao silva', '1111111111', 1),
(2, '23456789012', 'maria oliveira', '2222222222', 2),
(3, '34567890123', 'carlos pereira', '3333333333', 3);


insert into endereco (cod_end, logradouro, tipo_log, complemento, cidade, uf, cep, numero, bairro) values 
(1, 'rua a', 'rua', '', 'cidade a', 'a', '11111111', '10', 'bairro a'),
(2, 'rua b', 'avenida', 'apt 101', 'cidade b', 'b', '22222222', '20', 'bairro b'),
(3, 'rua c', 'travessa', '', 'cidade c', 'c', '33333333', '30', 'bairro c');


-- Inserir dados na tabela cli_endereco
insert into cli_endereco (cod_end, cod_cli) values 
(1, 1),
(2, 2),
(3, 3);

-- Inserir dados na tabela categoria
insert into categoria (cod_cat, nome, valor) values 
(1, 'ação', 100.00),
(2, 'comédia', 50.00),
(3, 'drama', 70.00);

-- Inserir dados na tabela genero
insert into genero (cod_gen, nome) values 
(1, 'aventura'),
(2, 'romance'),
(3, 'ficção científica');


-- Inserir dados na tabela ator
insert into ator (cod_ator, nome) values 
(1, 'ator 1'),
(2, 'ator 2'),
(3, 'ator 3');

-- Inserir dados na tabela filmes
insert into filmes (cod_filme, titulo_original, titulo, quantidade, cod_cat, cod_gen) values 
(1, 'Harry Potter and the Philosophers Stone', 'Harry Potter e a Pedra Filosofal', 10, 1, 1),
(2, 'Harry Potter and the Chamber of Secrets', 'Harry Potter e a Câmara Secreta', 5, 2, 2),
(3, 'Harry Potter and the Prisoner of Azkaban', 'Harry Potter e o Prisioneiro de Azkaban', 7, 3, 3),
(4, 'Harry Potter and the Goblet of Fire', 'Harry Potter e o Cálice de Fogo', 15, 1, 2),
(5, 'Harry Potter and the Order of the Phoenix', 'Harry Potter e a Ordem da Fênix', 3, 2, 3),
(6, 'Harry Potter and the Half-Blood Prince', 'Harry Potter e o Enigma do Príncipe', 8, 3, 1),
(7, 'Harry Potter and the Deathly Hallows: Part 1', 'Harry Potter e as Relíquias da Morte: Parte 1', 6, 1, 3),
(8, 'Harry Potter and the Deathly Hallows: Part 2', 'Harry Potter e as Relíquias da Morte: Parte 2', 12, 2, 1),
(9, 'The Lord of the Rings: The Fellowship of the Ring', 'O Senhor dos Anéis: A Sociedade do Anel', 4, 3, 2),
(10, 'The Lord of the Rings: The Two Towers', 'O Senhor dos Anéis: As Duas Torres', 20, 1, 1),
(11, 'The Lord of the Rings: The Return of the King', 'O Senhor dos Anéis: O Retorno do Rei', 9, 2, 2),
(12, 'The Hobbit: An Unexpected Journey', 'O Hobbit: Uma Jornada Inesperada', 11, 3, 3),
(13, 'The Hobbit: The Desolation of Smaug', 'O Hobbit: A Desolação de Smaug', 5, 1, 2),
(14, 'The Hobbit: The Battle of the Five Armies', 'O Hobbit: A Batalha dos Cinco Exércitos', 2, 2, 3),
(15, 'Fantastic Beasts and Where to Find Them', 'Animais Fantásticos e Onde Habitam', 13, 3, 1);


-- Inserir dados na tabela locacao
insert into locacao (cod_loc, data_loc, desconto, multa, sub_total, cod_cli) values 
(1, '2024-01-01', 5.00, 2.00, 20.00, 1),
(2, '2024-02-01', 10.00, 3.00, 30.00, 2),
(3, '2024-03-01', 0.00, 0.00, 40.00, 3);


-- Inserir dados na tabela locacao_filme
insert into locacao_filme (cod_loc, cod_filme, num_dias, data_devol) values 
(1, 1, 7, '2024-01-08'),
(1, 2, 7, '2024-01-08'),
(2, 3, 7, '2024-02-08'),
(2, 4, 7, '2024-02-08'),
(3, 5, 7, '2024-03-08'),
(3, 6, 7, '2024-03-08');

--exercicio 1- Listar todas as locações e seus respectivos clientes.

select 
    l.cod_loc,
    l.data_loc,
    c.nome as cliente
from 
    locacao l
    join cliente c on l.cod_cli = c.cod_cli;

--Exercício 2: Obter uma lista de clientes e seus dependentes.
select 
    c.nome as cliente,
    d.cod_dep as dependente
from 
    cliente c
    left join dependente d on c.cod_cli = d.cod_cli;


--Exercício 3: Listar todos os filmes de um determinado gênero.
select 
    f.titulo as filme,
    g.nome as genero
from 
    filmes f
    join genero g on f.cod_gen = g.cod_gen
where 
    g.cod_gen = 1;

--Exercício 4: Exibir todos os clientes que têm uma profissão específica.
select 
    c.nome as cliente,
    p.nome as profissao
from 
    cliente c
    join profissao p on c.cod_prof = p.cod_prof
where 
    p.cod_prof = 1;

-- Encontrar todos os filmes em uma categoria específica com quantidade disponível maior que 5.
select 
    f.titulo
from 
    filmes f
where 
    f.cod_cat = 1
    and f.quantidade > 5;

--Listar todos os atores que participaram de filmes com um determinado título.
select 
    a.nome
from 
    ator a
join 
    filme_ator fa on a.cod_ator = fa.cod_ator
join 
    filmes f on fa.cod_filme = f.cod_filme
where 
    f.titulo = 'Harry Potter e a Pedra Filosofal';

--Obter o endereço completo de um cliente específico.
select 
    e.logradouro,
    e.tipo_log,
    e.complemento,
    e.cidade,
    e.uf,
    e.cep,
    e.numero,
    e.bairro
from 
    endereco e
join 
    cli_endereco ce on e.cod_end = ce.cod_end
where 
    ce.cod_cli = 1;


--Listar todos os filmes e seus respectivos gêneros e categorias.
-- exercício 8
select 
    f.titulo,
    g.nome as genero,
    c.nome as categoria
from 
    filmes f
join 
    genero g on f.cod_gen = g.cod_gen
join 
    categoria c on f.cod_cat = c.cod_cat;


--Mostrar todos os clientes que alugaram um filme específico e a data de locação.
-- exercício 9
select 
    c.nome,
    l.data_loc
from 
    cliente c
join 
    locacao l on c.cod_cli = l.cod_cli
join 
    locacao_filme lf on l.cod_loc = lf.cod_loc
where 
    lf.cod_filme = 1;

--Exibir a lista de clientes com multas superiores a um valor específico.
-- exercício 10
select 
    c.nome,
    l.multa
from 
    cliente c
join 
    locacao l on c.cod_cli = l.cod_cli
where 
    l.multa > 10.0;


--Listar todas as locações feitas em um período específico.
--exercício 11

	select 
    l.*
from 
    locacao l
where 
    l.data_loc between '2023-01-01' and '2023-12-31';


-- Obter a quantidade total de filmes alugados por cada cliente. (DESAFIO)
-- exercício 12
select 
    c.nome,
    count(lf.cod_filme) as total_filmes_alugados
from 
    cliente c
join 
    locacao l on c.cod_cli = l.cod_cli
join 
    locacao_filme lf on l.cod_loc = lf.cod_loc
group by 
    c.nome;


--Listar os clientes e os filmes que eles alugaram, ordenados por data de locação.
-- Exercício 13
select 
    c.nome as cliente,
    f.titulo as filme,
    l.data_loc
from 
    cliente c
join 
    locacao l on c.cod_cli = l.cod_cli
join 
    locacao_filme lf on l.cod_loc = lf.cod_loc
join 
    filmes f on lf.cod_filme = f.cod_filme
order by 
    l.data_loc;


-- Mostrar todos os clientes que moram em uma cidade específica e que alugaram filmes de uma categoria específica.
--Exercício 14
select 
    c.nome as cliente
from 
    cliente c
join 
    cli_endereco ce on c.cod_cli = ce.cod_cli
join 
    endereco e on ce.cod_end = e.cod_end
join 
    locacao l on c.cod_cli = l.cod_cli
join 
    locacao_filme lf on l.cod_loc = lf.cod_loc
join 
    filmes f on lf.cod_filme = f.cod_filme
where 
    e.cidade = 'cidade b'
    and f.cod_cat = (select cod_cat from categoria where nome = 'ação')
group by 
    c.nome;

--Atores que participaram de pelo menos 5 filmes
-- Exercício 15

select 
    a.nome as ator,
    count(fa.cod_filme) as numero_de_filmes
from 
    ator a
join 
    filme_ator fa on a.cod_ator = fa.cod_ator
group by 
    a.nome
having 
    count(fa.cod_filme) >= 5;

--Quantidade total de filmes alugados por categoria e gênero
-- exercício 16
select 
    cat.nome as categoria,
    gen.nome as genero,
    count(lf.cod_filme) as total_alugados
from 
    locacao_filme lf
join 
    filmes f on lf.cod_filme = f.cod_filme
join 
    categoria cat on f.cod_cat = cat.cod_cat
join 
    genero gen on f.cod_gen = gen.cod_gen
group by 
    cat.nome, gen.nome
having 
    count(lf.cod_filme) > 50;





