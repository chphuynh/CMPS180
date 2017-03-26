UPDATE Tenants t
SET LastRentPaidDate = sub.DatePaid, RentOverdue = FALSE
FROM (SELECT * FROM NewRentPayments) AS sub
WHERE (sub.houseid, sub.apartmentnumber) IN (SELECT houseid, apartmentnumber FROM Tenants) AND t.LeaseTenantSSN = sub.LeaseTenantSSN AND t.Rent = sub.Rent;
    
    
INSERT INTO Tenants
SELECT houseid, apartmentnumber, leasetenantssn, CURRENT_DATE, NULL, rent, datepaid as lastrentpaid, FALSE
FROM NewRentPayments
WHERE (houseid, apartmentnumber) NOT IN (SELECT houseid, apartmentnumber FROM Tenants);