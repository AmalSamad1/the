import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the/home/drawer.dart';

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

      height:130,


      child: Column(
        children: <Widget>[
          AppBar(

            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.black,
                  onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (c)=> DrawerApp())); },

                );
              },
            ),



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

          ////ROW UNTUK FOTO DAN NAMA



        ],
      ),

    );







  }
}