drop schema if exists pablocemu cascade;

create schema pablocemu;

set schema 'pablocemu';

create table socio (
	num_socio serial primary key,
	nombre varchar(50) not null,
	apellido_1 varchar(50) not null,
	apellido_2 varchar(50),
	fecha_nacimiento date not null,
	telefono varchar (10) not null,
	dni varchar(10) not null,
	email varchar(50)
);

create table direccion (
	id serial primary key,
	num_socio integer not null,
	codigo_postal integer not null,
	calle varchar(10) not null,
	numero varchar(10) not null,
	piso integer not null,
	letra varchar(10) not null,
	ext varchar(10) not null
);

create table alquiler (
	id integer primary key,
	id_copia integer  not null,
	num_socio integer not null,
	fecha_alquiler date not null,
	fecha_devolucion date
);

create table copia (
	id integer primary key,
	id_pelicula integer not null
);


create table pelicula (
	id integer primary key,
	titulo varchar(50) not null,
	id_genero integer not null,
	director varchar(80) not null,
	sinopsis varchar(200)
);

create table genero (
	id integer primary key,
	genero varchar(50) not null
);

alter table direccion 
add constraint direccion_socio_fk
foreign key (num_socio)
references socio (num_socio);

alter table alquiler 
add constraint alquiler_socio_fk
foreign key (num_socio)
references socio (num_socio);

alter table alquiler 
add constraint alquiler_copia_fk
foreign key (id_copia)
references copia (id);

alter table copia 
add constraint copia_pelicula_fk
foreign key (id_pelicula)
references pelicula (id);

alter table pelicula 
add constraint pelicula_genero_fk
foreign key (id_genero)
references genero (id);











