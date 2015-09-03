    -- 1. Selects the names of all products that are not on sale.
select name from products where on_sale = 'f';
-- Teddy Bear
-- Cat Ears
-- Card Against Humanity
-- Set of 12 Mason Jars

    -- 2. Selects the names of all products that cost less than £20.
select name from products where price < 20;
-- Teddy Bear
-- The Ruby Programming Language
-- Silicon Valley Monopoly
-- Set of 12 Mason Jars

    -- 3. Selects the name and price of the most expensive product.
select name, max(price) from products;
Cat Ears|99.99

    -- 4. Selects the name and price of the second most expensive product.
select name, Max(price) from products where name <> 'Cat Ears';
Brown Leather Boots|82.0

    -- 5. Selects the name and price of the least expensive product.
select name, Min(price) from products;
Set of 12 Mason Jars|6.22

    -- 6. Selects the names and prices of all products, ordered by price in descending order.
select name, price from products order by price desc;
Cat Ears|99.99
Brown Leather Boots|82.0
Lonely Pillow|78.82
Card Against Humanity|25.0
Hoodie|25.0
Set of silverware|22.99
The Ruby Programming Language|19.99
Teddy Bear|17.99
Silicon Valley Monopoly|10.99
Set of 12 Mason Jars|6.22

    -- 7. Selects the average price of all products.
select avg(price) from products;
38.899

    -- 8. Selects the sum of the price of all products.
select sum(price) from products;
388.99

    -- 9. Selects the sum of the price of all products whose prices is less than £20.
select sum(price) from products where price < 20;
55.19

    -- 10. Selects the id of the user with your name.
select id from users where name = 'ALex Chin';
14

    -- 11. Selects the names of all users whose names start with the letter "J".
select name 
from users 
where name like 'J%';
Jon Rogers
James Gotsell

    -- 12. Selects the number of users whose first names are "Spencer".
select distinct count(name) 
from users 
where name like 'Spencer%';
1

    -- 13. Selects the number of users who want a "Teddy Bear".
select distinct count(w.user_id) 
from wishlists as w join products as p on w.product_id = p.id 
where p.name = 'Teddy Bear'; 
6   

    -- 14. Selects the count of items on the wishlish of the user with your name.
select distinct count(w.product_id) 
from wishlists as w join users as u on w.user_id = u.id 
where u.name = 'ALex Chin';
1

    -- 15. Selects the count and name of all products on the wishlist, ordered by count in descending order.
select p.name, count(p.id) as popularity
from products as p 
  join wishlists as w 
  on p.id = w.product_id
group by name
order by count(p.id) desc; 

-- Hoodie|17
-- Card Against Humanity|16
-- Cat Ears|15
-- The Ruby Programming Language|9
-- Teddy Bear|6
-- Silicon Valley Monopoly|5
-- Brown Leather Boots|4
-- Lonely Pillow|2
-- Set of 12 Mason Jars|2

    -- 16. Selects the count and name of all products that are not on sale on the wishlist, ordered by count in descending order.
select p.name, count(p.id)
from products as p 
  join wishlists as w 
  on p.id = w.product_id
where p.on_sale = 'f'
group by name
order by count(p.id) desc; 

-- Card Against Humanity|16
-- Cat Ears|15
-- Teddy Bear|6
-- Set of 12 Mason Jars|2 

    -- 17. Inserts a user with the name "Jonathan Anderson" into the users table. Ensure the created_at column is set to the current time.
insert into users (id, created_at, name) values (15, CURRENT_TIMESTAMP, 'Jonathan Anderson');

    -- 18. Selects the id of the user with the name "Jonathan Anderson"?
select id from users where name = 'Jonathan Anderson';
15

    -- 19. Inserts a wishlist entry for the user with the name "Jonathan Anderson" for the product "The Ruby Programming Language".
insert into wishlists (id, created_at, user_id, product_id) values (78, CURRENT_TIMESTAMP, 15, 4);


    -- 20. Updates the name of the "Jonathan Anderson" user to be "Jon Anderson".
update users set name = 'Jon Anderson' where id = 15;

    -- 21. Deletes the user with the name "Jon Anderson".
delete from users where name = 'Jon Anderson';

    -- 22. Deletes the wishlist item for the user you just deleted.
delete from wishlists where id in (
  select w.id from wishlists as w 
  left join users as u 
  on w.user_id = u.id
  where u.name is null
);
 