/* Create a new table named sales and read cr.employee. 
Include only employees in the Sales Department with no termination date (TermDate).
Generate a report that includes the number of Sales employees in each level.*/


data sales;
    set cr.employee;
    length SalesLevel $ 6;
    where Department="Sales" and TermDate is missing;
    Country=upcase(Country);
    if substr(JobTitle, 12)="I" then SalesLevel="Entry";
    else if substr(JobTitle, 12) in("II" "III") then   
            SalesLevel="Middle";
    else if substr(JobTitle, 12)="IV" then SalesLevel="Senior";
run;

proc freq data=sales;
    tables SalesLevel;
run;
