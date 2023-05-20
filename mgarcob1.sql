CREATE TABLE pedido (
    idpedido   INT PRIMARY KEY NOT NULL,
    tipopedido varchar CHECK ('sala', 'recoger', 'domicilio'),
    CIF NUMBER(38),
    idcliente NUMBER(5)
);

CREATE TABLE local (
    CIF INT PRIMARY KEY NOT NULL,
    telefono NUMBER(9),
    cp NUMBER(5),
    numero NUMBER (5),
    calle VARCHAR (30)
);


CREATE TABLE empleado (
    idempleado INT PRIMARY KEY NOT NULL,
    dni VARCHAR(10),
    nombre VARCHAR(30),
    primerApellido VARCHAR(30),
    segundoApellido VARCHAR(30),
    puesto VARCHAR(40) CHECK (puesto IN ('Gerente', 'Subgerente', 'Encargado', 'Repartidor', 'Auxiliar', 'Cocinero')),
    fechaIngreso DATE,
    CIF NUMBER(38),
    telefono VARCHAR(9),
    email VARCHAR(30),
    cp NUMBER(5),
    numero NUMBER(5),
    calle VARCHAR(30),
    piso VARCHAR(5),
    diasVacPendientes NUMBER (2)
);
CREATE TABLE cplocalidad (
    cp        INT,
    localidad VARCHAR(30),
    PRIMARY KEY ( cp,
                  localidad )
);

CREATE TABLE pedidocontienepizza (
    idpedido    INT,
    idpizza     INT,
    fechapedido DATE,
    cantidad    NUMBER(5),
    PRIMARY KEY ( idpedido,
                  idpizza,
                  fechapedido )
);

CREATE TABLE pizza (
    idpizza INT PRIMARY KEY NOT NULL,
    nombre  VARCHAR(30)
);

CREATE TABLE pizzallevaingrediente (
    idingrediente INT,
    idpizza       INT,
    udmedida      VARCHAR(10) CHECK (udmedida IN ('gramos', 'lonchas', 'cucharon')),
    cantidad      NUMBER(5) DEFAULT 0,
    PRIMARY KEY ( idingrediente,
                  idpizza )
);

CREATE TABLE ingrediente (
    idingrediente INT PRIMARY KEY NOT NULL,
    nombre        VARCHAR(30)
);


ALTER TABLE pedidocontienepizza ADD CONSTRAINT fkpizzapedido FOREIGN KEY (idpizza) REFERENCES pizza(idpizza)
ALTER TABLE pedidocontienepizza ADD CONSTRAINT fkpedido FOREIGN KEY (idpedido) REFERENCES pedido(idpedido)
ALTER TABLE pedido ADD CONSTRAINT fkpedidodod FOREIGN KEY (idcliente) REFERENCES cliente(idcliente)
ALTER TABLE pedido ADD CONSTRAINT fkcif FOREIGN KEY (CIF) REFERENCES local(CIF)
ALTER TABLE empleado ADD CONSTRAINT fkcifemp FOREIGN KEY (cif) REFERENCES local(cif)
ALTER TABLE empleado ADD CONSTRAINT fkcodpoemp FOREIGN KEY (cp) REFERENCES cplocalidad(cp)
ALTER TABLE cliente ADD CONSTRAINT fkcodpocli FOREIGN KEY (cp) REFERENCES cplocalidad(cp)
ALTER TABLE local ADD CONSTRAINT fkcodpoloc FOREIGN KEY (cp) REFERENCES cplocalidad(cp)
ALTER TABLE pizzallevaingrediente ADD CONSTRAINT fkpiz FOREIGN KEY (idpizza) REFERENCES pizza(idpizza)
ALTER TABLE pizzallevaingrediente ADD CONSTRAINT fkingre FOREIGN KEY (idingrediente) REFERENCES ingrediente(idingrediente)




INSERT INTO empleado VALUES (
    34,
    '85523365A',
    'Francisco',
    'Gomez',
    'Garay',
    'Subgerente',
    '08/09/2021',
    '7782254',
    '652369845',
    'frangomeza@outlook.com',
    32,
    41930,
    'Aceituna',
    '2E',
    30
);

INSERT INTO empleado VALUES (
    35,
    '96653355J',
    'Tomas',
    'Hidalgo',
    'Gomez',
    'Repartidor',
    '17/08/2019',
    '9656545',
    '785666662',
    'tomas@gmail.com',
    4,
    41940,
    'Agustina de Aragon',
    NULL,
    3
);

