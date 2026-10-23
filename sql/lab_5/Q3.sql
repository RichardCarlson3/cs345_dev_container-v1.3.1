CREATE TABLE Product (
    pid INT PRIMARY KEY,
    name VARCHAR(20)
);
 
CREATE TABLE Inventory (
    pid INT REFERENCES Product,
    quantity INT CHECK (quantity >= 0),
    PRIMARY KEY(pid)
);
 
CREATE TABLE Supplier (
    sid INT PRIMARY KEY,
    name VARCHAR(20),
    address VARCHAR(50)
);
 
CREATE TABLE Supplies (
    sid INT REFERENCES Supplier
    ON DELETE CASCADE,
    pid INT REFERENCES Product,
    PRIMARY KEY (sid, pid)
);
 
CREATE TABLE PurchaseOrder (
    pid INT REFERENCES Product,
    quantity INT REFERENCES Inventory,
    PRIMARY KEY (pid, quantity)
);
