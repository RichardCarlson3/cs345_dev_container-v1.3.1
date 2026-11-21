CREATE ROLE researcher;

CREATE VIEW DiseaseResearch AS
SELECT zipcode, age, disease
FROM patient, disease
WHERE patient.pid = disease.pid;

GRANT SELECT ON DiseaseResearch TO researcher;