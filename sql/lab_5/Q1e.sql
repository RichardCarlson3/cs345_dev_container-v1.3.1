CREATE TABLE Consults(
    date VARCHAR(10),
    room VARCHAR(10),
    address VARCHAR(10),
    badgeId VARCHAR(10) REFERENCES Doctor,
    ssn VARCHAR(10) REFERENCES Patient,
    PRIMARY KEY(address, room, badgeId, ssn),
    FOREIGN KEY(address, room) REFERENCES ExamRoom
);