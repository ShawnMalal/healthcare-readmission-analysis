INSERT INTO patients (patient_id, age, gender, race)
SELECT DISTINCT 
	patient_nbr::VARCHAR, 
	age, 
	gender,
	race 
FROM staging_diabetes_raw
ON CONFLICT (patient_id) DO NOTHING;