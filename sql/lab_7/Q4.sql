CREATE INDEX IF NOT EXISTS doc_spec ON Doctor(specialty);
CREATE INDEX IF NOT EXISTS patient_fname_lname ON Patient(fname, lname);
CREATE INDEX IF NOT EXISTS doctor_fname_lname ON Doctor(fname, lname);
CREATE INDEX IF NOT EXISTS Sees_did_pid ON Sees(did, pid);
CREATE INDEX IF NOT EXISTS Disease_disease ON Disease(disease);
CREATE INDEX IF NOT EXISTS Patient_age ON Patient(age);
CREATE INDEX IF NOT EXISTS Patient_zip ON Patient(zipcode);