import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influencer/presentation/bloc/bloc_observer.dart';
import 'package:influencer/presentation/bloc/login_bloc/login_cubit.dart';
import 'package:influencer/presentation/bloc/otp_bloc/otp_cubit.dart';
import 'package:influencer/presentation/bloc/profile_bloc/profile_bloc_cubit.dart';
import 'package:influencer/presentation/bloc/register_bloc/register_cubit.dart';
import 'app/app.dart';
import 'app/app_prefs.dart';
import 'app/constants.dart';
import 'app/di.dart';
import 'app/languages_manager.dart';
import 'data/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await initAppModule();
  AppPreferences appPreferences = instance<AppPreferences>();
  appPreferences.getToken(key: 'token').then((value) {
    Constants.token = value ?? "";
  });
  appPreferences.getUserId(key: 'userId').then((value) {
    Constants.userId = value ?? "";
  });
  appPreferences.getFirstName(key: 'firstName').then((value) {
    Constants.firstName = value ?? "";
  });
  appPreferences.getLastName(key: 'lastName').then((value) {
    Constants.lastName = value ?? "";
  });
  appPreferences.getPhoneNumber(key: 'phoneNumber').then((value) {
    Constants.phoneNumber = value ?? "";
  });
 appPreferences.getProfilePicture(key: 'profilePicture').then((value){
   Constants.profilePicture = value ?? "";
 });
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => LoginCubit()),
      BlocProvider(create: (context) => RegisterCubit()),
      BlocProvider(create: (context) => OtpCubit()),
      BlocProvider(create: (context) => ProfileBlocCubit()),

    ],
    child: EasyLocalization(
        supportedLocales: const [ARABIC_LOCALE, ENGLISH_LOCALE],
        path: ASSET_PATH_LOCALE,
        fallbackLocale: ARABIC_LOCALE,
        child: Phoenix(child: MyApp())),
  ));
  await ScreenUtil.ensureScreenSize();
}

// todo : add configuration for notification
