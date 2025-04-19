# Restaurant
Order Analysis

1.  View the menu items
```sql
SELECT
    *
FROM menu_items;
```
Results sample 
| menu\_item\_id | item\_name | category | price |
| :--- | :--- | :--- | :--- |
| 101 | Hamburger | American | 12.95 |
| 102 | Cheeseburger | American | 13.95 |
| 103 | Hot Dog | American | 9.00 |
| 104 | Veggie Burger | American | 10.50 |
| 105 | Mac & Cheese | American | 7.00 |
| 106 | French Fries | American | 7.00 |
| 107 | Orange Chicken | Asian | 16.50 |
| 108 | Tofu Pad Thai | Asian | 14.50 |
| 109 | Korean Beef Bowl | Asian | 17.95 |
| 110 | Pork Ramen | Asian | 17.95 |

2. Count the number of items on the menu
```sql
SELECT
    COUNT(menu_item_id)
FROM menu_items;
```

Results
| COUNT\(menu\_item\_id\) |
| :--- |
| 32 |
