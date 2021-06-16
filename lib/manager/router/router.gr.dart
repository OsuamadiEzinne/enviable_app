// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:enviable_app/_404.dart' as _i6;
import 'package:enviable_app/core/domain/entities/entities.dart' as _i7;
import 'package:enviable_app/features/auth/presentation/index.dart' as _i4;
import 'package:enviable_app/features/home/presentation/screens/home_screen.dart'
    as _i5;
import 'package:enviable_app/features/onborading/presentation/index.dart'
    as _i3;
import 'package:flutter/material.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.SplashScreen();
        }),
    OnboardingRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.OnboardingScreen();
        }),
    LoginRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.LoginScreen();
        },
        title: 'Login'),
    SignupRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.SignupScreen();
        },
        title: 'Sign Up'),
    OtpConfirmationRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<OtpConfirmationRouteArgs>();
          return _i4.OtpConfirmationScreen(
              key: args.key, verification: args.verification);
        },
        title: 'OTP Confirmation'),
    ForgotPasswordRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.ForgotPasswordScreen();
        },
        title: 'Forgot Password'),
    HomeRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.HomeScreen();
        }),
    UnknownRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.UnknownScreen();
        },
        title: 'Error 404')
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashRoute.name, path: '/', fullMatch: true),
        _i1.RouteConfig(OnboardingRoute.name,
            path: '/onboarding-screen', fullMatch: true),
        _i1.RouteConfig(LoginRoute.name,
            path: '/login-screen', fullMatch: true),
        _i1.RouteConfig(SignupRoute.name,
            path: '/signup-screen', fullMatch: true),
        _i1.RouteConfig(OtpConfirmationRoute.name,
            path: '/otp-confirmation-screen', fullMatch: true),
        _i1.RouteConfig(ForgotPasswordRoute.name,
            path: '/forgot-password-screen', fullMatch: true),
        _i1.RouteConfig(HomeRoute.name, path: '/home-screen', fullMatch: true),
        _i1.RouteConfig(UnknownRoute.name, path: '*')
      ];
}

class SplashRoute extends _i1.PageRouteInfo {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

class OnboardingRoute extends _i1.PageRouteInfo {
  const OnboardingRoute() : super(name, path: '/onboarding-screen');

  static const String name = 'OnboardingRoute';
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/login-screen');

  static const String name = 'LoginRoute';
}

class SignupRoute extends _i1.PageRouteInfo {
  const SignupRoute() : super(name, path: '/signup-screen');

  static const String name = 'SignupRoute';
}

class OtpConfirmationRoute extends _i1.PageRouteInfo<OtpConfirmationRouteArgs> {
  OtpConfirmationRoute(
      {_i2.Key? key, required _i7.PhoneVerification? verification})
      : super(name,
            path: '/otp-confirmation-screen',
            args:
                OtpConfirmationRouteArgs(key: key, verification: verification));

  static const String name = 'OtpConfirmationRoute';
}

class OtpConfirmationRouteArgs {
  const OtpConfirmationRouteArgs({this.key, required this.verification});

  final _i2.Key? key;

  final _i7.PhoneVerification? verification;
}

class ForgotPasswordRoute extends _i1.PageRouteInfo {
  const ForgotPasswordRoute() : super(name, path: '/forgot-password-screen');

  static const String name = 'ForgotPasswordRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home-screen');

  static const String name = 'HomeRoute';
}

class UnknownRoute extends _i1.PageRouteInfo {
  const UnknownRoute() : super(name, path: '*');

  static const String name = 'UnknownRoute';
}
