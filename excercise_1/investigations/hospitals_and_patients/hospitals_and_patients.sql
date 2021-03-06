DROP TABLE correlation_table;
create table correlation_table as
select CORR(a.hcahps_base_score + a.environment_performance_rate, b.rating) from survey_transform a, hospitals_transform b where hcahps_base_score IS NOT NULL AND environment_performance_rate IS NOT NULL AND rating IS NOT NULL AND a.provider_number = b.provider_id;
