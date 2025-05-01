# Restaurant Operations Analysis
Explore customer data to see which menu items are doing well/not so well and what customers seem to like best.  
Main objectives:  
1. Get an idea of what's on the menu.
2. Get an idea of the collected data.
3. Understand how customers are reacting to the menu items available.

## Tools
IDE: PyCharm  
Language: SQL  
Database: MySQL   


### Objective 1

1.  View the menu items
```sql
SELECT
    *
FROM menu_items;
```
Results
| menu\_item\_id | item\_name | category | price |
| :--- | :--- | :--- | :--- |
| 113 | Edamame | Asian | 5.00 |
| 105 | Mac & Cheese | American | 7.00 |
| 106 | French Fries | American | 7.00 |
| 122 | Chips & Salsa | Mexican | 7.00 |
| 103 | Hot Dog | American | 9.00 |
| 114 | Potstickers | Asian | 9.00 |
| 123 | Chips & Guacamole | Mexican | 9.00 |
| 104 | Veggie Burger | American | 10.50 |
| 121 | Cheese Quesadillas | Mexican | 10.50 |
| 111 | California Roll | Asian | 11.95 |
| 115 | Chicken Tacos | Mexican | 11.95 |
| 119 | Chicken Torta | Mexican | 11.95 |
| 101 | Hamburger | American | 12.95 |
| 117 | Chicken Burrito | Mexican | 12.95 |
| 102 | Cheeseburger | American | 13.95 |
| 116 | Steak Tacos | Mexican | 13.95 |
| 120 | Steak Torta | Mexican | 13.95 |
| 108 | Tofu Pad Thai | Asian | 14.50 |
| 124 | Spaghetti | Italian | 14.50 |
| 126 | Fettuccine Alfredo | Italian | 14.50 |
| 112 | Salmon Roll | Asian | 14.95 |
| 118 | Steak Burrito | Mexican | 14.95 |
| 128 | Cheese Lasagna | Italian | 15.50 |
| 129 | Mushroom Ravioli | Italian | 15.50 |
| 107 | Orange Chicken | Asian | 16.50 |
| 132 | Eggplant Parmesan | Italian | 16.95 |
| 109 | Korean Beef Bowl | Asian | 17.95 |
| 110 | Pork Ramen | Asian | 17.95 |
| 125 | Spaghetti & Meatballs | Italian | 17.95 |
| 127 | Meat Lasagna | Italian | 17.95 |
| 131 | Chicken Parmesan | Italian | 17.95 |
| 130 | Shrimp Scampi | Italian | 19.95 |


2. Count the number of items on the menu
```sql
SELECT
    COUNT(menu_item_id) AS number_of_menu_items
FROM menu_items;
```

Results
| number\_of\_menu\_items |
| :--- |
| 32 |

3. Least expensive menu item
```sql
SELECT 
   *
FROM menu_items
ORDER BY price
LIMIT 1;
```
Results
| menu\_item\_id | item\_name | category | price |
| :--- | :--- | :--- | :--- |
| 113 | Edamame | Asian | 5.00 |

4. Most expensive menu item
```sql
SELECT
    *
FROM menu_items
ORDER BY price DESC
LIMIT 1;
```
Results
| menu\_item\_id | item\_name | category | price |
| :--- | :--- | :--- | :--- |
| 130 | Shrimp Scampi | Italian | 19.95 |

5. How Many Italian dishes are on the menu? What are the least and most expensive Italian dishes?
```sql
SELECT
    category,
    COUNT(menu_item_id) AS itlaian_dishes,
    MIN(price) AS least_expensive,
    MAX(price) AS most_expensive
FROM menu_items
WHERE category = 'Italian';
```
Result
| category | itlaian\_dishes | least\_expensive | most\_expensive |
| :--- | :--- | :--- | :--- |
| Italian | 9 | 14.50 | 19.95 |

6. How many dishes are in each category and what is the average price per dish in each category?
```sql
SELECT
    category,
    COUNT(category) AS category_count,
    ROUND(AVG(price), 2) AS average_price
FROM menu_items
GROUP BY category;
```
Results
| category | category\_count | average\_price |
| :--- | :--- | :--- |
| American | 6 | 10.07 |
| Asian | 8 | 13.48 |
| Mexican | 9 | 11.80 |
| Italian | 9 | 16.75 |

