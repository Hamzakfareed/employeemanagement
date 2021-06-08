import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodtaxi_drivers/constants/constants.dart';

import 'package:foodtaxi_drivers/modals/employee.dart';

import 'package:http/http.dart' as http;

class EmployeesProvider with ChangeNotifier {
  List<Employee> _employees = [];

  List<Employee> get employees {
    return [..._employees];
  }

  Future<void> fetechAndSetEmployees() async {
    var response = await http.get('$url/employees');

    final data = json.decode(response.body) as List<dynamic>;

    if (data == null) {
      return null;
    }
    List<Employee> loadedemployees = [];
    data.forEach((element) {
      loadedemployees.add(Employee.fromJson(element));
    });

    _employees = loadedemployees;

    notifyListeners();
  }

  Employee findById(id) {
    return _employees.firstWhere((element) => element.id == id);
  }

  saveEmployee(employee) async {
    print(employee.id);
    try {
      Map<String, dynamic> body = Employee.toJson(employee);

      final response = await http.post('$url/employees',
          body: json.encode(body),
          headers: {"content-type": "application/json"});
      print(response.body);

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  updateEmployee(employee) async {
    try {
      Map<String, dynamic> body = Employee.toJson(employee);

      final response = await http.put('$url/employees/${employee.id}',
          body: json.encode(body),
          headers: {"content-type": "application/json"});
      print(response.body);

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
