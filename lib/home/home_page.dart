import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';


import 'package:the/extensions/fancy_bottom_navigation-0.3.2/lib/fancy_bottom_navigation.dart';
import 'package:the/halaman/halaman_dua.dart';
import 'package:the/halaman/halaman_empat.dart';
import 'package:the/halaman/halaman_satu.dart';

 void main(){
runApp(
 new MaterialApp(
   title:"Attendance",
   home: new Home(),
        )
   );
 }

class Home extends StatefulWidget {
  @override
  _HalamannavState createState() => _HalamannavState();
}

class _HalamannavState extends State {
  int currentPage = 0;
  int _selectedIndex = 0;

  List<Widget> pageList = List<Widget>();

  @override
  void initState() {
    pageList.add(Halamandua());
    pageList.add(Halamanone());
    pageList.add(Halamanempat());
    super.initState();
  }
    

  final _widgetOptions = [

    Halamandua(),
    Halamanone(),
    Halamanempat(),
  ];

  

  DateTime currentBackPressTime = DateTime.now();
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(seconds: 1)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Press again to exit');
      return Future.value(false);
    }
    //return Future.value(true);
    SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
    return Future.value(false);
  }

  @override
  Widget build (BuildContext context){
    return WillPopScope(
      onWillPop: onWillPop,
      child: SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomPadding:false,
          body: IndexedStack(
            index: _selectedIndex,
            // children: pageList.elementAt(_selectedIndex),
            children: _widgetOptions,
          ), 
          bottomNavigationBar : FancyBottomNavigation(
            barBackgroundColor: Color(0xFF328CE8),
            textColor: Colors.white,
            inactiveIconColor: Colors.white,
            tabs: [
              TabData(
                iconData: Icons.fingerprint,
                title: "Attendance",
              ),
              TabData(
                iconData: Icons.work,
                title: "Visit",
              ),
              TabData(
                iconData: Icons.account_circle,
                title: "Profile",
              ),
            ],
            //type: BottomNavigationBarType.fixed,
            currentPage: _selectedIndex,
            onTabChangedListener: onItemTapped,
          )
        )
      )
    );
  }
  
  void onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
  }
}