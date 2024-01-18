import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../app/app_prefs.dart';
import '../../../app/constants.dart';
import '../../../app/di.dart';
import '../../../data/network/dio_helper.dart';

import '../../../domain/login_model/login_model.dart';
import '../../resources/Strings_manager.dart';
import '../../resources/color_manager.dart';

import '../../resources/fonts_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/value_manager.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);
  final AppPreferences _appPreferences = instance<AppPreferences>();
  FToast fToast = FToast();

  showCustomToast(
      {required String message,
      required Color color,
      Color messageColor = Colors.black}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s10),
        color: color,
      ),
      child: Text(
        message,
        style: getBoldStyle(color: messageColor, fontSize: FontSize.s14.sp),
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 4),
    );
  }

  showNoInternetMessage() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s10),
        color: ColorManager.textFormDarkGrey,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.wifi),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            AppStrings.noInternetConnection.tr(),
            style: getBoldStyle(
                color: ColorManager.black, fontSize: AppSize.s14.sp),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 4),
    );
  }

  LoginModel? loginModel;

  Future<void> login(
      {required String phoneNumber, required String password}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      emit(LoginLoadingState());
      DioHelper.postData(endPoint: Constants.loginEndPoint, data: {
        "phone_number": "+97${phoneNumber.replaceFirst("0", "1")}",
        "password": password,
      }).then((value) {
        loginModel = LoginModel.fromJson(value!.data);
        if (kDebugMode) {
          print("token : ${loginModel!.token}");
          _appPreferences.setToken(
              key: 'token', value: loginModel!.token.toString());
          print("token : ${loginModel!.influencer!.id}");
          _appPreferences.setUserId(
              key: 'userId', value: loginModel!.influencer!.id!.toString());
          _appPreferences.setFirstName(
              key: 'firstName', value: loginModel!.influencer!.firstName.toString());
          _appPreferences.setFirstName(
              key: 'lastName', value: loginModel!.influencer!.lastName.toString());
          _appPreferences.setPhoneNumber(
              key: 'phoneNumber',
              value: loginModel!.influencer!.phoneNumber.toString());
          print("token from login cubit 1 ${Constants.token}");
          print("user if from login cubit 1 ${Constants.userId}");
        }
        _appPreferences.setProfilePicture(key: 'profilePicture', value: loginModel!.influencer!.influencerPicture.toString());
        _appPreferences.getToken(key: 'token').then((value) {
          Constants.token = value ?? "";
        });
        _appPreferences.getUserId(key: 'userId').then((value) {
          Constants.userId = value ?? "";
        });
        _appPreferences.getFirstName(key: 'firstName').then((value) {
          Constants.firstName = value ?? "";
        });
        _appPreferences.getLastName(key: 'lastName').then((value) {
          Constants.lastName = value ?? "";
        });
        _appPreferences.getPhoneNumber(key: 'phoneNumber').then((value) {
          Constants.phoneNumber = value ?? "";
        });
        _appPreferences.getProfilePicture(key: 'profilePicture').then((value){
          Constants.profilePicture = value ?? "";
        });
        if (kDebugMode) {
          print("token from login cubit 2 ${Constants.token}");
          print("user id from login cubit 2 ${Constants.userId}");
        }
        emit(LoginSuccessState());
      }).catchError((error) {
        emit(LoginErrorState(error.toString()));
        if (kDebugMode) {
          print(error.toString());
          print("*******EEEEEEE******");
        }
      });
    } else {
      showNoInternetMessage();
    }
  }

  bool containsOnlyNumbers(String input) {
    final RegExp numberRegex = RegExp(r'[!@#\$%^&*(),.?":{}|<>0-9]');
    return numberRegex.hasMatch(input);
  }

  String? validatePhoneNumberInput(String? value) {
    if (value!.isEmpty) {
      return AppStrings.phoneError.tr();
    } else if (!containsOnlyNumbers(value)) {
      return AppStrings.numberInvalid.tr();
    } else if (value.length < 10) {
      return AppStrings.phoneShortError.tr();
    } else if (!value.startsWith("05")) {
      return AppStrings.numberStart05.tr();
    } else {
      return null;
    }
  }

  logout() {
    _appPreferences.setUserId(key: 'userId', value: '');
    _appPreferences.setToken(key: 'token', value: '');
    _appPreferences.setFirstName(key: 'firstName', value: '');
    _appPreferences.setLastName(key: 'lastName', value: '');
    _appPreferences.setPhoneNumber(key: 'phoneNumber', value: '');
    emit(LogoutState());
  }

  showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (Theme.of(context).platform == TargetPlatform.iOS) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: CupertinoAlertDialog(
              title: Text(AppStrings.logout.tr()),
              content: Text(AppStrings.logoutMessage.tr()),
              actions: [
                CupertinoDialogAction(
                  child: Text(
                    AppStrings.cancel.tr(),
                    style: getSemiBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s16),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                CupertinoDialogAction(
                  child: Text(
                    AppStrings.confirm.tr(),
                    style: getSemiBoldStyle(
                        color: ColorManager.error, fontSize: FontSize.s16),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(Routes.loginRoute, (route) => false);
                    logout();
                  },
                ),
              ],
            ),
          );
        } else {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AlertDialog(
              title: Text(AppStrings.logout.tr()),
              content: Text(AppStrings.logoutMessage.tr()),
              actions: [
                ElevatedButton(
                  child: Text(
                    AppStrings.cancel.tr(),
                    style: getSemiBoldStyle(
                        color: CupertinoColors.white, fontSize: FontSize.s16),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.error),
                  child: Text(
                    AppStrings.confirm.tr(),
                    style: getSemiBoldStyle(
                        color: CupertinoColors.white, fontSize: FontSize.s16),
                  ),
                  onPressed: () {
                    // logout action
                    Navigator.of(context).pushNamedAndRemoveUntil(Routes.loginRoute, (route) => false);
                    logout();
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
