/*Write a new program that reads the sashelp.heart table and separates rows into two tables, 
dead and alive, based on the value of Status. 
Drop Status from both tables and drop DeathCause and AgeAtDeath from the alive table*/

data alive(drop=DeathCause AgeAtDeath Status) dead(drop=Status);
    set sashelp.heart;
    if Status="Alive" then output alive;
    else if Status="Dead" then output dead;
run;
