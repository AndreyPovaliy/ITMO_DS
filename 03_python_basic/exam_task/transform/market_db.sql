-- создать базу
CREATE DATABASE "market_db"
    WITH
    OWNER = andreypovaliy
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = 1
    IS_TEMPLATE = False;
    
-- создать схему
CREATE SCHEMA IF NOT EXISTS "MarketDetails"
    AUTHORIZATION  andreypovaliy;
    
-- создать таблицы
CREATE TABLE "MarketDetails".categories (
  category_id serial4 NOT NULL,
  category varchar NULL,
  CONSTRAINT categories_pk PRIMARY KEY (category_id)
);    

CREATE TABLE "MarketDetails".states (
  state_id serial4 NOT NULL,
  state_full varchar NULL,
  state_abbr bpchar (2) NOT NULL,
  CONSTRAINT states_pk PRIMARY KEY (state_id)
);

CREATE TABLE "MarketDetails".users (
  user_id serial4 NOT NULL,
  fname varchar NULL, 
  lname varchar NULL,
  username varchar NOT NULL, 
  password_hash varchar NOT NULL,
  CONSTRAINT users_pk PRIMARY KEY (user_id)
);

CREATE TABLE "MarketDetails".cities (
  city_id serial4 NOT NULL, 
  city varchar NOT NULL, 
  state_id int4 NOT NULL, 
  CONSTRAINT cities_pk PRIMARY KEY (city_id) ,
  CONSTRAINT cities_states_fk FOREIGN KEY (state_id) REFERENCES "MarketDetails".states(state_id)
);


CREATE TABLE "MarketDetails".markets (
  market_id int4 NOT NULL, 
  market_name varchar NULL, 
  street varchar NULL, 
  city int4 NULL, 
  state int4 NULL, 
  zip int4 NULL, 
  lat float4 NULL,
  lon float4 NULL,
  CONSTRAINT markets_pk PRIMARY KEY (market_id),
  CONSTRAINT markets_cities_fk FOREIGN KEY (city) REFERENCES "MarketDetails".cities(city_id),
  CONSTRAINT marketsstates_fk FOREIGN KEY (state) REFERENCES "MarketDetails".states (state_id)
);

CREATE TABLE "MarketDetails".markets_categories (
  market_category_id int4 NOT NULL,
  market_id int4 NOT NULL, 
  category_id int4 NOT NULL, 
  CONSTRAINT markets_categories_pk PRIMARY KEY (market_category_id),
  CONSTRAINT markets_categories_categories_fk FOREIGN KEY (category_id) REFERENCES "MarketDetails".categories (category_id),
  CONSTRAINT markets_categories_markets_fk FOREIGN KEY (market_id) REFERENCES "MarketDetails".markets(market_id)
);

CREATE TABLE "MarketDetails".reviews (
  review_id serial4 NOT NULL,
  user_id int4 NOT NULL, 
  market_id int4 NOT NULL, 
  date_time date NOT NULL, 
  score int2 NOT NULL, 
  review text NULL,
  CONSTRAINT reviews_pk PRIMARY KEY (review_id),
  CONSTRAINT reviews_markets_fk FOREIGN KEY (market_id) REFERENCES "MarketDetails".markets (market_id),
  CONSTRAINT reviews_users_fk FOREIGN KEY (user_id) REFERENCES "MarketDetails".users(user_id)
);



COPY "MarketDetails".states
  FROM '/Users/andreypovaliy/Documents/Education/ITMO_DS/03_python_basic/exam_task/transform/states.csv'
  DELIMITER ','
  CSV HEADER;

COPY "MarketDetails".categories
  FROM '/Users/andreypovaliy/Documents/Education/ITMO_DS/03_python_basic/exam_task/transform/categories.csv'
  DELIMITER ','
  CSV HEADER;
  
COPY "MarketDetails".cities
  FROM '/Users/andreypovaliy/Documents/Education/ITMO_DS/03_python_basic/exam_task/transform/cities.csv'
  DELIMITER ','
  CSV HEADER;

COPY "MarketDetails".markets
  FROM '/Users/andreypovaliy/Documents/Education/ITMO_DS/03_python_basic/exam_task/transform/markets.csv'
  DELIMITER ','
  CSV HEADER;
  
COPY "MarketDetails".markets_categories
  FROM '/Users/andreypovaliy/Documents/Education/ITMO_DS/03_python_basic/exam_task/transform/markets_categories.csv'
  DELIMITER ','
  CSV HEADER;




  