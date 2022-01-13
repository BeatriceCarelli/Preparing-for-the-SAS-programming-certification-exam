proc sort data=sashelp.baseball
	out=baseball_Sort;
	by Team Name;
run;

proc print data=baseball_Sort;
	where Team in ("San Francisco", "Los Angeles", "Oakland");
	keep Name Team Salary ;
run;

/* I can see the value of Position has the most players */

proc freq data=baseball_Sort order=freq;
	tables Position;
run;

/* I can see the average value of the Salary column */

proc means data=baseball_Sort maxdec=0 mean;
	var salary;
run;
