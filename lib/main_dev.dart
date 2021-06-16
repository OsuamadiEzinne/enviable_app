import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:enviable_app/app.dart';
import 'package:enviable_app/config/env.dart';
import 'package:enviable_app/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup Environmental variables & Service provider
  await BuildEnvironment.init(flavor: BuildFlavor.dev);

  try {
    // Initializes Hive with a valid directory in your app files.
    await Hive.initFlutter();
  } catch (e, trace) {
    log.e('Error initializing Hive', e, trace);
  }

  try {
    // Initialize Hydrated storage
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await Helpers.cacheDir,
    );
  } catch (e, trace) {
    log.e('Error initializing HydratedStorage', e, trace);
  }

  runApp(DevicePreview(
    enabled: env.flavor.fold(
      prod: () => !kReleaseMode,
      dev: () => true,
    )!,
    style: DevicePreviewStyle(
      background: BoxDecoration(color: Colors.transparent),
      toolBar: DevicePreviewToolBarStyle.light(),
    ),
    builder: (context) => const EnviableApp(),
  ));
}
