SELECT 'CREATE DATABASE db4'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'db4')\gexec

create table if not exists products (
    id serial primary key,
    name varchar(40),
    unity varchar(10),
    amomunt real
);

create table if not exists sells (
    id serial primary key,
    time timestamp,
    product_id int references products(id)
);