import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'package:the/halaman/component/attend.dart';
import 'package:the/halaman/component/header.dart';
import 'package:the/list%20view.dart';

import '../home/drawer.dart';
import 'component/your_location.dart';

class Halamanone extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Halamanone>{
  ProgressDialog pr;

  //get location
  Location location = Location();
  double long;
  double lat;
  LatLng _userPostion = LatLng(0, 0);

  getLocation() async {
    var location = new Location();
    location.onLocationChanged().listen((LocationData currentLocation) {
      setState(() {
        lat = currentLocation.latitude;
        long = currentLocation.longitude;
        _userPostion = LatLng(lat, long);
        print("Lokasi di : ");
        print(_userPostion);
      });
    });
  }

  // GOOGLE MAPS
  final Set<Marker> _markers = {};
  // final Set<Marker> user_markers = {};
  GoogleMapController mapController;
  // final LatLng _center = const LatLng(45.521563, -122.677433);
  LatLng _center = LatLng(-6.897980, 107.619328); // bandung

  BitmapDescriptor myIcon;
  @override
  void initState() {
//    getData();
    _markers.add(
      Marker(
        markerId: MarkerId("-6.897980, 107.619328"),
        position: _center,
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    super.initState();
    getLocation();
    super.initState();
  }
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Time
  bool isLoading = false;

  //WIDGET BUILDER
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
        ),

        title: Text('Recent Visit',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        textTheme: Theme.of(context).textTheme,

      ),



      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, i) {
          return Container(
            height: 160,
            child: Card(
//                color: Colors.blue,
              elevation: 10,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {

                      },

                      child: Container(
                        width: 500.0,
                        height: 400.0,

                            padding: EdgeInsets.only(top: 0, left: 0, right: 0),
                            child: Column(
                              children: <Widget>[
                                TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Customer name',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      // hintText: 'EMAIL',
                                      // hintStyle: ,
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.green))),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext conext) {
                                        return AlertDialog(
                                          title: Text('Not in'),
                                          content:
                                          const Text('This item is no longer available',
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text('Ok'),
                                              onPressed: () {
                                                Navigator.of(context).pop();

                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(50.0),
                                      child: Chip(
                                        label: Text('@anonymous'),
                                        shadowColor: Colors.blue[50],
                                        backgroundColor: Colors.white70,
                                        elevation: 10,
                                        autofocus: true,
                                      )),
                                ),

                              ],),


                      ),
                    ),

                  ),

                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffd1e7e5),
        foregroundColor: Colors.black,

        onPressed: () {
           Navigator.of(context).push(
               MaterialPageRoute(builder: (context) => Userdetials()));
        },

        child:
        const Icon(Icons.add),


      ),
    );
  }
}