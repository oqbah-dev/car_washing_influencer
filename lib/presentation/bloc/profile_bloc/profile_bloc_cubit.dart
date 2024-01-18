import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/app_prefs.dart';
import '../../../app/constants.dart';
import '../../../app/di.dart';
import '../../../data/network/dio_helper.dart';
import '../../resources/Strings_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/style_manager.dart';

part 'profile_bloc_state.dart';

class ProfileBlocCubit extends Cubit<ProfileBlocState> {
  ProfileBlocCubit() : super(ProfileBlocInitial());
  File? fileImage;
  final AppPreferences appPreferences = instance<AppPreferences>();

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      fileImage = File(image.path);
      emit(UpdateImageState());
    }
  }

  void deleteImage() {
    fileImage = null;
    emit(DeleteImageState());
  }

  updateProfileWithImage(
      {required String firstName,
      required String lastName,
      required String phoneNumber,
      required String email}) async {
    emit(UpdateImageState());
    DioHelper.postDataWithImage(
        endPoint: Constants.updateProfileEndPoint,
        data: FormData.fromMap({
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "phone_number": phoneNumber,
          "worker_picture": await MultipartFile.fromFile(fileImage!.path,
              filename: fileImage!.path.split('/').last)
        })).then((value) {
      if (kDebugMode) {
        print(value.toString());
      }
      emit(SuccessProfileState());
    }).catchError((error) {
      emit(ErrorProfileState(error.toString()));
    });
  }

  updateProfile(
      {required String firstName,
      required String lastName,
      required String phoneNumber,
      required String email}) async {
    emit(UpdateImageState());
    DioHelper.postData(endPoint: Constants.updateProfileEndPoint, data: {
      "first_name": fileImage,
      "last_name": lastName,
      "email": email,
      "phone_number": phoneNumber,
    }).then((value) {
      if (kDebugMode) {
        print(value.toString());
      }
      emit(SuccessProfileState());
    }).catchError((error) {
      emit(ErrorProfileState(error.toString()));
    });
  }

  changeLangToArabic(BuildContext context) {
    appPreferences.changeAppLanguage();
    context.setLocale(const Locale('ar', 'SA'));
    emit(UpdateLanguageState());
  }

  changeLangToEnglish(BuildContext context) {
    appPreferences.changeAppLanguage();
    context.setLocale(const Locale('en', 'US'));
    emit(UpdateLanguageState());
  }

  logout() {
    appPreferences.setUserId(key: 'userId', value: '');
    appPreferences.setToken(key: 'token', value: '');
    appPreferences.setFirstName(key: 'firstName', value: '');
    appPreferences.setLastName(key: 'lastName', value: '');
    appPreferences.setPhoneNumber(key: 'phoneNumber', value: '');
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
              title: Text(
                AppStrings.logout.tr(),
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s20.sp),
              ),
              content: Text(AppStrings.logoutMessage.tr(),
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s16.sp)),
              actions: [
                CupertinoDialogAction(
                  child: Text(
                    AppStrings.cancel.tr(),
                    style: getSemiBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s16.sp),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                CupertinoDialogAction(
                  child: Text(
                    AppStrings.confirm.tr(),
                    style: getSemiBoldStyle(
                        color: ColorManager.error, fontSize: FontSize.s16.sp),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.loginRoute, (route) => false);
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
              title: Text(AppStrings.logout.tr(),
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s20.sp)),
              content: Text(AppStrings.logoutMessage.tr(),
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s16.sp)),
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
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.loginRoute, (route) => false);
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
