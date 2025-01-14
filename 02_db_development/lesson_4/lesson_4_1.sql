-- создать таблицу transactions
CREATE TABLE "TransactionDetails".transactions 
(
    transactionid bigint GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1)
                        PRIMARY KEY NOT NULL,
    customerid bigint NOT NULL, 
    transactiontype int NOT NULL, 
    dateentered timestamp (0) NOT NULL, 
    amount numeric(18,5) NOT NULL, 
    referencedetails varchar (50) NULL, 
    notes varchar NULL, 
    relatedshareid bigint NULL, 
    relatedproductid bigint NOT NULL
    );

-- создать таблицу transactiontypes
CREATE TABLE "TransactionDetails".transactiontypes
(
    transactiontypesid int GENERATED ALWAYS AS IDENTITY NOT NULL, 
    transactiondescription varchar (30) NOT NULL, 
    credittype boolean NOT NULL);

-- изменить таблицу transactiontypes добавить столбец affectcashbalance
ALTER TABLE "TransactionDetails".transactiontypes
ADD affectcashbalance boolean NULL;


-- изменить созданный столбец
ALTER TABLE "TransactionDetails".transactiontypes
ALTER COLUMN affectcashbalance SET NOT NULL;

-- добавить первичный ключ
ALTER TABLE "TransactionDetails".transactiontypes
ADD CONSTRAINT PK_TransactionTypes PRIMARY KEY (transactiontypesid);



CREATE SCHEMA "CustomerDetails" AUTHORIZATION postgres;

-- создание остальных таблиц
CREATE TABLE "CustomerDetails".customers
( 
	customerid bigint GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1)
                        PRIMARY KEY NOT NULL,
	customertitleid integer NOT NULL,
	customerfirstname varchar (50)[] NOT NULL,
	customerotherinitials varchar (10)[] NULL,
	customerlastname varchar (50)[] NOT NULL,
	addressid bigint NOT NULL,
	accountnumber char (50)[] NOT NULL,
	accounttypeid integer NOT NULL,
	clearebalance money NOT NULL,
	unclearebalance money NOT NULL,
	dateadded date

);

CREATE TABLE "CustomerDetails".customersproducts
(
	customerfinancialproductid bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
	customerid bigint NOT NULL,
	financialproductid bigint NOT NULL,
	amounttocollect money NOT NULL,
	frequency int NOT NULL,
	lastcollected timestamp(0) NOT NULL,
	lastcollection timestamp(0) NOT NULL,
	renewable boolean NOT NULL
);

CREATE TABLE "CustomerDetails".financialproducts
(
	productid bigint NOT NULL,
	productname varchar (50) NOT NULL
);

CREATE SCHEMA "ShareDetails" AUTHORIZATION postgres;

CREATE TABLE "ShareDetails".shareprices
(
	sharepriceid bigint GENERATED ALWAYS AS IDENTITY NOT NULL, 
	shareid bigint NOT NULL, 
	price numeric (18,5) NOT NULL, 
	pricedate timestamp (0) NOT NULL
);

CREATE TABLE "ShareDetails".shares
(
	shareid bigint ALWAYS AS IDENTITY NOT NULL, 
	sharedesc varchar (50) NOT NULL, 
	sharetickerid varchar (50) NULL, 
	currentprice numeric (18,5) NOT NULL
);

-- создание отношений
ALTER TABLE "ShareDetails".shares
ADD CONSTRAINT PK_shareid PRIMARY KEY (shareid);

ALTER TABLE "TransactionDetails".transactions
ADD CONSTRAINT fk_transactions_shares FOREIGN KEY (relatedshareid)
REFERENCES "ShareDetails".shares (shareid);

ALTER TABLE "TransactionDetails".transactions
ADD CONSTRAINT fk_customersid FOREIGN KEY (customerid)
REFERENCES "CustomerDetails".customers (customerid);


'''
Удалить ограничения
ALTER TABLE "TransactionDetails".transactions
DROP CONSTRAINT fk_customersid;

ALTER TABLE "TransactionDetails".transactions
DROP CONSTRAINT fk_transactions_shares;

DROP TABLE "CustomerDetails".customers;
'''
