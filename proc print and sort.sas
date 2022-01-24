proc sort data=sashelp.baseball out=baseball_sort;
    by Team Name;
run;

title "Baseball Team Statistics";
proc print data=baseball_sort label;
    by Team;
    id Name;
    var Position YrMajor nAtBat nHits nHome;
    sum nAtBat nHits nHome;
run;

/*The ID statement can be used to specify a column to identify rows and replace the OBS column. */
