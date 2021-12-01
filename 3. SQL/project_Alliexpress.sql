INSERT INTO Orders
Values(2.35,14.03,'ordered',NULL,1,1 ,7)

 select * from Orders

 --NumbersOfProducts in a ShoppingCart
 --Total Sum
 --Attributes
select * from ShoppingCart

execute GetIdCategories

INSERT INTO Payment
VALUES('Web Money')

select * from Payment

SELECT SUM(Price) as Total
FROM Products p
JOIN CartHasProduct c
ON p.ProductID = c.ProductID
WHERE CartID = 1;

SELECT SUM(p.Price)+SUM(o.ShippingFee) as Total
FROM Products p
JOIN CartHasProduct c
ON p.ProductID = c.ProductID
JOIN Orders o
ON o.CartID = c.CartID
WHERE c.CartID=1;


SELECT SUM(Price)
FROM Products p
JOIN CartHasProduct c
ON p.ProductID = c.ProductID
WHERE CartID = 1;



select * from CartHasProduct

execute GetUserProduct

select * from Account

select * from Orders

alter table Delivery
add DeliveryDate varchar(255)

select * from Delivery



CREATE PROCEDURE GetUserInfo
AS
BEGIN
SELECT FNAME + ' ' + LNAME as Person,o.Total,ad.Country + ',' + ad.Town +',' + ad.Street as Delivery_Address,d.DeliveryDate
FROM Account a
JOIN Orders o
ON a.AccountID = o.AccountID
JOIN Delivery d
ON d.OrderID = d.OrderID
JOIN Address ad
ON ad.AddressID = d.AddressID
END;

EXECUTE GetUserInfo


execute GetIdCategories

execute GetProductCategory
execute GetUserProduct
execute GetUserInfo

alter table Delivery
alter column Date datetime


alter table Payment
drop column ParentID 



select * from Payment

insert into Payment
values('Sofort Bank')
insert into Payment
values('Bancontact')
insert into Payment
values('Cash Payment')




select * from Store

INSERT INTO Store
Values('Mozuleva',NULL,'Italia')
INSERT INTO Store
Values('Toppies','Toppies Official Store','America')
INSERT INTO Store
Values('LOVE&LEMONADE','LOVE&LEMONADE Official Store','America')
INSERT INTO Store
Values('Brown Online Store',NULL,'China')
INSERT INTO Store
Values('Tiny Spark ','Tiny Spark Official Store','Netherlands')
INSERT INTO Store
Values('MANLUODANNI Oversea	 ',NULL,'India')
INSERT INTO Store
Values('Yogodlns ','Yogodlns Official Store','China')


select * from Store
SELECT * FROM Account
select * from UserHasFavStores
alter table UserHasFavStores
drop column ID

INSERT INTO UserHasFavStores
VALUES(109,3)



CREATE PROCEDURE UserFavShop
AS
BEGIN
SELECT a.FName+' '+a.LNAme as Person_Name,s.Name as Store_Favourite_Name
FROM Account a
JOIN UserHasFavStores u
ON a.AccountID= u.AccountID
JOIN Store s
ON u.StoreID = s.StoreID
END;

EXECUTE UserFavShop



SELECT * FROM WishList

INSERT INTO WishList
VALUES(5,2)
INSERT INTO WishList
VALUES(5,7)
INSERT INTO WishList
VALUES(8,2)
INSERT INTO WishList
VALUES(1,4)
INSERT INTO WishList
VALUES(6,6)
INSERT INTO WishList
VALUES(8,7)
INSERT INTO WishList
VALUES(8,5)
INSERT INTO WishList
VALUES(2,5)


CREATE PROCEDURE UserFavProduct
AS
BEGIN
SELECT a.FName+' '+a.LNAme as Person_Name,p.Name as Favourite_Product_Name
FROM Account a
JOIN WishList w
ON a.AccountID= w.AccountID
JOIN Products p
ON p.ProductID = w.ProductID
END;

EXECUTE UserFavProduct



execute GetProductCategory


create table StoreHasProducts
(
	StoreID int NOT NULL,
	ProductID int NOT NULL,




);

ALTER TABLE StoreHasProducts
add constraint 
FK_StoreHasProducts_StoreID
FOREIGN KEY(StoreID)
REFERENCES Store(StoreID)


ALTER TABLE StoreHasProducts
add constraint 
FK_StoreHasProducts_ProductID
FOREIGN KEY(ProductID)
REFERENCES Products(ProductID)

select * from StoreHasProducts
select * from Store
select * from Products
INSERT INTO StoreHasProducts
VALUES(101,1)
INSERT INTO StoreHasProducts
VALUES(101,6)
INSERT INTO StoreHasProducts
VALUES(102,2)
INSERT INTO StoreHasProducts
VALUES(103,5)
INSERT INTO StoreHasProducts
VALUES(105,3)
INSERT INTO StoreHasProducts
VALUES(105,7)
INSERT INTO StoreHasProducts
VALUES(109,8)
INSERT INTO StoreHasProducts
VALUES(110,9)

