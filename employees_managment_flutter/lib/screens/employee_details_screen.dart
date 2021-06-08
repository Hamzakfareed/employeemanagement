import 'package:flutter/material.dart';
import 'package:foodtaxi_drivers/constants/constants.dart';
import 'package:foodtaxi_drivers/providers/emp_provider.dart';

import 'package:foodtaxi_drivers/widgets/drawer.dart';
import 'package:foodtaxi_drivers/widgets/employee_details_widget.dart';
import 'package:foodtaxi_drivers/widgets/sidebar.dart';
import 'package:provider/provider.dart';

class EmployeeDetailScreen extends StatelessWidget {
  static String routeName = "/order_details_screen";

  int id;
  EmployeeDetailScreen(this.id);
  var scaffoldKey = GlobalKey<ScaffoldState>();
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
            child: Consumer<EmployeesProvider>(
              builder: (context, value, child) => EmployeeDetailWidget(id),
            ),
          ),
        ],
      ),
    );
  }
}
