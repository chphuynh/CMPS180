CREATE VIEW Home_Landlords AS
    SELECT l.ownerssn as SSN, l.landlordid, p.houseid, p.apartmentnumber
    FROM Landlords l, Persons p, Houses h
    WHERE l.ownerssn = p.ssn AND p.houseid = h.houseid AND l.landlordaddress = h.houseaddress;