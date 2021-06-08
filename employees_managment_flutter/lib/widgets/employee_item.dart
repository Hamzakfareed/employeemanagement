import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodtaxi_drivers/providers/emp_provider.dart';

import 'package:foodtaxi_drivers/screens/employee_details_screen.dart';
import 'package:provider/provider.dart';

class EmployeeItem extends StatelessWidget {
  final int id;
  var userImageUrl =
      "https://manofmany.com/wp-content/uploads/2019/06/50-Long-Haircuts-Hairstyle-Tips-for-Men-5.jpg";
  EmployeeItem(this.id);

  @override
  Widget build(BuildContext context) {
    final employee =
        Provider.of<EmployeesProvider>(context, listen: false).findById(id);
    print(employee);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EmployeeDetailScreen(id),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Color.fromRGBO(237, 237, 237, 1),
          ),
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(237, 237, 237, 1),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                userImageUrl,
                height: 60.0,
                width: 60.0,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employee.fullName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  employee.fullName.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                SizedBox(height: 10),
                Text(
                  employee.personalNumber.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
