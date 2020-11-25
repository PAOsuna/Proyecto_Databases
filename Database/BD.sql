create database Automotriz
use Automotriz

CREATE TABLE Concesionario(
  id_concesionario int primary key NOT NULL,
  nombre nvarchar(50),
  ciudad nvarchar(50),
  estado nvarchar(50),
  direccion nvarchar(50), 
  telefono nvarchar(20),
)

CREATE TABLE Distribuidor(
  id_distribuidor int primary key NOT NULL,
  nombre nvarchar(50),
  ciudad nvarchar(50),
  estado nvarchar(50),
  direccion nvarchar(50), 
  telefono nvarchar(20),
  id_concesionario int,
  constraint FK_c foreign key (id_concesionario) references Concesionario (id_concesionario)
) 


CREATE TABLE Administracion(
  id_admin int primary key NOT NULL,
  nombre nvarchar (20),
  apellido nvarchar(20),
  contraseña nvarchar(20),
  correo nvarchar(20),
  permisos nvarchar(20),
  id_distribuidor int,
  constraint FK_d foreign key (id_distribuidor) references Distribuidor (id_distribuidor)
)

CREATE TABLE Empleados(
  id_empleado int primary key NOT NULL,
  nombre nvarchar(50),
  apellido nvarchar(50),
  puesto nvarchar(50),
  sueldo nvarchar(50),
  direccion nvarchar(50),
  telefono nvarchar(50),
  correo nvarchar(50),
  contraseña nvarchar(50),
  id_distribuidor int,
  constraint FK_di foreign key (id_distribuidor) references Distribuidor (id_distribuidor)
) 

CREATE TABLE Vehiculo (
  Id_vehiculo int primary key NOT NULL,
  Nombre nvarchar(50),
  Modelo nvarchar(50),
  Marca nvarchar(50),
  Año nvarchar(50),
  Color nvarchar(50),
  id_distribuidor int,
  constraint FK_dis foreign key (id_distribuidor) references Distribuidor (id_distribuidor)
) 

CREATE TABLE Referencias (
  id_referencia int primary key NOT NULL,
  nombre nvarchar(50),
  apellido nvarchar(50),
  telefono int
) 

CREATE TABLE Cliente (
  id_cliente int primary key NOT NULL,
  nombre nvarchar(50),
  apellido nvarchar(50),
  direccion nvarchar(50),
  edad int,
  fecha_nacimiento date,
  telefono_cel nvarchar(50),
  telefono_casa nvarchar(50),
  correo nvarchar(50),
  sexo nvarchar(50),
  RFC nvarchar(50),
  id_referencia int,
  constraint FK_re foreign key (id_referencia) references Referencias (id_referencia)
) 

CREATE TABLE Autopartes (
  id_autopartes int primary key NOT NULL,
  precio nvarchar(1000),
  descripcion nvarchar(50),
  nombre nvarchar(50),
  id_distribuidor int NOT NULL,
  constraint FK_dist foreign key (id_distribuidor) references Distribuidor (id_distribuidor)
)

CREATE TABLE Ventas (
  id_ventas int primary key NOT NULL,
  id_cliente int NOT NULL,
  id_vehiculo int NOT NULL,
  id_concesionario int NOT NULL,
  id_autopartes int NOT NULL,
  fecha date NOT NULL,
  total int NOT NULL,
  subtotal int NOT NULL,
  metodo_pago nvarchar(50),
  constraint FK_cl foreign key (id_cliente) references Cliente (id_cliente),
  constraint FK_v foreign key (id_vehiculo) references Vehiculo (id_vehiculo),
  constraint FK_co foreign key (id_concesionario) references Concesionario (id_concesionario),
  constraint FK_a foreign key (id_autopartes) references Autopartes (id_autopartes)
) 



