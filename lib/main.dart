import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/view/onboarding/splash.dart';

Future<void> main() async {
  initApp();
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'iConsent',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.bgColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColor.blackColor,
          selectionColor: AppColor.lightBlackColor,
          selectionHandleColor: AppColor.lightBlackColor,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
