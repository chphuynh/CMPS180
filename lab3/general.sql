ALTER TABLE Ownerships
    ADD CONSTRAINT tax_not_negative
    CHECK ( PropertyTax >= 0);

ALTER TABLE Tenants
    ADD CONSTRAINT  positive_rent
    CHECK ( Rent > 0);

ALTER TABLE Tenants
    ADD CONSTRAINT check_lease
    CHECK ( LeaseExpirationDate = NULL
            OR (LeaseExpirationDate <> NULL 
                AND LeaseExpirationDate > LeaseStartDate));

ALTER TABLE Tenants
    ADD CONSTRAINT check_paid_date
    CHECK ( LastRentPaidDate <> CURRENT_DATE
            OR (LastRentPaidDate = CURRENT_DATE
                AND RentOverdue = FALSE));