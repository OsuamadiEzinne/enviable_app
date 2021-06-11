//import 'dart:html';
import 'dart:ui';
import 'package:connectivity/connectivity.dart';
import 'package:enviable_app/screens/mainpage.dart';
import 'package:enviable_app/widgets/progressDialogue.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:enviable_app/screens/splashscreen.dart';
import 'package:enviable_app/screens/confirmation.dart';
import 'package:enviable_app/widgets/EnviableButton.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'dart:ui';
import '../brand_colors.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:flutter_signin_button/flutter_signin_button.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = 'login';

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  void showSnackBar(String title) {
    final snackbar = SnackBar(
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
    );
    scaffoldkey.currentState!.showSnackBar(snackbar);
  }

  //UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
  FirebaseAuth auth = FirebaseAuth.instance;

  var fullNameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void registerUser() async {
    //show please wait dialogue
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => ProgressDialogue(status: 'Logging you in',),
    );

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "barry.allen@example.com",
              password: "SuperSecretPassword!");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    //   final FirebaseUser user = (await auth.createUserWithEmailAndPassword(
    //       email: emailController.text,
    //       password: passwordController.text,
    //   ).catchError((ex){
    //
    //     //check error and display message
    //     PlatformException thisEx = ex;
    //     showSnackBar(thisEx.message);
    //
    //   })).user;

    if (auth.currentUser != null) {
      print(auth.currentUser!.uid);
      DatabaseReference newUserRef = FirebaseDatabase.instance
          .reference()
          .child('users/${auth.currentUser!.uid}');

      //prepare data to be saved on users table
      Map userMap = {
        'fullname': fullNameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
      };
      newUserRef.set(userMap);

      //Take the user to the mainPage
      Navigator.pushNamedAndRemoveUntil(context, MainPage.id, (route) => false);
      //print('registration sucessful');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                'Enter your mobile number',
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 20,
                    color: BrandColors.colorBlue,
                    fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Image(
                      alignment: Alignment.topLeft,
                      height: 22.0,
                      width: 77.0,
                      image: AssetImage('images/niger.png'),
                    ),
                    TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: '+234',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            ))),

                    SizedBox(
                      height: 20,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Padding(
                        //   padding: const EdgeInsets.all(10),
                        Text(
                          'Or sign up with',
                          //textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    InkWell(
                      onTap: () {},
                      child: Ink(
                        color: Color(0xFF397AF3),
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Image.asset(
                                'images/google.png',
                                height: 40.0,
                              ), // <-- Use 'Image.asset(...)' here
                              SizedBox(width: 12),
                              Text('Sign up with Google'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Text('Sign up with Google',
                    //   textAlign: TextAlign.left,
                    //   style: TextStyle(fontSize: 10,  color: Colors.grey, fontFamily: 'Poppins'),
                    // ),

                    SizedBox(
                      height: 20,
                    ),

                    Text(
                      'Sign up with Facebook',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(
                      height: 400,
                    ),

                    EnviableButton(
                      title: 'next',
                      color: BrandColors.colorBlue,
                      onPressed: () async {
                        //check network availability
                        var connectivityResult =
                            await Connectivity().checkConnectivity();
                        if (connectivityResult != ConnectivityResult.mobile &&
                            connectivityResult != ConnectivityResult.wifi) {
                          showSnackBar('No Internet Connectivity');
                          return;
                        }

                        if (fullNameController.text.length < 3) {
                          showSnackBar('please provide a valid name');
                          return;
                        }
                        if (phoneController.text.length < 10) {
                          showSnackBar('please provide a valid phone number');
                          return;
                        }
                        if (emailController.text.contains('@')) {
                          showSnackBar('please provide a valid email address');
                          return;
                        }
                        if (passwordController.text.length < 8) {
                          showSnackBar(
                              'password must be at least 8 characters');
                          return;
                        }
                        registerUser();
                        Navigator.pushNamedAndRemoveUntil(
                            context, ConfirmationPage.id, (route) => false);
                      },
                    )
                  ],
                ),
              ),

              // FlatButton(
              //   onPressed: (){
              //   },
              //   child: Text('Next'),
              // )
            ]),
          ),
        ),
      ),
    );
  }
}

