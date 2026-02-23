DROP TABLE IF EXISTS modeling_dataset;

CREATE TABLE modeling_dataset AS
SELECT
    encounter_id,
    patient_nbr,
    age,
    gender,
    race,
    time_in_hospital,
    num_lab_procedures,
    num_procedures,
    num_medications,
    number_outpatient,
    number_emergency,
    number_inpatient,
    number_diagnoses,
    
    (number_outpatient + number_emergency + number_inpatient) AS total_prior_visits,
    
    CASE 
        WHEN (number_outpatient + number_emergency + number_inpatient) = 0 THEN '0'
        WHEN (number_outpatient + number_emergency + number_inpatient) BETWEEN 1 AND 3 THEN '1-3'
        WHEN (number_outpatient + number_emergency + number_inpatient) BETWEEN 4 AND 6 THEN '4-6'
        ELSE '7+'
    END AS visit_bucket,
    
    CASE 
        WHEN readmitted = '<30' THEN 1
        ELSE 0
    END AS readmitted_binary

FROM staging_diabetes_raw;