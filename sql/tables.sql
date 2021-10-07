SELECT 'CREATE DATABASE bd4'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'bd4')\gexec

create table if not exists products (
    id serial primary key,
    name varchar(40),
    unity varchar(10),
    amount real
);

create table if not exists sells (
    id serial primary key,
    time timestamp with time zone default current_timestamp,
    product_id int references products(id),
    amount real
);

insert into products(name, unity, amount) values ('café', 'unidade', 20);
insert into products(name, unity, amount) values ('arroz', 'unidade', 30);
insert into products(name, unity, amount) values ('ovos', 'caixa', 25);