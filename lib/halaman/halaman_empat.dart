import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/drawer.dart';

class Halamanempat extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State {
  var foto;
  var name;

  Future <String> getData() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      foto = pref.getString('photo');
      name = pref.getString('username');
    });
    return String.fromEnvironment(name);
  }

  void initState(){
    getData();
  }
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerApp(),
      body: Column(
        children: <Widget>[
          Container(
            height:160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight:Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 10.0, // has the effect of softening the shadow
                  spreadRadius: 0.25, // has the effect of extending the shadow
                  offset: Offset(
                    5.0, // horizontal, move right 10
                    5.0, // vertical, move down 10
                  ),
                )
              ],
            ),
            child: Column(
              children: <Widget>[
                // PROFILE
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                // ROW UNTUK FOTO DAN NAMA
                Row(
                  children: <Widget>[
                    //FOTO
                    Container(
                      padding: const EdgeInsets.only(left:35, bottom: 10, right: 10, top: 10),

                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(greeting(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
                              Text('$name', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24,),),
                            ]
                        )
                    )
                  ],
                )
              ],
            ),
          ),
          Container(

            // child:Center(
            //   child: Text(
            //     "Coming soon!",
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}