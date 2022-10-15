use company;

show index from departament;
show index from employee;

-- indice para o departamento
alter table departament add index index_Sname(Sname);

-- Qual o departamento com maior número de pessoas?
select Sname as Departamento, max(Dnumber) as quant_pessoas from departament
	inner join employee
		on Dnumber = Dno;

-- Quais são os departamentos por cidade?
select Sname as departamento, Dlocation as cidade from departament as de
	inner join dept_locations as dl
		on de.Dnumber = dl.Dnumber;
        
-- Relação de empregados por departamento
select concat(Fname,' ',Minit,'',Lname) as funcionario, Sname as departamento from employee
	inner join departament
		on Dno = Dnumber;

/* *******  PARTE 2  ******* */

-- manipulação de dados para ecommerce
use ecommerce;
delimiter $
create procedure manipulacao(
	in opcao int   
)
begin	
	case opcao		
		when 1 then
			select * from clients;
        when 2 then
			update orders set orderStatus = 'Confirmado' where idOrder = 1;
		when 3 then
			delete from product where id = 7;
	end case;
end $
delimiter ;

call manipulacao(1);

-- manipulação de dados para Universidade
use universidade;
delimiter $
create procedure manipulacao(
	in opcao int   
)
begin	
	case opcao		
		when 1 then
			select * from professor;
        when 2 then
			update periodo set semestre = '5º semestre' where idPeriodo = 2;
		when 3 then
			delete from aluno where id = 5;
	end case;
end $
delimiter ;

call manipulacao(1);