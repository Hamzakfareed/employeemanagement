import 'package:flutter/material.dart';

import 'package:foodtaxi_drivers/screens/create_new_employee.dart';
import 'package:foodtaxi_drivers/screens/home_page_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                child: IconButton(
                    icon: Icon(
                      Icons.dashboard,
                      color: Colors.black,
                    ),
                    onPressed: null,
                    iconSize: 50),
              ),
              Column(
                children: [
                  ListTile(
                    leading: IconButton(
                      icon: Icon(
                        Icons.shopping_bag,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, HomePageScreen.routeName);
                      },
                    ),
                    title: Text(
                      'Employees',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Divider(),
                  ListTile(
                    leading: IconButton(
                      icon: Icon(
                        Icons.shopping_bag,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, CreateNewEmployee.routeName);
                      },
                    ),
                    title: Text(
                      'New Employee',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Divider(),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 160),
                    width: 150,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: GestureDetector(
                      onTap: null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Log Out',
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.logout,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
