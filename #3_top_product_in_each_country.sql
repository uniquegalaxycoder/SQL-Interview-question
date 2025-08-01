-- Amazon Interview Practice 21/02/2024


/* 1. You have two tables: Product and Supplier.
- Product Table Columns: Product_id, Product_Name, Supplier_id, Price
- Supplier Table Columns: Supplier_id, Supplier_Name, Country
*/

-- Write an SQL query to find the name of the product with the highest 
-- price in each country.

CREATE TABLE suppliers(
    supplier_id int PRIMARY KEY,
    supplier_name varchar(25),
    country VARCHAR(25)
);

INSERT all 
into suppliers(supplier_id,supplier_name, country) VALUES(501, 'alan', 'India')
into suppliers(supplier_id,supplier_name, country) VALUES(502, 'rex', 'US')
into suppliers(supplier_id,supplier_name, country) VALUES(503, 'dodo', 'India')
into suppliers(supplier_id,supplier_name, country) VALUES(504, 'rahul', 'US')
into suppliers(supplier_id,supplier_name, country) VALUES(505, 'zara', 'Canda')
into suppliers(supplier_id,supplier_name, country) VALUES(506, 'max', 'Canada')
select * from dual;

create table products (
    product_id int PRIMARY KEY,
    product_name VARCHAR(25),
    supplier_id int,
	price float,
	FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

INSERT all
into  products VALUES(201, 'iPhone 14', '501', 1299)
into  products VALUES(202, 'iPhone 8', '502', 999)
into  products VALUES(204, 'iPhone 13', '502', 1199)
into  products VALUES(203, 'iPhone 11', '503', 1199)
into  products VALUES(205, 'iPhone 12', '502', 1199)
into  products VALUES(206, 'iPhone 14', '501', 1399)
into  products VALUES(214, 'iPhone 15', '503', 1499)
into  products VALUES(207, 'iPhone 15', '505', 1499)
into  products VALUES(208, 'iPhone 15', '504', 1499)
into  products VALUES(209, 'iPhone 12', '502', 1299)
into  products VALUES(210, 'iPhone 13', '502', 1199)
into  products VALUES(211, 'iPhone 11', '501', 1099)
into  products VALUES(212, 'iPhone 14', '503', 1399)
into  products VALUES(213, 'iPhone 8', '502', 1099)
into  products VALUES(222, 'Samsung Galaxy S21', '504', 1699)
into  products VALUES(223, 'Samsung Galaxy S20', '505', 1899)
into  products VALUES(224, 'Google Pixel 6', '501', 899)
into  products VALUES(225, 'Google Pixel 5', '502', 799)
into  products VALUES(226, 'OnePlus 9 Pro', '503', 1699)
into  products VALUES(227, 'OnePlus 9', '502', 1999)
into  products VALUES(228, 'Xiaomi Mi 11', '501', 899)
into  products VALUES(229, 'Xiaomi Mi 10', '504', 699)
into  products VALUES(230, 'Huawei P40 Pro', '505', 1099)
into  products VALUES(231, 'Huawei P30', '502', 1299)
into  products VALUES(232, 'Sony Xperia 1 III', '503', 1199)
into  products VALUES(233, 'Sony Xperia 5 III', '501', 999)
into  products VALUES(234, 'LG Velvet', '505', 1899)
into  products VALUES(235, 'LG G8 ThinQ', '504', 799)
into  products VALUES(236, 'Motorola Edge Plus', '502', 1099)
into  products VALUES(237, 'Motorola One 5G', '501', 799)
into  products VALUES(238, 'ASUS ROG Phone 5', '503', 1999)
into  products VALUES(239, 'ASUS ZenFone 8', '504', 999)
into  products VALUES(240, 'Nokia 8.3 5G', '502', 899)
into  products VALUES(241, 'Nokia 7.2', '501', 699)
into  products VALUES(242, 'BlackBerry Key2', '504', 1899)
into  products VALUES(243, 'BlackBerry Motion', '502', 799)
into  products VALUES(244, 'HTC U12 Plus', '501', 899)
into  products VALUES(245, 'HTC Desire 20 Pro', '505', 699)
into  products VALUES(246, 'Lenovo Legion Phone Duel', '503', 1499)
into  products VALUES(247, 'Lenovo K12 Note', '504', 1499)
into  products VALUES(248, 'ZTE Axon 30 Ultra', '501', 1299)
into  products VALUES(249, 'ZTE Blade 20', '502', 1599)
into  products VALUES(250, 'Oppo Find X3 Pro', '503', 1999)
select * from dual
;

--delete from products ;
select * from suppliers;
select * from products ;


-- Write an SQL query to find the name of the product with the highest 
-- price in each country.

with cte1 as (
select 
    a.*,
    b.*
from suppliers a 
left join products  b 
on a.supplier_id = b.supplier_id
where product_name is not null
)
select 
    country,
    product_name,
    price
from (
select 
    country,
    product_name,
    price,
    dense_rank()over(partition by country order by price desc) as max_price
from cte1) a 
where max_price =1;

-- 
