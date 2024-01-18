import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:influencer/presentation/forgot_password/view/forgot_password.dart';

import '../login/view/login.dart';
import '../otp/view/otp.dart';

import '../profile/view/profile.dart';
import '../register/view/register.dart';

import 'Strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String servicesHistoryRoute = "/servicesHistory";
  static const String notificationsRoute = "/notifications";
  static const String otpRoute = "/otp";
  static const String profileRoute = "/profile";
  static const String homeRoute = "/home";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String searchRoute = "/search";
  static const String bookingDetailsRoute = "/bookingDetails";
  static const String choosePackagesRoute = "/choosePackages";
  static const String scheduleRoute = "/schedule";
  static const String requestsRoute = "/requests";
}

class RouteGenerator {
  static PageRoute getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const LoginView());
        } else {
          return CupertinoPageRoute(builder: (_) => const LoginView());
        }
      case Routes.registerRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const RegisterView());
        } else {
          return CupertinoPageRoute(builder: (_) => const RegisterView());
        }
      case Routes.forgotPasswordRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
        } else {
          return CupertinoPageRoute(builder: (_) => const ForgotPasswordView());
        }

      case Routes.otpRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const OTPView());
        } else {
          return CupertinoPageRoute(builder: (_) => const OTPView());
        }
      case Routes.profileRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const ProfileView());
        } else {
          return CupertinoPageRoute(builder: (_) => const ProfileView());
        }

      default:
        return pageNotFound();
    }
  }

  static PageRoute pageNotFound() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.pageNotFound.tr()),
              ),
              body: Center(child: Text(AppStrings.pageNotFound.tr())),
            ));
  }
}
