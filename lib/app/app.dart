import 'package:final_assignment/app/navigator_key/navigator_key.dart';
import 'package:final_assignment/app/themes/app_theme.dart';
import 'package:final_assignment/core/common/provider/theme_view_model_provider.dart';
import 'package:final_assignment/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:light_sensor/light_sensor.dart';

import '../features/splash/presentation/view/splash_view.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    _initializeLightSensor();
  }

  void _initializeLightSensor() async {
    final bool hasSensor = await LightSensor.hasSensor();
    if (hasSensor) {
      LightSensor.luxStream().listen((int lux) {
        final isDarkMode = lux < 5000;
        ref.read(themeViewModelProvider.notifier).state = isDarkMode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeViewModelProvider);

    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      theme: AppTheme.getApplicationTheme(isDarkMode),
      home: const SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
