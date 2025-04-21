-- View the menu_items table and write a query to find the number of items on the menu.
SELECT
    *
FROM menu_items;

SELECT
    COUNT(menu_item_id) AS number_of_menu_items
FROM menu_items;

-- What are the least and most expensive items on the menu?
SELECT
   *
FROM menu_items
ORDER BY price
LIMIT 1;

SELECT
    *
FROM menu_items
ORDER BY price DESC
LIMIT 1;

-- How many Italian dishes  are on the menu? Least and most expensive Italian dishes?
SELECT
    category,
    COUNT(menu_item_id) AS itlaian_dishes,
    MIN(price) AS least_expensive,
    MAX(price) AS most_expensive
FROM menu_items
WHERE category = 'Italian';



-- How many dishes are in each category and what is the average price per dish in each category?
SELECT
    category,
    COUNT(category) AS category_count,
    ROUND(AVG(price), 2) AS average_price
FROM menu_items
GROUP BY category;

-- What is the date range of the order details table?
SELECT
    *
FROM order_details;

SELECT
    MIN(order_date) AS oldest_order_date,
    MAX(order_date) AS newest_order_date
FROM order_details;

-- How many orders were made within this date range? How many items were ordered within this range?
SELECT
    COUNT(DISTINCT order_id) AS orders_made,
    COUNT(order_id) AS total_items
FROM order_details;

-- Order that had the most number of items?
SELECT
    order_id,
    COUNT(item_id) AS total_items
FROM order_details
GROUP BY order_id
ORDER BY total_items DESC
LIMIT 1;

-- How many orders had more than 12 items?
SELECT
    COUNT(*) AS twelve_plus_orders
FROM
(SELECT
    order_id,
    COUNT(item_id) AS total_items
FROM order_details
GROUP BY order_id
HAVING total_items > 12) AS orders;

-- Combine two tables into one table
SELECT
    *
FROM order_details AS od LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id;

-- What were the least and most ordered items in what categories?
SELECT
    item_name,
    category,
    COUNT(order_details_id) AS purchases
FROM order_details AS od LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
GROUP BY item_name,
         category
ORDER BY purchases
LIMIT 1;

SELECT
    item_name,
    category,
    COUNT(order_details_id) AS purchases
FROM order_details AS od LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
GROUP BY item_name,
         category
ORDER BY purchases DESC
LIMIT 1;


-- Five most expensive orders. Details of the highest spend order, what items were purchased?
SELECT
    order_id,
    SUM(price) AS total
FROM order_details AS od LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total DESC
LIMIT 5;

SELECT
    category,
    COUNT(item_id) AS items_count
FROM order_details AS od LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;

-- View top 5 orders, category, and purchase per order.
SELECT
    order_id,
    category,
    COUNT(item_id) AS total_items,
    SUM(price) AS total_spent
FROM order_details AS od LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category
LIMIT 5;



