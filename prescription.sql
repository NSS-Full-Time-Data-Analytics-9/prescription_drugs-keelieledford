-- TRYING TO FIGURE OUT DATA
-- CORE BASED STATISTICAL AREA

-- SELECT *
-- FROM cbsa;

-- SELECT *
-- FROM zip_fips;

-- Dr. info
-- SELECT *
-- FROM prescriber;

-- SELECT *
-- FROM population;


-- overdose deaths
-- SELECT *
-- FROM overdoses;

-- SELECT *
-- FROM prescription;


--JOIN FAILS:
-- SELECT prescription.prescriber, SUM(total_claim_count) AS total_claim_count
-- FROM prescription LEFT JOIN prescriber ON prescription.npi = prescriber.npi
-- GROUP BY prescription.prescriber
-- ORDER BY total_claim_count;

-- SELECT prescription, prescriber
-- 	SUM(total_claim_count) AS total_claim_count
-- FROM prescription LEFT JOIN prescriber ON prescription.npi = prescriber.npi
-- GROUP BY prescriber;


-- 1.a = NPI1881634483, claims= 99707


-- SELECT npi, SUM(total_claim_count) AS total_claim_count
-- FROM prescriber 
-- INNER JOIN prescription
-- USING (npi)
-- GROUP BY npi
-- ORDER BY total_claim_count DESC
-- LIMIT 1;



-- 1.b

-- SELECT nppes_provider_first_name, nppes_provider_last_org_name,  specialty_description,
-- SUM(total_claim_count) AS total_claim_count
-- FROM prescriber 
-- INNER JOIN prescription
-- USING (npi)
-- GROUP BY npi, nppes_provider_first_name, nppes_provider_last_org_name,  specialty_description
-- ORDER BY total_claim_count;	





--2.a Family Practice


-- SELECT specialty_description, SUM(total_claim_count) AS total_claim_count
-- FROM prescription
-- INNER JOIN prescriber
-- USING (npi)
-- GROUP BY specialty_description
-- ORDER BY total_claim_count DESC
-- LIMIT 1;

--2b. 




                                                                                                           


--3a.

--SELECT MAX(DISTINCT total_drug_cost) AS total_cost_for_drug, drug_name
--FROM prescription
--INNER JOIN drug
--USING (drug_name)
--GROUP BY drug_name, total_drug_cost
--ORDER BY total_drug_cost DESC;

-- 3a.

-- SELECT generic_name, MAX(total_drug_cost)AS tot_drug
-- FROM drug
-- INNER JOIN prescription
-- USING (drug_name)
-- GROUP BY generic_name, drug_name
-- ORDER BY tot_drug DESC
-- LIMIT 1;


--3b


-- SELECT generic_name, ROUND(total_30_day_fill_count/30, 2) AS tot_gen_per_day
-- FROM prescription
-- INNER JOIN drug
-- USING (drug_name)
-- ORDER BY tot_gen_per_day DESC
-- LIMIT 1;


-- 4.     a. For each drug in the drug table, return the drug name and then a column named 'drug_type' which says 'opioid' for drugs which have opioid_drug_flag = 'Y', says 'antibiotic' for those drugs which have antibiotic_drug_flag = 'Y', and says 'neither' for all other drugs.

-- SELECT drug_name, opioid_drug_flag long_acting_opioid_drug_flag, antibiotic_drug_flag,
-- CASE WHEN opioid_drug_flag = 'Y' AND long_acting_opioid_drug_flag = 'Y' THEN 'opioid' 
--  WHEN antibiotic_drug_flag = 'Y' THEN 'antibiotic'
--  ELSE 'neither' 
--  END AS drug_type
-- FROM drug


 



-- -- 4b
-- SELECT drug_name, opioid_drug_flag, long_acting_opioid_drug_flag, antibiotic_drug_flag, SUM(total_drug_cost::MONEY),
		   

--  CASE WHEN opioid_drug_flag = 'Y' AND long_acting_opioid_drug_flag = 'Y' THEN 'opioid'
--  WHEN antibiotic_drug_flag = 'Y' THEN 'antibiotic' 
--  ELSE 'neither' 
--  END AS drug_type
 
-- FROM drug
-- LEFT JOIN prescription
-- USING (drug_name)
-- GROUP BY opioid_drug_flag, total_drug_cost, long_acting_opioid_drug_flag, antibiotic_drug_flag, drug_name 
-- ORDER BY SUM(total_drug_cost::MONEY);

--5.

SELECT SUM(CASE WHEN state ='TN' THEN 1 END) AS tn_tn, county, state,

FROM fips_county
INNER JOIN cbsa
USING (fipscounty)
GROUP BY state, county
ORDER BY tn_tn DESC;


SELECT *
FROM cbsa;


































































-- FROM drug
-- INNER JOIN prescription
-- USING (drug_name)































