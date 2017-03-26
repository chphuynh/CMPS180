SELECT p.name, t.rent
FROM Home_Landlords h, Persons p, Tenants t
WHERE h.ssn = p.ssn AND h.ssn = t.leasetenantssn AND RentOverdue = TRUE;

/*
Results of data before deletions
              name              |  rent
--------------------------------+---------
 Robert Johnson                 | 1802.40
 Alex Jones                     | 2201.10
 Juan Rodriguez                 | 3104.10
 Juan Rodriguez                 | 2310.50

 Statement to delete tuples
 DELETE FROM Tenants 
 WHERE (houseid = 1000 OR houseid = 1100) AND apartmentnumber = 2;

 Second output after deletions
              name              |  rent
--------------------------------+---------
 Robert Johnson                 | 1802.40
 Juan Rodriguez                 | 3104.10

*/