INSERT INTO empleado VALUES (
    36,
    '78596321A',
    'Maria',
    'Lozano',
    'Gomez',
    'Gerente',
    '09/06/2015',
    '9656545',
    '698899854',
    'marilozano@hotmail.com',
    7,
    41926,
    'Pineda',
    '10D',
    14
);

INSERT INTO empleado VALUES (
    37,
    '85551445F',
    'Juana',
    'Gomez',
    'Hermoso',
    'Encargado',
    '06/09/2022',
    '8555455',
    '777545224',
    'juana@gmail.com',
    21,
    41927,
    'Londres',
    NULL,
    30
);

INSERT INTO empleado VALUES (
    38,
    '65589845N',
    'Andres',
    'Garcia',
    'Hidalgo',
    'Repartidor',
    '02/08/2020',
    '7782254',
    '665665898',
    'andresinho@gmail.com',
    12,
    41926,
    'En medio',
    '2D',
    30
);

INSERT INTO empleado VALUES (
    39,
    '78562452Q',
    'Rosario',
    'Ruiz',
    'Jimenez',
    'Auxiliar',
    '05/06/2019',
    '7782254',
    '666522145',
    'rosario@outlook.com',
    78,
    41120,
    'Zamora',
    '2F',
    15
);

INSERT INTO empleado VALUES (
    40,
    '65898245J',
    'Marta',
    'Fernandez',
    'Lopez',
    'Subgerente',
    '28/05/2012',
    '9652121',
    '754448566',
    'martafe@gmail.com',
    8,
    41960,
    'Gomera',
    NULL,
    30
);

INSERT INTO empleado VALUES (
    41,
    '75566224V',
    'Cristian',
    'Moreno',
    'Luna',
    'Cocinero',
    '01/02/2023',
    '7782254',
    '632415896',
    'cristian@gmail.com',
    5,
    41120,
    'Lepanto',
    NULL,
    30
);

INSERT INTO empleado VALUES (
    42,
    '17456633L',
    'Moises',
    'Olver,Macho',
    'Cocinero',
    '31/01/2014',
    '8555455',
    '712566257',
    'moi@gmail.com',
    16,
    41930,
    'Escarcha',
    '1Der',
    30
);

INSERT INTO empleado VALUES (
    43,
    '95421455D',
    'Lidia',
    'Macho',
    'Perez',
    'Repartidor',
    '29/03/2015',
    '8555455',
    '663256633',
    'lidiamafer@gmail.com',
    20,
    41130,
    'Tamayo',
    '4G',
    21
);

INSERT INTO empleado VALUES (
    44,
    '78545215A',
    'Marta',
    'Villar',
    'Santos',
    'Encargado',
    '02/04/2022',
    '9652121',
    '785699996',
    'marvi@outlook.com',
    4,
    41120,
    'Toledo',
    'C',
    30
);

INSERT INTO empleado VALUES (
    45,
    '74563215B',
    'Alba',
    'Blanco',
    'Serrano',
    'Auxiliar',
    '02/05/2022',
    '8555455',
    '652458665',
    'albab@hotmail.com',
    23,
    41120,
    'Barajas',
    '6L',
    3
);

INSERT INTO empleado VALUES (
    46,
    '78542236A',
    'Ruben',
    'Perez',
    'Sosa',
    'Auxiliar',
    '15/06/2020',
    '9656545',
    '778554565',
    'ruru@gmail.com',
    96,
    41900,
    'Gordal',
    '5F',
    30
);

INSERT INTO empleado VALUES (
    47,
    '75452369K',
    'Noelia',
    'Reyes',
    'Trento',
    'Encargado',
    '11/09/2019',
    '9656545',
    '658542259',
    'noeliarey@gmail.com',
    5,
    41930,
    'Soplete',
    '2F',
    6
);



INSERT INTO cplocalidad VALUES (
    41100,
    'Coria del Rio'
);

INSERT INTO cplocalidad VALUES (
    41120,
    'Gelves'
);

INSERT INTO cplocalidad VALUES (
    41130,
    'La Puebla del Rio'
);

INSERT INTO cplocalidad VALUES (
    41900,
    'Camas'
);

INSERT INTO cplocalidad VALUES (
    41910,
    'Camas'
);

INSERT INTO cplocalidad VALUES (
    41920,
    'San Juan de Aznalfarache'
);

INSERT INTO cplocalidad VALUES (
    41926,
    'Mairena del Aljarafe'
);

