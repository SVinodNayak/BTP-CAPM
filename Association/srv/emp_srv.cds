using demo from '../db/emp';
service empservice {
     entity employee as projection on demo.employee;
    //  {
    //     emp_id,
    //     emp_name,
    //     salary,
    //     department
    // };
    entity dept as projection on demo.dept;
    // {
    //     dept_id,
    //     dept_name
    // };

    

}