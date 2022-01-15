data want;
  erste_besuch = '30-06-2020';

  format tday yymmddn8. ; 
  format date_nk yymmddn8. ; 
  format date_nk_12mon yymmddn8. ; 

  *** THIS IS A SAS DATE ***;
  tday=today(); 

  *** THESE ARE NUMERIC BUT -NOT- SAS DATES - SO USING DATE FORMATS WITH THESE VARIABLES IS A PROBLEM ***;
  *date_nk = put(input(erste_besuch, ddmmyy10.), yymmdd8.)*1;
  *date_nk = put(input(erste_besuch, ddmmyy10.), yymmddn8.)*1;
  *date_nk_12mon = date_nk + 10000; 

  *** THESE ARE SAS DATES ***;
  date_nk = input(erste_besuch, ddmmyy10.);
  date_nk_12mon = intnx('month', date_nk, 12, 'same');

  *** IF DATE VARIABLES ARE MISSING, KEEP AS MISSING, DO NOT RESET TO ZERO ***;
  *if date_nk='' then date_nk=0; 
  *if date_nk_12mon='' then date_nk_12mon=0;

  *** NOW YOU HAVE 3 VARIABLES THAT ARE ALL SAS DATES AND CAN COMPARE THEM CORRECTLY ***;
  if date_nk < tday < date_nk_12mon then neukunde="1"; 
run;

title 'NEW ATTEMPT';
proc print data=want;
run;
title2 'WITHOUT FORMATS';
proc print data=want;
    format _all_;
run;
