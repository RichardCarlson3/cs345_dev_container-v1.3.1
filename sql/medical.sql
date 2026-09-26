CREATE TABLE Doctor (
    did integer PRIMARY KEY,
    fname VARCHAR(25),
    lname VARCHAR(25),
    specialty VARCHAR(25)
);

INSERT INTO doctor (did, fname, lname, specialty) VALUES
(1232, 'Robert', 'Stafford', 'urology'),
(1233, 'George', 'Foster', 'immunology'),
(1234, 'Sophie', 'Braun', 'obstretics'),
(1235, 'John', 'Guerra', 'pediatrics'),
(1236, 'Matthew', 'Moreno', 'neurosurgery'),
(1237, 'Ashley', 'Potter', 'pulmonology');

CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    fName VARCHAR(50) NOT NULL,
    lName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F', 'O')),
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    Insurance VARCHAR(50),
    Did INT NOT NULL,
    FOREIGN KEY (Did) REFERENCES Doctor (did)
);

INSERT INTO Patient (PatientID, fname, lname, DateOfBirth, Gender, Phone,
    Email, Insurance, Did)
VALUES
(102, 'John', 'Smith', '1985-05-12', 'M', '555-0101', 'john.smith@email.com', 'BlueCross', 1235),
(103, 'Jane', 'Doe', '1992-11-23', 'F', '555-0102', 'jane.doe@email.com', 'Aetna', 1234),
(104, 'Sam', 'Brown', '1978-02-15', 'M', '555-0103', 'sam.brown@email.com', 'Cigna', 1236),
(105, 'Ram', 'Krishnamurthy', '1969-02-20', 'M', '558-8803', 'ramk@email.com', 'Cigna', 1237),
(106, 'Selena', 'Luo', '1990-08-12', 'F', '224-2971', 'sluo99@email.com', 'Blue Cross', 1233),
(107, 'Dolores', 'Delrio', '1998-11-23', 'M', '332-90113', 'ddr@email.com', 'Aetna', 1235);



