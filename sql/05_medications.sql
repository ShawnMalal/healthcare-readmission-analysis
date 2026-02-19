INSERT INTO medications (admission_id, num_medications)
SELECT
    a.admission_id,
    s.num_medications
FROM staging_diabetes_raw s
JOIN admissions a
ON s.patient_nbr::VARCHAR = a.patient_id
AND s.time_in_hospital = a.time_in_hospital;