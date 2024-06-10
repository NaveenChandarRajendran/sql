--------------------------------------------------------------------------
-- Inner Join
--------------------------------------------------------------------------
select p.product_id,p.name,oi.quantity,oi.unit_price from order_items oi
join products p on oi.product_id = p.product_id;

--------------------------------------------------------------------------
-- Self Join
--------------------------------------------------------------------------

select * from employee e
join employee m on m.report_to = e.employee_id; 

---------------------------------------------------------------------------
-- Multi Join table
---------------------------------------------------------------------------
select c.name,p.date,pm.name from payments p
join clients c on
p.client_id = c.client_id
join payment_methods pm on
pm.payment_method_id = p.payment_method;

--------------------------------------------------------------------------
-- Left Join
--------------------------------------------------------------------------
select p.product_id,p.name,oi.quantity from products p
left join order_items oi on
oi.product_id = p.product_id;

--------------------------------------------------------------------------
USING 
--------------------------------------------------------------------------
select p.date,c.name,p.amount,pm.name from payments p 
join clients c 
	-- on p.client_id = c.client_id
    using (client_id)
join payment_methods pm 
	on pm.payment_method_id = p.payment_method;

-- From the both client and payments table the client id column name is same so we can use USING.
-- If the both table column name is not same we need to use ON only

-----------------------------------------------------------------------------
-- Natural Joins
-----------------------------------------------------------------------------

-- The natural join itself will look for the both table for join. If the column name 
-- of the two table is same means it will join and produce the result.

select * from orders natural join customers;

-------------------------------------------------------------------------------
-- Cross Join
------------------------------------------------------------------------------

select p.product_id,p.name as product,s.shipper_id,s.name as shipper,p.quantity_in_stock from products p,shippers s;


select p.product_id,p.name as product,s.shipper_id,s.name as shipper,p.quantity_in_stock from products p
cross join shippers s;

-- Cross join will compare every record with other mentionsed table record. So there is ON condition.

-------------------------------------------------------------------------------------
-- UNIONS
-------------------------------------------------------------------------------------

select customer_id,first_name,points,'Bronze' as type from customers where points < 2000
union
select  customer_id,first_name,points,'Silver' as type from customers where points  between  2000 and 3000 
union
select  customer_id,first_name,points,'Gold' as type from customers where points > 3000 order by first_name;

-- We can combine one or more query by using UNION key