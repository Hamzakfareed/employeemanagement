import 'package:flutter/material.dart';

import 'package:foodtaxi_drivers/widgets/create_new_employee_widget.dart';
import 'package:foodtaxi_drivers/widgets/drawer.dart';
import 'package:foodtaxi_drivers/widgets/sidebar.dart';

class CreateNewEmployee extends StatelessWidget {
  static String routeName = "/new_employee";
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
            child: CreateNewEmployeeWidget(),
          ),
        ],
      ),
    );
  }
}
