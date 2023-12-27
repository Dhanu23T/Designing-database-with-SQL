-- DDL Statements:
 Create TABLE if not exists Plant (
    ID INT unique primary key,
    Name varchar(50),
    Size varchar(50),
    Price int,
    TypeID int, 
    CategoryID int,
    Foreign key(TypeID) references PlantType(TypeID),
    Foreign key(CategoryID) references PlantCategory(CategoryID)
  );
 Create TABLE if not exists PlantType (
    TypeID int primary key,
    Name varchar(50)
  );
 Create Table if not exists PlantCategory(
   CategoryID int primary key,
   Name varchar(50)
 );
 Create Table if not exists Customer (
 CustomerId int unique primary key,
 First_Name varchar(25),
 Last_Name varchar(25),
 Mobile integer(20),
 Email varchar(80),
 Address varchar(255)
);

Create Table if not exists Orders (
 OrderId int not null primary key,
 CustomerID int,
 OrderDate date,
    OrderStatusId int,
 Total int,
    Foreign key(CustomerID) references Customer(CustomerID),
    Foreign key(OrderStatusId) references orderstatus(OrderStatusId)
);

Create Table if not exists OrderItems (
 ItemId int primary key,
 OrderId int,
 PlantId int,
 Quantity int,
 Subtotal int,
 Foreign key(OrderId) references Orders(OrderId),
    Foreign key(PlantID) references Plant(ID)
);

Create Table if not exists Payment (
 PaymentId int not null primary key,
 OrderId int ,
 Paydate date,
 Amount int,
 Method varchar(25),
    Foreign key(OrderId) references Orders(OrderId)
);

Create Table if not exists OrderStatus (
  OrderStatusId int  primary key,
  Status varchar(25)
);

-- DML Statements:
-- Sample data for Customers table
   INSERT INTO Customer (CustomerID, First_Name, Last_Name, Mobile, Email, Address)
VALUES
(1, 'John', 'Doe', '+1234567890', 'john.doe@email.com', '123 Main St, Cityville, CA'),
(2, 'Jane', 'Smith', '+9876543210', 'jane.smith@email.com', '456 Oak Ave, Townburg, NY'),
(3, 'Mike', 'Johnson', '+1112223333', 'mike.johnson@email.com', '789 Pine Rd, Villageton, TX'),
(4, 'Emily', 'Williams', '+5556667777', 'emily.williams@email.com', '321 Elm St, Hamletown, FL'),
(5, 'Chris', 'Brown', '+4443332222', 'chris.brown@email.com', '567 Cedar Ln, Cityside, IL'),
(6, 'Amanda', 'Miller', '+7778889999', 'amanda.miller@email.com', '987 Birch Rd, Townsville, OH'),
(7, 'Mark', 'Taylor', '+6665554444', 'mark.taylor@email.com', '234 Oakwood Ave, Villagetown, WA'),
(8, 'Laura', 'Davis', '+3332221111', 'laura.davis@email.com', '876 Pinecrest Rd, Cityburg, GA'),
(9, 'Ryan', 'Wilson', '+2221110000', 'ryan.wilson@email.com', '543 Maple St, Hamletsville, MI'),
(10, 'Eva', 'Clark', '+9990001111', 'eva.clark@email.com', '765 Redwood Ln, Villageside, NJ');

-- Sample data for Plantcategory table
INSERT INTO plantcategory (CategoryID,Name) values 
(1, 'Indoor Plants'),
(2, 'Outdoor Plants');

-- Sample data for Planttype table
INSERT INTO planttype (TypeID,Name) values
(1, 'Flowering Plants'),
(2, 'Fruit Plants'),
(3, 'Cacti'),
(4, 'Medicinal Plants'),
(5, 'Air Purifying Plants'),
(6, 'Low Maintainence Plants');

