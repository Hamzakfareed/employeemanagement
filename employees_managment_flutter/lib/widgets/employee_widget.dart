import 'package:flutter/material.dart';
import 'package:foodtaxi_drivers/constants/constants.dart';

import 'package:foodtaxi_drivers/providers/emp_provider.dart';

import 'file:///E:/workspace/foodtaxi_drivers/lib/widgets/employee_item.dart';
import 'package:provider/provider.dart';

class EmployeeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<EmployeesProvider>(context, listen: false)
            .fetechAndSetEmployees(),
        builder: (ctx, dataSnapshot) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(height: 15.0,),
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
                      // SizedBox(height: 10),
                      Text(
                        'Employees',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 10),
                      Container(
                        height: 400,
                        child: Consumer<EmployeesProvider>(
                          builder: (ctx, employeeData, child) =>
                              ListView.builder(
                            itemCount: employeeData.employees.length,
                            itemBuilder: (context, index) =>
                                EmployeeItem(employeeData.employees[index].id),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
