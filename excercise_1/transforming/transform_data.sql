DROP TABLE hospitals_transform;
create table hospitals_transform as 
select
    provider_id,
    hospital_name, 
    state, 
    cast(hospital_overall_rating as float) rating
from hospitals
where hospital_overall_rating not like 'Not%'
;


DROP TABLE effective_transform;
create table effective_transform as 
select
    provider_id,
    condition, 
    measure_id, 
    cast(score as float) score
from effective_care
where score not like 'Not%'
;


DROP TABLE readmission_transform;
create table readmission_transform as 
select
    provider_id,
    measure_name, 
    measure_id, 
    compared_to_national,
    cast(score as float) score
from readmissions
where score not like 'Not%'
;

DROP TABLE survey_transform;
create table survey_transform as 
select
    provider_number,
    cast(communication_with_nurses_performance_rate as float) nurses_performance_rate,
    cast(communication_with_doctors_performance_rate as float) doctors_performance_rate,
    cast(responsiveness_of_hospital_staff_performance_rate as float) staff_performance_rate,
    cast(pain_management_performance_rate as float) pain_management_performance_rate,
    cast(communication_about_medicines_performance_rate as float) medicines_performance_rate,
    cast(cleanliness_and_quietness_of_hospital_environment_performance_rate as float) environment_performance_rate,
    cast(overall_rating_of_hospital_performance_rate as float) overall_rating_of_hospital_performance_rate,
    cast(hcahps_base_score as float) hcahps_base_score,
    cast(hcahps_consistency_score as float) hcahps_consistency_score
from surveys_responses
where communication_with_nurses_performance_rate not like 'Not%'  AND communication_with_doctors_performance_rate not like 'Not%' AND responsiveness_of_hospital_staff_performance_rate not like 'Not%' AND  pain_management_performance_rate not like 'Not%'  AND communication_about_medicines_performance_rate not like 'Not%'  AND cleanliness_and_quietness_of_hospital_environment_performance_rate not like 'Not%'  AND overall_rating_of_hospital_performance_rate not like 'Not%'  AND hcahps_base_score not like 'Not%'  AND hcahps_consistency_score not like 'Not%' 
;

