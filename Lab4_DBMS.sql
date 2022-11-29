show databases;
-- Database creation --
create database if not exists e_commerce;
use e_commerce;
-- Create tab supplier --
create table if not exists supplier(
supp_id int unsigned primary key,
supp_name varchar(50) not null,
supp_city varchar(50) not null,
supp_phone varchar(15) not null
);

-- Create table customer--
create table if not exists customer (
	cus_id int unsigned primary key,
    cus_name varchar(20) not null,
    cus_phone varchar(15) not null,
    cus_email varchar(30) not null unique,
    cus_city varchar(30) not null,
    cus_gender enum('M','F') not null
);

-- Create table Catogory --
create table if not exists catogory (
	cat_id int unsigned primary key,
    cat_name varchar(20) not null,
    parent_cat_id int unsigned,
    foreign key(parent_cat_id) references catogory(cat_id)
);
-- Create table product -- 
create table if not exists product (
	pro_id int unsigned primary key,
    pro_name varchar(50) not null default "dummy",
    pro_desc varchar(100) not null,
    cat_id int unsigned not null,
    foreign key(cat_id) references catogory(cat_id)
);
-- Create table supplier_pricing
create table if not exists supplier_pricing (
	pricing_id int unsigned primary key,
    pro_id int unsigned not null,
    supp_id int unsigned not null,
    supp_price int unsigned not null default 0,
    foreign key (pro_id) references product(pro_id),
    foreign key (supp_id) references supplier(supp_id)
);
-- Create table order --
create table if not exists `order`(
	ord_id int unsigned primary key,
	ord_amount int not null,
	ord_date date not null,
	cus_id int unsigned not null,
	pricing_id int unsigned not null,
	foreign key(cus_id) references customer(cus_id),
	foreign key(pricing_id) references supplier_pricing(pricing_id)
);
 -- Create table rating --
 create table if not exists rating(
	rat_id int unsigned primary key,
    ord_id int unsigned not null,
    rat_stars int not null,
    foreign key(ord_id) references `order`(ord_id)
);

-- Inserting values into supplier table --
INSERT INTO supplier(supp_id ,supp_name,supp_city,supp_phone) VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO supplier(supp_id ,supp_name,supp_city,supp_phone) VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO supplier(supp_id ,supp_name,supp_city,supp_phone) VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO supplier(supp_id ,supp_name,supp_city,supp_phone) VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO supplier(supp_id ,supp_name,supp_city,supp_phone) VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

-- Inserting values into customer table --
INSERT INTO customer(cus_id,cus_name,cus_phone,cus_email,cus_city,cus_gender) VALUES(1,"AAKASH",'9999999999',"aakash19@gmail.com","DELHI",'M');
INSERT INTO customer(cus_id,cus_name,cus_phone,cus_email,cus_city,cus_gender) VALUES(2,"AMAN",'9785463215',"aman25@gmail.com","NOIDA",'M');
INSERT INTO customer(cus_id,cus_name,cus_phone,cus_email,cus_city,cus_gender) VALUES(3,"NEHA",'9999999999',"neha39@gmail.com","MUMBAI",'F');
INSERT INTO customer(cus_id,cus_name,cus_phone,cus_email,cus_city,cus_gender) VALUES(4,"MEGHA",'9994562399',"megha45@gmail.com","KOLKATA",'F');
INSERT INTO customer(cus_id,cus_name,cus_phone,cus_email,cus_city,cus_gender) VALUES(5,"PULKIT",'7895999999',"pulkit59@gmail.com","LUCKNOW",'M');

-- Inserting values into Catogory table --
INSERT INTO catogory(cat_id,cat_name,parent_cat_id) VALUES( 1,"BOOKS",1);
INSERT INTO catogory(cat_id,cat_name,parent_cat_id) VALUES(2,"GAMES",2);
INSERT INTO catogory(cat_id,cat_name,parent_cat_id) VALUES(3,"GROCERIES",3);
INSERT INTO catogory(cat_id,cat_name,parent_cat_id) VALUES (4,"ELECTRONICS",4);
INSERT INTO catogory(cat_id,cat_name,parent_cat_id) VALUES(5,"CLOTHES",5);