INSERT INTO cplocalidad VALUES (
    41927,
    'Mairena del Aljarafe'
);

INSERT INTO cplocalidad VALUES (
    41928,
    'Mairena del Aljarafe'
);

INSERT INTO cplocalidad VALUES (
    41930,
    'Bormujos'
);

INSERT INTO cplocalidad VALUES (
    41940,
    'Tomares'
);

INSERT INTO cplocalidad VALUES (
    41950,
    'Castilleja de la Cuesta'
);

INSERT INTO cplocalidad VALUES (
    41960,
    'Gines'
);


INSERT INTO pedido VALUES (
    1,
    'domicilio',
    '7782254',
    2
);

INSERT INTO pedido VALUES (
    2,
    'recoger',
    '7782254',
    2
);

INSERT INTO pedido VALUES (
    3,
    'domicilio',
    '7782254',
    1
);

INSERT INTO pedido VALUES (
    4,
    'sala',
    '8555455',
    3
);

INSERT INTO pedido VALUES (
    5,
    'sala',
    '9656545',
    3
);

INSERT INTO pedido VALUES (
    6,
    'domicilio',
    '9656545',
    6
);

INSERT INTO pedido VALUES (
    7,
    'sala',
    '8555455',
    3
);

INSERT INTO pedido VALUES (
    8,
    'domicilio',
    '8555455',
    6
);

INSERT INTO pedido VALUES (
    9,
    'sala',
    '7782254',
    5
);

INSERT INTO pedido VALUES (
    10,
    'sala',
    '9656545',
    15
);

INSERT INTO pedido VALUES (
    11,
    'sala',
    '8555455',
    1
);

INSERT INTO pedido VALUES (
    12,
    'recoger',
    '8555455',
    11
);

INSERT INTO pedido VALUES (
    13,
    'sala',
    '9652121',
    2
);

INSERT INTO pedido VALUES (
    14,
    'sala',
    '9652121',
    21
);

INSERT INTO pedido VALUES (
    15,
    'recoger',
    '7782254',
    3
);

INSERT INTO pedido VALUES (
    16,
    'sala',
    '7782254',
    5
);

INSERT INTO pedido VALUES (
    17,
    'domicilio',
    '7782254',
    8
);

INSERT INTO pedido VALUES (
    18,
    'domicilio',
    '8555455',
    9
);

INSERT INTO pedido VALUES (
    19,
    'sala',
    '9652121',
    14
);

INSERT INTO pedido VALUES (
    20,
    'sala',
    '9656545',
    17
);

INSERT INTO pedido VALUES (
    21,
    'sala',
    '9656545',
    18
);

INSERT INTO pedido VALUES (
    22,
    'recoger',
    '8555455',
    22
);

INSERT INTO pedido VALUES (
    23,
    'recoger',
    '8555455',
    25
);

INSERT INTO pedido VALUES (
    24,
    'sala',
    '8555455',
    4
);

INSERT INTO pedido VALUES (
    25,
    'sala',
    '7782254',
    7
);

INSERT INTO pedido VALUES (
    26,
    'sala',
    '7782254',
    9
);

INSERT INTO pedido VALUES (
    27,
    'sala',
    '7782254',
    11
);

INSERT INTO pedido VALUES (
    28,
    'domicilio',
    '9652121',
    13
);

INSERT INTO pedido VALUES (
    29,
    'sala',
    '9652121',
    12
);

INSERT INTO pedido VALUES (
    30,
    'recoger',
    '9652121',
    24
);

INSERT INTO pedido VALUES (
    31,
    'recoger',
    '9656545',
    22
);

INSERT INTO pedido VALUES (
    32,
    'recoger',
    '7782254',
    20
);

INSERT INTO pedido VALUES (
    33,
    'domicilio',
    '8555455',
    10
);

INSERT INTO pedido VALUES (
    34,
    'sala',
    '7782254',
    11
);

INSERT INTO pedido VALUES (
    35,
    'sala',
    '9652121',
    14
);

INSERT INTO pedido VALUES (
    36,
    'sala',
    '9652121',
    1
);

INSERT INTO pedido VALUES (
    37,
    'domicilio',
    '7782254',
    5
);

INSERT INTO pedido VALUES (
    38,
    'recoger',
    '9656545',
    7
);

INSERT INTO pedido VALUES (
    39,
    'sala',
    '8555455',
    2
);

INSERT INTO pedido VALUES (
    40,
    'domicilio',
    '7782254',
    9
);

