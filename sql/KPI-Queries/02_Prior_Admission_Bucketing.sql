SELECT 
    CASE
        WHEN (number_inpatient + number_emergency + number_outpatient) = 0 THEN '0'
        WHEN (number_inpatient + number_emergency + number_outpatient) = 1 THEN '1'
        WHEN (number_inpatient + number_emergency + number_outpatient) BETWEEN 2 AND 3 THEN '2-3'
        WHEN (number_inpatient + number_emergency + number_outpatient) BETWEEN 4 AND 6 THEN '4-6'
        ELSE '7+'
    END AS visit_bucket,
    COUNT(*) AS sample_size,
    COUNT(*) FILTER (WHERE readmitted = '<30')::float / COUNT(*) AS readmit_rate
FROM staging_diabetes_raw
GROUP BY visit_bucket
ORDER BY visit_bucket;