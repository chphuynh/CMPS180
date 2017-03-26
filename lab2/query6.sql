/* Christopher Huynh - chphuynh
   CMPS 180 - Finkelstein
   Lab 2 - Fri 2pm-4pm
*/

SELECT h.HouseAddress, p1.ApartmentNumber, p1.Name AS LeaseTenant,
	p1.Salary, p2.Name AS LandlordName
FROM Persons p1, Houses h, Tenants t, Persons p2,
	Landlords l, Ownerships o
WHERE h.HouseID = p1.HouseID AND t.LeaseTenantSSN = p1.SSN 
	AND t.RentOverdue = TRUE AND p2.SSN = l.OwnerSSN 
	AND l.LandlordID = o.LandlordID AND o.HouseID = h.HouseID; 