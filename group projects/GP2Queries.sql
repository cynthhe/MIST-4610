USE ns_Group3;

# CREATE PROCEDURE TP_Q1()
# Query 1: Report all of the daily temperatures in Celsius (converts from its default which is Fahrenheit).
SELECT cityName AS 'City', calendarDate AS 'Date', (minTemp-32)/1.8 AS 'MIN (C)', (maxTemp-32)/1.8 AS 'MAX (C)'
FROM DAILY
JOIN CITY ON DAILY.cityID = CITY.cityID
ORDER BY calendarDate, cityName;

# CREATE PROCEDURE TP_Q2()
# Query 2: Report the most common weather status of the city with the most users of the Yahoo app.
SELECT DISTINCT(CITY.cityName) AS 'City', weatherStatus AS 'Weather Status'
FROM USER
JOIN USER_CITY
ON USER.userID = USER_CITY.userID
JOIN CITY
ON USER_CITY.cityID = CITY.cityID
JOIN DAILY
ON CITY.cityID = DAILY.cityID
JOIN W_STATUS
ON DAILY.statusID = W_STATUS.statusID
GROUP BY CITY.cityName
ORDER BY COUNT(weatherStatus) DESC
LIMIT 3;

# CREATE PROCEDURE TP_Q3()
# Query 3: Report the city with the most days of sunny weather.
SELECT cityName AS 'City', COUNT(*) AS '# of Days'
FROM CITY
JOIN DAILY
ON CITY.cityID = DAILY.cityID
JOIN W_STATUS
ON DAILY.statusID = W_STATUS.statusID
WHERE weatherStatus = 'Sunny'
GROUP BY CITY.cityID;

# CREATE PROCEDURE TP_Q4()
# Query 4: Report the latitude and longitude of the cities that are in the eastern hemisphere.  
SELECT cityName AS 'City', cityLong AS 'Longitude', cityLat AS 'Latitude'
FROM CITY
WHERE cityLat REGEXP 'E$';

# CREATE PROCEDURE TP_Q5()
# Query 5: Report which day was collectively the hottest throughout all the cities.
SELECT calendarDate AS 'Hottest Day', MAX(max_Temp) AS 'AVG Temp Across All Cities'
FROM (SELECT calendarDate, AVG(maxTemp) AS max_Temp 
FROM DAILY 
GROUP BY calendarDate
ORDER BY calendarDate DESC) AS max_Temp;

# CREATE PROCEDURE TP_Q6()
# Query 6: Report the cities who have a status of raining or light rain in at least 2 days. 
SELECT cityName AS 'City', COUNT(*) AS '# Of Days With Rain/Light Rain'
FROM CITY
JOIN DAILY ON DAILY.cityID = CITY.cityID
JOIN W_STATUS ON DAILY.statusID = W_STATUS.statusID
WHERE DAILY.statusID = 26962 OR DAILY.statusID = 79872
GROUP BY CITY.cityID
HAVING COUNT(*) >= 2;

# CREATE PROCEDURE TP_Q7()
# Query 7: Report the preferred measurement unit for users in the Atlanta and Melbourne.
SELECT fName AS 'First Name', lName AS 'Last Name', mUnitName AS 'Preferred Unit'
FROM USER
JOIN PREFERENCE ON USER.userID = PREFERENCE.userID
JOIN MEASURING_UNIT ON PREFERENCE.mUnitID = MEASURING_UNIT.mUnitID
JOIN USER_CITY ON USER.userID = USER_CITY.userID
WHERE cityID = 82661 OR cityID = 76184;

# CREATE PROCEDURE TP_Q8()
# Query 8: Report the cities of the user who lives in the city with a preference of Celsius.
SELECT cityName AS 'City', fName AS 'User First Name', lName AS 'User Last Name'
FROM CITY
JOIN USER_CITY ON CITY.cityID = USER_CITY.cityID
JOIN USER ON USER_CITY.userID = USER.userID
JOIN PREFERENCE ON PREFERENCE.userID = USER.userID
WHERE mUnitID = '19965'
GROUP BY USER.userID;

# CREATE PROCEDURE TP_Q9()
# Query 9: Report the latitude and longitude of the city that has the most users.
SELECT cityName AS 'City', cityLat AS 'Latitude', cityLong AS 'Longitude', MAX(USER_COUNT) AS '# Of Users'
FROM (SELECT cityID, COUNT(*) AS USER_COUNT
FROM USER_CITY
GROUP BY cityID
ORDER BY cityID DESC) AS USER_COUNT
JOIN CITY ON CITY.cityID = USER_COUNT.cityID;

# CREATE PROCEDURE TP_Q10()
# Query 10: Report the temperature of the cities in which there are the least amount of users.
SELECT CITY.cityName AS 'City', maxTemp AS 'Max Temp', minTemp AS 'Min Temp'
FROM USER
JOIN USER_CITY
ON USER.userID = USER_CITY.userID
JOIN CITY
ON USER_CITY.cityID = CITY.cityID
JOIN DAILY
ON CITY.cityID = DAILY.cityID
GROUP BY CITY.cityID
HAVING MIN(USER.userID);
