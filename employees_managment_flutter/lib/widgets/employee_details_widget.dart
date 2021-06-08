import 'package:flutter/material.dart';
import 'package:foodtaxi_drivers/constants/constants.dart';

import 'package:foodtaxi_drivers/providers/emp_provider.dart';
import 'package:foodtaxi_drivers/enum/position.dart';
import 'package:provider/provider.dart';

class EmployeeDetailWidget extends StatefulWidget {
  int id;
  EmployeeDetailWidget(this.id);
  @override
  State<StatefulWidget> createState() {
    return EmployeeDetailWidgetState();
  }
}

class EmployeeDetailWidgetState extends State<EmployeeDetailWidget> {
  int selectedValue = 0;
  List<String> statusList;

  selectValue(value) {
    setState(() {
      selectedValue = value;
    });
  }

  onSaveButtonClicked(employee) async {
    if (selectedValue == 0) {
      employee.position = Position.DEVOPS;
    } else if (selectedValue == 1) {
      employee.position = Position.DEVELOPER;
    } else if (selectedValue == 2) {
      employee.position = Position.PROJECT_MANAGER;
    } else if (selectedValue == 3) {
      employee.position = Position.TESTER;
    }
    await Provider.of<EmployeesProvider>(context, listen: false)
        .updateEmployee(employee);
  }

  @override
  Widget build(BuildContext context) {
    final employee = Provider.of<EmployeesProvider>(context, listen: false)
        .findById(widget.id);

    statusList = [];
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Center(
              child: Image.network(
                '${logoUrl}',
                width: 180.0,
                height: 180.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 250.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Employee',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(height: 10),
                  updateEmployeeRole(context, employee),
                  SizedBox(
                    height: 10,
                  ),
                  employeeInformation(context, employee),
                  SizedBox(
                    height: 10,
                  ),
                  employeedetail(context, employee),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  updateEmployeeRole(BuildContext context, employee) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 250,
      height: 150,
      decoration: BoxDecoration(
          color: Color.fromRGBO(237, 237, 237, 1),
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Update Employee Role',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      createRadioButtons('DEVOPS', 0),
                      createRadioButtons('DEVELOPER', 1),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      createRadioButtons('SUPERVISOR', 2),
                      createRadioButtons('ADMIN', 3),
                    ],
                  ),
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1, color: Theme.of(context).primaryColor),
                        color: Theme.of(context).primaryColor),
                    child: FlatButton(
                      onPressed: () {
                        onSaveButtonClicked(employee);
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  createRadioButtons(status, v) {
    return Row(
      children: [
        Radio(
          onChanged: (value) {
            selectValue(value);
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: Theme.of(context).primaryColor,
          value: v,
          groupValue: selectedValue,
        ),
        Text(
          status,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  employeeInformation(BuildContext context, employee) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 250,
      height: 130,
      decoration: BoxDecoration(
          color: Color.fromRGBO(237, 237, 237, 1),
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Employee Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/icon_user_8.png',
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        employee.fullName,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        employee.personalNumber.toString(),
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: Image.asset('assets/icons/Icon - Call-8.png'),
                onPressed: null,
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
          Text(
            'Office Mail:',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 1, color: Theme.of(context).primaryColor),
                  color: Theme.of(context).primaryColor),
              child: FlatButton(
                onPressed: null,
                child: Text(
                  employee.officeMail.toString(),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  employeedetail(BuildContext context, employee) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 280,
      height: 120,
      decoration: BoxDecoration(
          color: Color.fromRGBO(237, 237, 237, 1),
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Employment Id : ' + employee.id.toString(),
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          ),
          Text(
            "Active",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Salary',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                employee.salary.toString(),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              )
            ],
          )
        ],
      ),
    );
  }
}
