SELECT account_id, customer_id, balance, iban
FROM cuenta
WHERE balance < 0;

SELECT customer_name, customer_surname, dob
FROM cliente
WHERE customer_surname LIKE '%Z%';

SELECT c.customer_name, c.customer_surname AS apellido, c.dob AS edad, s.branch_name AS nombre_sucursal
FROM cliente AS c
JOIN sucursal AS s ON c.branch_id = s.branch_id
WHERE c.customer_name = 'Brendan'
ORDER BY s.branch_name;


SELECT *
FROM prestamo
WHERE loan_total > 8000000
   OR loan_type = 'PRENDARIO';

SELECT *
FROM prestamo
WHERE loan_total > (SELECT AVG(loan_total) FROM prestamo);

SELECT COUNT(*)
FROM cliente
WHERE dob > (strftime('%Y', 'now') - 50);

SELECT *
FROM cuenta
WHERE balance > 800000
LIMIT 5;

SELECT *
FROM prestamo
WHERE strftime('%m', loan_date) IN ('04', '06', '08')
ORDER BY loan_total;

SELECT loan_type, SUM(loan_total) AS loan_total_accu
FROM prestamo
GROUP BY loan_type;





