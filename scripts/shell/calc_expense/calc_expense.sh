#!/bin/bash
PGPASSWORD=eT9dCTZO4N9jdFMvw_oOp_gAYY psql -t -h ec2-107-22-250-212.compute-1.amazonaws.com -U zoamztsgjzuifs -d dckfchnkl0i3dj -c "SELECT SUM(expense) as total FROM
(
SELECT SUM(expense) AS expense FROM public.bookkeeping
  WHERE date_part('month', submitted_date) = '$1'
    AND date_part('year', submitted_date) = '$2'
    AND responsible = '$3'
UNION ALL
SELECT SUM(expense)/2 AS expense FROM public.bookkeeping
  WHERE date_part('month', submitted_date) = '$1'
    AND date_part('year', submitted_date) = '$2'
    AND responsible = 'even' AND reporter = '$4') AS expense;"
