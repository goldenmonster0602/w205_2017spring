DROP TABLE best_hospital_table;
create table best_hospital_table as
select a.provider_number, a.hospital_name,  a.hcahps_base_score + a.hcahps_consistency_score from survey_transform a where hcahps_base_score IS NOT NULL AND hcahps_consistency_score IS NOT NULL order by a.hcahps_base_score + a.hcahps_consistency_score DESC limit 10;
