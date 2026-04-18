\connect root@localhost
create database gregs_list;
show databases;
use gregs_list;
create table my_contacts ( last_name varchar(30), first_name varchar(20), email varchar(50), birthday date, profession varchar(50), location varchar(50), status varchar(20), interests varchar(100), seeking varchar(100) );
desc my_contacts;
drop table my_contacts;
create table my_contacts ( last_name varchar(30), first_name varchar(20), email varchar(50), gender char(1), birthday date, profession varchar(50), location varchar(50), status varchar(20), interests varchar(100), seeking varchar(100) );
desc my_contacts;
