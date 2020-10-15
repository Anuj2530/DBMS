use myHospital;
/* 1. INNER JOIN WITH OPERATORS AND CLAUSES */
/*1.1. Inner Join between Specialities and Doctors Table */
select Specialities.Speciality_Name,Doctors.Doc_Name from Specialities inner join Doctors on Specialities.Speciality_Id=Doctors.Speciality_Id;
/* 1.2. Inner Join between Patients and Bills Table using Order BY Clause and '+' operator*/
select concat(Patients.Pat_FName,' ',Patients.Pat_LName) as Pat_Name,Bills.Date_Admitted from Patients inner join Bills on Patients.Pat_Id=Bills.Pat_Id order by Bills.Date_Admitted;
/* 1.3. Inner Join between Patients,Nurses_has_Patients and Nurses */
select Patients.Pat_FName,Nurses.Nurse_Name from ((Nurses_has_Patients inner join Patients on Nurses_has_Patients.Patients_Pat_Id=Patients.Pat_Id) inner join Nurses on Nurses_has_Patients.Nurses_Nurse_Id=Nurses.Nurse_Id) order by Nurses.Nurse_Name;

/* 2. LEFT OUTER JOIN WITH OPERATORS AND CLAUSES */
/* 2.1. Left Outer Join between Doctors and Patients using ORDER BY Clause */
select Doctors.Doc_Name,concat(Patients.Pat_FName,' ',Patients.Pat_LName)as Pat_Name from Doctors left join Patients on Doctors.Doc_Id=Patients.Doc_Id order by Doctors.Doc_Name;
/* 2.2. Left Outer Join between Patients and Bills using WHERE Clause */
/* Here it only gives consultation fee greater than 10000 */
select Patients.Pat_FName,Bills.Consultation_Fee from Patients left join Bills on Patients.Pat_Id=Bills.Pat_Id where Bills.Consultation_Fee>10000;
/* 2.3. Left Outer Join between Patients and Relatives using ORDER BY Clause */
select Patients.Pat_FName,Relatives.Rel_Name,Relatives.Rel_Relation from Patients left join Relatives on Patients.Pat_Id=Relatives.Pat_Id order by Patients.Pat_FName;

/* 3. RIGHT OUTER JOIN WITH OPERATORS AND CLAUSES */
/* 3.1. Right Outer Join between Wards and Patients */
select Patients.Pat_FName,Wards.Ward_Floor from Wards right join Patients on Wards.Pat_Id=Patients.Pat_Id;
/* 3.2. Right Outer Join between Doctors and Patients using where clause and like operator */
select Doctors.Doc_Name,Patients.Pat_FName,Pat_Age from Patients right join Doctors on Patients.Doc_Id=Doctors.Doc_Id where Patients.Pat_FName like 'A%';
/* 3.3. Right Outer Join between Relatives and Patients */
select Patients.Pat_FName,Patients.Pat_Age,Relatives.Rel_Name from Relatives right join Patients on Relatives.Pat_Id=Patients.Pat_Id where Relatives.Rel_Name like '%a' or Relatives.Rel_Name like'%i';