import 'package:auto_route/auto_route.dart';
import 'package:enviable_app/features/auth/presentation/managers/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:enviable_app/features/onborading/presentation/managers/index.dart';
import 'package:enviable_app/manager/locator/locator.dart';
import 'package:enviable_app/utils/utils.dart';
import 'package:enviable_app/widgets/widgets.dart';

class SplashScreen extends StatelessWidget with AutoRouteWrapper {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OnboardingCubit>()..delaySplash(),
      child: BlocListener<OnboardingCubit, OnboardingState>(
        listenWhen: (p, c) => p.isLoading != c.isLoading,
        listener: (c, s) {
          var cubit = BlocProvider.of<AuthWatcherCubit>(App.context);

          if (!cubit.state.listenerAttached) {
            cubit.listenToAuthChanges(
              (option) => option.fold(
                () {
                  if (s.isLoading == false)
                    navigator.pushAndPopUntil(
                      SignupRoute(),
                      predicate: (_) => false,
                    );
                },
                (user) {
                  if (s.isLoading == false)
                    navigator.pushAndPopUntil(
                      HomeRoute(),
                      predicate: (_) => false,
                    );
                },
              ),
            );
          }
        },
        child: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('${AppAssets.logo}'),
                height: App.height * 0.15,
                fit: BoxFit.contain,
              ),
            ),
          ),
          //
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: App.height * 0.05,
            child: BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) => Visibility(
                visible: state.isLoading,
                child: SpinKitWave(
                  color: Theme.of(context).accentColor,
                  size: 30.0,
                  duration: Duration(milliseconds: 1200),
                  type: SpinKitWaveType.center,
                  itemCount: 7,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
