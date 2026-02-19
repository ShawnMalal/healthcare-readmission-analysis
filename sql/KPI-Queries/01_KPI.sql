-- Defining Core Healthcare KPIs 

-- 30 Day Readmission Rate (KPI 1)
SELECT 
	COUNT(*) FILTER (WHERE readmitted = '<30')::float / COUNT(*)
	AS readmission_rate 
FROM staging_diabetes_raw

-- Average Length of Stay (KPI 2) 
SELECT AVG(time_in_hospital)
FROM staging_diabetes_raw

-- Readmission by Age Group (KPI 3)
SELECT 
	age, 
	COUNT(*) FILTER (WHERE readmitted = '<30')::float / COUNT(*) AS rate 
	FROM staging_diabetes_raw 
	GROUP BY age 
	ORDER BY age; 

-- Readmission by Prior Admissions (KPI 4)
SELECT 
    (number_inpatient + number_emergency + number_outpatient) AS total_prior_visits,
    COUNT(*) FILTER (WHERE readmitted = '<30')::float / COUNT(*) AS readmit_rate
FROM staging_diabetes_raw
GROUP BY total_prior_visits
ORDER BY total_prior_visits;

-- Readmission by Prior Admissions (KPI 5)
SELECT 
    number_diagnoses,
    COUNT(*) FILTER (WHERE readmitted = '<30')::float / COUNT(*) AS readmit_rate
FROM staging_diabetes_raw
GROUP BY number_diagnoses
ORDER BY number_diagnoses;