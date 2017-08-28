DROP TABLE If Exists Users;
DROP TABLE If Exists MAIL;
DROP TABLE If Exists ROUTE;

CREATE TABLE Users (
  Username CHAR(20) NOT NULL,
  Password CHAR(10) NOT NULL,
  Manager Boolean
);

CREATE TABLE ROUTE(
    id serial primary key,
    origin varchar(30),
    destination varchar(30),
    cost_per_kg_customer real,
    cost_per_volume_customer real,
    cost_per_kg_business real,
    cost_per_volume_business real,
    priority varchar(10),
    deliveryType varchar(20),
    travel_time int,
    transportFirm varchar(20),
    is_active boolean
    );

CREATE TABLE MAIL(
    id serial primary key,
    cost real,
    weight real,
    volume real,
    send_date date,
    arrive_date date,
    is_arrived boolean,
    route_id int references ROUTE(id)
);

-- generate a table that shows the company cost per gram and cubic cm, next to each of the mail delivery events:








INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Auckland',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Hamilton',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Rotorua',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Palmerston North',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Christchurch',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Auckland',0.5,0.5,0.3,0.3,'Low','van',3,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Hamilton',0.6,0.6,0.4,0.4,'Low','ship',6,'Ship NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Rotorua',0.6,0.6,0.3,0.3,'Low','van',2,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Palmerston North',0.5,0.5,0.2,0.2,'Low','van',1,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Christchurch',0.5,0.5,0.3,0.3,'Low','ship',7,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Wellington','Dunedin',0.6,0.6,0.4,0.4,'Low','ship',8,'Ship NZ',true
);


INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Auckland',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Rotorua',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Palmerston North',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Christchurch',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Auckland',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Wellington',0.6,0.6,0.4,0.4,'Low','ship',6,'Ship NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Rotorua',0.6,0.6,0.3,0.3,'Low','ship',7,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Palmerston North',0.5,0.5,0.2,0.2,'Low','ship',6,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Christchurch',0.5,0.5,0.3,0.3,'Low','van',3,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Hamilton','Dunedin',0.6,0.6,0.4,0.4,'Low','van',2,'Van NZ',true
);




INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Hamilton',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Rotorua',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Palmerston North',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Christchurch',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Hamilton',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Wellington',0.6,0.6,0.4,0.4,'Low','van',3,'Van NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Rotorua',0.6,0.6,0.3,0.3,'Low','van',3,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Palmerston North',0.5,0.5,0.2,0.2,'Low','van',4,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Christchurch',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Auckland','Dunedin',0.6,0.6,0.4,0.4,'Low','ship',11,'Ship NZ',true
);



INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Hamilton',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Auckland',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Palmerston North',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Christchurch',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Hamilton',0.5,0.5,0.3,0.3,'Low','ship',8,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Wellington',0.6,0.6,0.4,0.4,'Low','van',2,'Van NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Auckland',0.6,0.6,0.3,0.3,'Low','van',2,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Palmerston North',0.5,0.5,0.2,0.2,'Low','van',4,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Christchurch',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Rotorua','Dunedin',0.6,0.6,0.4,0.4,'Low','ship',11,'Ship NZ',true
);







INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Hamilton',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Auckland',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Rotorua',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Christchurch',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Hamilton',0.5,0.5,0.3,0.3,'Low','ship',8,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Wellington',0.6,0.6,0.4,0.4,'Low','van',1,'Van NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Auckland',0.6,0.6,0.3,0.3,'Low','van',2,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Rotorua',0.5,0.5,0.2,0.2,'Low','van',2,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Christchurch',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Palmerston North','Dunedin',0.6,0.6,0.4,0.4,'Low','ship',11,'Ship NZ',true
);






INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Auckland',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Rotorua',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Palmerston North',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Hamilton',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Dunedin',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Auckland',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Wellington',0.6,0.6,0.4,0.4,'Low','ship',6,'Ship NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Rotorua',0.6,0.6,0.3,0.3,'Low','ship',7,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Palmerston North',0.5,0.5,0.2,0.2,'Low','ship',6,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Hamilton',0.5,0.5,0.3,0.3,'Low','van',3,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Christchurch','Dunedin',0.6,0.6,0.4,0.4,'Low','van',2,'Van NZ',true
);






INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Auckland',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Wellington',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Rotorua',0.6,0.6,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Palmerston North',0.5,0.5,0.2,0.2,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Hamilton',0.5,0.5,0.3,0.3,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Christchurch',0.6,0.6,0.4,0.4,'High','air',1,'Air NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Auckland',0.5,0.5,0.3,0.3,'Low','ship',10,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Wellington',0.6,0.6,0.4,0.4,'Low','ship',6,'Ship NZ',true
);
INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Rotorua',0.6,0.6,0.3,0.3,'Low','ship',7,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Palmerston North',0.5,0.5,0.2,0.2,'Low','ship',6,'Ship NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Hamilton',0.5,0.5,0.3,0.3,'Low','van',3,'Van NZ',true
);

INSERT INTO ROUTE VALUES(
    DEFAULT,'Dunedin','Christchurch',0.6,0.6,0.4,0.4,'Low','van',2,'Van NZ',true
);




