select a.state, avg(a.rating) from hospitals_transform a where rating IS NOT NULL group by a.state order by avg(a.rating) DESC limit 10;
