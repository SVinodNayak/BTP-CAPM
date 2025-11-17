const cds = require('@sap/cds');
module.exports = cds.service.impl(async function () {
  const { employee } = this.entities;

  //Create
  this.before('CREATE', employee,async(req) => {
    const { salaryAmount, Currency_code } = req.data;
    if (salaryAmount > 50000 && Currency_code != 'USD') {
      req.error(400, `Employees salary mustbe less than 50000 USD. ${salaryAmount}, ${Currency_code}` );
    }
  });
  this.after('CREATE', employee, (data, req) => {
    console.log('Create successful');
  });

  //  UPDATE 
this.before('UPDATE', employee, async (req) => {
  const { salaryAmount, Currency_code, nameFirst, loginName, ID } = req.data;
  if (salaryAmount >= 50000 &&Currency_code === 'USD') {
    req.error(400, 'Employees salary less than 50000 USD', salaryAmount, Currency_code, nameFirst, loginName);
  }
  const existing = await cds.tx(req).run(SELECT.one.from(employee).where({ID: ID}));
  console.log(existing)
  if (!existing) {
    req.error(404, `Employee not found ${existing} ${ID}`);
  } else {
    if (existing.nameFirst != nameFirst || existing.loginName != loginName) {
      req.error(400, `Operation not allowed ${existing.nameFirst} ${existing.loginName}  `);
    }}
});
this.after('UPDATE', employee, (data, req) => {
  console.log('Update operation successful');
});


  //Delete Operation
  
this.before('DELETE', employee, async (req) => {
    const { ID } = req.params[0];
    console.log(ID)
    const emp = await SELECT.one.from(employee).where({ ID : ID });
    console.log(emp);
    if (!emp) req.error(404, "Employee not found.");
    if (emp.nameFirst && emp.nameFirst[0].toUpperCase() === 'S') {
      req.error(400, "Delete not allowed — Employee name starts with 'S'.");
    }
  });
  this.after('DELETE', () => {
    console.log('Delete operation successful');
  });
});
