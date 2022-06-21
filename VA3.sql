create database if not exists va3;
use va3;

create table if not exists programa(
	idProgrma int primary key not null auto_increment,
    dataApresentacao datetime

);

create table if not exists apresentador(
	idApresentador int primary key not null auto_increment,
    nome varchar(70) not null,
    idade int not null,
    sexo enum('Masculino', 'Feminino')
);
create table if not exists convidado(
	idConvidado int primary key not null auto_increment,
    nome varchar(70) not null,
    idade int not null,
    sexo enum('Masculino', 'Feminino'),
	periculosidade varchar(100) not null,
    assuntoAbordado enum('Musica', 'Religião', 'Politica','Games','Outros') default 'Outros'
);

create table if not exists patrocinador(
	idPatrocinador int primary key not null auto_increment,
	marca varchar(70) not null,
    valorPatrocinio float not null default 0.00
);

alter table programa
add column apresentador int not null,
add constraint apresentador foreign key(apresentador) references apresentador(idApresentador) on delete cascade on update cascade;

alter table programa
add column patrocinador int not null,
add constraint patrocinador foreign key(patrocinador) references patrocinador(idPatrocinador)on delete restrict on update cascade;

alter table programa
add column convidado int not null,
add constraint convidado foreign key(convidado) references convidado(idConvidado)on delete restrict on update cascade;




insert into apresentador values(default, 'Bruno Monteiro', 31, 'Masculino');
insert into convidado values(default, 'Bruna Marquezine', 26, 'Feminino', 'Baixo', 'Outros');
insert into patrocinador values(default, 'Pepsi', 31000);
insert into patrocinador values(default, 'Zé Delivery', 3500);
insert into programa values(default, '2022-03-17 18:00', 01, 01, 01);

select * from apresentador;
select * from convidado;
select * from patrocinador;
select * from programa;

select sum(valorPatrocinio) from patrocinador;

update apresentador set nome = 'Monark' where idApresentador =1;
delete from apresentador where idApresentador = 1 limit 1;