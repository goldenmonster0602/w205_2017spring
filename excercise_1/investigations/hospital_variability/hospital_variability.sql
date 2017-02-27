DROP TABLE variability_table;
create table variability_table as
select a.measure_id, stddev(a.score) from effective_transform a where score IS NOT NULL  group by a.measure_id order by stddev(a.score) DESC limit 10;
DROP TABLE variability_table1;
create table variability_table1 as
select a.measure_id, stddev(a.score) from readmission_transform a where score IS NOT NULL  group by a.measure_id order by stddev(a.score) DESC limit 10;
