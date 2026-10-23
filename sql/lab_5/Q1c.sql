CREATE TABLE Office(
    phone VARCHAR(10),
    address VARCHAR(10) PRIMARY KEY,
    badgeID VARCHAR(10) REFERENCES Doctor
);