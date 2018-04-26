USE ns_Group3;

CREATE TABLE USER (
	userID	INT(5),
    fName	VARCHAR(45),
    lName	VARCHAR(45),
    email	VARCHAR(45),
    phone	VARCHAR(10),
    pass	VARCHAR(45),
	PRIMARY KEY(userID));
    
CREATE TABLE USER_CITY (
	userID INT(5),
    cityID INT(5),
    addedOn DATE,
    CONSTRAINT PK_USER_CITY PRIMARY KEY (userID, cityID));
    
CREATE TABLE PREFERENCE (
	userID INT(5),
    attributeID INT(5),
    mUnitID INT(5),
    CONSTRAINT PK_PREFERENCE PRIMARY KEY (userID, attributeID),
    CONSTRAINT fk_preference_measuringunit FOREIGN KEY (mUnitID)
    REFERENCES MEASURING_UNIT(mUnitID) ON DELETE RESTRICT);
        
SELECT *
FROM USER
JOIN USER_CITY
ON USER.userID = USER_CITY.userID;

SELECT cityName, calendarDate, (minTemp-32)/1.8 AS 'MIN (C)', (maxTemp-32)/1.8 AS 'MAX (C)'
FROM DAILY
JOIN CITY ON DAILY.cityID = CITY.cityID
ORDER BY calendarDate, cityName;

#QUERY 1
SELECT cityName, calendarDate, (minTemp-32)/1.8 AS 'MIN (C)', (maxTemp-32)/1.8 AS 'MAX (C)'
FROM DAILY
JOIN CITY ON DAILY.cityID = CITY.cityID
ORDER BY calendarDate, cityName;

# Query 3
SELECT cityName, COUNT(*)
FROM CITY
JOIN DAILY
ON CITY.cityID = DAILY.cityID
JOIN W_STATUS
ON DAILY.statusID = W_STATUS.statusID
WHERE weatherStatus = 'Sunny'
GROUP BY CITY.cityID;

#QUERY 4
SELECT cityName, cityLong AS 'Longitude', cityLat AS 'Latitude'
FROM CITY
WHERE cityLat REGEXP 'E$';

#QUERY 5
SELECT calendarDate AS 'Hottest Day', MAX(max_Temp) AS 'AVG Temp Across All Cities'
FROM (SELECT calendarDate, AVG(maxTemp) AS max_Temp 
FROM DAILY GROUP BY calendarDate) AS max_Temp;

#QUERY 6
SELECT cityName AS 'City', COUNT(*) AS '# Of Days With Rain/Light Rain'
FROM CITY
JOIN DAILY ON DAILY.cityID = CITY.cityID
JOIN W_STATUS ON DAILY.statusID = W_STATUS.statusID
WHERE DAILY.statusID = 26962 OR DAILY.statusID = 79872
GROUP BY CITY.cityID
HAVING COUNT(*) >= 2;

#QUERY 8
SELECT cityName AS 'City', fName AS 'User First Name', lName AS 'User Last Name'
FROM CITY
JOIN USER_CITY ON CITY.cityID = USER_CITY.cityID
JOIN USER ON USER_CITY.userID = USER.userID
JOIN PREFERENCE ON PREFERENCE.userID = USER.userID
WHERE mUnitID = '19965'
GROUP BY USER.userID;

SELECT *
FROM USER;

CALL TP_Q1;
CALL TP_Q2;
CALL TP_Q3;
CALL TP_Q4;
CALL TP_Q5;
CALL TP_Q6;
CALL TP_Q7;
CALL TP_Q8;
CALL TP_Q9;
CALL TP_Q10;
