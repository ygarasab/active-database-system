create database db4;

create table products(
    id serial,
    name varchar(40),
    unity varchar(10),
    amomunt double
);

create table sells(
    id serial,
    time timestamp,
    product_id int foreign key references products(id)
);