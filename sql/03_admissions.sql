INSERT INTO admissions (
    patient_id,
    admission_type,
    discharge_disposition,
    time_in_hospital,
    readmitted
)
SELECT
    patient_nbr::VARCHAR,
    admission_type_id::VARCHAR,
    discharge_disposition_id::VARCHAR,
    time_in_hospital,
    readmitted
FROM staging_diabetes_raw;