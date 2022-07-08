--1
CREATE INDEX ix_diachi
ON customers(city);

SELECT * FROM customers
WHERE city LIKE '%ZAVIELY%';

--2
CREATE INDEX ix_gia
ON orders(totalamount);

SELECT * FROM orders
WHERE totalamount >=400;

--3
CREATE UNIQUE INDEX ix_3 ON customers(customerid);

SELECT CUSTOMERS.[customerid]
      ,[firstname]
      ,[lastname]
      ,[address1]
FROM customers
JOIN orders ON customers.customerid = orders.customerid
WHERE CUSTOMERS.customerid IN (
    SELECT customerid FROM orders GROUP BY customerid HAVING SUM(totalamount) >1000
);
--4
CREATE INDEX prod_idx ON products(prod_id);
DROP INDEX prod_idx ON products;

SELECT products.prod_id,products.title, sum(quantity) AS 'sum_quantity' 
from orderlines LEFT JOIN products ON products.prod_id = orderlines.prod_id
group by products.prod_id,products.title;
--5
SELECT CUSTOMERS.[customerid]
      ,[firstname]
      ,[lastname]
      ,[address1]            FROM customers
WHERE customerid IN (SELECT customerid FROM orderlines);
CREATE UNIQUE INDEX uidx_5 ON customers(customerid);
CREATE  INDEX uidx_5x ON orders(customerid);

--6
SELECT * FROM products
WHERE prod_id NOT IN (SELECT prod_id FROM orderlines);
CREATE UNIQUE INDEX uidx_6 ON products(prod_id);

--7
CREATE INDEX total ON orders(totalamount);
DROP INDEX total ON orders(totalamount);
SELECT customerid, SUM(totalamount) FROM orders 
GROUP BY customerid;
--8
CREATE INDEX soLuong ON orderlines(quantity);
DROP INDEX soLuong ON orderlines;
SELECT prod_id, SUM(quantity) AS 'so luong' FROM orderlines
GROUP BY prod_id;

ALTER TABLE reorder
ADD CONSTRAINT fk_prodid
FOREIGN KEY (prod_id)
REFERENCES products(prod_id);


ALTER TABLE cust_hist
ADD CONSTRAINT fk_product_hist
FOREIGN KEY (prod_id)
REFERENCES products(prod_id);

ALTER TABLE inventory
ADD CONSTRAINT fk_product_inven
FOREIGN KEY (prod_id)
REFERENCES products(prod_id);

ALTER TABLE products
ADD CONSTRAINT fk_product_cate
FOREIGN KEY (category)
REFERENCES categories(category);


ALTER TABLE orderlines
ADD CONSTRAINT fk_prodid_orderline
FOREIGN KEY (prod_id)
REFERENCES products(prod_id);


ALTER TABLE orderlines
ADD CONSTRAINT fk_order_line
FOREIGN KEY (orderid)
REFERENCES orders(orderid);


ALTER TABLE cust_hist
ADD CONSTRAINT fk_order_hist
FOREIGN KEY (orderid)
REFERENCES orders(orderid);
