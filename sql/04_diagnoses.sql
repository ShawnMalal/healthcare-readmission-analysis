INSERT INTO diagnoses (admission_id, diagnosis_1, diagnosis_2, diagnosis_3)
SELECT
    a.admission_id,
    s.diag_1,
    s.diag_2,
    s.diag_3
FROM staging_diabetes_raw s
JOIN admissions a 
ON s.patient_nbr::VARCHAR = a.patient_id
AND s.time_in_hospital = a.time_in_hospital;