import 'package:flutter/material.dart';

import 'package:foodtaxi_drivers/providers/emp_provider.dart';

import 'package:foodtaxi_drivers/screens/create_new_employee.dart';
import 'package:foodtaxi_drivers/screens/home_page_screen.dart';
import 'package:foodtaxi_drivers/screens/employees_screen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: EmployeesProvider()),
      ],
      child: MaterialApp(
        title: 'Employee Management',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(255, 198, 0, 1),
          accentColor: Colors.yellowAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePageScreen(),
        routes: {
          HomePageScreen.routeName: (context) => HomePageScreen(),
          EmployeesScreen.routeName: (context) => EmployeesScreen(),
          CreateNewEmployee.routeName: (context) => CreateNewEmployee(),
        },
      ),
    );
  }
}