### Obective 2  
1. What is the date range of the order details table?
```sql
SELECT
    MIN(order_date) AS oldest_order_date,
    MAX(order_date) AS newest_order_date
FROM order_details;
```
Results
| oldest\_order\_date | newest\_order\_date |
| :--- | :--- |
| 2023-01-01 | 2023-03-31 |

2. How many orders were made and amount of items within this date range?
```sql
SELECT
    COUNT(DISTINCT order_id) AS orders_made,
    COUNT(order_id) AS total_items
FROM order_details;
```
Results
| orders\_made | total\_items |
| :--- | :--- |
| 5370 | 12234 |

3. Oredr that had the most items
```sql
SELECT
    order_id,
    COUNT(item_id) AS total_items
FROM order_details
GROUP BY order_id
ORDER BY total_items DESC
LIMIT 1;
```
Results
| order\_id | total\_items |
| :--- | :--- |
| 330 | 14 |

4. How many orders had more than 12 items?
```sql
SELECT
    COUNT(*) AS twelve_plus_orders
FROM
(SELECT
    order_id,
    COUNT(item_id) AS total_items
FROM order_details
GROUP BY order_id
HAVING total_items > 12) AS orders;
```
Results
| twelve\_plus\_orders |
| :--- |
| 20 |

### Final Objective 3
1. Combine both tables into one table
```sql
SELECT
    *
FROM order_details AS od LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
LIMIT 5;
```
Results
| order\_details\_id | order\_id | order\_date | order\_time | item\_id | menu\_item\_id | item\_name | category | price |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | 1 | 2023-01-01 | 11:38:36 | 109 | 109 | Korean Beef Bowl | Asian | 17.95 |
| 2 | 2 | 2023-01-01 | 11:57:40 | 108 | 108 | Tofu Pad Thai | Asian | 14.50 |
| 3 | 2 | 2023-01-01 | 11:57:40 | 124 | 124 | Spaghetti | Italian | 14.50 |
| 4 | 2 | 2023-01-01 | 11:57:40 | 117 | 117 | Chicken Burrito | Mexican | 12.95 |
| 5 | 2 | 2023-01-01 | 11:57:40 | 129 | 129 | Mushroom Ravioli | Italian | 15.50 |

2. What was the least ordered item in what category?
```sql
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
```
Results
| item\_name | category | purchases |
| :--- | :--- | :--- |
| Chicken Tacos | Mexican | 123 |

3. What was the most ordered item in what category?
```sql
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
```
Results
| item\_name | category | purchases |
| :--- | :--- | :--- |
| Hamburger | American | 622 |

4. Five most expensive orders
```sql
SELECT
    order_id,
    SUM(price) AS total
FROM order_details AS od LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total DESC
LIMIT 5;
```
Results
| order\_id | total |
| :--- | :--- |
| 440 | 192.15 |
| 2075 | 191.05 |
| 1957 | 190.10 |
| 330 | 189.70 |
| 2675 | 185.10 |

5. Highest spend order details.
```sql
SELECT
    category,
    COUNT(item_id) AS items_count
FROM order_details AS od LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;
```
Results
| category | items\_count |
| :--- | :--- |
| Mexican | 2 |
| American | 2 |
| Italian | 8 |
| Asian | 2 |

6. Top five orders, category, and purchases per order.
```sql
SELECT
    order_id,
    category,
    COUNT(item_id) AS total_items,
    SUM(price) AS total_spent
FROM order_details AS od LEFT JOIN menu_items AS mi
    ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category
ORDER BY total_spent DESC
LIMIT 5;
```
Results
| order\_id | category | total\_items | total\_spent |
| :--- | :--- | :--- | :--- |
| 440 | Italian | 8 | 132.25 |
| 2075 | Italian | 6 | 99.80 |
| 330 | Asian | 6 | 87.40 |
| 1957 | Italian | 5 | 84.30 |
| 2675 | Italian | 4 | 63.90 |
