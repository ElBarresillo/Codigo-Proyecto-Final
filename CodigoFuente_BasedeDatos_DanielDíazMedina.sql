use empresa_srver;

 create table if not exists componentes (
 id_componente int primary key auto_increment,
 nombre_componente varchar(60),
 precio_dolares decimal(6, 2),
 stock varchar(7)
 );
 
 create table if not exists empleados (
 id_empleados int primary key auto_increment,
 nombre varchar(50),
 apellido varchar(50),
 telefono varchar(10),
 correo_electronico varchar(55),
 puesto enum('programador','ensamblador','oficinista','rh', 'marketing', 'vendedor'),
 salario decimal(6,2) check(salario > 0),
 fecha_contratacion date 
 );
 
 create table if not exists proveedores (
 id_proveedor int primary key auto_increment,
 nombre_proveedor varchar(70),
 pais varchar(45),
 telefono varchar(13),
 direccion varchar(100)
 );
 
 create table if not exists area_trabajo (
 id_area int  primary key auto_increment,
 id_empleados int,
 nombre_area varchar(60),
 descripcion text,
 foreign key(id_empleados) references empleados(id_empleados)
 );
 
 create table if not exists materiales (
 id_materiales int primary key auto_increment,
 id_area int,
 nombre_material varchar(70),
 cantidad_disponible varchar(10),
 id_proveedor int,
 foreign key (id_proveedor) references proveedores(id_proveedor),
 foreign key(id_area) references area_trabajo(id_area)
 );
 
 create table if not exists pedidos (
 id_pedidos int primary key auto_increment,
 estado enum('enviado', 'entregado', 'cancelado'),
 fecha_pedido datetime,
 cantidad varchar(5),
 id_componente int,
 foreign key(id_componente) references componentes(id_componente)
); 

create table if not exists clientes (
id_clientes int primary key auto_increment,
nombre varchar(45),
apellido varchar(45),
numero_telefono varchar(10),
direccion varchar(100),
correo_electronico varchar(55),
id_pedidos int,
foreign key(id_pedidos) references pedidos(id_pedidos)
 );
 
 create table if not exists ventas (
 id_ventas int primary key auto_increment,
 id_componente int, 
 id_pedidos int,
 id_empleados int,
 fecha_venta date,
 total decimal(10, 2),
 foreign key(id_componente) references componentes(id_componente),
 foreign key(id_pedidos) references pedidos(id_pedidos),
 foreign key(id_empleados) references empleados(id_empleados)
); 

insert into componentes (nombre_componente, precio_dolares, stock) values
('Sistema Completo', 899.99, 1235),
('Lentes VR', 399.99, 274),
('Coderas Sensoriales', 99.99, 300),
('Guantes', 249.99, 420),
('Rodilleras', 99.99,340),
('Calzado Sensorial', 149.99, 187); 

insert into empleados (nombre, apellido, telefono, correo_electronico, puesto, salario, fecha_contratacion) values
('sofia', 'Garcia', '3521854389', 'sofiagracia@gmail.com', 'vendedor', 1250, '2020-11-21'),
('Mateo', 'Fernandez', '3528854734', 'mateofernandez@gmail.com', 'marketing', 1320, '2021-03-12'),
('Valeria', 'Martinez', '4641998320', 'valeriamartinez@gmail.com', 'oficinista', 1600, '2020-01-09'),
('Leonardo', 'Rodriguez', '4644431243', 'leonardorodriguez@gmail.com', 'ensamblador', 1150, '2022-04-30');

insert into proveedores (nombre_proveedor, pais, telefono, direccion) values
('Sensores Dinamicos', 'Mexico', '+525648277549', 'Calle Independencia 789, Centro, 44100, Guadalajara, Jalisco'),
('VisioSphere', 'Estados Unidos', '+12231009485', '742 Evergreen Terrace, Springfield, IL 62704, USA'),
('StrideFlex', 'Mexico', '+527283945630', 'Boulevard Manuel Ávila Camacho 101, Colonia Anzures, 11590, Ciudad de México, CDMX'),
('Pasos Comfort', 'Mexico', '+523521229911', 'Avenida Paseo de la Reforma 456, Colonia Juárez, 06600, Ciudad de México, CDMX'),
('Polytech Studios', 'Mexico', '+521112300954', 'Calle de la Amargura 123, Colonia Roma Norte, 06700, Ciudad de México, CDMX');

insert into area_trabajo(id_empleados, nombre_area, descripcion) values
('1', 'Almacen CE', 'Alcamenamiento de componentes electronicos'),
('2', 'Ensamblaje', 'Centro de Ensamblaje de piezas'),
('3', 'Oficinas', 'null'),
('4', 'Zona de Desarrollo', 'Zona especifica para el desarrollo de software');

insert into materiales (id_area, nombre_material, cantidad_disponible, id_proveedor) values
(1, 'Lentes', 90, 1),
(2, 'Plastico', 150, 3),
(3, 'sensores', 204, '1'),
(4, 'calzado', 182, 2),
(2,'rodilleras', 99, 2),
(1, 'coderas', 152, 4),
(1, 'componentes electronicos', 315, 4),
(4, 'guantes', 100, 5);

insert into pedidos (estado, fecha_pedido, cantidad, id_componente) values
('enviado', '2024-11-07', 2, 2),
('entregado', '2024-09-02', 3, 3),
('enviado', '2024-09-29', 1, 3),
('cancelado', '2023-11-07', 4, 6),
('enviado', '2024-10-27', 4, 1),
('entregado', '2024-04-19', 5, 1),
('entregado', '2023-01-12', 10, 1),
('cancelado', '2023-06-04', 1, 4);

insert into clientes (nombre, apellido, numero_telefono, direccion, correo_electronico, id_pedidos) values
('Daniel', 'Diaz', '3521000191', 'Calle Silvestre #212', 'danieldiaz@gmail.com', 8),
('Eduardo', 'Sanchez', '4642103445', 'Calle Homobono #113', 'eduardosanchez@gmail.com', 3),
('Jorge', 'Cardenas', '4645993421', 'Calle Melgoza #99', 'jorgecardenas@gmail.com', 1),
('Luis', 'Perez', '4646783234', 'Calle Irapuato #554', 'luisperez@gmail.com', 5),
('Fernando', 'Mendoza', '4645546632', 'Avenida Comonfort #029', 'fernandomendoza@gmail.com', 2),
('Zaira', 'Lopez', '4645546632', 'Blvd. Valle de Santiago #100', 'zairalopez@gmail.com', 4),
('Marcos', 'Fernandez', '3529941833', 'Calle Abasolo #194', 'marcoshernandez@gmail.com', 6),
('Dana', 'Suarez', '4641234567', 'Calle Constituyentes #554', 'danasuarez@gmail.com', 7),
('Alejandro', 'Luna', '3124434566', 'Calle Heriberto Jara #330', 'alejandroluna@gmail.com', null),
('Jose Eduardo', 'Conejo', '4621944325', 'Avenida Santiago de Chile #998', 'joseconejo@gmail.com', null);

insert into ventas (id_componente, id_pedidos, id_empleados, fecha_venta, total) values
(2, 1, 1, '2024-09-29', 400.00),
(3, 4, 1, '2023-01-12', 250.00),
(6, 5, 1, '2023-11-07', 2000.00),
(5, 3, 1, '2024-11-07', 1800.00),
(4, 8, 1, '2024-09-02', 600.00);