using { eventsdemo as db } from '../db/schema';

service StudentService {
  entity Students as projection on db.Students;
}