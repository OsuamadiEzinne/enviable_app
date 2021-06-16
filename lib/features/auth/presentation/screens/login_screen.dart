import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// A stateless widget to render LoginScreen.
class LoginScreen extends StatelessWidget with AutoRouteWrapper {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text('This is login'),
        ),
      ),
    );
  }
}