// class LoginPage extends StatelessWidget {
//
//   static const String id = 'login';
//   final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
//
//   void showSnackBar(String title){
//     final snackbar = SnackBar(
//       content: Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
//     );
//     scaffoldkey.currentState!.showSnackBar(snackbar);
//   }
//
//
//   FirebaseAuth auth = FirebaseAuth.instance;
//   //final FirebaseAuth _auth = FirebaseAuth.instance;
//  // UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
//
//
//   var fullNameController = TextEditingController();
//   var phoneController = TextEditingController();
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//
//   // void loginUser() try {
//   // UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//   // email: "barry.allen@example.com",
//   // password: "SuperSecretPassword!"
//   // );
//   // } on FirebaseAuthException catch (e) {
//   // if (e.code == 'user-not-found') {
//   // print('No user found for that email.');
//   // } else if (e.code == 'wrong-password') {
//   // print('Wrong password provided for that user.');
//   // }
//   // }
//
//   void registerUser() async {
//
//     final FirebaseUser user = (await auth.createUserWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//     ).catchError((ex){
//
//       //check error and display message
//       PlatformException thisEx = ex;
//       showSnackBar(thisEx.message);
//
//     })).user;
//
//     if (user != null){
//       DatabaseReference newUserRef = FirebaseDatabase.instance.reference().child('users/${user.uid}');
//
//       //prepare data to be saved on users table
//       Map userMap = {
//         'fullname': fullNameController.text,
//         'email': emailController.text,
//         'phone': phoneController.text,
//       };
//       newUserRef.set(userMap);
//
//       //Take the user to the mainPage
//       Navigator.pushNamedAndRemoveUntil(context, MainPage.id, (route) => false);
//     //print('registration sucessful');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var onPressed;
//     return Scaffold(
//       key: scaffoldkey,
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//                 children: <Widget>[
//                   SizedBox(height: 30,),
//                   Text('Enter your mobile number',
//                     textAlign: TextAlign.end,
//                     style: TextStyle(fontSize: 20, color:BrandColors.colorBlue, fontFamily: 'Poppins'),
//                   ),
//                   SizedBox(height: 10,),
//
//                   Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Column(
//                       children: <Widget> [
//                         Image(
//                           alignment: Alignment.topLeft,
//                           height: 22.0,
//                           width: 77.0,
//                           image: AssetImage('images/niger.png'),
//                         ),
//                         TextField(
//                           controller: phoneController,
//                             keyboardType: TextInputType.phone,
//                             decoration: InputDecoration(
//                                 labelText: '+234',
//                                 labelStyle: TextStyle(
//                                   fontSize: 14.0,
//                                 ),
//                                 hintStyle: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 10.0,
//                                 )
//                             )
//                         ),
//
//                         SizedBox(height: 20,),
//
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             // Padding(
//                             //   padding: const EdgeInsets.all(10),
//                               Text(
//                           'Or sign up with',
//                                 //textAlign: TextAlign.left,
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.grey,
//                                     fontFamily: 'Poppins'
//                                 ),
//                               ),
//                           ],
//                         ),
//                         SizedBox(height: 20,),
//
//
//                         Text('Sign up with Google',
//                           textAlign: TextAlign.left,
//                           style: TextStyle(fontSize: 10,  color: Colors.grey, fontFamily: 'Poppins'),
//                         ),
//
//                         SizedBox(height: 20,),
//
//                         Text('Sign up with Facebook',
//                           textAlign: TextAlign.start,
//                           style: TextStyle(fontSize: 10, color: Colors.grey, fontFamily: 'Poppins'),
//                         ),
//                         SizedBox(height: 400,),
//
//                         EnviableButton(
//                           title: 'next',
//                           color: BrandColors.colorBlue,
//                           onPressed: (){
//
//                             //check network availability
//
//                             if(fullNameController.text.length < 3){
//                               showSnackBar('please provide a valid name');
//                               return;
//                             }
//                           if(phoneController.text.length < 10){
//                             showSnackBar('please provide a valid phone number');
//                             return;
//                           }
//                             if(emailController.text.contains('@')){
//                               showSnackBar('please provide a valid email address');
//                               return;
//                             }
//                             if(passwordController.text.length < 8){
//                               showSnackBar('password must be at least 8 characters');
//                               return;
//                             }
//                             registerUser();
//                           Navigator.pushNamedAndRemoveUntil(context, ConfirmationPage.id, (route) => false);
//                         },
//                         )
//
//                       ],
//                     ),
//                   ),
//
//               // FlatButton(
//               //   onPressed: (){
//               //   },
//               //   child: Text('Next'),
//               // )
//                 ]
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// mixin FirebaseUser {
// }

// class class FirebaseUser {
// }
