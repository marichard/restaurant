# Restaurant
Order Analysis

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
ORDER BY price;
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
ORDER BY price DESC;
```
Results
| menu\_item\_id | item\_name | category | price |
| :--- | :--- | :--- | :--- |
| 130 | Shrimp Scampi | Italian | 19.95 |
