SELECT fname, lname, disease
FROM DiseaseResearch, Voter
WHERE DiseaseResearch.zipcode = Voter.zipcode AND DiseaseResearch.age = Voter.age;