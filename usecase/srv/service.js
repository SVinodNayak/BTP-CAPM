const cds = require('@sap/cds');
const { SELECT } = require('@sap/cds/lib/ql/cds-ql');
module.exports = cds.service.impl(function () {
    const { Students } = this.entities;

    this.before(['CREATE','UPDATE'], Students, req => {
        if (req.data.Score !== undefined && req.data.Score < 60) {
            req.error(400,'Record Rejected: Score should be greater than 60.');
        }
         if (!req.data.Name || req.data.Name.trim() === '' || !req.data.Course || req.data.Course.trim() === '') {
      req.data.Name = 'SAI';
      req.data.Course = 'SAP';
    }
    });

    this.before('DELETE',Students, async req => {
                       
        const Student = await SELECT.one.from(Students).where({StudentID:req.data.StudentID});
        if (Student && Student.Score >= 90){
            req.error(403,'Cannot delete: Student scored 90 and above');
        }
        
    });

});