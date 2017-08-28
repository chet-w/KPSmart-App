-------------------------------------------------------
--** CREATING AND INSERTING mailDeliveryEvents ... **--
-------------------------------------------------------

DROP TABLE IF EXISTS KPSmailDeliveryEvents;

-- Create the table that will store the mail delivery events:
CREATE TABLE KPSmailDeliveryEvents (id SERIAL PRIMARY KEY, origin CHAR(20), destination CHAR(20),
weight INT, volume INT, priority CHAR(20), deliveryType CHAR(20),startDate date,deliveryTime INT);

-- Add data to KPSmailDeliveryEvents: (some dummy values)
INSERT INTO KPSmailDeliveryEvents (origin,destination,weight,volume,priority,deliveryType,startDate,deliveryTime) VALUES ('WEL','AKL',12.01,34.02,'low','land',current_date,5);
INSERT INTO KPSmailDeliveryEvents (origin,destination,weight,volume,priority,deliveryType,startDate,deliveryTime) VALUES ('WEL','AKL',13.07,4.02,'low','land',current_date,6);
INSERT INTO KPSmailDeliveryEvents (origin,destination,weight,volume,priority,deliveryType,startDate,deliveryTime) VALUES ('WEL','AKL',15.1,3.02,'low','land',current_date,3);
INSERT INTO KPSmailDeliveryEvents (origin,destination,weight,volume,priority,deliveryType,startDate,deliveryTime) VALUES ('CHC','WEL',10.1,3.01,'high','air',current_date,2);
INSERT INTO KPSmailDeliveryEvents (origin,destination,weight,volume,priority,deliveryType,startDate,deliveryTime) VALUES ('HAM','AKL',7.1,9.03,'high','air',current_date,1);
INSERT INTO KPSmailDeliveryEvents (origin,destination,weight,volume,priority,deliveryType,startDate,deliveryTime) VALUES ('HAM','DUN',13.1,23.01,'low','sea',current_date,4);

----------------------------------------------------
--** CREATING AND INSERTING availableRoutes ... **--
----------------------------------------------------

DROP TABLE If EXISTS KPSavailableRoutes;

-- the available routes, and amount of money it costs to use the routes, depending on the priority:
CREATE TABLE KPSavailableRoutes (
    id SERIAL PRIMARY KEY,
    origin CHAR(20),
    destination CHAR(20),
    pricePerGram INT,
    pricePerCubicCM INT,
    companyCostPerGram INT,
    companyCostPerCubicCM INT,
    deliveryType CHAR(20), -- Land/Sea: For "low" priority, Air: For "high" priority
    active BOOLEAN,
 	transportFirm char(20));

-- some dummy values for all the available routes, as well as their costs:

