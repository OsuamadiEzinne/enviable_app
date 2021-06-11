import 'dart:async';
import 'dart:io';
import 'dart:ui';
//import 'package:firebase_database/firebase_database.dart';
import 'package:enviable_app/brand_colors.dart';
import 'package:enviable_app/styles/styles.dart';
import 'package:enviable_app/widgets/BrandDivider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainPage extends StatefulWidget {
  static const String id = 'mainpage';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  double searchSheetHeight =  (Platform.isIOS)? 300 : 275;

  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  double mapBottomPadding = 0;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Container(
        width: 250,
        color: Colors.white,
        child: Drawer(

          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[

              Container(
                color: Colors.white,
                height: 150,
                child: DrawerHeader(
                  decoration:BoxDecoration(
                    color: Colors.white
                  ),
                  child: Row(
                    children: <Widget>[
                    Image.asset('images/profile.png', height: 60, width: 60,),
                      SizedBox(width: 15,),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Chisom', style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),),
                          SizedBox(height: 5,),
                          Text('View Profile'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              BrandDivider(),

              SizedBox(height: 10,),

              ListTile(
                leading: Icon(Icons.card_giftcard),
                title: Text('Free Rides', style: kDrawerItemStyle),),

              ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('Payments', style: kDrawerItemStyle),),

              ListTile(
                leading: Icon(Icons.history),
                title: Text('Ride History', style: kDrawerItemStyle),),

              ListTile(
                leading: Icon(Icons.contact_support),
                title: Text('Support', style: kDrawerItemStyle),),

              ListTile(
                leading: Icon(Icons.info),
                title: Text('About', style: kDrawerItemStyle),),

            ],
          ),

        ),
      ),
      // appBar: AppBar(
      //   title: Text('Main Page'),
      // ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
             padding: EdgeInsets.only(bottom: mapBottomPadding),
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                mapController = controller;

               setState(() {
                 mapBottomPadding = (Platform.isAndroid)? 280 : 270;
               });

              }),

          Positioned(
          top: 44,
         left: 20,
         child: GestureDetector(
           onTap: (){
         scaffoldKey.currentState!.openDrawer();
    },
         child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5.0,
                  spreadRadius: 0.5,
                  offset: Offset(
                    0.7,
                    0.7,
                  )
                )

              ]
            ),
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(Icons.menu, color: Colors.black87,),
              )
          ),
          ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
          child: Container(
            height: searchSheetHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15.0,
                  spreadRadius: 0.5,
                  offset: Offset(
                    0.7,
                    0.7,
                  )
                )
              ]
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:24, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 5,),
                  Text('Ready to go!', style: TextStyle(fontSize: 10),),
                  Text('Where to?', style: TextStyle(fontSize: 10, fontFamily:'Brand-bold'),),

                    SizedBox(height: 20,),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          spreadRadius: 0.5,
                          offset: Offset(
                            0.7,
                            0.7,
                          )
                        )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children:<Widget>[
                          Icon(Icons.search, color: Colors.black26, ),
                          SizedBox(width: 10,),
                          Text('Search Destination')
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 22,),

                  Row(
                    children: <Widget>[
                      Icon(Icons.star, color: BrandColors.colorBlue,),
                      SizedBox(width: 12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget> [
                          Text('Choose a saved place'),
                          SizedBox(height: 4,),
                          Text('Popular', style: TextStyle(fontSize: 11, color: Colors.black54, ),)
                        ],
                      )
                    ]
                  ),

                  SizedBox(height: 10,),

                  BrandDivider(),

                  SizedBox(height: 16,),

                  Row(
                      children: <Widget>[
                        Icon(Icons.location_city, color: Colors.black,),
                        SizedBox(width: 12,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:<Widget> [
                            Text('Add work'),
                            SizedBox(height: 4,),
                            Text('Your Address', style: TextStyle(fontSize: 11, color: Colors.black54, ),)
                          ],
                        )
                      ]
                  )

                ],
              ),
            ),

          )
          )],
        //     child: MaterialButton(
        //       onPressed: (){
        //         DatabaseReference dbref = FirebaseDatabase.instance.reference().child('Test');
        //         dbref.set('IsConnected');
        //       },
        //       height: 50,
        //       minWidth: 300,
        //     color: Colors.blue,
        //     child: Text('Test Connection'),
        // ),
      ),
    );
  }
}
