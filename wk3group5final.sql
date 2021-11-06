## GROUP 5 Week 3 Submission.  Wei-Jung Liu, Ava Zhang, David Hess
## Lines 6-119  Creates the Tables and Populate the Tables for Amber's Menu and Pricing Structure
## Lines 121-141 Has the 4 VIEWS for the assignment (we did a few more because we had fun exploring what we could do!)
## Lines 163-202 Has the 6 subqueries 

USE group5proj;
CREATE TABLE Menu (
MenuID INT PRIMARY KEY,
Item VARCHAR(64),
MealType INT,
PriceStructure INT
);
CREATE TABLE MealAttribute (
MealType INT PRIMARY KEY,
MType VARCHAR(64),
Subtype VARCHAR(64),
MeatKey INT
);
CREATE TABLE PriceTable (
PriceStructure INT PRIMARY KEY,
Price INT,
Profit INT
);
CREATE TABLE MeatType (
MeatKey INT PRIMARY KEY,
MeatName VARCHAR(64)
);
CREATE TABLE VegType (
MeatKey INT PRIMARY KEY,
Veg VARCHAR(64)
);

INSERT INTO VegType VALUES(1, "Yes");
INSERT INTO VegType VALUES(2, "No");
INSERT INTO VegType VALUES(3, "No");
INSERT INTO VegType VALUES(4, "No");
INSERT INTO VegType VALUES(5, "No");
INSERT INTO VegType VALUES(6, "No");

INSERT INTO MeatType VALUES(1, "none");
INSERT INTO MeatType VALUES(2, "chicken");
INSERT INTO MeatType VALUES(3, "fish");
INSERT INTO MeatType VALUES(4, "lamb");
INSERT INTO MeatType VALUES(5, "goat");
INSERT INTO MeatType VALUES(6, "shrimp");

INSERT INTO PriceTable VALUES(1, 10, 3);
INSERT INTO PriceTable VALUES(2, 15, 3);
INSERT INTO PriceTable VALUES(3, 16, 4);
INSERT INTO PriceTable VALUES(4, 10, 2);
INSERT INTO PriceTable VALUES(5, 11, 3);
INSERT INTO PriceTable VALUES(6, 25, 5);
INSERT INTO PriceTable VALUES(7, 25, 6);
INSERT INTO PriceTable VALUES(8, 23, 4);
INSERT INTO PriceTable VALUES(9, 36, 6);
INSERT INTO PriceTable VALUES(10, 27, 5);
INSERT INTO PriceTable VALUES(11, 26, 6);
INSERT INTO PriceTable VALUES(12, 26, 5);
INSERT INTO PriceTable VALUES(13, 27, 6);
INSERT INTO PriceTable VALUES(14, 24, 5);
INSERT INTO PriceTable VALUES(15, 3, 1);
INSERT INTO PriceTable VALUES(16, 4, 2);
INSERT INTO PriceTable VALUES(17, 5, 2);
INSERT INTO PriceTable VALUES(18, 18, 5);
INSERT INTO PriceTable VALUES(19, 18, 4);
INSERT INTO PriceTable VALUES(20, 21, 5);
INSERT INTO PriceTable VALUES(21, 17, 4);
INSERT INTO PriceTable VALUES(22, 17, 5);
INSERT INTO PriceTable VALUES(23, 28, 7);

INSERT INTO MealAttribute VALUES(1, "Appetizer", "none", 1);
INSERT INTO MealAttribute VALUES(2, "Appetizer", "none", 2);
INSERT INTO MealAttribute VALUES(3, "Appetizer", "none", 3);
INSERT INTO MealAttribute VALUES(4, "Appetizer", "Soup", 1);
INSERT INTO MealAttribute VALUES(5, "Entree", "Clay Oven", 2);
INSERT INTO MealAttribute VALUES(6, "Entree", "Clay Oven", 4);
INSERT INTO MealAttribute VALUES(7, "Entree", "Clay Oven", 1);
INSERT INTO MealAttribute VALUES(8, "Entree", "Clay Oven", 3);
INSERT INTO MealAttribute VALUES(9, "Entree", "Curry", 5);
INSERT INTO MealAttribute VALUES(10, "Entree", "none", 2);
INSERT INTO MealAttribute VALUES(11, "Entree", "Curry", 6);
INSERT INTO MealAttribute VALUES(12, "Entree", "Curry", 2);
INSERT INTO MealAttribute VALUES(13, "Entree", "Curry", 3);
INSERT INTO MealAttribute VALUES(14, "Entree", "Vindaloo", 4);
INSERT INTO MealAttribute VALUES(15, "Bread", "Roti", 1);
INSERT INTO MealAttribute VALUES(16, "Bread", "Naan", 1);
INSERT INTO MealAttribute VALUES(17, "Bread", "Paratha", 1);
INSERT INTO MealAttribute VALUES(18, "Entree", "none", 1);
INSERT INTO MealAttribute VALUES(19, "Entree", "Dal", 1);
INSERT INTO MealAttribute VALUES(20, "Entree", "Biryani", 2);

