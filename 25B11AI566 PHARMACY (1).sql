DROP DATABASE IF EXISTS Pharmacy;

CREATE DATABASE Pharmacy;

USE Pharmacy;

CREATE TABLE Tablets (
    Tablet_ID INT PRIMARY KEY,
    Tablet_Name VARCHAR(50),
    Tablet_Weight DECIMAL(5,2),
    Disease VARCHAR(50),
    Symptom VARCHAR(50)
);

ALTER TABLE Tablets
ADD COLUMN Cost DECIMAL(8,2);

ALTER TABLE Tablets
RENAME COLUMN Cost TO Tablet_Cost;

INSERT INTO Tablets
(Tablet_ID, Tablet_Name, Tablet_Weight, Disease, Symptom, Tablet_Cost)
VALUES
(1,'Paracetamol',500,'Fever','High Fever',20),
(2,'Dolo 650',650,'Fever','Body Pain',30),
(3,'Crocin',500,'Cold','Headache',25),
(4,'Azithromycin',250,'Infection','Cough',80),
(5,'Amoxicillin',500,'Bacterial Infection','Fever',90),
(6,'Cetirizine',10,'Allergy','Sneezing',15),
(7,'Pantoprazole',40,'Acidity','Stomach Pain',35),
(8,'Omeprazole',20,'Ulcer','Acidity',40),
(9,'Metformin',500,'Diabetes','High Sugar',50),
(10,'Glimipride',2,'Diabetes','High Sugar',60),
(11,'Aspirin',75,'Heart Disease','Chest Pain',45),
(12,'Ibuprofen',400,'Pain','Body Pain',35),
(13,'Vitamin C',500,'Vitamin Deficiency','Weakness',25),
(14,'Calcium',500,'Bone Weakness','Joint Pain',55),
(15,'ORS',200,'Dehydration','Weakness',18),
(16,'Cough Syrup Tablet',300,'Cough','Dry Cough',40),
(17,'Zinc Tablet',50,'Immunity','Weakness',30),
(18,'Levocetirizine',5,'Allergy','Itching',22),
(19,'Diclofenac',100,'Pain','Joint Pain',48),
(20,'Ranitidine',150,'Acidity','Heart Burn',28);

UPDATE Tablets
SET Tablet_Cost = Tablet_Cost + 10
WHERE Tablet_ID > 0;


ALTER TABLE Tablets
DROP COLUMN Disease;

ALTER TABLE Tablets
ADD COLUMN Age_Group VARCHAR(20);

UPDATE Tablets
SET Age_Group='Children'
WHERE Tablet_ID IN (1,3,6,13,15);

UPDATE Tablets
SET Age_Group='Adults'
WHERE Tablet_ID IN (2,4,5,7,8,9,10,11,12,14,16,17,18,19,20);

SELECT Age_Group, COUNT(*) AS Total_Tablets
FROM Tablets
GROUP BY Age_Group
HAVING COUNT(*) >= 5;

-- GROUP BY Clause
SELECT Symptom, COUNT(*) AS Total
FROM Tablets
GROUP BY Symptom;

SELECT * FROM Tablets;

SELECT
MIN(Tablet_Weight) AS Minimum_Weight,
MAX(Tablet_Weight) AS Maximum_Weight
FROM Tablets;

ALTER TABLE Tablets
ADD COLUMN Qty INT;

UPDATE Tablets SET Qty=10 WHERE Tablet_ID=1;
UPDATE Tablets SET Qty=15 WHERE Tablet_ID=2;
UPDATE Tablets SET Qty=20 WHERE Tablet_ID=3;
UPDATE Tablets SET Qty=8 WHERE Tablet_ID=4;
UPDATE Tablets SET Qty=12 WHERE Tablet_ID=5;
UPDATE Tablets SET Qty=25 WHERE Tablet_ID=6;
UPDATE Tablets SET Qty=10 WHERE Tablet_ID=7;
UPDATE Tablets SET Qty=15 WHERE Tablet_ID=8;
UPDATE Tablets SET Qty=18 WHERE Tablet_ID=9;
UPDATE Tablets SET Qty=20 WHERE Tablet_ID=10;
UPDATE Tablets SET Qty=10 WHERE Tablet_ID=11;
UPDATE Tablets SET Qty=12 WHERE Tablet_ID=12;
UPDATE Tablets SET Qty=14 WHERE Tablet_ID=13;
UPDATE Tablets SET Qty=16 WHERE Tablet_ID=14;
UPDATE Tablets SET Qty=10 WHERE Tablet_ID=15;
UPDATE Tablets SET Qty=8 WHERE Tablet_ID=16;
UPDATE Tablets SET Qty=18 WHERE Tablet_ID=17;
UPDATE Tablets SET Qty=20 WHERE Tablet_ID=18;
UPDATE Tablets SET Qty=15 WHERE Tablet_ID=19;
UPDATE Tablets SET Qty=12 WHERE Tablet_ID=20;

SELECT
Tablet_ID,
Tablet_Name,
Tablet_Weight,
Qty,
(Tablet_Weight * Qty) AS Total_Weight,
Symptom
FROM Tablets;

SELECT
Tablet_ID,
Tablet_Name,
Tablet_Weight,
Symptom
FROM Tablets
WHERE Tablet_Weight >= 500
AND Age_Group='Adults';