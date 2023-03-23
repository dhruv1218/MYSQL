show databases

use mydatabase

create table Product(
Code int(2),
Name varchar(20),
Price int(4),
Manufacturer int(2)
)
 
select * from Product 


insert into Product(Code,Name,Price,Manufacturer)values
(1,"Hard ",240,5),
(2,"Memory",120,6),
(3,"Zip drive",150,4),
(4,"Floopy disk",5,6),
(5,"Monitor",240,1),
(6,"DVD drive",180,2),
(7,"CD driive",90,2),
(8,"Printer",270,3),
(9,"Toner cartridge",66,3),
(10,"DVD burner",180,2)


drop table product

truncate table product 

select * from Product

drop table Manufacture

create table Manufacture(
Code int(10),
Name varchar(20)
)

select * from Manufacture

insert into Manufacture(Code,Name)values
(1,"Sony"),
(2,"Creative Labs"),
(3,"Hewlett Packard"),
(4,"Iomega"),
(5,"Fujitsu"),
(6,"Winchester")

select * from Manufacture

#1 Select the names of all the products in the store
select Name from Product

#2 Select the names and the prices of all the products in the store
select Name,Price from Product

#3 Select the name of the products with a price less than or equal to $200
select Name from Product where Price<=200

#4 Select all the products with a price between $60 and $120
select Price from Product where Price between 60 and 120

#5 Select the name and price in cents (i.e. the price must be multiplied by 100)
select Name,Price/100 from Product 

#6 Compute the average price of all the products
select avg(Price) from Product

#7 Compute the average price of all products with manufacturer code equal to 2.
select avg(price) from product where manufacture=2

#8 Compute the number of products with a price larger than or equal to $180.
select count(name),Price from product where price>=180

#9 Select the name and price of all products with a price larger than orequal to $180, and sort first by price (in descending order), and then byname (in ascending order).
select Name,Price from Product where Price>=180 order by price desc,Name asc


#10 Select all the data from the products, including all the data for eachproduct's manufacturer
select product.code,product.name,product.price,product.manufacturer,manufacture.name as manufacturer_name from product
inner join manufacture
on product.manufacturer = manufacture.code

#11 .Select the product name, price, and manufacturer name of all the products
select product.name,product.price,manufacture.name as manufactuure_name from product 
left join manufacture
on product.manufacturer = manufacture.code

#12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
select avg(price),manufacture.code from product 
left join manufacture 
on product.manufacturer = manufacture.code
group by manufacturer 
order by manufacturer asc

#13 Select the average price of each manufacturer's products, showing the manufacturer's name.
select avg(price),manufacture.name from product 
left join manufacture 
on product.manufacturer = manufacture.code
group by manufacturer 
order by manufacturer asc

#14 Select the names of manufacturer whose products have an average price larger than or equal to $150
select avg(price),manufacture.name as manufacture_name from product  
left join manufacture 
on product.manufacturer = manufacture.code
group by manufacturer
having avg(price)>=150

#15 Select the name and price of the cheapest product.
select name,min(price) from product 

#16 Select the name of each manufacturer along with the name and price of its most expensive product.
select product.name,max(price),manufacture.name from product 
inner join manufacture 
on product.manufacturer = manufacture.code
where price in(select max(price) from product)


#17 Add a new product: Loudspeakers, $70, manufacturer 2.
insert into Product values(11,"Loudspeakers",70,2)

#18 Update the name of product 8 to "Laser Printer".
update product 
set name = "Laser Printer"
where Code = 8


#19 Apply a 10% discount to all products.
select price*0.9 as dis_price from product



#20 Apply a 10% discount to all products with a price larger than or equal to $120.
select price*0.9 as dis_price from product
where price>=120




