-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными.

-- Создадим базу данных, проверив что бд с таким именем не сущществует.

DROP DATABASE IF EXISTS hw2;
CREATE DATABASE hw2;
USE hw2;

-- Создадим таблицу sales.

CREATE TABLE sales (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	order_date DATE,
	count_product INT DEFAULT '0'
);

- Заполним таблицу данными.

INSERT INTO `sales` (order_date, count_product)
VALUES 
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

/*
2. Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100 - Маленький заказ;
от 100 до 300 - Средний заказ;
больше 300 - Большой заказ.
*/

select id, 
	case
		when count_product < 100 then 'Маленький заказ'
		when count_product between 100 and 300 then 'Средний заказ'
		when count_product > 300 then 'Большой заказ'
		else 'Не определено'
		end as 'Тип заказа'
from sales;			

/* Создайте таблицу “orders”, заполните ее значениями. Выберите все заказы. 
   В зависимости от поля order_status выведите столбец full_order_status:
   OPEN – «Order is in open state» ;
   CLOSED - «Order is closed»;
   CANCELLED - «Order is cancelled»
*/

-- Создадим таблицу orders и заполним ее данными.

CREATE TABLE orders (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	employee_id VARCHAR(8) NOT NULL UNIQUE DEFAULT 'e00',
	amount FLOAT(7,2) NOT NULL DEFAULT '0.00',
    order_status VARCHAR(15) NOT NULL DEFAULT 'OPEN'
);

INSERT INTO `orders` (employee_id, amount, order_status)
VALUES 
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

select id, 
	case
		when order_status = 'OPEN' then 'Order is in open state'
		when order_status = 'CLOSED'  then 'Order is closed'
		when order_status = 'CANCELLED' then 'Order is cancelled'
		else 'Не определено'
		end as 'full_order_status'
from orders;	

-- 4. Чем 0 отличается от NULL?

-- NULL это отсутсвие значений в ячейке, а 0 это данные формата it или float. При работе
-- с некоторыми операторами вроде count() данные null не будут считаться, а 0 будет. 