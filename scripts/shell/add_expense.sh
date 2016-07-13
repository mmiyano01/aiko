#!/bin/bash
PGPASSWORD=eT9dCTZO4N9jdFMvw_oOp_gAYY psql -t -h ec2-107-22-250-212.compute-1.amazonaws.com -U zoamztsgjzuifs -d dckfchnkl0i3dj -c "INSERT INTO public.bookkeeping(expense, reporter, responsible, submitted_date, purpose) VALUES ($2, '$1', '$3', current_date, '$4');"
