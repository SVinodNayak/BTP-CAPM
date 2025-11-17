using { temporal } from '@sap/cds/common';

namespace eventsdemo;
entity Students: temporal{
  key StudentID : UUID;
      Name      :localized String(100);
      Course    : String(50);
      Score     : Integer; 
      validFrom: Timestamp;
      validTo:Timestamp  
}
 