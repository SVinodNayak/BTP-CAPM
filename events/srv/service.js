const cds = require('@sap/cds');

module.exports = cds.service.impl(function () {

  const { Orders } = this.entities;

  // 🧩 Validation before CREATE or UPDATE
  this.before(['CREATE', 'UPDATE'], Orders, req => {
    if (req.data.qty <= 0) {
      req.error(400, 'Quantity should be greater than 0');
    }
  });

  // 🧩 Custom CREATE handler
  this.on('CREATE', Orders, async req => {
    console.log('ON Handler: Creating Order', req.data);
    return await INSERT.into(Orders).entries(req.data);
  });

  // 🧩 Add computed field after READ
  this.after('READ', Orders, (data) => {
    const orders = Array.isArray(data) ? data : [data];
    for (const order of orders) {
      if (order.price && order.qty) {
        order.total = order.price * order.qty;
      }
    }
  });

});
