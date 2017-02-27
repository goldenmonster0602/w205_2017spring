DROP TABLE best_state_table;
create table best_state_table as
select a.state, avg(a.rating) from hospitals_transform a where rating IS NOT NULL group by a.state order by avg(a.rating) DESC limit 10;
DROP TABLE best_state_table1;
create table best_state_table1 as
select a.state, avg(a.hcahps_base_score + a.hcahps_consistency_score) from survey_transform a group by a.state order by avg(a.hcahps_base_score + a.hcahps_consistency_score) DESC limit 10;
