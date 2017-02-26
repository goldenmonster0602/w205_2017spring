select a.measure_id, stddev(a.score) from effective_transform a where score IS NOT NULL  group by a.measure_id order by stddev(a.score) DESC limit 10;

select a.measure_id, stddev(a.score) from readmission_transform a where score IS NOT NULL  group by a.measure_id order by stddev(a.score) DESC limit 10;