INSERT INTO pedido VALUES (
    41,
    'recoger',
    '9656545',
    16
);

INSERT INTO pedido VALUES (
    42,
    'sala',
    '9656545',
    23
);

INSERT INTO pedido VALUES (
    43,
    'domicilio',
    '7782254',
    17
);

INSERT INTO pedido VALUES (
    44,
    'domicilio',
    '9652121',
    12
);

INSERT INTO pedido VALUES (
    45,
    'recoger',
    '9652121',
    11
);

INSERT INTO pedido VALUES (
    46,
    'domicilio',
    '9652121',
    21
);

INSERT INTO pedido VALUES (
    47,
    'domicilio',
    '7782254',
    24
);

INSERT INTO pedido VALUES (
    48,
    'sala',
    '9656545',
    22
);

INSERT INTO pedido VALUES (
    49,
    'sala',
    '7782254',
    19
);

INSERT INTO pedido VALUES (
    50,
    'sala',
    '8555455',
    1
);



INSERT INTO pedidocontienepizza VALUES
(1,3,'10/06/2019',2);
INSERT INTO pedidocontienepizza VALUES
(1,4,'10/06/2019',1);
INSERT INTO pedidocontienepizza VALUES
(2,1,'12/06/2019',1);
INSERT INTO pedidocontienepizza VALUES
(3,1,'13/06/2019',1);
INSERT INTO pedidocontienepizza VALUES
(3,5,'13/06/2019',1);
INSERT INTO pedidocontienepizza VALUES
(4,1,'13/06/2019',2);
INSERT INTO pedidocontienepizza VALUES
(4,3,'13/06/2019',1);
INSERT INTO pedidocontienepizza VALUES
(4,6,'13/06/2019',3);
INSERT INTO pedidocontienepizza VALUES
(5,10,'15/06/2019',1);
INSERT INTO pedidocontienepizza VALUES
(6,1,'22/06/2019',1);
INSERT INTO pedidocontienepizza VALUES
(7,1,'23/06/2019',2);
INSERT INTO pedidocontienepizza VALUES
(7,2,'23/06/2019',2);
INSERT INTO pedidocontienepizza VALUES
(8,6,'30/06/2019',2);
INSERT INTO pedidocontienepizza VALUES
(8,12,'30/06/2019',1);
INSERT INTO pedidocontienepizza VALUES
(9,10,'01/07/2019',3);
INSERT INTO pedidocontienepizza VALUES
(10,7,'02/07/2019',2);
INSERT INTO pedidocontienepizza VALUES
(11,6,'05/07/2019',5);
INSERT INTO pedidocontienepizza VALUES
(12,4,'06/07/2019',2);
INSERT INTO pedidocontienepizza VALUES
(12,5,'06/07/2019',1);
INSERT INTO pedidocontienepizza VALUES
(13,5,'10/07/2019',2);
INSERT INTO pedidocontienepizza VALUES
(14,6,'11/07/2019',2);
INSERT INTO pedidocontienepizza VALUES
(15,6,'14/07/2019',1);
INSERT INTO pedidocontienepizza VALUES
(16,3,'15/07/2019',6);
INSERT INTO pedidocontienepizza VALUES
(16,5,'15/07/2019',2);
INSERT INTO pedidocontienepizza VALUES
(16,7,'15/07/2019',1);
INSERT INTO pedidocontienepizza VALUES
(17,1,'18/07/2019',1);
INSERT INTO pedidocontienepizza VALUES
(18,4,'19/07/2019',1);
INSERT INTO pedidocontienepizza VALUES
(19,1,'01/08/2019',2);
INSERT INTO pedidocontienepizza VALUES
(19,7,'01/08/2019',1);
INSERT INTO pedidocontienepizza VALUES
(20,3,'03/08/2019',1);
INSERT INTO pedidocontienepizza VALUES
(21,1,'05/08/2019',3);
INSERT INTO pedidocontienepizza VALUES
(22,5,'06/08/2019',1);
INSERT INTO pedidocontienepizza VALUES
(22,6,'06/08/2019',3);
INSERT INTO pedidocontienepizza VALUES
(23,2,'08/08/2019',1);
INSERT INTO pedidocontienepizza VALUES
(24,1,'10/08/2019',1);
INSERT INTO pedidocontienepizza VALUES
(24,4,'10/08/2019',2);
INSERT INTO pedidocontienepizza VALUES
(25,6,'14/08/2019',1);
INSERT INTO pedidocontienepizza VALUES
(26,2,'15/08/2019',2);
INSERT INTO pedidocontienepizza VALUES
(27,10,'16/08/2019',1);
INSERT INTO pedidocontienepizza VALUES
(27,11,'16/08/2019',2);
INSERT INTO pedidocontienepizza VALUES
(28,6,'20/08/2019',3);
INSERT INTO pedidocontienepizza VALUES
(29,2,'21/08/2019',2);
INSERT INTO pedidocontienepizza VALUES
(30,1,'22/08/2019',1);
INSERT INTO pedidocontienepizza VALUES
(30,9,'22/08/2019',1);
INSERT INTO pedidocontienepizza VALUES
(31,10,'25/08/2019',2);
INSERT INTO pedidocontienepizza VALUES
(31,11,'25/08/2019',1);
INSERT INTO pedidocontienepizza VALUES
(32,7,'27/08/2019',1);
INSERT INTO pedidocontienepizza VALUES
(33,2,'29/08/2019',1);
INSERT INTO pedidocontienepizza VALUES
(34,7,'30/08/2019',3);
INSERT INTO pedidocontienepizza VALUES
(35,8,'02/09/2019',3);
INSERT INTO pedidocontienepizza VALUES
(36,9,'30/09/2019',1);
INSERT INTO pedidocontienepizza VALUES
(37,10,'02/10/2019',1);
INSERT INTO pedidocontienepizza VALUES
(37,11,'02/10/2019',3);
INSERT INTO pedidocontienepizza VALUES
(38,3,'30/11/2019',5);
INSERT INTO pedidocontienepizza VALUES
(39,4,'20/12/2019',2);
INSERT INTO pedidocontienepizza VALUES
(40,8,'15/01/2020',1);
INSERT INTO pedidocontienepizza VALUES
(41,4,'30/03/2020',2);
INSERT INTO pedidocontienepizza VALUES
(42,1,'15/05/2020',1);
INSERT INTO pedidocontienepizza VALUES
(43,1,'16/09/2020',1);
INSERT INTO pedidocontienepizza VALUES
(43,5,'16/09/2020',2);
INSERT INTO pedidocontienepizza VALUES
(44,1,'20/12/2020',6);
INSERT INTO pedidocontienepizza VALUES
(45,2,'20/03/2021',1);
INSERT INTO pedidocontienepizza VALUES
(46,6,'30/11/2021',2);
INSERT INTO pedidocontienepizza VALUES
(47,1,'20/05/2022',2);
INSERT INTO pedidocontienepizza VALUES
(48,2,'26/09/2022',2);
INSERT INTO pedidocontienepizza VALUES
(48,10,'26/09/2022',1);
INSERT INTO pedidocontienepizza VALUES
(49,12,'30/01/2023',5);
INSERT INTO pedidocontienepizza VALUES
(50,2,'25/02/2023',1);
INSERT INTO pedidocontienepizza VALUES
(50,10,'25/02/2023',2);




