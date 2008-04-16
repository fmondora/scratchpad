module MoolidooHelper
   
 def breadcrumbs 
   return if controller.controller_name == ‘homepage’ 
   html = [link_to(‘Home’, home_path)] 
   # first level 
   html << link_to(‘Companies’, companies_path) if @companies || 
@company 
   html << link_to(@company, company_path(@company)) if @company 
   # second level 
   html << link_to(‘Departments’, departments_path) if @depts || @dept 
   html << link_to(@dept, department_path(@dept)) if @dept 
   # third and final level 
   html << link_to(‘Employees’, employees_path) if @employees || 
@employee 
   html << link_to(@employee.name, employee_path(@employee)) if 
@employee 
   html.join("&gt; ") 
 end 

end
