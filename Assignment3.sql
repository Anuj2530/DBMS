/*      1. Creating and Dropping a new Database      */ 
create database if not exists Group1;
drop database Group1;
/*      2. Showing all the databases that are in my system      */
show databases;
/*      3. Creating table for my database      */
/*       Here i am creating another database and creating table in that so as to not harm any content in main DB      */
create database if not exists Group1;
use Group1;
create table Members(Mem_Id Int Not Null unique,Mem_Name varchar(30) Not Null, Primary Key(Mem_Id));
/*      4. Create a Table using Select Statement      */
/*       I am creating table with same attributes as Members but I don't want to copy same data in both tables so I do it this way      */
create table New_Members as ( select * from Members where 1=2);
/*      5. Drop Table      */
/*       I am dropping the table created with select statement i.e. New_Members      */
drop table New_Members;
/*      6. Check Schema of Tables      */
/*       It is same as description of Table so I am describing table created just now i.e. Members*/
desc Members;
/*      7. Show all Table From Database      */
/*       I will use my main database as there are multiple tables and values are already inserted      */
use myHospital;
show tables;
/*      8. Insert 5-10 rows in each table      */
/*       I have already inserted min 10 values in each table and the screenshot will be provided in pdf      */


/*      9. Usage of Select Statement      */
/*       I am using select statement to give all details about Patient      */
select * from Patients;
/*      10. Use Relational and Logical Operators      */
/*       I am using both Relational and Logical Operator in same query      */
select * from Patients where Pat_Age>50 and Pat_Sex = 'M';
/*      11. Use a subquery      */
/*       I am getting all details of Relatives where Pat_Id in Patients table is greater than 100 i.e. all because Pat_Id starts from 100      */
select * from Relatives R where R.Pat_Id in (select Pat_Id from Patients where Pat_Id > 100);