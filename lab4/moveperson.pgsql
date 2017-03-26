CREATE FUNCTION movePerson(
    IN personSSN INT, 
    IN personAddress VARCHAR(40),
    IN personApartmentNumber INT
    )
    RETURNS INTEGER AS
    $$
    DECLARE 
        checkSSN INTEGER;
        checkHouse INTEGER;
        checkApartment BOOLEAN;
    BEGIN
        SELECT COUNT(*) INTO checkSSN FROM Persons WHERE SSN = personSSN;
        SELECT COUNT(*) INTO checkHouse FROM Houses WHERE HouseAddress = personAddress;
        IF personApartmentNumber < 1 OR 
           personApartmentNumber > (SELECT ApartmentCount FROM Houses
                                    WHERE HouseAddress = personAddress)
        THEN checkApartment := FALSE;
        ELSE checkApartment := TRUE;
        END IF;
        
        IF checkSSN = 1 AND checkHouse = 1 AND checkApartment = TRUE
        THEN
            UPDATE Persons p
            SET HouseId = sub.HouseId, ApartmentNumber = personApartmentNumber
            FROM (SELECT * FROM Houses WHERE HouseAddress = personAddress) AS sub
            WHERE p.SSN = personSSN;
            
            RETURN (SELECT HouseId FROM Houses WHERE HouseAddress = personAddress);
        ELSE
            RETURN -1;
        END IF;
    END;
    $$ LANGUAGE plpgsql;