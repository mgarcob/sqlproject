
SELECT pedido.idpedido, pedido.tipopedido, Pedidocontienepizza.Fechapedido, Pizza.Nombre INTO datospizza
FROM Pedido INNER JOIN (pizza INNER JOIN pedidocontienepizza ON pizza.idpizza = Pedidocontienepizza.Idpizza) ON pedido.idpedido = Pedidocontienepizza.Idpedido;


CREATE TABLE pizzaporpedido (
    pedido INT,
    cantidad  INT)
INSERT INTO pizzaporpedido (pedido, cantidad)
SELECT idpedido as pedido, count(idpizza) as cantidad
FROM pedidocontienepizza
GROUP BY idpedido;

UPDATE Cliente
SET telefono = 954202080
WHERE idcliente = 1;

DELETE FROM cliente
WHERE cliente.cp = 41999