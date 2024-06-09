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