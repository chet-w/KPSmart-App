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


-- selecting data from KPSmailDeliveryEvents, show all the rows from the table
SELECT * FROM KPSmailDeliveryEvents;

--for the business figures, amount of mail:
SELECT origin,destination,SUM(weight) AS totalWeight, SUM(volume) AS totalVolume, COUNT(*) AS totalPackagesSent FROM
KPSmailDeliveryEvents GROUP BY origin, destination;

-- work out the average delivery time of all the delivered parcels in days
SELECT ROUND(Avg(deliveryTime),2) AS averageDays FROM kpsmaildeliveryevents;
