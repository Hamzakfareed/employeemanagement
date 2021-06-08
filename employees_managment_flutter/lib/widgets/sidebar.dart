import 'package:flutter/material.dart';

class SideBarScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
  SideBarScreen(this.scaffoldKey);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 45.0,
        padding: EdgeInsets.only(top: 50, bottom: 50),
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.dashboard_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                scaffoldKey.currentState.openDrawer();
              },
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      color: Colors.black,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.yellow,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    color: Colors.black,
                    child: IconButton(
                      icon: Icon(
                        Icons.logout,
                        color: Colors.yellow,
                      ),
                      onPressed: null,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
