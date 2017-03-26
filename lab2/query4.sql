/* Christopher Huynh - chphuynh
   CMPS 180 - Finkelstein
   Lab 2 - Fri 2pm-4pm
*/

SELECT p.Name
FROM Persons p, Tenants t
WHERE p.SSN = t.LeaseTenantSSN AND t.Rent > (p.Salary / 2);