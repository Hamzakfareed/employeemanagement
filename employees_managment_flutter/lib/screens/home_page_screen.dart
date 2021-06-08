import 'package:flutter/material.dart';
import 'package:foodtaxi_drivers/screens/employees_screen.dart';

import 'package:foodtaxi_drivers/widgets/drawer.dart';

class HomePageScreen extends StatelessWidget {
  static String routeName = "/home_page_screen";

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      drawer: AppDrawer(),
      key: scaffoldKey,
      body: EmployeesScreen(),
    );
  }
}
