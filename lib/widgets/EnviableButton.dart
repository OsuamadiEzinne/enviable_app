//import 'package:enviable_app/screens/confirmation.dart';
//import 'package:enviable_app/screens/kyc.dart';
import 'package:flutter/material.dart';
//import 'package:enviable_app/screens/loginpage.dart';
//import 'package:enviable_app/splashscreen.dart';

import '../brand_colors.dart';
class EnviableButton extends StatelessWidget {

  final String title;
  final Color color;
  final Function onPressed;

  EnviableButton({ required this.title,   required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    // EnviableButton(
    //   title: 'Next', color: BrandColors.colorBlue, onPressed: onPressed,
    // );

    // ignore: deprecated_member_use
    return RaisedButton(
      onPressed: (){
         // Navigator.pushNamedAndRemoveUntil(context, ConfirmationPage.id, (route) => false);
         },
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10),
      ),
      color: color,
      textColor:Colors.white ,
      child: Container(
        height: 40,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
          ),
        ),
      ),
    );
  }
}