-- Sample data for Plant table
INSERT INTO plant (ID,Name,Size,Price,TypeID,CategoryID) values
(1, 'Peace Lily', 'Medium',350, 1, 1),
(2, 'Rose', 'Large', 250, 1, 2),
(3, 'Meyer Lemon','Medium',490,2,1),
(4, 'Mango','Large',275,2,2),
(5, 'Angel Wings','Small',375,3,1),
(6, 'Barrel Cactis','Small',400,3,2),
(7, 'Rosemary','Small',300,4,1),
(8, 'Tulsi','Medium',175,4,2),
(9, 'Golden Pothos','Small',350,5,1),
(10, 'Lucky Bamboo','Small',100,6,1),
(11, 'Oleander','Large',125,6,2);

-- Sample data for Order table
INSERT INTO orders (OrderId, CustomerID, OrderDate, OrderStatusID, Total) VALUES
(1, 1, '2023-12-01', '3', 1940),
(2, 2, '2023-12-02', '4', 1475),
(3, 3, '2023-12-03', '1', 900),
(4, 4, '2023-12-04', '3', 1125),
(5, 5, '2023-12-05', '4', 865),
(6, 6, '2023-12-06', '3', 1550),
(7, 7, '2023-12-07', '4', 725),
(8, 8, '2023-12-08', '1', 725),
(9, 9, '2023-12-09', '3', 200),
(10, 10, '2023-12-10', '4', 650);
 
-- Sample data for OrderItems table
INSERT INTO orderitems (ItemId, OrderId, PlantId, Quantity, Subtotal) VALUES
(1, 1, 1, 2, 700),
(2, 1, 3, 1, 490),
(3, 2, 6, 3, 1200),
(4, 4, 9, 2, 700),
(5, 4, 2, 1, 250),
(6, 6, 5, 2, 750),
(7, 7, 8, 1, 175),
(8, 5, 11, 3, 375),
(9, 7, 4, 2, 550),
(10, 10, 7, 1, 300),
(11, 8, 10, 2, 200),
(12, 2, 4, 1, 275),
(13, 3, 7, 3, 900),
(14, 9, 10, 2, 200),
(15, 5, 3, 1, 490),
(16, 6, 6, 2, 800),
(17, 10, 9, 1, 350),
(18, 8, 8, 3, 525),
(19, 1, 5, 2, 750),
(20, 4, 8, 1, 175);

-- Sample data for Payments table
INSERT INTO payment (PaymentId, OrderId, Paydate, Amount, Method) VALUES
(1, 1, '2023-12-02', 1940, 'Credit Card'),
(2, 2, '2023-12-03', 1475, 'PayPal'),
(3, 3, '2023-12-04', 900, 'Cash on Delivery'),
(4, 4, '2023-12-05', 1125, 'Credit Card'),
(5, 5, '2023-12-06', 865, 'PayPal'),
(6, 6, '2023-12-07', 1550, 'Cash on Delivery'),
(7, 7, '2023-12-08', 725, 'Credit Card'),
(8, 8, '2023-12-09', 725, 'PayPal'),
(9, 9, '2023-12-10', 200, 'Cash on Delivery'),
(10, 10, '2023-12-11', 650, 'Credit Card');

-- Sample data for OrderStatus table
INSERT INTO orderStatus (OrderStatusID, Name) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Delivered'),
(5, 'Cancelled');

-- DQL Statements:
-- Find the total revenue generated from orders
Select sum(Total) Revenue from orders;

-- Customer whose order more than 1000

Select c.First_Name,o.Total from orders o 
join customer c on o.CustomerId = c.CustomerId
Where Total > 1000;

-- Display the quantity of each product sold.

select Name,sum(Quantity) Quantity from orderitems o
join plant p on o.PlantId= p.ID
Group By PlantId
Order by Quantity desc;

-- Number of Payments done by different methods

select Method,count(OrderId) Payments_number from payment
Group by Method;

-- Ranking the Customer based on their Order amount

SELECT First_Name as Name,Total,
RANK()over( order by Total desc) as Ranks 
FROM orders o join customer c on o.CustomerId=c.CustomerId;
