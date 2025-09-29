use ecommerce;
select customer.name,orders.orderID from customer inner join orders on customer.customerID=orders.customerID;
select customer.name,orders.orderID from customer left join orders on customer.customerID=orders.customerID;
select customer.name,orders.orderID from customer right join orders on customer.customerID=orders.customerID;
select customer.name,orders.orderID from customer full join orders on customer.customerID=orders.customerID;