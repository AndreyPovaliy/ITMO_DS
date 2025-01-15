'''
Задание 1. Создание представления с помощью графического интерфейса
'''
CREATE VIEW "ShareDetails".v_currentshares AS
    SELECT sharedesc, sharetickerid, currentprice AS "Last Price"
    FROM "ShareDetails".shares
    WHERE currentprice > 0
    ORDER BY sharedesc;
'''
Задание 2. Создание представления на основе представления
'''
DROP VIEW IF EXISTS "ShareDetails".v_currentshares;
CREATE VIEW "ShareDetails".v_currentshares AS
    SELECT 
        shares.shareid,
        shares.sharedesc, 
        shares.sharetickerid, 
        shares.currentprice AS "Last Price"
    FROM "ShareDetails".shares
    WHERE currentprice > 0::numeric
    ORDER BY sharedesc;

CREATE VIEW "ShareDetails".v_shareprices AS
    SELECT
        sp. shareid, 
        sp.price, 
        sp.pricedate, 
        vcs.sharedesc
    FROM "ShareDetails". shareprices sp
    INNER JOIN "ShareDetails".v_currentshares vCS
        ON sp.shareid = vcs.shareid
    ORDER BY vcs. sharedesc, sp.pricedate;

-- протестировать представление
INSERT INTO "ShareDetails".shareprices (shareid, price, pricedate)
VALUES
    (1, 2.155, '2023-08-01 10:10:00'),
    (1, 2.2125, '2023-08-01 10:12:00'),
    (1, 2.4175, '2023-08-01 10:16:00'),
    (1, 2.21, '2023-08-01 11:22:00'),
    (1, 2.17, '2023-08-01 14:54:00'),
    (1, 2.34125, '2023-08-01 16:10:00'),
    (2, 41.10, '2023-08-01 10:10:00'),
    (2, 43.22, '2023-08-02 10:10:00'),
    (2, 45.20, '2023-08-03 10:10:00');

INSERT INTO "ShareDetails".shares 
(sharedesc, sharetickerid, currentprice)
VALUES ('FAT-BELLY.COM', 'FBC', 45.2000);

SELECT * FROM "ShareDetails".v_shareprices;
'''
Задание 3. Создание представления с помощью Query Editor
'''
CREATE VIEW "CustomerDetails".v_custtrans
AS
SELECT
    c. accountnumber,
    c. customerfirstname,
    c. customerotherinitials, tt. transactiondescription,
    t. dateentered,
    t. amount,
    t. referencedetails
FROM "CustomerDetails".customers AS c
JOIN "TransactionDetails". transactions AS t
    ON t. customerid = c.customerid
JOIN "TransactionDetails". transactiontypes AS tt
    ON tt. transactiontypesid = t. transactiontype
ORDER BY c.accountnumber ASC, t.dateentered DESC;
'''
Задание 4. Изменение базовых таблиц представлений
'''
INSERT INTO "CustomerDetails".financialproducts 
(productid, productname)
VALUES
    (1, 'Regular Savings'),
    (2, 'Bonds Account'),
    (3, 'Share Account'),
    (4, 'Life Insurance');


INSERT INTO "CustomerDetails".customersproducts 
(customerid, financialproductid, amounttocollect, 
frequency, lastcollected, lastcollection, renewable)
VALUES
(1, 1, 200, 1, DATE '2021-08-31', DATE '2035-08-31', false), 
(1, 2, 50, 1,  DATE '2023-08-24',  DATE '2025-03-24', false), 
(2, 4, 150, 3, DATE '2023-08-20', DATE '2025-08-25', true), 
(3, 3, 500, 0, DATE '2023-08-24', DATE '2025-08-24', true);


DROP VIEW IF EXISTS "CustomerDetails".v_custfinproducts;

CREATE VIEW "CustomerDetails".v_custfinproducts AS 
    SELECT
c.customerfirstname || ' ' || c.customerlastname as customername,
c.accountnumber, fp.productname, cp.amounttocollect, 
cp.frequency, cp.lastcollected
FROM "CustomerDetails".customers AS c
JOIN "CustomerDetails".customersproducts AS cp
    ON cp.customerid = c.customerid
JOIN "CustomerDetails".financialproducts AS fp
    ON fp.productid = cp.financialproductid;


SELECT * FROM "CustomerDetails".v_custfinproducts;

ALTER TABLE "CustomerDetails".customers
ALTER COLUMN CustomerFirstName TYPE varchar (100);
'''
Задание 5. Создание материализованного представления
'''
DROP VIEW IF EXISTS "CustomerDetails".v_custfinproducts;
CREATE MATERIALIZED VIEW "CustomerDetails".v_custfinproducts
AS SELECT
c.customerfirstname || ' ' || c. customerlastname as customername,
c. accountnumber, fp. productname, cp. amounttocollect, cp. frequency, cp. lastcollected
FROM "CustomerDetails".customers AS c
JOIN "CustomerDetails".customersproducts AS cp
    ON cp.customerid = c.customerid
JOIN "CustomerDetails". financialproducts AS fp
    ON fp.productid = cp.financialproductid;



UPDATE "CustomerDetails".customers
SET customerlastname = 'Brusten'
WHERE customerlastname = 'Brust';
SELECT * FROM "CustomerDetails".customers;