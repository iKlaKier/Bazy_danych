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

alter table pozycja
    add constraint rel_produkt2pozycja
    FOREIGN KEY (IDproduct) REFERENCES produkt(productID);
	
alter table pozycja		-- relecja pozycji do zmówień
    add constraint rel_zamowienia2pozycja
    FOREIGN KEY (IDorder) REFERENCES zamowienia(orderID);
	
alter table zamowienia
    add constraint rel_klient2zamowienia
    FOREIGN KEY (IDcustomer) REFERENCES klient(customerID);
	
alter table pozycja
    modify(IDorder unique);
	
	
-- 2.1
alter table klient
    add(mail varchar2(45) null);
-- 2.2
alter table klient
    rename column addr_postacode to addr_postalcode;

alter table klient
    modify addr_postalcode varchar2(7);
--
-- 2.3
alter table zamowienia
    add(Filled varchar2(3) check(Filled in ('Yes', 'No')));
-- 2.4
alter table zamowienia
    add(FillDate DATE null);
-- 2.5
alter table zamowienia
    rename column Filled to Status;
alter table zamowienia
    modify(Status varchar2(21) check(Status in ('Nowe zamówienie', 'Realizowane', 'Przesyłka wysłana', 'Realizacja
zakończona')));

-- 2.6
ALTER TABLE produkt
modify(price_gross as default(price_net*1.23) VIRTUAL);

-- 2.7
create index client_fast
    ON klient(surname, login, mail);
	
-- 2.8
create unique index client_fast
    ON klient(surname, login, mail);


