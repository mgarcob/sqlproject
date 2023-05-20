SELECT cliente.nombre, cliente.email
FROM cliente
WHERE Cliente.cp=41950;

SELECT Empleado.Nombre, Empleado.primerApellido, Empleado.segundoApellido, Empleado.DNI
FROM Empleado
WHERE Empleado.segundoApellido Like 'Gomez';

SELECT Empleado.Nombre, Empleado.primerApellido, Empleado.segundoApellido, Empleado.fechaingreso
FROM Empleado
WHERE Empleado.fechaingreso > '20/10/20';

ALTER TABLE empleado
ADD CHECK (segundoapellido='Trento');


SELECT pedido.idpedido, pedido.tipopedido
FROM Pedido INNER JOIN (pizza INNER JOIN pedidocontienepizza ON pizza.idpizza = Pedidocontienepizza.Idpizza) ON pedido.idpedido = Pedidocontienepizza.Idpedido
WHERE pizza.nombre='Barbacoa';


SELECT Empleado.IdEmpleado, Empleado.Nombre, Empleado.primerApellido, Empleado.Puesto
FROM empleado INNER JOIN local ON Local.cif = Empleado.cif
WHERE local.telefono = 955712531

SELECT Nombre, primerapellido, Puesto, fechaingreso AS DiasTrabajados
FROM Empleado; 

SELECT DATEDIFF(day, '2017/08/25', '2011/08/25') AS DateDiff;
FROM empleado;


SELECT Empleado.Nombre, Empleado.primerapellido, Empleado.Puesto, (Empleado.FechaIngreso datediff) AS DiasTrabajados
FROM Empleado;

SELECT Pizza.Nombre, Sum(PedidoContienePizza.Cantidad) AS TotalVecesPedida
FROM Pizza INNER JOIN PedidoContienePizza ON Pizza.IdPizza = PedidoContienePizza.IdPizza
GROUP BY Pizza.Nombre; 


SELECT Empleado.Nombre, Empleado.primerapellido, Empleado.puesto, (TRUNC(SYSDATE) - Empleado.Fechaingreso) AS Diastrabajados FROM empleado;

SELECT count(empleado.nombre) as TrabajadoresLocal FROM empleado
WHERE Empleado.cif = 7782254;
