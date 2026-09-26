create table Company(
    cname varchar(30) primary key, 
    country varchar(30)
);

insert into Company values('GizmoWorks','USA');
insert into Company values('Canon','Japan');
insert into Company values('Hitachi','Japan');

create table Product(
    pname varchar(30) primary key, 
    price float, 
    category varchar(30), 
    manufacturer varchar(30),
    foreign key (manufacturer) references Company (cname)
);

insert into Product values('Gizmo',19.99,'Gadgets','GizmoWorks');
insert into Product values('PowerGizmo',29.99,'Gadgets','GizmoWorks');
insert into Product values('SingleTouch',149.99,'Photography','Canon');
insert into Product values('Multitouch',203.99,'Household','Hitachi');
insert into Product values('SuperGizmo',49.99, 'Gadgets', 'Hitachi');
insert into Product values('Gizmo-Plus',NULL,'Gadgets','GizmoWorks');

create table Employee(
    empID integer primary key, 
    empName varchar(50), 
    phone varchar(12), 
    managerID integer
);

insert into Employee values (1, 'John', '555-1234', 5);
insert into Employee values (2, 'Alice', '555-4321', 3);
insert into Employee values (3, 'Peter', '555-2314', 5);
insert into Employee values (4, 'Cecilia', '555-3241', 1);
insert into Employee values (5, 'James', '555-4231', NULL);

ALTER TABLE Employee ADD CONSTRAINT fk_emp_mgr foreign key (managerID) references Employee (empID);

create table Project(
    projID int primary key,
    projName varchar(40)
);

insert into Project values (1, 'Web archive') ;
insert into Project values (2, 'Phone app');
insert into Project values (3, 'Dev Ops');
insert into Project values (4, 'Game design');

create table ProjAssign(
    assignID int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    projID int not null,
    empID int not null, 
    assignDate date not null,
    foreign key (projID) references Project (projID),
    foreign key (empID) references Employee (empID)
);

insert into ProjAssign (projID, empID, assignDate) values (1, 2, '2024-06-05') ;
insert into ProjAssign (projID, empID, assignDate) values (1, 3, '2024-06-05') ;
insert into ProjAssign (projID, empID, assignDate) values (1, 2, '2024-06-08') ;
insert into ProjAssign (projID, empID, assignDate) values (2, 1, '2024-06-13') ;
insert into ProjAssign  (projID, empID, assignDate)values (2, 4, '2024-06-13') ;
insert into ProjAssign (projID, empID, assignDate) values (3, 2, '2024-07-01') ;


