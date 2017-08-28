DROP TABLE If Exists Users;

CREATE TABLE Users (
  UserID SERIAL PRIMARY KEY,
  Username CHAR(20) NOT NULL,
  Password CHAR(10) NOT NULL,
  Manager Boolean
);

INSERT INTO Users(Username, Password, Manager) VALUES('Jian','jian1',FALSE);
INSERT INTO Users(Username, Password, Manager) VALUES('Dragos','dragos1', FALSE);
INSERT INTO Users(Username, Password, Manager) VALUES('Cameron', 'cameron1',TRUE);
INSERT INTO Users(Username, Password, Manager) VALUES('Kevin', 'kevin1', FALSE);
INSERT INTO Users(Username, Password, Manager) VALUES('Chet', 'chet1', FALSE);

SELECT * from Users;