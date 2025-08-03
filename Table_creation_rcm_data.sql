DROP TABLE IF EXISTS claims;
DROP TABLE IF EXISTS payer_rules;

CREATE TABLE claims (
    claim_id INT PRIMARY KEY,
    patient_id INT,
    provider_id INT,
    payer TEXT,
    procedure_code TEXT,
    diagnosis_code TEXT,
    billed_amount NUMERIC,
    date_of_service DATE,
    submission_date DATE,
    status TEXT
);

CREATE TABLE payer_rules (
    payer TEXT,
    rule_name TEXT,
    rule_logic TEXT,
    severity TEXT
);
