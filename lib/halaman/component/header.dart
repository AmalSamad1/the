import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Header extends StatefulWidget{
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State{
  var foto;
  var name;

  Future<String> getData() async{
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
  Widget build(BuildContext context){
      return Container(

      height:60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0), bottomRight:Radius.circular(0)),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 0.0, // has the effect of softening the shadow
            spreadRadius: 0.25, // has the effect of extending the shadow
            offset: Offset(
              2.0, // horizontal, move right 10
              2.0, // vertical, move down 10
            ),
          )
        ],
      ),

      child: Column(
        children: <Widget>[
          AppBar(
            leading: Icon(Icons.menu,
            color: Colors.black,),
            title: Text('Attendance',
            style: TextStyle(color: Colors.black),),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),

              ),
              Icon(Icons.more_vert,
              color: Colors.black,),
            ],
            backgroundColor: Colors.white,
          ),
          // ABSENCE
          Container(
            padding: EdgeInsets.all(10),

            alignment: Alignment.center,

            child: Text(
              "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          ////ROW UNTUK FOTO DAN NAMA
          Row(
            children: <Widget>[
              //FOTO

              Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // _selamat(),
                        Text(
                          greeting(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '$name',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ]
                  )
              )
            ],
          )


        ],
      ),

    );







  }
}