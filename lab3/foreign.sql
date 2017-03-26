ALTER TABLE Landlords
    ADD FOREIGN KEY (OwnerSSN)
    REFERENCES Persons(SSN);
    
ALTER TABLE Tenants
    ADD FOREIGN KEY (LeaseTenantSSN)
    REFERENCES Persons(SSN);

ALTER TABLE Persons
    ADD FOREIGN KEY (HouseID)
    REFERENCES Houses(HouseID);
    
ALTER TABLE Ownerships
    ADD FOREIGN KEY (HouseID)
    REFERENCES Houses(HouseID);
    
ALTER TABLE Tenants
    ADD FOREIGN KEY (HouseID)
    REFERENCES Houses(HouseID);
    
ALTER TABLE Ownerships
    ADD FOREIGN KEY (LandlordID)
    REFERENCES Landlords(LandlordID);