-- Inserting values into product table --
INSERT INTO product(pro_id,pro_name,pro_desc,cat_id) VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO product(pro_id,pro_name,pro_desc,cat_id) VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO product(pro_id,pro_name,pro_desc,cat_id) VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO product(pro_id,pro_name,pro_desc,cat_id) VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO product(pro_id,pro_name,pro_desc,cat_id) VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO product(pro_id,pro_name,pro_desc,cat_id) VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO product(pro_id,pro_name,pro_desc,cat_id) VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO product(pro_id,pro_name,pro_desc,cat_id) VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO product(pro_id,pro_name,pro_desc,cat_id) VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO product(pro_id,pro_name,pro_desc,cat_id) VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO product(pro_id,pro_name,pro_desc,cat_id) VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO product(pro_id,pro_name,pro_desc,cat_id) VALUES(12,"Train Your Brain","By Shireen Stephen",1);

-- Inserting values into supplier_pricing table --
INSERT INTO supplier_pricing(pricing_id,pro_id,supp_id,supp_price) VALUES(1,1,2,1500);
INSERT INTO supplier_pricing(pricing_id,pro_id,supp_id,supp_price) VALUES(2,3,5,30000);
INSERT INTO supplier_pricing(pricing_id,pro_id,supp_id,supp_price) VALUES(3,5,1,3000);
INSERT INTO supplier_pricing(pricing_id,pro_id,supp_id,supp_price) VALUES(4,2,3,2500);
INSERT INTO supplier_pricing(pricing_id,pro_id,supp_id,supp_price) VALUES(5,4,1,1000);
INSERT INTO supplier_pricing(pricing_id,pro_id,supp_id,supp_price) VALUES(6,12,2,780);
INSERT INTO supplier_pricing(pricing_id,pro_id,supp_id,supp_price) VALUES(7,12,4,789);
INSERT INTO supplier_pricing(pricing_id,pro_id,supp_id,supp_price) VALUES(8,3,1,31000);
INSERT INTO supplier_pricing(pricing_id,pro_id,supp_id,supp_price) VALUES(9,1,5,1450);
INSERT INTO supplier_pricing(pricing_id,pro_id,supp_id,supp_price) VALUES(10,4,2,999);
INSERT INTO supplier_pricing(pricing_id,pro_id,supp_id,supp_price) VALUES(11,7,3,549);
INSERT INTO supplier_pricing(pricing_id,pro_id,supp_id,supp_price) VALUES(12,7,4,529);
INSERT INTO supplier_pricing(pricing_id,pro_id,supp_id,supp_price) VALUES(13,6,2,105);
INSERT INTO supplier_pricing(pricing_id,pro_id,supp_id,supp_price) VALUES(14,6,1,99);
INSERT INTO supplier_pricing(pricing_id,pro_id,supp_id,supp_price) VALUES(15,2,5,2999);
INSERT INTO supplier_pricing(pricing_id,pro_id,supp_id,supp_price) VALUES(16,5,2,2999);

-- Inserting values into order table --
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (102,1000,"2021-10-12",3,5);
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (103,30000,"2021-09-16",5,3);
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (104,1500,"2021-10-05",1,1);
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (105,3000,"2021-08-16",4,3);
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (106,1450,"2021-08-18",1,9);
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (107,789,"2021-09-01",3,7);
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (108,780,"2021-09-07",5,6);
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (109,3000,"2021-09-10",5,3);
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (110,2500,"2021-09-10",2,4);
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (111,1000,"2021-09-15",4,5);
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (112,789,"2021-09-16",4,7);
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (113,31000,"2021-09-16",1,8);
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (114,1000,"2021-09-16",3,5);
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (115,3000,"2021-09-16",5,3);
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (116,99,"2021-09-17",2,14);

-- Inserting values into rating table --