INSERT INTO pizza VALUES
(1,'Margarita');
INSERT INTO pizza VALUES
(2,'Pecado Carnal');
INSERT INTO pizza VALUES
(3,'Tony Peperoni');
INSERT INTO pizza VALUES
(4,'Extravaganzza');
INSERT INTO pizza VALUES
(5,'Pollo a la Parrilla');
INSERT INTO pizza VALUES
(6,'Barbacoa');
INSERT INTO pizza VALUES
(7,'4 quesos');
INSERT INTO pizza VALUES
(8,'Cremozza BBQ');
INSERT INTO pizza VALUES
(9,'Carbonara');
INSERT INTO pizza VALUES
(10,'Texas bbq');
INSERT INTO pizza VALUES
(11,'Cabramelizada');
INSERT INTO pizza VALUES
(12,'Hawaiana');


INSERT INTO ingrediente VALUES
(1,'Jamon');
INSERT INTO ingrediente VALUES
(2,'Pollo');
INSERT INTO ingrediente VALUES
(3,'Ternera');
INSERT INTO ingrediente VALUES
(4,'Bacon');
INSERT INTO ingrediente VALUES
(5,'Cebolla');
INSERT INTO ingrediente VALUES
(6,'Pimiento');
INSERT INTO ingrediente VALUES
(7,'Piña');
INSERT INTO ingrediente VALUES
(8,'Mozzarela');
INSERT INTO ingrediente VALUES
(9,'Champiñon');
INSERT INTO ingrediente VALUES
(10,'QuesoCabra');
INSERT INTO ingrediente VALUES
(11,'Maiz');
INSERT INTO ingrediente VALUES
(12,'Salsa Tomate');
INSERT INTO ingrediente VALUES
(13,'Salsa Bbq');
INSERT INTO ingrediente VALUES
(14,'Salsa Crema');
INSERT INTO ingrediente VALUES
(15,'Peperoni');
INSERT INTO ingrediente VALUES
(16,'Bacon Crispy');
INSERT INTO ingrediente VALUES
(17,'Cebolla Caramelizada');



