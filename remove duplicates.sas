/* The PROC SQL way of removing duplicate values is intuitive and easy to understand. In the select clause, 
we use the DISTINCT keyword to account for exact duplicate observations in the data.
A small example of removing duplicate observations from the example data set is specified below.*/


proc sql;
	create table NoDuplicates2 as
	select distinct *
	from Mydata;
quit;

/*The Sort Procedure with the NODUPKEY option is the simplest and most common way of removing duplicate values in SAS.
Simply specify the NODUPKEY option in the PROC SORT statement. In the BY statement, specify the variables by which you want to remove duplicates. 
In this case, we want to remove all exact duplicates, so we specify _ALL_ in the BY statement.*/

proc sort data=Mydata out=NoDuplicates1 nodupkey;
	by _all_; /* Or equivalently by ID var1-var3 */
run;

proc sort data=Mydata out=NoDuplicates1 nodupkey;
	by ID var1;
run;
