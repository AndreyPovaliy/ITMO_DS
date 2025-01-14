-- создание индекса
CREATE INDEX ix_customersproducts
ON "CustomerDetails".customersproducts (CustomerId);

CREATE UNIQUE INDEX ix_transactiontypes
    ON "TransactionDetails". transactiontypes
    USING btree (transactiontypesid ASC) ;

ALTER TABLE IF EXISTS "TransactionDetails". transactiontypes
    CLUSTER ON ix_transactiontypes;

/* Таким образом создали уникальный кластеризованный индекс
для таблицы TransactionDetails.transactiontypes */

/* Теперь создадим некластеризованный индекс для таблицы
TransactionDetails.transactions на основе столбца TransactionType*/
CREATE INDEX ix_transactions_ttypes
    ON "TransactionDetails". transactions
    USING btree (TransactionType ASC);

-- удаление индекса
DROP INDEX "TransactionDetails". ix_transactiontypes;


-- изменение индекса
CREATE UNIQUE INDEX iX_shareprices
ON "ShareDetails".shareprices (ShareID ASC, PriceDate ASC);

-- ошибка!
CREATE UNIQUE INDEX ix_shareprices
ON "ShareDetails".shareprices (ShareID ASC, PriceDate DESC, Price);

-- перенакатываемый код
DROP INDEX IF EXISTS "ShareDetails".ix_shareprices;
CREATE UNIQUE INDEX ix_shareprices
ON "ShareDetails".shareprices (ShareID ASC, PriceDate DESC, Price);