INSERT INTO pizzallevaingrediente VALUES
(1,8,'gramos',100);
INSERT INTO pizzallevaingrediente VALUES
(1,12,'cucharon',1);
INSERT INTO pizzallevaingrediente VALUES
(2,1,'lonchas',12);
INSERT INTO pizzallevaingrediente VALUES
(2,2,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(2,3,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(2,8,'gramos',150);
INSERT INTO pizzallevaingrediente VALUES
(2,12,'cucharon',1);
INSERT INTO pizzallevaingrediente VALUES
(3,8,'gramos',100);
INSERT INTO pizzallevaingrediente VALUES
(3,12,'cucharon',1);
INSERT INTO pizzallevaingrediente VALUES
(3,15,'lonchas',12);
INSERT INTO pizzallevaingrediente VALUES
(4,1,'lonchas',8);
INSERT INTO pizzallevaingrediente VALUES
(4,3,'gramos',38);
INSERT INTO pizzallevaingrediente VALUES
(4,5,'gramos',38);
INSERT INTO pizzallevaingrediente VALUES
(4,6,'gramos',38);
INSERT INTO pizzallevaingrediente VALUES
(4,8,'gramos',100);
INSERT INTO pizzallevaingrediente VALUES
(4,9,'gramos',38);
INSERT INTO pizzallevaingrediente VALUES
(4,12,'cucharon',1);
INSERT INTO pizzallevaingrediente VALUES
(4,15,'lonchas',8);
INSERT INTO pizzallevaingrediente VALUES
(4,16,'gramos',48);
INSERT INTO pizzallevaingrediente VALUES
(5,2,'gramos',100);
INSERT INTO pizzallevaingrediente VALUES
(5,5,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(5,8,'gramos',100);
INSERT INTO pizzallevaingrediente VALUES
(5,9,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(5,11,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(5,12,'cucharon',1);
INSERT INTO pizzallevaingrediente VALUES
(6,3,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(6,4,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(6,5,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(6,8,'gramos',100);
INSERT INTO pizzallevaingrediente VALUES
(6,13,'cucharon',1);
INSERT INTO pizzallevaingrediente VALUES
(6,16,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(7,8,'gramos',100);
INSERT INTO pizzallevaingrediente VALUES
(7,10,'lonchas',12);
INSERT INTO pizzallevaingrediente VALUES
(7,14,'cucharon',1);
INSERT INTO pizzallevaingrediente VALUES
(8,2,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(8,4,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(8,5,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(8,8,'gramos',100);
INSERT INTO pizzallevaingrediente VALUES
(8,13,'gramos',38);
INSERT INTO pizzallevaingrediente VALUES
(8,14,'cucharon',1);
INSERT INTO pizzallevaingrediente VALUES
(9,4,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(9,5,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(9,8,'gramos',100);
INSERT INTO pizzallevaingrediente VALUES
(9,9,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(9,14,'cucharon',1);
INSERT INTO pizzallevaingrediente VALUES
(10,2,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(10,3,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(10,4,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(10,8,'gramos',100);
INSERT INTO pizzallevaingrediente VALUES
(10,13,'cucharon',1);
INSERT INTO pizzallevaingrediente VALUES
(10,16,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(11,8,'gramos',100);
INSERT INTO pizzallevaingrediente VALUES
(11,10,'lonchas',12);
INSERT INTO pizzallevaingrediente VALUES
(11,14,'cucharon',1);
INSERT INTO pizzallevaingrediente VALUES
(11,17,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(12,1,'lonchas',16);
INSERT INTO pizzallevaingrediente VALUES
(12,7,'gramos',50);
INSERT INTO pizzallevaingrediente VALUES
(12,8,'gramos',150);
INSERT INTO pizzallevaingrediente VALUES
(12,12,'cucharon',1);


alter table empleado
  modify cif number(38);