-----------------------
--** AKL TO ... **--
-----------------------
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('AKL','HAM',10,5,13,7,'land',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('AKL','HAM',15,10,4,7,'air',true,'firm');

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('AKL','WEL',20,3,3,7,'sea',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('AKL','WEL',25,8,13,17,'air',true,'firm');

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('AKL','CHC',30,5,35,17,'land',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('AKL','CHC',35,10,31,5,'air',true,'firm');

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('AKL','DUN',40,15,32,9,'sea',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('AKL','DUN',45,20,23,17,'air',true,'firm');

-----------------------
--** HAM TO ... **--
-----------------------
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('HAM','AKL',17,19,2,7,'sea',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('HAM','AKL',22,24,13,27,'air',true,'firm');

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('HAM','WEL',23,25,32,2,'land',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('HAM','WEL',28,30,6,5,'air',true,'firm');

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('HAM','CHC',10,5,32,9,'land',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('HAM','CHC',15,6,23,7,'air',true,'firm');

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('HAM','DUN',14,35,43,67,'sea',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('HAM','DUN',15,45,23,67,'air',true,'firm');


-----------------------
--** WEL TO ... **--
-----------------------

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('WEL','AKL',14,35,43,67,'land',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('WEL','AKL',15,45,23,67,'air',true,'firm');

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('WEL','HAM',10,5,3,7,'sea',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('WEL','HAM',15,6,23,7,'air',true,'firm');

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('WEL','CHC',14,35,43,67,'sea',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('WEL','CHC',15,45,23,67,'air',true,'firm');

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('WEL','DUN',10,5,3,7,'land',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('WEL','DUN',15,6,23,7,'air',true,'firm');

-----------------------
--** CHC TO ... **--
-----------------------

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('CHC','AKL',17,19,2,7,'sea',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('CHC','AKL',22,24,13,27,'air',true,'firm');

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('CHC','HAM',14,35,43,67,'sea',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('CHC','HAM',15,45,23,67,'air',true,'firm');

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('CHC','WEL',17,19,2,7,'land',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('CHC','WEL',22,24,13,27,'air',true,'firm');

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('CHC','DUN',10,5,3,7,'land',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('CHC','DUN',15,6,23,7,'air',true,'firm');

-----------------------
--** DUN TO ... **--
-----------------------

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('DUN','AKL',10,5,3,7,'land',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('DUN','AKL',15,6,23,7,'air',true,'firm');

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('DUN','HAM',14,35,43,67,'land',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('DUN','HAM',15,45,23,67,'air',true,'firm');

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('DUN','WEL',10,5,3,7,'land',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('DUN','WEL',15,6,23,7,'air',true,'firm');

INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('DUN','CHC',14,35,43,67,'sea',true,'firm');
INSERT INTO KPSavailableRoutes (origin,destination,pricePerGram,pricePerCubicCM,companyCostPerGram,companyCostPerCubicCM,deliveryType,active,transportFirm) VALUES ('DUN','CHC',15,45,23,67,'air',true,'firm');

----------------------------------------
--** QUERIES FOR BUSINESS EVENTS... **--
----------------------------------------

--for the business figures, amount of mail:
SELECT origin,destination,SUM(weight) AS totalWeight, SUM(volume) AS totalVolume, COUNT(*) AS totalPackagesSent FROM
KPSmailDeliveryEvents GROUP BY origin, destination;

-- work out the average delivery time of all the delivered parcels in days
SELECT ROUND(Avg(deliveryTime),2) AS averageDays FROM kpsmaildeliveryevents;

-----------------------
--** TOTAL REVENUE **--
-----------------------

CREATE VIEW revenueTable AS (
SELECT M.origin AS mail_Origin ,M.destination AS mail_Destination,M.weight AS mail_Weight,
M.volume AS mail_Volume,A.pricePerGram,A.pricePerCubicCM, A.deliveryType,
M.weight*A.pricePerGram + M.volume*A.pricePerCubicCM AS revenue
FROM kpsmailDeliveryEvents m JOIN kpsavailableRoutes a
ON M.origin = A.origin AND M.destination = A.destination AND A.deliveryType = M.deliveryType);

SELECT * FROM revenueTable;

CREATE VIEW totalRevenueTablePerRoute AS (select mail_origin, mail_destination, SUM (mail_weight*pricePerGram + mail_volume*pricePerCubicCM) as total_revenue
from revenueTable GROUP BY mail_origin, mail_destination ORDER BY total_revenue);

CREATE VIEW tableA AS (SELECT * FROM totalRevenueTablePerRoute);

select sum(total_revenue) from totalRevenueTablePerRoute AS totalRevenue;

SELECT * FROM tableA; -- The table for the total_revenue
---------------------------
--** TOTAL EXPENDITURE **--
---------------------------

-- generate a table that shows the company cost per gram and cubic cm, next to each of the mail delivery events:
CREATE VIEW expenditureTable AS (
SELECT m.origin AS mail_Origin ,m.destination AS mail_Destination,m.weight AS mail_Weight,
m.volume AS mail_Volume,a.companyCostPerGram,a.companyCostPerCubicCM, a.deliveryType,
m.weight*a.companyCostPerGram + m.volume*a.companyCostPerCubicCM AS cost
FROM KPSmailDeliveryEvents m JOIN KPSavailableRoutes a
ON m.origin = a.origin AND m.destination = a.destination AND a.deliveryType = m.deliveryType);

-- showing the view generated above:
SELECT * FROM expenditureTable;

-- from that view, compute the total company expenditure per each route:
CREATE VIEW tableB AS (select mail_origin, mail_destination, SUM (mail_weight*companyCostPerGram + mail_volume*companyCostPerCubicCM) as total_company_expenditure
from expenditureTable GROUP BY mail_origin, mail_destination ORDER BY total_company_expenditure);

SELECT * FROM tableB; -- The table for the total expendeture
-----------------------
--**CRITICAL ROUTES**--
-----------------------

-- Create a view of all the routes with their current expenditure and revenue values:
CREATE VIEW revenueAndExpediture AS (
-- Query to show the total revenue and expedeture of every route, next to each origin,destination pair.
SELECT a.mail_origin,a.mail_destination,a.total_revenue, b.total_company_expenditure
 FROM tableA a
 JOIN tableB b
 ON a.mail_origin = b.mail_origin
 AND a.mail_destination = b.mail_destination);

-- Display the data from that view:
SELECT * FROM revenueAndExpediture;

-- Find Critical Routes (Routes for which the compnay is paying more than they are receiving)
-- and display the difference between money made and money spent (i.e money lost):
SELECT mail_origin,mail_destination, re.total_company_expenditure - re.total_revenue as money_lost
FROM revenueAndExpediture re WHERE re.total_revenue < re.total_company_expenditure;