INSERT INTO Menu VALUES(1, "Edamame and Potatoe", 1, 1);
INSERT INTO Menu VALUES(2, "Chilli Chicken Dumpling", 2, 2);
INSERT INTO Menu VALUES(3, "Kolkata Fish Fry", 3, 3);
INSERT INTO Menu VALUES(4, "Coconut Lentil Soup", 4, 4);
INSERT INTO Menu VALUES(5, "Cauliflower Manchurian", 1, 5);
INSERT INTO Menu VALUES(6, "Tandori Chicken", 5, 6);
INSERT INTO Menu VALUES(7, "Lucknowi Seekh Kebab", 6, 7);
INSERT INTO Menu VALUES(8, "Cayenne Pepper Paneer Tikka", 7, 8);
INSERT INTO Menu VALUES(9, "Chilean Seabass Tikka", 8, 9);
INSERT INTO Menu VALUES(10, "Dill Mustard Char Grilled Salmon", 8, 10);
INSERT INTO Menu VALUES(11, "Frontier Lamb Rack", 6, 9);
INSERT INTO Menu VALUES(12, "Goat Curry", 9, 11);
INSERT INTO Menu VALUES(13, "Butter Chicken", 10, 12);
INSERT INTO Menu VALUES(14, "Karavali Prawn Curry", 11, 13);
INSERT INTO Menu VALUES(15, "Classic Methi Chicken Curry", 12, 14);
INSERT INTO Menu VALUES(16, "Malabari Fish Curry", 13, 12);
INSERT INTO Menu VALUES(17, "Nalli Vindaloo", 14, 9);
INSERT INTO Menu VALUES(18, "Roti", 15, 15);
INSERT INTO Menu VALUES(19, "Naan", 16, 16);
INSERT INTO Menu VALUES(20, "Paratha", 17, 16);
INSERT INTO Menu VALUES(21, "Stuffed Naan", 15, 17);
INSERT INTO Menu VALUES(22, "Pindi Chole", 18, 18);
INSERT INTO Menu VALUES(23, "Gobi Roast", 18, 19);
INSERT INTO Menu VALUES(24, "Nutty Eggplant", 18, 18);
INSERT INTO Menu VALUES(25, "Saag Paneer", 18, 20);
INSERT INTO Menu VALUES(26, "Dal Amber", 19, 21);
INSERT INTO Menu VALUES(27, "Tadkewali Peeli Dal", 19, 22);
INSERT INTO Menu VALUES(28, "Hyderabadi Chicken Biryani", 20, 23);

## The 4 VIEWS for this assignment: FullMenu, AvgPriceMeal, CostAndProfit and Meat Price

## This view combines the relevant columns across the four tables to generate a single 
## table with every Menu Item, Categories about the Item, Price and Profit.
CREATE VIEW FullMenu AS
SELECT m.MenuID, m.Item, ma.MType AS Course, ma.Subtype, mt.MeatName AS Meat, pt.Price, pt.Profit FROM 
Menu m INNER JOIN 
(MealAttribute ma INNER JOIN MeatType mt ON ma.MeatKey = mt.MeatKey)
ON m.MealType = ma.MealType
INNER JOIN PriceTable pt ON m.PriceStructure = pt.PriceStructure;

SELECT * FROM FullMenu;

## This view shows the average price of each kind of meal
CREATE VIEW AvgPriceMeal AS
SELECT ma.MType Course, AVG(pt.Price) AvgPrice
FROM Menu m
JOIN MealAttribute ma ON m.MealType = ma.MealType
JOIN PriceTable pt ON m.PriceStructure = pt.PriceStructure
JOIN MeatType mt ON ma.MeatKey = mt.MeatKey
GROUP BY Course;

SELECT * FROM AvgPriceMeal;

## This query shows the costs and profit ratio of meals from high to low
CREATE VIEW CostAndProfit AS
SELECT m.Item, (pt.Price-pt.Profit) AS Cost, ((pt.Price-pt.Profit)/pt.Price) AS ProfitRatio
FROM Menu m INNER JOIN PriceTable pt ON pt.PriceStructure=m.PriceStructure
ORDER BY Cost DESC, ProfitRatio;

SELECT * FROM CostAndProfit;

## This query shows the costs and profit ratio of meat meals from high to low
CREATE VIEW MeatPrice AS 
SELECT m.Item, mt.MeatName, (pt.Price-pt.Profit) AS Cost, ((pt.Price-pt.Profit)/pt.Price) AS ProfitRatio
FROM MeatType mt INNER JOIN MealAttribute ma ON mt.MeatKey=ma.MeatKey
INNER JOIN Menu m ON m.MealType=ma.MealType
INNER JOIN PriceTable pt ON pt.PriceStructure=m.PriceStructure
ORDER BY Cost DESC, ProfitRatio;

SELECT * FROM MeatPrice;

## The 6 subqueries for our assignment

 ## This subquery returns the Menu ID and Item Name for all Entrees.       
SELECT MenuID, Item 
FROM Menu
WHERE MealType IN
	(SELECT MealType FROM MealAttribute WHERE MType = 'Entree');
    

## This subquery returns the MealType IDs and type of Course (Appetizer, Entree, etc) for all items containing 'chicken' as the primary meat.
## The MealType ID could be used to look up the Item Names from the Parent Menu Table
SELECT MealType, MType AS Course FROM MealAttribute
WHERE MeatKey IN (SELECT MeatKey FROM MeatType WHERE MeatName = 'chicken');



## Selects all Menu Items More Expensive than the most expensive vegetarian dish
SELECT * FROM FullMenu WHERE Price >
(SELECT MAX(Price) FROM FullMenu WHERE Meat = 'none');

## Return the items that has profit larger than 5 dollars
SELECT MenuID, Item
FROM Menu
WHERE PriceStructure IN(
SELECT PriceStructure FROM PriceTable
WHERE Profit >= 5);

## Return the items that could be recommended to vegetarians
SELECT MenuID, Item
FROM Menu
WHERE MealType IN(
SELECT MealType FROM MealAttribute
WHERE MeatKey IN (
SELECT MeatKey FROM VegType WHERE Veg = "Yes")
);

## Return how many choices are there in each kind of meal type
SELECT MType, count(MealType) Choices
FROM MealAttribute
GROUP BY MType;



