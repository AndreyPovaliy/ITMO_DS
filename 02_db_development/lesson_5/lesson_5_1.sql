'''
ДОБАВЛЕНИЕ ДАННЫХ
'''
-- добаление данных
INSERT INTO "ShareDetails".shares
    (sharedesc, 
    sharetickerid, 
    currentprice)
VALUES
    ('ACME''S HOMEBAKE COOKIES INC'
    , 'AHCI'
    ,2.34125);

-- проверка
SELECT * FROM "ShareDetails".shares;

INSERT INTO "CustomerDetails".customers
     (customertitleid, 
     customerfirstname, 
     customerotherinitials, 
     customerlastname, 
     addressid, 
     accountnumber, 
     accounttypeid, 
     clearebalance, 
     unclearebalance,
     dateadded)
VALUES (123, 
    '{"Dmitrij"}',
    null, 
    '{"Vetrov"}', 
    123, 
    '{123}', 
    123, 
    123, 
    123, 
    '2023-07-30');
-- ошибка
INSERT INTO "CustomerDetails".customers
     (customertitleid, 
     customerlastname, 
     customerfirstname, 
     customerotherinitials, 
     addressid, 
     accountnumber, 
     accounttypeid, 
     clearebalance, 
     unclearebalance)
VALUES (3, 
    'Lobel', 
    'Leonard', 
    NULL, 
    145, 
    53431993, 
    1, 
    437.97, 
    -10.56);

DELETE FROM "CustomerDetails".customers
WHERE customerid = 3;
-- исправить типы данных
ALTER TABLE "CustomerDetails".customers
ALTER COLUMN customerfirstname TYPE character varying(50) ;

ALTER TABLE "CustomerDetails".customers
ALTER COLUMN customerotherinitials TYPE character varying(10);

ALTER TABLE "CustomerDetails".customers
ALTER COLUMN customerlastname TYPE character varying(50);

ALTER TABLE "CustomerDetails".customers
ALTER COLUMN accountnumber TYPE character varying(15) ;


-- проверка записи
SELECT * FROM "CustomerDetails".customers;

-- отключаем автоинкремент
ALTER TABLE "CustomerDetails".customers
ALTER COLUMN customerid
DROP IDENTITY;

-- обновить и проверить строку
UPDATE "CustomerDetails".customers
SET customerid = 1;
SELECT * FROM "CustomerDetails".customers;


-- включить автоинкремент
ALTER TABLE "CustomerDetails".customers
ALTER COLUMN customerid
ADD GENERATED ALWAYS AS IDENTITY;


-- ERROR:  duplicate key value violates unique constraint "customers_pkey"
INSERT INTO "CustomerDetails".customers 
(customertitleid, customerlastname, customerfirstname, 
customerotherinitials, addressid, accountnumber, 
accounttypeid, clearebalance, unclearebalance)
VALUES
(1, 'Brust', 'Andrew', 'J.', 133, 18176111, 1, 200.00, 2.00) , 
(3, 'Lobel', 'Leonard', NULL, 145, 53431993, 1, 437.97, -10.56);

-- изменение последовательности
ALTER SEQUENCE "CustomerDetails".customers_customerid_seq RESTART WITH 2;


'''
ДОБАВЛЕНИЕ ОГРАНИЧЕНИЙ
'''
-- добавление первичного ключа
ALTER TABLE "CustomerDetails".customersproducts
ADD CONSTRAINT pk_customersproducts
PRIMARY KEY (customerfinancialproductid);

-- добавление ограничение минимального значения больше нуля
ALTER TABLE "CustomerDetails".customersproducts
ADD CONSTRAINT ck_custprods_amtcheck
CHECK (amounttocollect > 0::money);

-- ограничение DEFAULT для столбца renewable со значением false
ALTER TABLE "CustomerDetails".customersproducts
ALTER COLUMN renewable
SET DEFAULT false;


