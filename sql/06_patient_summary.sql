-- Created a new table through JOINS to summarize data from patients, admissions, diagnoses, and medications
CREATE TABLE patient_summary AS
SELECT 
    p.patient_id,
    p.age,
    p.gender,
    p.race,
    a.admission_id,
    a.time_in_hospital,
    d.diagnosis_1,
    m.num_medications
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
JOIN diagnoses d ON a.admission_id = d.admission_id
JOIN medications m ON a.admission_id = m.admission_id;