-- Just a small loop to generate some random mail deliveries
DO
$do$
BEGIN
    DECLARE
        --k integer := 0;
    BEGIN
        FOR i IN 1..83 LOOP
            DECLARE
                a integer := round((CAST((1 + (random() * 20)) AS numeric)),0);

            BEGIN
                FOR j IN 1..a LOOP
                    DECLARE
                        -- Generate a random weight and volume
                        weight integer := round((CAST((1 + (random() * 6)) AS numeric)),0);
                        volume integer := round((CAST((1 + (random() * 5) + (weight/2)) AS numeric)),0);

                        -- Generate a random send and arrival date
                        send_date date := current_date - CAST(round((CAST((1 + (random() * 100)) AS numeric)),0)AS integer);
                        --arrive_date date := send + round((CAST(1 + (random() * 10) AS numeric)),0);
                        arrive_date date := send_date + CAST(round((CAST((1 + (random() * 10)) AS numeric)),0)AS integer);

                        is_arrived boolean := (arrive_date < current_date);

                        -- Generate a random cost depending on assign kg/volume costs
                        cost_per_kg_customer numeric := 0.2;
                        cost_per_volume_customer numeric := 0.3;
                        cost integer := round((CAST( cost_per_kg_customer * cost_per_volume_customer * weight * volume AS numeric)),0);

                    BEGIN
                        -- Finally insert into mail table
                        INSERT INTO MAIL VALUES(
                            DEFAULT, cost, weight, volume, send_date, arrive_date, is_arrived, i
                        );
                        --k := k + 1;
                    END;
                END LOOP;
            END;
        END LOOP;
    END;

END
$do$;










INSERT INTO Users(Username, Password, Manager) VALUES
('Jian','jian1',false),
('Dragos','dragos1', false),
('Cameron', 'cameron1',true),
('Kevin', 'kevin1', false),
('Chet', 'chet1', false);





/*
Querries

-- RevenueAndExpenditure Table
CREATE VIEW revenueAndExpenditure AS (
SELECT r.id AS RouteID, r.origin AS Origin ,r.destination AS Destination,
m.weight AS Weight, m.volume AS Volume, r.deliveryType AS DeliveryType,
r.cost_per_kg_customer, r.cost_per_volume_customer,
r.cost_per_kg_business, r.cost_per_volume_business,
m.weight * r.cost_per_kg_customer + m.volume * r.cost_per_volume_customer AS revenue,
m.weight * r.cost_per_kg_business + m.volume * r.cost_per_volume_business AS expenditure
FROM mail m JOIN route r
ON m.route_id = r.id);

SELECT * FROM revenueAndExpenditure;

CREATE VIEW TotalsPerRoute AS (select RouteID, Origin, Destination, DeliveryType, SUM (weight * cost_per_kg_customer + volume * cost_per_volume_customer) as total_revenue,
SUM (weight * cost_per_kg_business + volume * cost_per_volume_business) as total_expenditure from revenueAndExpenditure GROUP BY RouteID, Origin, Destination, DeliveryType ORDER BY RouteID);

CREATE VIEW BusinessMonitoringA AS (SELECT * FROM TotalsPerRoute);

select sum(total_revenue) from TotalsPerRoute AS totalRevenue;

SELECT * FROM BusinessMonitoringA; -- The table for RevenueAndExpenditure



-- AverageDeliveryTimes Table
SELECT ROUND(Avg(arrive_date - send_date),2) AS averageDays FROM mail;

CREATE VIEW averageDeliveryDays AS (
SELECT r.id AS RouteID, r.origin AS Origin ,
r.destination AS Destination, r.deliveryType AS DeliveryType,
m.send_date, m.arrive_date,
m.arrive_date - m.send_date AS deliveryTime
FROM mail m JOIN route r
ON m.route_id = r.id);



-- Average Days
SELECT r.id, r.origin, r.destination,r.deliveryType AS DeliveryType, ROUND(Avg(m.arrive_date - m.send_date),0) AS averageDays
FROM mail m JOIN route r ON m.route_id = r.id WHERE r.is_active = true GROUP BY r.id;

-- Business Monitoring Mail Delivery
SELECT m.id, r.origin, r.destination, m.weight, m.volume, m.send_date,
CASE WHEN current_date < m.arrive_date THEN 'In Transit' ELSE 'Delivered' END
FROM mail m JOIN route r ON m.route_id = r.id GROUP BY r.origin, r.destination, m.id;

DROP VIEW revenueAndExpenditure CASCADE;

DROP VIEW averageDeliveryDays CASCADE;*/






--working on this stuff


/*CREATE VIEW revenueAndExpenditure AS (
SELECT r.id AS RouteID, r.origin AS Origin ,r.destination AS Destination,
m.weight AS Weight, m.volume AS Volume, r.deliveryType AS DeliveryType,
r.cost_per_kg_customer, r.cost_per_volume_customer,
r.cost_per_kg_business, r.cost_per_volume_business,
m.weight * r.cost_per_kg_customer + m.volume * r.cost_per_volume_customer AS revenue,
m.weight * r.cost_per_kg_business + m.volume * r.cost_per_volume_business AS expenditure
FROM mail m JOIN route r
ON m.route_id = r.id);


SELECT * FROM revenueAndExpenditure;

CREATE VIEW TotalsPerRoute AS (select RouteID, Origin, Destination, DeliveryType, SUM (weight * cost_per_kg_customer + volume * cost_per_volume_customer) as total_revenue,
SUM (weight * cost_per_kg_business + volume * cost_per_volume_business) as total_expenditure from revenueAndExpenditure GROUP BY RouteID, Origin, Destination, DeliveryType ORDER BY RouteID);

CREATE VIEW BusinessMonitoringA AS (SELECT * FROM TotalsPerRoute);

select sum(total_revenue) from TotalsPerRoute AS totalRevenue;

SELECT * FROM BusinessMonitoringA; -- The table for RevenueAndExpenditure

SELECT * FROM BussinessMonitoring

SELECT t.origin ,t.destination, t.total_expenditure - t.total_revenue as money_lost
FROM TotalsPerRoute t WHERE t.total_revenue < t.total_expenditure;

DROP VIEW revenueAndExpenditure CASCADE;*/

