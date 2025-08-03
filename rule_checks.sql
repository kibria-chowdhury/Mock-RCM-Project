-- Missing Diagnosis
SELECT * FROM claims
WHERE diagnosis_code IS NULL OR diagnosis_code = '';

-- Invalid CPT
SELECT * FROM claims
WHERE procedure_code NOT IN ('99213','99214','99215');

-- Late Submission
SELECT * FROM claims
WHERE submission_date - date_of_service > 30;

-- No Submission
SELECT * FROM claims
WHERE status = 'billed' AND submission_date IS NULL;

-- Medicare Diagnosis Requirement
SELECT * FROM claims
WHERE payer = 'Medicare' AND diagnosis_code NOT LIKE 'E%';

-- % of claims violating rules by payer
SELECT payer,
       COUNT(*) FILTER (WHERE diagnosis_code IS NULL OR diagnosis_code = '') * 100.0 / COUNT(*) AS missing_diagnosis_pct,
       COUNT(*) FILTER (WHERE procedure_code NOT IN ('99213','99214','99215')) * 100.0 / COUNT(*) AS invalid_cpt_pct
FROM claims
GROUP BY payer;

-- Denial rates by provider
SELECT provider_id,
       COUNT(*) FILTER (WHERE status = 'denied') * 100.0 / COUNT(*) AS denial_rate
FROM claims
GROUP BY provider_id;

-- Average delay between DOS and submission
SELECT ROUND(AVG(submission_date - date_of_service), 2) AS avg_delay
FROM claims
WHERE submission_date IS NOT NULL;
