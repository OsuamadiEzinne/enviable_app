import 'package:auto_route/annotations.dart';
import 'package:enviable_app/_404.dart';
import 'package:enviable_app/features/auth/presentation/index.dart';
import 'package:enviable_app/features/onborading/presentation/index.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute<dynamic>>[
    AdaptiveRoute(
      initial: true,
      fullMatch: true,
      page: SplashScreen,
      maintainState: true,
    ),
    //
    AdaptiveRoute(
      fullMatch: true,
      page: OnboardingScreen,
      maintainState: true,
    ),
    //
    AdaptiveRoute(
      fullMatch: true,
      page: LoginScreen,
      maintainState: true,
      cupertinoPageTitle: 'Login',
    ),
    //
    AdaptiveRoute(
      fullMatch: true,
      page: SignupScreen,
      maintainState: true,
      cupertinoPageTitle: 'Sign Up',
    ),
    //
    AdaptiveRoute(
      fullMatch: true,
      page: OtpConfirmationScreen,
      maintainState: true,
      cupertinoPageTitle: 'OTP Confirmation',
    ),
    //
    AdaptiveRoute(
      fullMatch: true,
      page: ForgotPasswordScreen,
      maintainState: true,
      cupertinoPageTitle: 'Forgot Password',
    ),
    //
    AdaptiveRoute(
      path: '*',
      cupertinoPageTitle: 'Error 404',
      page: UnknownScreen,
      maintainState: true,
    ),
  ],
  replaceInRouteName: 'Screen,Route',
  preferRelativeImports: false,
)
class $AppRouter {}
