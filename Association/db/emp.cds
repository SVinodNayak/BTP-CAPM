namespace demo;
entity dept{
    key dept_id: Integer;
    dept_name: String;
}

entity employee{
    key emp_id:Integer;
    emp_name:String;
    salary:Decimal(10,2);
    dept_id : Integer;
    department: Association to many dept on department.dept_id = $self.dept_id;
}