-- добавление еще одного ограничения
ALTER TABLE "CustomerDetails".customersproducts
ADD CONSTRAINT ck_custprods_lastcollcheck
CHECK (lastcollection >= lastcollected);

-- тесировка ограничений
-- check constraint "ck_custprods_amtcheck"
INSERT INTO "CustomerDetails".customersproducts 
(customerid, financialproductid, amounttocollect, 
frequency , lastcollected, lastcollection, renewable)
VALUES (1, 1, -100, 0, '2023-08-24', '2023-08-24', false);
-- check constraint "ck_custprods_lastcollcheck"
INSERT INTO "CustomerDetails".customersproducts 
(customerid, financialproductid, amounttocollect, 
frequency , lastcollected, lastcollection, renewable)
VALUES (1, 1, 100, 0, '2023-08-24', '2023-08-20', false);

'''
ОДНОВРЕМЕННАЯ ВСТАВКА НЕСКОЛЬКИХ ЗАПИСЕЙ
'''
INSERT INTO "CustomerDetails".Customers 
    (customertitleid, customerfirstname, customerotherinitials, 
    customerlastname, addressid, accountnumber, 
    accounttypeid, clearebalance, unclearebalance)
VALUES 
    (3, 'Bernie', 'I', 'McGee', 314, 65368765, 1, 6653.11, 0.00), 
    (2, 'Julie', 'A', 'Dewson', 2134, 81625422, 1, 53.32, -12.21), 
    (1, 'Kirsty', NULL, 'Hull', 4312, 96565334, 1, 1266.00, 10.32);

INSERT INTO "ShareDetails".shares (sharedesc, sharetickerid, currentprice)
VALUES 
    ('FAT-BELLY.COM', 'FBC', 45.20), 
    ('NetRadio Inc', 'NRI', 29.79),
    ('Texas Oil Industries', 'TOI' ,0.455), 
    ('London Bridge Club', 'LBC', 1.46);

'''
ИЗВЛЕЧЕНИЕ ДАННЫХ: ОТОБРАЖЕНИЕ РЕЗУЛЬТАТОВ
'''
SELECT * FROM "CustomerDetails".customers;

SELECT customerfirstname, customerlastname, clearebalance
FROM "CustomerDetails". customers;

SELECT customerfirstname AS "First Name", customerlastname AS "Last Name", clearebalance Balance
FROM "CustomerDetails".customers;

-- сохранение в .csv
\copy
    (SELECT * FROM "CustomerDetails".customers)
TO 'query.csv' csv header;


'''
ОБНОВЛЕНИЕ ДАННЫХ
'''
UPDATE "CustomerDetails". customers
SET customerlastname = 'Brodie'
WHERE customerid = 4;


DO
$$
DECLARE
    ValueToUpdate VARCHAR (30);
BEGIN
    ValueToUpdate := 'McGlynn';
    UPDATE "CustomerDetails".customers
    SET customerlastname = ValueToUpdate,
        clearebalance = clearebalance + unclearebalance,
        unclearebalance = 0
    WHERE customerlastname = 'Brodie';
END
$$

DO
$$
DECLARE
    WrongDataType VARCHAR(20) := '4311.22';
BEGIN
    UPDATE "CustomerDetails", customers
    SET clearebalance = WrongDataType
    WHERE customerid = 4;
END
$$

DO
$$
DECLARE
    WrongDataType VARCHAR (20) := '4311,22';
BEGIN
    UPDATE "CustomerDetails".customers
    SET clearebalance = WrongDataType: :money
    WHERE customerid = 4;
END
$$
'''
УДАЛЕНИЕ ДАННЫХ
'''
-- создание временной таблициы
CREATE TEMPORARY TABLE tmp_customers
AS SELECT
    customerid, 
    customerfirstname, 
    customerotherinitials, 
    customerlastname
FROM "CustomerDetails".customers;

SELECT * FROM tmp_customers;