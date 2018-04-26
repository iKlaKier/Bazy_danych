create table klient(
    customerID INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR2(25) NOT NULL,
    surname VARCHAR2(25) NOT NULL,
    addr_street VARCHAR2(25) NULL,
    addr_zip VARCHAR2(25) NULL,
    addr_city VARCHAR2(25) NULL,
    login VARCHAR2(25) NOT NULL,
    passwd VARCHAR2(25) NULL);
--
alter table klient
    MODIFY(surname VARCHAR(35) NULL,
    addr_street VARCHAR2(45),
    addr_zip VARCHAR2(5),
    addr_city VARCHAR2(45),
    login VARCHAR2(14),
    passwd VARCHAR2(12));
--
CREATE TABLE zamowienia(
    orderID INTEGER PRIMARY KEY NOT NULL,
    IDcustomer INTEGER NOT NULL,
    crDATE DATE NULL);
--
create table pozycja(
    IDproduct INTEGER NOT NULL,
    IDorder INTEGER NOT NULL,
    quantity INTEGER NOT NULL);
--
CREATE TABLE produkt(
    productID INTEGER PRIMARY KEY,
    name VARCHAR2(35),
    price_net FLOAT,
    price_gross FLOAT,
    description CLOB);
--
alter table klient
    modify(customerID constraint re_klient2zamowienia references zamowienia(IDcustomer) UNIQUE);
