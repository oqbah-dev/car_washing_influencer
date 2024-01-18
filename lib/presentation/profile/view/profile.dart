import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../app/app_prefs.dart';
import '../../../app/constants.dart';
import '../../../app/di.dart';
import '../../../app/languages_manager.dart';
import '../../bloc/profile_bloc/profile_bloc_cubit.dart';
import '../../common_widgets/button.dart';
import '../../common_widgets/profile_items.dart';
import '../../common_widgets/textField.dart';
import '../../resources/Strings_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/value_manager.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  TextEditingController? _firstNameController;
  TextEditingController? _lastNameController;
  TextEditingController? _phoneController;
  TextEditingController? _emailController;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: Constants.firstName);
    _lastNameController = TextEditingController(text: Constants.lastName);
    _phoneController = TextEditingController(
        text: Constants.phoneNumber.replaceFirst('+971', '0'));
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProfileBlocCubit>();
    final h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: ColorManager.primary,
        child: Column(
          children: [
            const Spacer(),
            BuildDrawer(
              onTap: () {
                isRTL()
                    ? cubit.changeLangToEnglish(context)
                    : cubit.changeLangToArabic(context);
                Phoenix.rebirth(context);
              },
              h: h,
              text: isRTL()
                  ? AppStrings.changeEnglish.tr()
                  : AppStrings.changeArabic.tr(),
              icon: Icons.translate,
            ),
            BuildDrawer(
              onTap: () {
                cubit.showLogoutDialog(context);
              },
              h: h,
              text: AppStrings.logout.tr(),
              icon: Icons.login,
            ),
            SizedBox(height: h *.1,)
          ],
        ),
      ),
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorManager.white),
        backgroundColor: ColorManager.primary,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                isRTL()
                    ? cubit.changeLangToEnglish(context)
                    : cubit.changeLangToArabic(context);
                Phoenix.rebirth(context);
              },
              icon: const Icon(Icons.translate))
        ],
      ),
      body: BlocConsumer<ProfileBlocCubit, ProfileBlocState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Constants.profilePicture == ""
                          ? cubit.fileImage == null
                              ? InkWell(
                                  onTap: () {
                                    cubit.pickImage();
                                  },
                                  child: Card(
                                    elevation: 3,
                                    color: ColorManager.primary,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: AppSize.s120.w,
                                      width: AppSize.s120.w,
                                      decoration: BoxDecoration(
                                          color: ColorManager.white,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: const FaIcon(FontAwesomeIcons.add,
                                          size: AppSize.s40),
                                    ),
                                  ),
                                )
                              : Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: AppSize.s120.w,
                                          width: AppSize.s120.w,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: FileImage(
                                                    cubit.fileImage!,
                                                  ),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: IconButton(
                                              onPressed: () {
                                                cubit.deleteImage();
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: ColorManager.error,
                                                size: AppSize.s30,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                          : Container(
                              height: AppSize.s120.w,
                              width: AppSize.s120.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        "https://wash-stations.com/api/influencer/${Constants.profilePicture}",
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      BuildTextField(
                        label: Text(AppStrings.firstName.tr()),
                        controller: _firstNameController!,
                      ),
                      SizedBox(
                        height: h * 0.022,
                      ),
                      BuildTextField(
                        label: Text(AppStrings.lastName.tr()),
                        controller: _lastNameController!,
                      ),
                      SizedBox(
                        height: h * 0.022,
                      ),
                      BuildTextField(
                        label: Text(AppStrings.phoneNumber.tr()),
                        controller: _phoneController!,
                      ),
                      SizedBox(
                        height: h * 0.035,
                      ),
                      state is LoadingProfileState
                          ? const LoadingButton()
                          : BuildButton(
                              text: AppStrings.update.tr(),
                              onPressed: () {
                                if (cubit.fileImage == null) {
                                  cubit.updateProfile(
                                      firstName:
                                          _firstNameController!.text.trim(),
                                      lastName:
                                          _lastNameController!.text.trim(),
                                      phoneNumber:
                                          _lastNameController!.text.trim(),
                                      email: _emailController!.text.trim());
                                } else {
                                  cubit.updateProfileWithImage(
                                      firstName:
                                          _firstNameController!.text.trim(),
                                      lastName:
                                          _lastNameController!.text.trim(),
                                      phoneNumber:
                                          _lastNameController!.text.trim(),
                                      email: _emailController!.text.trim());
                                }
                              },
                            )
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
    _firstNameController!.dispose();
    _lastNameController!.dispose();
    _phoneController!.dispose();
    _emailController!.dispose();
    super.dispose();
  }

  bool isRTL() {
    return context.locale == ARABIC_LOCALE;
  }
}
