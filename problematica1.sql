CREATE TABLE TipoCliente (
    id INTEGER PRIMARY KEY,
    tipo TEXT
);
INSERT INTO TipoCliente (tipo) VALUES ('Classic');
INSERT INTO TipoCliente (tipo) VALUES ('Gold');
INSERT INTO TipoCliente (tipo) VALUES ('Black');
CREATE TABLE TipoCuenta (
    id INTEGER PRIMARY KEY,
    tipo TEXT
);
INSERT INTO TipoCuenta (tipo) VALUES ('Caja de Ahorro en Pesos');
INSERT INTO TipoCuenta (tipo) VALUES ('Caja de Ahorro en Dólares');
INSERT INTO TipoCuenta (tipo) VALUES ('Cuenta Corriente en Pesos');
INSERT INTO TipoCuenta (tipo) VALUES ('Cuenta Corriente en Dólares');
INSERT INTO TipoCuenta (tipo) VALUES ('Cuenta de Inversión');
CREATE TABLE MarcaTarjeta (
    id INTEGER PRIMARY KEY,
    marca TEXT
);
INSERT INTO MarcaTarjeta (marca) VALUES ('Visa');
INSERT INTO MarcaTarjeta (marca) VALUES ('Mastercard');
INSERT INTO MarcaTarjeta (marca) VALUES ('Amex');
CREATE TABLE Tarjeta (
    id INTEGER PRIMARY KEY,
    numero TEXT UNIQUE,
    cvv TEXT,
    fecha_otorgamiento TEXT,
    fecha_expiracion TEXT,
    tipo TEXT,
    marca_id INTEGER,
    cliente_id INTEGER,
    FOREIGN KEY (marca_id) REFERENCES MarcaTarjeta(id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(customer_id)
);
CREATE TABLE Direccion (
    id INTEGER PRIMARY KEY,
    calle TEXT,
    ciudad TEXT,
    estado TEXT,
    codigo_postal TEXT
);
ALTER TABLE cuenta ADD COLUMN tipo_cuenta_id INTEGER;
UPDATE cuenta SET tipo_cuenta_id = (SELECT id FROM TipoCuenta ORDER BY RANDOM() LIMIT 1);
UPDATE empleado
SET employee_hire_date = strftime('%Y-%m-%d', employee_hire_date);
INSERT INTO `Tarjeta` (`id`,`numero`,`cvv`,`fecha_otorgamiento`,`fecha_expiracion`,`tipo`,`marca_id`,`cliente_id`)
VALUES
  (1,"558862 478739 3475","406","Oct 1, 2023","Feb 10, 2025","CREDITO","3","124"),
  (2,"5641824144669774479","657","Feb 3, 2024","May 7, 2026","CREDITO","2","64"),
  (3,"491337 3228488382","942","May 27, 2024","Aug 20, 2026","CREDITO","1","5"),
  (4,"450871 6627385537","440","May 27, 2023","Nov 14, 2024","CREDITO","3","78"),
  (5,"5151833542398664","743","Sep 16, 2023","May 29, 2026","CREDITO","1","1");
  INSERT INTO `Direccion` (`id`,`calle`,`ciudad`,`estado`,`codigo_postal`)
VALUES
  (1,"Ap #953-4411 Augue, Street","Agustín Codazzi","Friuli-Venezia Giulia","50216"),
  (2,"123-6492 Odio St.","General Trias","Ohio","5278"),
  (3,"Ap #203-5463 Ut Avenue","Neusiedl am See","Bremen","3955995"),
  (4,"Ap #114-2334 Mauris Rd.","Millport","Ninh Thuận","58464-19511"),
  (5,"151-213 Elit. Ave","Güssing","Alaska","11402");







