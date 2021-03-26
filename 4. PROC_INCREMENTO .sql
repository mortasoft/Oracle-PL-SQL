create or replace procedure "PROC_INCREMENTO"
(nombre_departamento IN VARCHAR2,
porcentaje_aumento IN NUMBER)
is
avg_salary NUMBER(10);
id_departamento NUMBER;
begin
select AVG(E.SALARY) INTO avg_salary from EMPLOYEES E INNER JOIN DEPARTMENTS ON department_name=nombre_departamento;
select DEPARTMENT_ID INTO id_departamento FROM DEPARTMENTS WHERE DEPARTMENT_NAME=nombre_departamento;

UPDATE EMPLOYEES
SET SALARY= (SALARY * porcentaje_aumento/100) + SALARY
WHERE SALARY < avg_salary AND DEPARTMENT_ID=id_departamento;


end;
