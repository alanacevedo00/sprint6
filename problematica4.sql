--ITEM 1.
SELECT c.branch_id, s.branch_name, COUNT(*) AS client_count

FROM cliente c

JOIN sucursal s ON c.branch_id = s.branch_id

GROUP BY c.branch_id

ORDER BY client_count DESC;

	--ITEM 2.
SELECT c.branch_id, c.customer_id, COUNT(DISTINCT e.employee_id) AS employee_count

FROM cliente c

JOIN empleado e ON c.branch_id = e.branch_id

GROUP BY c.branch_id, c.customer_id;

	--ITEM 3.
SELECT sucursal.branch_name AS Sucursal, tarjeta.tipo AS TipoTarjeta, COUNT(*) AS Cantidad

FROM tarjeta

JOIN sucursal ON tarjeta.id = sucursal.branch_id

GROUP BY sucursal.branch_name, tarjeta.tipo

ORDER BY sucursal.branch_name, tarjeta.tipo;

	--ITEM 4.
SELECT c.branch_id, AVG(crd.loan_id) AS average_credit

FROM cliente c

JOIN prestamo crd ON c.customer_id = crd.customer_id

GROUP BY c.branch_id;

	--ITEM 5. 
CREATE TRIGGER after_update_cuenta

AFTER UPDATE ON cuenta

FOR EACH ROW

INSERT INTO auditoria_cuenta (old_id, new_id, old_balance, new_balance, old_iban, new_iban, old_type, new_type, user_action)

VALUES (OLD.id, NEW.id, OLD.balance, NEW.balance, OLD.iban, NEW.iban, OLD.type, NEW.type, 'update');

Lucas Dippolito8:02 p. m.
UPDATE cuenta

SET balance = balance - 100

WHERE id IN (10, 11, 12, 13, 14);

	--ITEM 6
CREATE INDEX idx_customer_dni ON cliente(customer_DNI);

	--ITEM 7
CREATE TABLE movimientos (

  movimiento_id INTEGER PRIMARY KEY,

  numero_cuenta_origen INTEGER,

  numero_cuenta_destino INTEGER,

  monto REAL,

  tipo_operacion TEXT,

  hora DATETIME DEFAULT CURRENT_TIMESTAMP

);
BEGIN;

SELECT balance FROM cuenta WHERE account_id = 200;

SELECT balance FROM cuenta WHERE account_id = 400;

UPDATE cuenta SET balance = balance - 1000 WHERE account_id = 200;

UPDATE cuenta SET balance = balance + 1000 WHERE account_id = 400;

INSERT INTO movimientos (numero_cuenta_origen, numero_cuenta_destino, monto, tipo_operacion)

VALUES (200, 400, 1000, 'transferencia');

COMMIT;