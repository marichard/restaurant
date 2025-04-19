-- View the menu_items table and write a query to find the number of items on the menu.
SELECT
    *
FROM menu_items;

SELECT
    COUNT(menu_item_id) AS number_of_menu_items
FROM menu_items;

-- What are the least and most expensive items on the menu?
SELECT -- least expensive
   *
FROM menu_items
ORDER BY price;

SELECT -- most expensive
    *
FROM menu_items
ORDER BY price DESC;

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