import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/controller/auth_controller.dart';
import 'package:i_consent/controller/profile_controller.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/utils/utils.dart';
import 'package:i_consent/view/onboarding/splash.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  initApp();
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  Utils.setStatusBarColor();

  Get.put(AuthController(), tag: 'authController');
  Get.put(ProfileController(), tag: 'profileController');

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        title: 'iConsent',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColor.bgColor,
          fontFamily: GoogleFonts.poppins().fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColor.blackColor,
            selectionColor: AppColor.primaryColor.withOpacity(0.3),
            selectionHandleColor: AppColor.primaryColor,
          ),
        ),
        home: const SplashScreen(),

        // DevicePreview
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      );
    });
  }
}
