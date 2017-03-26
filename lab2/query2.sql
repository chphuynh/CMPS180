/* Christopher Huynh - chphuynh
   CMPS 180 - Finkelstein
   Lab 2 - Fri 2pm-4pm
*/

SELECT DISTINCT p.Name
FROM Persons p, Houses h
WHERE p.HouseID = h.HouseID AND h.HouseAddress = '1730 Alma Street';