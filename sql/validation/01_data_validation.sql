-- Data Validation Checks 

SELECT * FROM staging_diabetes_raw; 

SELECT readmitted, COUNT (*)
FROM staging_diabetes_raw 
GROUP BY readmitted; 

-- Check for any missing values 

-- race
SELECT COUNT(*) 
FROM staging_diabetes_raw 
WHERE race is NULL; 

-- gender
SELECT COUNT(*) 
FROM staging_diabetes_raw 
WHERE gender is NULL; 

-- diagnoses 1
SELECT COUNT(*) 
FROM staging_diabetes_raw 
WHERE diag_1 is NULL; 

-- medical specialty
SELECT COUNT(*) 
FROM staging_diabetes_raw 
WHERE medical_specialty is NULL; 