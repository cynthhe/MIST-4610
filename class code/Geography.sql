USE Geography;

SELECT * FROM boundary;
SELECT * FROM city;
SELECT * FROM political_unit;

# Area
SELECT Area(boundpath)*1406 as 'Area (km^2)' FROM political_unit, boundary
WHERE unitname = 'Republic of Ireland'
AND political_unit.unitcode = boundary.unitcode;
