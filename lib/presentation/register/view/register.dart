import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/languages_manager.dart';
import '../../bloc/register_bloc/register_cubit.dart';
import '../../common_widgets/button.dart';
import '../../common_widgets/textField.dart';
import '../../resources/Strings_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/value_manager.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

TextEditingController? _name;

TextEditingController? _phoneNumber;

TextEditingController? _password;

var _key = GlobalKey<FormState>();
File? _image;

class _RegisterViewState extends State<RegisterView> {
  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _phoneNumber = TextEditingController();
    _password = TextEditingController();
    context.read<RegisterCubit>().fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context)..width;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primary,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: ColorManager.primary,
        iconTheme: IconThemeData(color: ColorManager.white),
        elevation: 0.0,
      ),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (context.read<RegisterCubit>().registerModel!.phoneNumber ==
                _phoneNumber!.text) {
              Navigator.pushNamed(context, Routes.otpRoute,
                  arguments: _phoneNumber!.text);
            }
          }

        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
              child: Form(
                key: _key,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: isRTL()
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          AppStrings.welcome.tr(),
                          style: getBoldStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s40.sp),
                        ),
                      ),
                      Align(
                        alignment: isRTL()
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          AppStrings.signUpToJoin.tr(),
                          style: getRegularStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s18.sp),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      BuildTextField(
                        controller: _name!,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          return context
                              .read<RegisterCubit>()
                              .validateNameInput(value);
                        },
                        label: Text(
                          AppStrings.name.tr(),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.015,
                      ),
                      BuildTextField(
                        controller: _phoneNumber!,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return context
                              .read<RegisterCubit>()
                              .validatePhoneNumberInput(value);
                        },
                        label: Text(
                          AppStrings.phoneNumber.tr(),
                        ),
                      ),
                      SizedBox(
                        height: h * .015,
                      ),
                      BuildTextField(
                        controller: _password!,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          return context
                              .read<RegisterCubit>()
                              .validatePasswordInput(value);
                        },
                        label: Text(
                          AppStrings.password.tr(),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: h * 0.215,
                      ),
                      //0552668738
                      state is RegisterLoadingState
                          ? const LoadingButton()
                          : BuildButton(
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  context.read<RegisterCubit>().register(
                                      name: _name!.text.trim(),
                                      phoneNumber: _phoneNumber!.text.trim(),
                                      password: _phoneNumber!.text.trim());
                                }
                              },
                              text: AppStrings.register.tr())
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _name!.dispose();
    _phoneNumber!.dispose();
    _password!.dispose();
    super.dispose();
  }

  bool isRTL() {
    return context.locale == ARABIC_LOCALE;
  }

// Future<void> _pickImage() async {
//   final ImagePicker picker = ImagePicker();
//   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//
//   if (image != null) {
//     setState(() {
//       _image = File(image.path);
//     });
//   }
// }
}
