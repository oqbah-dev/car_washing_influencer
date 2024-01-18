import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/languages_manager.dart';
import '../../bloc/login_bloc/login_cubit.dart';
import '../../bloc/login_bloc/login_states.dart';
import '../../common_widgets/button.dart';
import '../../common_widgets/textField.dart';
import '../../resources/Strings_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/value_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

final TextEditingController _phoneNumber = TextEditingController();
final TextEditingController _password = TextEditingController();
var _loginKeyForm = GlobalKey<FormState>();

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    context.read<LoginCubit>().fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.profileRoute, (route) => false);
        }
        if (state is LoginErrorState) {
          context.read<LoginCubit>().showCustomToast(
              messageColor: ColorManager.white,
              message: AppStrings.phonePasswordInvalid.tr(),
              color: ColorManager.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.primary,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
              elevation: 0.0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: ColorManager.primary,
                  statusBarIconBrightness: Brightness.light),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
              child: Form(
                key: _loginKeyForm,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: h * .05,
                      ),
                      Text(
                        AppStrings.welcome.tr(),
                        style: getBoldStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s40.sp),
                      ),
                      SizedBox(
                        height: h * .05,
                      ),
                      Align(
                          alignment: isRTL()
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Text(
                            AppStrings.signInToContinue.tr(),
                            style: getMediumStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s20.sp),
                          )),
                      SizedBox(
                        height: h * .05,
                      ),
                      BuildTextField(
                        controller: _phoneNumber,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return context
                              .read<LoginCubit>()
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
                        controller: _password,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.passwordError.tr();
                          } else {
                            return null;
                          }
                        },
                        label: Text(
                          AppStrings.password.tr(),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: h * .05,
                      ),
                      OutlinedButton(
                          style: ButtonStyle(
                              side: MaterialStateProperty.resolveWith((states) {
                            return BorderSide(color: ColorManager.white);
                          })),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(Routes.forgotPasswordRoute);
                          },
                          child: Text(
                            AppStrings.forgotPassword.tr(),
                            style: getSemiBoldStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s14.sp),
                          )),
                      SizedBox(
                        height: h * .115,
                      ),
                      state is LoginLoadingState
                          ? const LoadingButton()
                          : BuildButton(
                              text: AppStrings.login.tr(),
                              onPressed: () {
                                if (_loginKeyForm.currentState!.validate()) {
                                  context.read<LoginCubit>().login(
                                      phoneNumber: _phoneNumber.text.trim(),
                                      password: _password.text.trim());
                                }
                              },
                            ),
                      //971552668738
                      SizedBox(
                        height: h * .03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            AppStrings.doNotHaveAnAccount.tr(),
                            style: getMediumStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s18.sp),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.registerRoute);
                            },
                            child: Text(
                              AppStrings.signUp.tr(),
                              style: getMediumStyle(
                                  color: ColorManager.textFormLightGrey,
                                  fontSize: FontSize.s18.sp),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _phoneNumber.dispose();
    _password.dispose();
    super.dispose();
  }

  bool isRTL() {
    return context.locale == ARABIC_LOCALE;
  }
}
