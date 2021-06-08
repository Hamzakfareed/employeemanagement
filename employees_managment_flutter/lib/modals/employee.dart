import 'package:foodtaxi_drivers/enum/Position.dart';
import 'package:foodtaxi_drivers/modals/category.dart';

class Employee {
  int id;

  Position position;
  double salary;
  String fullName;
  Category category;
  String officeMail;
  String personalEmail;
  String officeNumber;
  String personalNumber;

  Employee(
      {this.id,
      this.category,
      this.fullName,
      this.officeMail,
      this.personalEmail,
      this.officeNumber,
      this.personalNumber,
      this.salary,
      this.position});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        id: json['id'],
        fullName: json['fullName'],
        officeMail: json['officeMail'],
        personalEmail: json['personalEmail'],
        officeNumber: json['officeNumer'],
        personalNumber: json['personalNumber'],
        salary: json['salary'],
        position: json['position']);
  }

  static Map<String, dynamic> toJson(Employee employee) {
    return {
      "fullName": employee.fullName,
      "personalEmail": employee.personalEmail,
      "officeMail": employee.officeMail,
      "personalNumber": employee.personalNumber,
      "officeNumber": employee.officeNumber,
      "salary": employee.salary,
      "position": employee.position
    };
  }
}
