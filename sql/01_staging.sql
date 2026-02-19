CREATE TABLE patients (
    patient_id VARCHAR(50) PRIMARY KEY,
    age VARCHAR(20),
    gender VARCHAR(10),
    race VARCHAR(50)
);

CREATE TABLE admissions (
    admission_id SERIAL PRIMARY KEY,
    patient_id VARCHAR(50),
    admission_type VARCHAR(50),
    discharge_disposition VARCHAR(50),
    time_in_hospital INT,
    readmitted VARCHAR(10),
    FOREIGN KEY (patient_id) 
        REFERENCES patients(patient_id)
);

CREATE TABLE diagnoses (
    admission_id INT,
    diagnosis_1 VARCHAR(20),
    diagnosis_2 VARCHAR(20),
    diagnosis_3 VARCHAR(20),
    FOREIGN KEY (admission_id)
        REFERENCES admissions(admission_id)
);

CREATE TABLE medications (
    admission_id INT,
    num_medications INT,
    FOREIGN KEY (admission_id)
        REFERENCES admissions(admission_id)
);

CREATE TABLE staging_diabetes_raw (
    encounter_id BIGINT,
    patient_nbr BIGINT,
    race VARCHAR(50),
    gender VARCHAR(20),
    age VARCHAR(20),
    weight VARCHAR(20),
    admission_type_id INT,
    discharge_disposition_id INT,
    admission_source_id INT,
    time_in_hospital INT,
    payer_code VARCHAR(20),
    medical_specialty VARCHAR(100),
    num_lab_procedures INT,
    num_procedures INT,
    num_medications INT,
    number_outpatient INT,
    number_emergency INT,
    number_inpatient INT,
    diag_1 VARCHAR(20),
    diag_2 VARCHAR(20),
    diag_3 VARCHAR(20),
    number_diagnoses INT,
    max_glu_serum VARCHAR(20),
    A1Cresult VARCHAR(20),
    metformin VARCHAR(20),
    repaglinide VARCHAR(20),
    nateglinide VARCHAR(20),
    chlorpropamide VARCHAR(20),
    glimepiride VARCHAR(20),
    acetohexamide VARCHAR(20),
    glipizide VARCHAR(20),
    glyburide VARCHAR(20),
    tolbutamide VARCHAR(20),
    pioglitazone VARCHAR(20),
    rosiglitazone VARCHAR(20),
    acarbose VARCHAR(20),
    miglitol VARCHAR(20),
    troglitazone VARCHAR(20),
    tolazamide VARCHAR(20),
    examide VARCHAR(20),
    citoglipton VARCHAR(20),
    insulin VARCHAR(20),
    glyburide_metformin VARCHAR(20),
    glipizide_metformin VARCHAR(20),
    glimepiride_pioglitazone VARCHAR(20),
    metformin_rosiglitazone VARCHAR(20),
    metformin_pioglitazone VARCHAR(20),
    change VARCHAR(10),
    diabetesMed VARCHAR(10),
    readmitted VARCHAR(10)
);
