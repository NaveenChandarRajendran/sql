-- Basic Retrival using operators

select * from order_items where order_id = 6 and unit_price * quantity > 30;

-----------------------------------------------------------------------------------------------
-- IN operator
-----------------------------------------------------------------------------------------------
-- Worst query
select * from customers where state = 'VA' or state = 'FL' or state = 'GA';

-- Using IN operator we can simple the above query as
select * from customers where state in ('VA','FL','GA');
select * from products where quantity_in_stock in (49,38,72);
-- Using Not IN
select * from customers where state not in ('VA','FL','GA');

------------------------------------------------------------------------------------------------
-- Between operator
------------------------------------------------------------------------------------------------

-- Worst query
select * from customers where points >= 1000 and points <= 3000;

-- Using Between query
select * from customers where points between 1000 and 3000;

select * from customers where birth_date between '1990-1-1' and '2000-1-1';

-------------------------------------------------------------------------------------------------
-- Like operator
-------------------------------------------------------------------------------------------------

select * from customers where last_name like 'b%'
-- This query is used to get the last name which starting b. % is used to say whatever charecters after that.
select * from customers where last_name like '%b%';
-- This query will look for wheather the lastname has b. It can be start,middle or last.
select * from customers where last_name like '%y';
-- Lastname should be end with y
select * from customers where last_name like '_____y';
-- _ is used to find single charector.  _ should match the exact number of charector . the above query has 5 _ after that y. So the sql will search for exact pattern like Boagey, Naseby etc.
select * from customers where last_name like 'b____y';
-- It will match the same conventions.
select * from customers where address like '%TRAIL%' or 
							  address like '%AVENUE%' and phone like '%9';

------------------------------------------------------------------------------------------------------
-- Regexp
------------------------------------------------------------------------------------------------------

-- It is also works very good for searching text.

select * from customers where last_name regexp 'field';

-- ^ Symbol is used to declare the text must be start with
select * from customers where last_name regexp '^field';

-- $ Symbol is used to declare the text must be end with
select * from customers where last_name regexp 'field$';

-- | is used to find the multiple value of the column;
select * from customers where last_name regexp 'field|mac|rose';

-- This query will find the last name where end with e before e any of the charector can present inside array like g-e,i-e,m-e.
select * from customers where last_name regexp '[gim]e';
-- Start with e and match with array charectors.
select * from customers where last_name regexp 'e[gim]';

-- This query will check like a to h
select * from customers where last_name regexp '[a-h]e';

-- excercise
select * from customers where first_name regexp 'elka|ambur';
select * from customers where last_name regexp 'ey$|on$';
select * from customers where last_name regexp '^my|se';
select * from customers where last_name regexp 'b[ru]';

------------------------------------------------------------------------------------------------------
-- Not Null
------------------------------------------------------------------------------------------------------

select * from customers where phone is null;
select * from orders where shipped_date is not null;

------------------------------------------------------------------------------------------------------
-- Order By
------------------------------------------------------------------------------------------------------

select * from order_items where order_id =2 order by (quantity * unit_price) desc;