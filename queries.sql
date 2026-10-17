-- День 2. Запросы к базе ООО «Рога и Копыта»
--
-- Пиши запрос под каждым заданием и заканчивай его точкой с запятой ;
-- Строки «-- Задание N» не удаляй и не меняй — по ним проверяется работа.
-- Подробные условия и подсказки — в README.md.

-- ===================== Часть A. Выборка из одной таблицы =====================

-- Задание 1. Все товары (все столбцы)
SELECT * FROM products;

-- Задание 2. Название и цена всех товаров
SELECT name, price FROM products;

-- Задание 3. Название и цена товаров дороже 1000 рублей
SELECT name, price from products WHERE price >1000;

-- Задание 4. Название и цена всех товаров — от самого дорогого к самому дешёвому
SELECT name FROM products ORDER BY price DESC;

-- Задание 5. Название и цена пяти самых дешёвых товаров (сначала самый дешёвый)
SELECT name, price FROM products ORDER BY price LIMIT 5;

-- Задание 6. Клиенты из Казани (все столбцы)
SELECT name FROM clients WHERE city = 'Казань';

-- Задание 7. Название и цена товаров, в названии которых есть слово «Кофе»
SELECT name, price FROM products WHERE name LIKE '%Кофе%';

-- Задание 8. Названия товаров, которых нет на складе
SELECT name FROM products WHERE stock =0;

-- Задание 9. Заказы, сделанные в 2025 году (все столбцы)
SELECT * FROM orders WHERE order_date >= '2025-01-01' AND order_date < '2026-01-01';

-- ===================== Часть B. Подсчёты и группировка =====================

-- Задание 10. Сколько всего товаров в каталоге
SELECT COUNT(*) FROM products;

-- Задание 11. Средняя цена товара, округлённая до целых
SELECT ROUND( AVG(price), 0 ) FROM products;


-- Задание 12. Город и сколько в нём клиентов. Сначала города с большим числом клиентов, при равенстве — по алфавиту
SELECT city, COUNT(*) FROM clients GROUP BY city ORDER BY COUNT (*) DESC, city ASC;

-- Задание 13. Города, в которых больше одного клиента, и число клиентов в них
SELECT city, COUNT(*) FROM clients GROUP BY city HAVING COUNT(*) >1;


-- Задание 14. Номер категории и сколько всего штук товаров этой категории лежит на складе
SELECT category_id, SUM(stock) FROM products GROUP BY category_id; 

-- Задание 15. Номер заказа и его сумма (количество × цена по всем строкам заказа)
SELECT order_id, SUM( quantity * price ) FROM order_items GROUP BY order_id;

-- ===================== Часть C. Несколько таблиц =====================

-- Задание 16. Название товара и название его категории
SELECT products.name, categories.name 
FROM products 
JOIN categories ON products.category_id = categories.id;

-- Задание 17. Номер заказа, дата заказа и название клиента
SELECT orders.id, order_date, clients.name
FROM orders
JOIN clients ON orders.client_id = clients.id;

-- Задание 18. Три клиента, которые купили больше всех: название клиента и сумма всех его заказов, от большей к меньшей
SELECT clients.name, SUM( order_items.quantity * order_items.price) AS total_sum
FROM clients
JOIN orders ON clients.id = orders.client_id
JOIN order_items ON orders.id = order_items.order_id
GROUP BY clients.name
ORDER BY total_sum DESC
LIMIT 3;

-- Задание 19. Названия товаров, которые ни разу не заказывали
-- Задание 19. Названия товаров, которые ни разу не заказывали
SELECT products.name
FROM products
LEFT JOIN order_items  ON products.id = order_items.product_id
WHERE order_items.product_id IS NULL;


-- ===================== Часть D. Изменение данных =====================

-- Задание 20. Добавь товар «Ручка шариковая синяя»: категория 3, цена 50, на складе 200


-- Задание 21. Подними цены на все товары категории «Канцелярия» на 10%


-- Задание 22. Удали товар «Ручка шариковая синяя»


-- Задание 23. Создай таблицу employees и добавь в неё шесть сотрудников (см. README.md)

