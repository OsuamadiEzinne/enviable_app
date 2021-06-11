//import 'package:flutter/cupertino.dart';
//import 'dart:html';
//import 'dart:html';
//import 'dart:ui';

//import 'dart:ui';

import 'package:enviable_app/brand_colors.dart';
import 'package:enviable_app/screens/loginpage.dart';
import 'package:enviable_app/widgets/EnviableButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'dart:async';

class Splashscreen extends StatelessWidget {

  static const String id = 'splashcreen';


  @override
  Widget build(BuildContext context) {
//     return Container();
//   }
// }

//
// class Splashscreen extends StatefulWidget {
//   @override
//   _SplashscreenState createState() => _SplashscreenState();
// }
//
// class _SplashscreenState extends State<Splashscreen> {
//   @override
//   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                Image(
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 100.0,
                  image: AssetImage('images/logo.png'),
                ),
                SizedBox(height: 10,),

                Text('Get around with ease',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.grey, fontFamily: 'Poppins'),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget> [
                      Image(
                        alignment: Alignment.center,
                        height: 579.0,
                        width: 829.0,
                        image: AssetImage('images/here.png'),
                      ),

                      EnviableButton(
                        title: 'Get Started', color: BrandColors.colorBlue, onPressed: (){
                        Navigator.pushNamedAndRemoveUntil(context, RegistrationPage.id, (route) => false);
                      },
                      ),

                      // FlatButton(
                      //   onPressed: (){
                      //   },
                      //   child: Text('Get Started'),
                      // )
                      // RaisedButton(
                      //   onPressed: (){
                      //     //Navigator.pushNamedAndRemoveUntil(context, LoginPage.id, (route) => false);
                      //   },
                      //   shape: new RoundedRectangleBorder(
                      //     borderRadius: new BorderRadius.circular(10),
                      //   ),
                      //   color: BrandColors.colorBlue,
                      //   textColor:Colors.white ,
                      //   child: Container(
                      //     height: 40,
                      //     child: Center(
                      //       child: Text(
                      //         'Get Started',
                      //         style: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                // FlatButton(
                //   onPressed: (){
                //
                //   },
                //   child: Text('Get Started'),
                //  )
              ]
                ),
          ),
        ),
      ),
        );
  }
}
