import 'package:device_preview/device_preview.dart';
import 'package:enviable_app/features/auth/presentation/managers/index.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart' hide Router;
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:enviable_app/manager/locator/locator.dart';
import 'package:enviable_app/manager/theme/theme.dart';
import 'package:enviable_app/utils/utils.dart';
import 'package:enviable_app/widgets/widgets.dart';

/// Application Router
final AppRouter _router = AppRouter();

class EnviableApp extends StatelessWidget {
  /// This is the entry point for EnviableApp App
  const EnviableApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => getIt<ThemeCubit>()),
        BlocProvider<AuthWatcherCubit>(
          create: (_) => getIt<AuthWatcherCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, AppTheme>(
        builder: (context, app) => Portal(
          child: PlatformBuilder(
            material: (context) => MaterialApp.router(
              title: AppStrings.appName.capitalizeFirst(),
              debugShowCheckedModeBanner: false,
              theme: app.themeData(),
              darkTheme: AppTheme.dark().themeData(),
              locale: DevicePreview.locale(context),
              routeInformationParser: _router.defaultRouteParser(),
              routerDelegate: _router.delegate(
                navigatorObservers: () => <NavigatorObserver>[
                  if (env.flavor == BuildFlavor.prod)
                    FirebaseAnalyticsObserver(
                      analytics: getIt<FirebaseAnalytics>(),
                    ),
                ],
              ),
              builder: (context, child) {
                /// Setup Basic Utils
                Helpers.setup(context, _router);

                return DevicePreview.appBuilder(context, child);
              },
            ),
          ),
        ),
      ),
    );
  }
}
