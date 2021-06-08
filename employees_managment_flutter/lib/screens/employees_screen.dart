import 'package:flutter/material.dart';
import 'package:foodtaxi_drivers/widgets/drawer.dart';

import 'package:foodtaxi_drivers/widgets/sidebar.dart';
import 'package:foodtaxi_drivers/widgets/employee_widget.dart';

class EmployeesScreen extends StatelessWidget {
  static String routeName = "/employees_screen";
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      key: scaffoldKey,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideBarScreen(scaffoldKey),
          Container(
            padding: EdgeInsets.only(left: 30),
            child: EmployeeWidget(),
          ),
        ],
      ),
    );
  }
}
