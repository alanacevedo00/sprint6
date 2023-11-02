
CREATE VIEW vista_clientes AS
SELECT customer_id, branch_id, customer_name, customer_surname, customer_DNI, dob
FROM cliente
WHERE dob > 40
ORDER BY customer_DNI;


SELECT customer_id, branch_id, customer_name, customer_surname, customer_DNI, dob
FROM cliente
WHERE customer_name IN ('Anne', 'Tyler')
ORDER BY dob;


INSERT INTO cliente (customer_name, customer_surname, customer_DNI, branch_id, dob) VALUES
('Lois', 'Stout', 47730534, 80, '1984-07-07'),
('Hall', 'Mcconnell', 52055464, 45, '1968-04-30'),
('Hilel', 'Mclean', 43625213, 77, '1993-03-28'),
('Jin', 'Cooley', 21207908, 96, '1959-08-24'),
('Gabriel', 'Harmon', 57063950, 27, '1976-04-01');

SELECT * FROM cliente WHERE customer_name IN ('Lois', 'Hall', 'Hilel', 'Jin', 'Gabriel');

UPDATE cliente
SET branch_id = 10
WHERE customer_name IN ('Lois', 'Hall', 'Hilel', 'Jin', 'Gabriel');

DELETE FROM cliente
WHERE customer_name = 'Noel' AND customer_surname = 'David';

SELECT loan_type, loan_id, loan_total, loan_date
FROM prestamo
WHERE loan_total = (SELECT MAX(loan_total) FROM prestamo);




