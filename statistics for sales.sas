/* Calculate summary statistics for the cr.employee table.

Subset the rows to include only the Sales Department.

Calculate the sum, mean, minimum, and maximum of Salary for each value of JobTitle. Round values to the nearest whole number. */

proc means data=cr.employee sum mean min max maxdec=0;	
    where Department="Sales";
    var Salary;
    class JobTitle;
    ways 0 1;
run;
