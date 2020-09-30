use myHospital;
/*         1. ORDER BY CLAUSE         */
/*          We are arranging whole Bills table in ascending and descinding order on the basis of Date_Admitted         */
select * from Bills order by Date_Admitted;
select * from Bills order by Date_Admitted desc;
/*         2. GROUP BY and HAVING         */
/*          We are grouping the count of Pat_Id based on the Sex of the Patient         */
select count(Pat_Id) from Patients group by Pat_Sex;
/*          We are grouping the count of Doc_Id based on sex of Doc and displaying number of Doc_Id which are greater than 5         */
/*          As there are only 2 kinds of sex and there are 10 male and female doctors it will show 10 for both         */
select count(Doc_Id) from Doctors group by Doc_Sex having count(Doc_Id)>5;
/*       3. AGGREGATE FUNCTIONS , There are 5 aggregate functions, we will show all of them         */
/*        3.1 COUNT FUNCTION  , We will count the number of Pat_Age and that should give 10 as there are 10 patients in the Table       */
select count(Pat_Age) from Patients;
/*         3.2 SUM FUNCTION   , We will calculate the sum of Pat_Age and that should give the sum of all 10 patients         */
select sum(Pat_Age) from Patients;
/*         3.3 AVG FUNCTION   , We will calculate the average of Pat_Age and that should add all 10 ages and divide it by 10         */
select avg(Pat_Age) from Patients;
/*         3.4 MIN FUNCTION   , We will calculate the minimum of Pat_Age and that should give the age of youngest patient         */
select min(Pat_Age) from Patients;
/*         3.5 MAX FUNCTION    , We will calculate the maximum of Pat_Age and that should give the age of oldest patient         */
select max(Pat_Age) from Patients;
/*         4. LOGICAL OPERATORS WITH LIKE         */
/*         We will two examples of Pat_FName starting with 'A' and ending with 'A' and we will give all details of these people         */
select * from Patients where Pat_FName like 'a%';
select * from Patients where Pat_FName like '%a';
/*         5. NESTED QUERIES ATLEAST 4         */
/*          5.1 Using 1 nested query  , it should give all details as all Pat_Id is greater than 100       */
select * from Patients where Pat_Id in (select Pat_Id from Bills where Pat_Id > 100);
/*          5.2 USing 2 nested queries , it gives all details of Doctors       */
select * from Doctors where Doc_Id in (select Doc_Id from Patients where Pat_Id in (select Pat_Id from Relatives where Pat_Id>300));
/*          5.3 Using 2 nested queries , it gives Consultation_Fee from Bills Table         */
select Consultation_Fee from Bills where Pat_Id in (select Pat_Id from Patients where Pat_Id in (select Pat_Id from Relatives where Pat_Id>200));
/*          5.4 Using 2 nested queries , it gives Speciality_Name from Specialities Table       */
select Speciality_Name from Specialities where Speciality_Id in (select Speciality_Id from Doctors where Doc_Id in (select Doc_Id from Patients where Doc_Id>0));