SELECT a.FName AS FName ,p.Name AS Product,c.Name AS Category,sc.Name AS SubCategory,sr.Name as Store,sd.CartID 
FROM
Products p 
JOIN Category sc
ON p.CategoryID = sc.CategoryID
JOIN Category c
ON c.CategoryID = sc.ParentID
JOIN CartHasProduct chp 
ON chp.ProductID=p.ProductID
JOIN StoreHasProducts st
ON st.ProductID = p.ProductID
JOIN Store sr
ON sr.StoreID=st.StoreID
JOIN ShoppingCart sd 
ON sd.CartID=chp.CartID
JOIN Account a
ON a.AccountID=sd.AccountID


execute GetUserProductOrder


CREATE FUNCTION quantityOfProducts(@CartID as int)
RETURNS int
AS
BEGIN
 DECLARE @quantityOfProducts int = 0;
 SELECT @quantityOfProducts =  COUNT(p.ProductID) 
 FROM Products p
 JOIN CartHasProduct c
 ON p.ProductID = c.ProductID
 JOIN ShoppingCart s 
 On s.CartID = c.CartID
 WHERE c.CartID = @CartID
 RETURN(@quantityOfProducts)
 END;

 SELECT dbo.quantityOfProductsInCart(4) as [Quantity of products in Cart];


 select * from CartHasProduct
 select * from ShoppingCart
 select * from Products

 insert into CartHasProduct
 values(5,9)

 select * from ShoppingCartQuantity


 select * from Account
 select * from ShoppingCart
 select * from CartHasProduct

 insert into CartHasProduct
 values(1,8)
 select * from Products

 insert into Orders
 values(0,)


select * from Orders

SELECT SUM(Price) as Total
FROM Products p
JOIN CartHasProduct c
ON p.ProductID = c.ProductID
WHERE CartID = 1;

use ShopSystemDB
select * from CartHasProduct
select * from ShoppingCart
select * from Orders
select * from Payment

SELECT * FROM Products

 insert into Orders
 values(0,35.98,'delivered',NULL,1,7,7)

 
 CREATE TRIGGER deleteProductFromCart
 ON CartHasProduct
 AFTER INSERT 
 AS 
 BEGIN
 SET NOCOUNT ON
 DELETE FROM CartHasProduct 
 WHERE CartID IN(SELECT CartID FROM Orders where CartID in (SELECT deleted.CartId from deleted))

END;
 select * from CartHasProduct


 ALTER TABLE Delivery
 ALTER COLUMN DeliveryDate varchar(255)

 select * from Delivery

 insert into Delivery
 values(GETDATE(),5,4,'normal',7,GETDATE()+14)

 select * from Address

 ----------------------------------------
 USE ShopSystemDB

 -- Процедури

 EXECUTE GetAllCategories
 EXECUTE GetIdCategories
 EXECUTE GetProductCategory
 EXECUTE GetUserProductOrder
 EXECUTE UserFavProduct
 EXECUTE UserFavStore
 EXECUTE getProductsAttributes


 -- Функция 

 SELECT dbo.quantityOfProductsInCart(4) as [Quantity of products in Cart];


 -- Тригер

 INSERT INTO CartHasProduct
 VALUES(3,3)

 SELECT * FROM CartHasProduct

 SELECT * FROM ShoppingCartQuantity



 -- Продукти с атрибути 



  --*
 SELECT c.Name, atr.Type AS Attribute
 FROM Category_Attribute ca
 JOIN Category c
 ON ca.CategoryID = c.CategoryID
 JOIN Attribute atr
 ON ca.AttributeID = atr.AttributeID

 CREATE PROCEDURE getProductsAttributes
AS
BEGIN
SELECT p.Name as Product, atr.Type, pha.Value
 FROM ProductsHasAttributes pha
 JOIN Products p
 ON pha.ProductID = p.ProductID
 JOIN Attribute atr
 ON pha.AttibuteID = atr.AttributeID
END;


EXECUTE getProductsAttributes;
 

 CREATE TABLE Category_Attribute(
 CategoryID INT NOT NULL,
 AttributeID INT NOT NULL
 );

 ALTER TABLE Category_Attribute
 ADD CONSTRAINT
 FK_CategoryID
 FOREIGN KEY(CategoryID)
 REFERENCES Category(CategoryID)

 ALTER TABLE Category_Attribute
 ADD CONSTRAINT
 FK_Cat_Att_AttributeID
 FOREIGN KEY(AttributeID)
 REFERENCES Attribute(AttributeID)



INSERT INTO Category_Attribute
VALUES(17,200)
INSERT INTO Category_Attribute
VALUES(17,201)



SELECT * FROM Category_Attribute
select * from Category
select * from Attribute
select * from Category_Attribute

SELECT c.Name, atr.Type AS Attribute
 FROM Category_Attribute ca
 JOIN Category c
 ON ca.CategoryID = c.CategoryID
 JOIN Attribute atr
 ON ca.AttributeID = atr.AttributeID


