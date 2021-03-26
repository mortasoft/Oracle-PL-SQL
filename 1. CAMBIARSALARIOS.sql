create or replace procedure "CAMBIARSALARIOS"
is
m_salary NUMBER;
m_hire_date DATE;
a_salary NUMBER;
a_hire_date DATE;

begin
   
SELECT SALARY,HIRE_DATE 
INTO m_salary,m_hire_date
FROM EMPLOYEES 
WHERE FIRST_NAME like 'Matthew' and  LAST_NAME like 'Weiss';

SELECT SALARY,HIRE_DATE 
INTO a_salary,a_hire_date
FROM EMPLOYEES 
WHERE FIRST_NAME like 'Adam' and  LAST_NAME like 'Fripp';

UPDATE EMPLOYEES
SET SALARY=a_salary
 WHERE FIRST_NAME like 'Matthew' and LAST_NAME like 'Weiss';
 
UPDATE EMPLOYEES
SET SALARY=m_salary
 WHERE FIRST_NAME like 'Adam' and  LAST_NAME like 'Fripp';

 
 IF (m_hire_date<a_hire_date) THEN
   UPDATE EMPLOYEES
   SET SALARY=SALARY*1.05
   WHERE FIRST_NAME like 'Matthew' and LAST_NAME like 'Weiss';
 else
   UPDATE EMPLOYEES
   SET SALARY=SALARY*1.05
   WHERE FIRST_NAME like 'Adam' and  LAST_NAME like 'Fripp';
END IF;

commit;

end;


