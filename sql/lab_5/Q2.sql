CREATE TABLE B(
    c INT PRIMARY KEY,
    d INT
);
CREATE TABLE A(
    a INT,
    b INT,
    c INT,
    PRIMARY KEY(a, c),
    FOREIGN KEY(c) REFERENCES B
);
CREATE TABLE C(
    e INT,
    a INT,
    c INT,
    PRIMARY KEY(a, c),
    FOREIGN KEY(a, c) REFERENCES A
);
CREATE TABLE D(
    g INT PRIMARY KEY,
    h INT
);
CREATE TABLE S(
    g INT REFERENCES D,
    a INT,
    c INT,
    f INT,
    PRIMARY KEY(g, a, c),
    FOREIGN KEY(a, c) REFERENCES C
);