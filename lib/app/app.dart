import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influencer/presentation/login/view/login.dart';
import 'package:influencer/presentation/otp/view/otp.dart';
import 'package:influencer/presentation/profile/view/profile.dart';

import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';

import 'app_prefs.dart';
import 'constants.dart';
import 'di.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
    _appPreferences.getLocale().then((locale) => context.setLocale(locale));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          // initialRoute: Constants.token == "" ? Routes.loginRoute : Routes.profileRoute,
          home: const ProfileView(),
          builder: EasyLoading.init(),
          theme: getApplicationTheme(),
        );
      },
    );
  }
}
//+971552668738
// todo : add configuration for awesome notification package for ios
