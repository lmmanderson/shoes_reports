ods listing close;

%let workpath=%sysfunc(getoption(WORK));

filename outfile '/&workpath/shoes_by_country.pdf';

ods pdf file=outfile;

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

/* Generate a tabular report. */

proc report data=work.country_summary;
        column Region total_sales total_returns;
        rbreak after / summarize;
        title 'Shoes Sales by Country';
run;