INSERT INTO rating(rat_id,ord_id,rat_stars) VALUES(1,101,4);
INSERT INTO rating(rat_id,ord_id,rat_stars) VALUES(2,102,3);
INSERT INTO rating(rat_id,ord_id,rat_stars) VALUES(3,103,1);
INSERT INTO rating(rat_id,ord_id,rat_stars) VALUES(4,104,2);
INSERT INTO rating(rat_id,ord_id,rat_stars) VALUES(5,105,4);
INSERT INTO rating(rat_id,ord_id,rat_stars) VALUES(6,106,3);
INSERT INTO rating(rat_id,ord_id,rat_stars) VALUES(7,107,4);
INSERT INTO rating(rat_id,ord_id,rat_stars) VALUES(8,108,4);
INSERT INTO rating(rat_id,ord_id,rat_stars) VALUES(9,109,3);
INSERT INTO rating(rat_id,ord_id,rat_stars) VALUES(10,110,5);
INSERT INTO rating(rat_id,ord_id,rat_stars) VALUES(11,111,3);
INSERT INTO rating(rat_id,ord_id,rat_stars) VALUES(12,112,4);
INSERT INTO rating(rat_id,ord_id,rat_stars) VALUES(13,113,2);
INSERT INTO rating(rat_id,ord_id,rat_stars) VALUES(14,114,1);
INSERT INTO rating(rat_id,ord_id,rat_stars) VALUES(15,115,1);
INSERT INTO rating(rat_id,ord_id,rat_stars) VALUES(16,116,0);

-- 3)Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.--
select c.cus_gender as Customer_Gender, count(*) as Order_Count, sum(o.ord_amount) as Order_amount from customer as c inner join `order` as o on o.cus_id = c.cus_id where ord_amount >= 3000 group by c.cus_gender;

-- 4)Display all the orders along with product name ordered by a customer having Customer_Id=2--
select supplier.SUPP_NAME, product.PRO_NAME, supplier_pricing.PRICING_ID, `order`.ORD_ID, customer.CUS_NAME from `order` 
inner join customer on `order`.CUS_ID=customer.CUS_ID 
inner join supplier_pricing on `order`.PRICING_ID=supplier_pricing.PRICING_ID
inner join supplier on supplier.SUPP_ID=supplier_pricing.SUPP_ID
inner join product on supplier_pricing.PRO_ID=product.PRO_ID
where `order`.CUS_ID=2;

 -- 5)Display the Supplier details who can supply more than one product--
select s.SUPP_NAME, count(p.PRO_NAME) as product_count from supplier as s inner join supplier_pricing as sp on s.SUPP_ID=sp.SUPP_ID
inner join product as p on p.PRO_ID=sp.PRO_ID group by s.SUPP_NAME having count(p.PRO_NAME)>1;

-- 6)Find the least expensive product from each category and print the table with category id, name, product name and price of the product--
select * from supplier where SUPP_ID=5;
select PRO_ID, min(SUPP_PRICE) from supplier_pricing group by PRO_ID, SUPP_ID;
select cat.CAT_ID, cat.CAT_NAME, p.PRO_NAME, sp.SUPP_PRICE from category as cat
inner join product as p on cat.CAT_ID=p.CAT_ID
inner join supplier_pricing as sp on sp.PRO_ID=p.PRO_ID
group by cat.CAT_NAME having min(sp.SUPP_PRICE);

-- 7)Display the Id and Name of the Product ordered after “2021-10-05”--
select PRICING_ID from `order` where ORD_DATE > '2021-10-05';
select PRO_ID from supplier_pricing where PRICING_ID in (select PRICING_ID from `order` where ORD_DATE > '2021-10-05');
select PRO_ID, PRO_NAME from product where PRO_ID in (select PRO_ID from supplier_pricing where PRICING_ID in (select PRICING_ID from `order` where ORD_DATE > '2021-10-05'));

-- 8)Display customer name and gender whose names start or end with character 'A'--
select customer.cus_name,customer.cus_gender from customer where customer.cus_name like 'A%' or customer.cus_name like '%A';

-- 9)Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”--
select `order`.PRICING_ID, avg(rating.RAT_STARS) as rating, case 
when avg(rating.RAT_STARS)=5 then 'Excellent Service'
when avg(rating.RAT_STARS)>4 then 'Good Service'
when avg(rating.RAT_STARS)>2 then 'Average Service'
else 'Poor Service' end as Type_of_Service from `order` 
inner join rating where `order`.ORD_ID=rating.ORD_ID group by `order`.PRICING_ID;



