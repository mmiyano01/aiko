#!/bin/bash
PGPASSWORD=eT9dCTZO4N9jdFMvw_oOp_gAYY psql -t -h ec2-107-22-250-212.compute-1.amazonaws.com -U zoamztsgjzuifs -d dckfchnkl0i3dj -c "SELECT SUM(expense) FROM public.bookkeeping WHERE date_part('month', submitted_date) = '$1' AND date_part('year', submitted_date) = '$2';"
