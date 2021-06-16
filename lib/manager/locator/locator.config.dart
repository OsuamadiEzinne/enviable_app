// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i8;
import 'package:connectivity/connectivity.dart' as _i3;
import 'package:enviable_app/core/presentation/managers/network/network_cubit.dart'
    as _i11;
import 'package:enviable_app/features/auth/data/repositories/firebase_auth_impl.dart'
    as _i15;
import 'package:enviable_app/features/auth/domain/index.dart' as _i14;
import 'package:enviable_app/features/auth/presentation/managers/auth/auth_cubit.dart'
    as _i17;
import 'package:enviable_app/features/auth/presentation/managers/auth_watcher/auth_watcher_cubit.dart'
    as _i16;
import 'package:enviable_app/features/onborading/presentation/managers/onboarding/onboarding_cubit.dart'
    as _i12;
import 'package:enviable_app/manager/locator/modules/modules.dart' as _i18;
import 'package:enviable_app/manager/theme/manager/theme_cubit.dart' as _i13;
import 'package:firebase_analytics/firebase_analytics.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_core/firebase_core.dart' as _i5;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i9;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  Future<_i1.GetIt> $initGetIt(
      {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    final serviceModules = _$ServiceModules();
    final modules = _$Modules();
    gh.lazySingleton<_i3.Connectivity>(() => serviceModules.connectionStatus);
    gh.lazySingleton<_i4.FirebaseAnalytics>(() => modules.firebaseAnalytics);
    await gh.factoryAsync<_i5.FirebaseApp>(() => modules.firebaseApp,
        preResolve: true);
    gh.lazySingleton<_i6.FirebaseAuth>(() => modules.firebaseAuth);
    gh.lazySingleton<_i7.FirebaseCrashlytics>(
        () => modules.firebaseCrashlytics);
    gh.lazySingleton<_i8.FirebaseFirestore>(() => modules.firestore);
    gh.lazySingleton<_i9.GoogleSignIn>(() => modules.googleSignIn);
    gh.lazySingleton<_i10.InternetConnectionChecker>(
        () => modules.connectionChecker);
    gh.factory<_i11.NetworkCubit>(() => _i11.NetworkCubit());
    gh.factory<_i12.OnboardingCubit>(() => _i12.OnboardingCubit());
    gh.factory<_i13.ThemeCubit>(() => _i13.ThemeCubit());
    gh.lazySingleton<_i14.AuthFacade>(() => _i15.FirebaseAuthImpl(
        get<_i6.FirebaseAuth>(),
        get<_i9.GoogleSignIn>(),
        get<_i10.InternetConnectionChecker>()));
    gh.factory<_i16.AuthWatcherCubit>(
        () => _i16.AuthWatcherCubit(get<_i14.AuthFacade>()));
    gh.factory<_i17.AuthCubit>(() => _i17.AuthCubit(get<_i14.AuthFacade>()));
    return this;
  }
}

class _$ServiceModules extends _i18.ServiceModules {}

class _$Modules extends _i18.Modules {}
