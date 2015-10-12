ods listing close;


/* Prepare the data. */

proc sql noprint;
        create table work.country_summary as
                select country as country,
                           sum(sales) as total_sales,
                           sum(returns) as total_returns
                from sashelp.shoes
                group by country
                order by country asc;
quit;
