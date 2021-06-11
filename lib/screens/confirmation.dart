import 'package:enviable_app/screens/kyc.dart';
import 'package:enviable_app/widgets/EnviableButton.dart';
import 'package:flutter/material.dart';
//import 'package:enviable_app/screens/loginpage.dart';
//import 'package:enviable_app/screens/confirmation.dart';


import '../brand_colors.dart';


class ConfirmationPage extends StatelessWidget {

  static const String id = 'confirmation';

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  Text('Enter Code',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 20, color:BrandColors.colorBlue, fontFamily: 'Poppins'),
                  ),
                  SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget> [
                        // Image(
                        //   alignment: Alignment.topLeft,
                        //   height: 22.0,
                        //   width: 77.0,
                        //   image: AssetImage('images/niger.png'),
                        // ),
                        TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                labelText: 'Enter the four-digit code we sent you',
                                labelStyle: TextStyle(
                                  fontSize: 14.0,
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0,
                                )
                            )
                        ),

                        SizedBox(height: 550,),

                        EnviableButton(
                          title: 'Next', color: BrandColors.colorBlue, onPressed: (){
                          Navigator.pushNamedAndRemoveUntil(context, KycPage.id, (route) => false);
                        },
                        ),


                        // FlatButton(
                        //   onPressed: (){
                        //   },
                        //   child: Text('Next'),
                        // )
                        // Text('Or sign up with',
                        //   textAlign: TextAlign.left,
                        //   style: TextStyle(fontSize: 10, color: Colors.grey, fontFamily: 'Poppins'),
                        // ),
                        // SizedBox(height: 20,),
                        //
                        // Text('Sign up with Google',
                        //   textAlign: TextAlign.left,
                        //   style: TextStyle(fontSize: 10,  color: Colors.grey, fontFamily: 'Poppins'),
                        // ),
                        //
                        // SizedBox(height: 20,),
                        //
                        // Text('Sign up with Facebook',
                        //   textAlign: TextAlign.start,
                        //   style: TextStyle(fontSize: 10, color: Colors.grey, fontFamily: 'Poppins'),
                        // ),
                        // //SizedBox(height: 40,),
                        // RaisedButton(
                        //   onPressed: (){
                        //     Navigator.pushNamedAndRemoveUntil(context, KycPage.id, (route) => false);
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
                        //         'Next',
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
                  //   },
                  //   child: Text('Next'),
                  // )
                ]
            ),
          ),
        ),
      ),
    );

  }
}
