/* Christopher Huynh - chphuynh
   CMPS 180 - Finkelstein
   Lab 2 - Fri 2pm-4pm
*/

SELECT p.Name, h.HouseAddress
FROM Persons p, Landlords l, Ownerships o, Houses h
WHERE p.SSN = l.OwnerSSN AND l.landlordID = o.landlordID 
	AND h.houseID = o.HouseID AND h.ApartmentCount = 1;