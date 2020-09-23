use myHospital;
/*         1. Many-to-Many relation is the relation between Patients and Nurses         */
/*         2. Composite key is the combination of (Nurses_Nurse_Id, Patients_Pat_Id) and the weak entity is Relatives Table         */
/*         3. Violation of Primary key is same as violation of Unique Key         */
/*           As the Speciality_Id is unique and Primary Key and 110 already exists in table, it doesn't accept same values         */
insert into Specialities values (110, 'Orthodontics');
/*         3. Inserting Null Value in an attribute set to Not Null should give Error         */
/*          Here Speciality_Id is set to Not Null and if Null value is inserted it must give error         */
insert into Specialities values  (null, 'Orthodontics');
/*         3. Not inserting any value in an attribute not having default value must give Error         */
/*          Here Speciality_Name doesn't have any default value and if not assigned any value it must give Error         */
insert into Specialities(Speciality_Id) values (111);
/*         4. Derived Attribute         */
/*          In Bills table to calculate total bill we are adding consulation fee and room charges as 1000 rs per day         */
select Consultation_Fee + (datediff(Date_Discharged,Date_Admitted))* 1000 as Total_Fee from Bills;
/*         5. We are adding Speciality_Id in Doctors Table directly without adding in Specialities table it is violating foreign key rules         */
/*          There is no 111 Speciality_Id in Specialities Table and if we give it in Speciality_Id in Doctors Table  it must give Error         */
insert into Doctors values (221,'Nikhil',60,'M',111);      