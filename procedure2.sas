/*submit a program to read the cr.employee_raw table and create a new s
orted table named emp_sort. Sort rows by all columns and remove entirely 
duplicated rows.*/

proc sort data=cr.employee_raw
out=emp_sort nodupkey;
*dupout=dups;
format TermDate HireDate BirthDate date9.;
by EmpID;
run;

/* write and submit a procedure step to read the emp_sort table and create a
 listing of all employees with a JobTitle that includes Logistics*/

proc print data=work.emp_sort;
where JobTitle like '%Logistics%';
format TermDate HireDate BirthDate date9.;
run;


/*What is the average salary for employees with a hire date on or after
 January 1, 2010, and a missing value for TermDate?*/

proc means data=emp_sort n mean;
    where HireDate >= "01JAN2010"d and TermDate is missing;
    var salary;
run;

/*What is the third highest salary among all employees?*/

proc univariate data=emp_sort;
    var Salary;
run;
