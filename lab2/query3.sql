/* Christopher Huynh - chphuynh
   CMPS 180 - Finkelstein
   Lab 2 - Fri 2pm-4pm
*/

SELECT DISTINCT h.Color, h.ApartmentCount
FROM Persons p, Houses h
WHERE p.Name = 'John Smith' AND p.HouseID = h.HouseID;