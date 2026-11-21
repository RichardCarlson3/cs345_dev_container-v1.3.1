CREATE VIEW PublicDoctor AS
SELECT fname, lname, specialty
FROM Doctor;

GRANT SELECT ON PublicDoctor TO PUBLIC;