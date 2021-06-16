import 'package:auto_route/auto_route.dart';
import 'package:enviable_app/features/auth/presentation/managers/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// A stateless widget to render HomeScreen.
class HomeScreen extends StatelessWidget with AutoRouteWrapper {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text('This is Home screen'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<AuthWatcherCubit>().signOut,
        child: Icon(Icons.logout),
      ),
    );
  }
}
