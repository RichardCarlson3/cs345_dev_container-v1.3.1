CREATE TABLE ExamRoom(
    address VARCHAR,
    room VARCHAR,
    PRIMARY KEY(address, room),
    FOREIGN KEY(address) REFERENCES Office
);