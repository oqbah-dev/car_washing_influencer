import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../bloc/otp_bloc/otp_cubit.dart';
import '../../bloc/register_bloc/register_cubit.dart';
import '../../common_widgets/button.dart';
import '../../resources/Strings_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/value_manager.dart';

class OTPView extends StatefulWidget {
  const OTPView({super.key, this.number});

  final String? number;

  @override
  State<OTPView> createState() => _OTPViewState();
}

TextEditingController? _controller;
var _key = GlobalKey<FormState>();

class _OTPViewState extends State<OTPView> {
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    context.read<OtpCubit>().fToast.init(context);
    context.read<OtpCubit>().startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<OtpCubit>();
    final h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primary,
            statusBarIconBrightness: Brightness.light),
        title: Text(
          AppStrings.verifyingNumber.tr(),
          style: getSemiBoldStyle(
              color: ColorManager.white, fontSize: FontSize.s20.sp),
        ),
        backgroundColor: ColorManager.primary,
        iconTheme: IconThemeData(color: ColorManager.white),
        elevation: 0,
      ),
      body: BlocConsumer<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state is OtpSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.loginRoute, (route) => false);
          }
          if (state is OtpErrorState) {
            EasyLoading.dismiss();
            context.read<OtpCubit>().showCustomToast(
                message: AppStrings.otpInvalid.tr(), color: ColorManager.white);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: h * .1,
                    ),
                    Text(
                      AppStrings.otpMessage.tr(),
                      style: getMediumStyle(
                          color: ColorManager.white, fontSize: FontSize.s22.sp),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${widget.number}',
                      style: getMediumStyle(
                          color: ColorManager.white, fontSize: FontSize.s22.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: h * .12,
                    ),
                    PinCodeTextField(
                      controller: _controller,
                      length: 6,
                      appContext: context,
                      pinTheme: PinTheme(
                        borderRadius: BorderRadius.circular(5),
                        activeColor: ColorManager.white,
                        disabledColor: ColorManager.textFormLightGrey,
                        inactiveColor: ColorManager.white,
                        selectedColor: ColorManager.white,
                        shape: PinCodeFieldShape.box,
                      ),
                      textStyle: getSemiBoldStyle(
                          color: ColorManager.white, fontSize: FontSize.s24.sp),
                      cursorColor: ColorManager.primary,
                      keyboardType: TextInputType.number,
                      enablePinAutofill: true,
                      autoFocus: true,
                      onCompleted: (String? value) {
                        debugPrint(" completed : $value");
                        _controller!.text = value!;
                      },
                    ),
                    SizedBox(
                      height: h * .15,
                    ),
                    state is RegisterLoadingState
                        ? const LoadingButton()
                        : BuildButton(
                            onPressed: () {
                              debugPrint(_controller!.text);
                              if (_controller!.text.length < 6) {
                                context.read<OtpCubit>().showCustomToast(
                                    message: AppStrings.pinCodeShort.tr(),
                                    color: ColorManager.gold);
                              } else {
                                context.read<OtpCubit>().otpSubmit(
                                    otpCode: _controller!.text,
                                    phoneNumber: "${widget.number}");
                              }
                            },
                            text: AppStrings.verify.tr(),
                            color: ColorManager.primary),
                    SizedBox(
                      height: h * .05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(elevation: 0.0),
                          onPressed: cubit.counter > 0
                              ? null
                              : () {
                                  // todo : resent otp code api and resent the counter
                                },
                          child: Text(
                            AppStrings.resendCode.tr(),
                            style: getSemiBoldStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s18.sp),
                          ),
                        ),
                        Text(
                          "${cubit.formatTime(cubit.counter)} ${AppStrings.remainTime.tr()}",
                          style: getMediumStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s18.sp),
                        ),
                      ],
                    )
                  ],
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
    _controller!.dispose();
    context.read<OtpCubit>().timer.cancel();
    super.dispose();
  }
}
