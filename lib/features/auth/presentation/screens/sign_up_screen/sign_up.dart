import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/assets_manager/assets_manager.dart';
import 'package:movie_app/core/colors_manager/colors_manager.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_app/core/widgets/dialog_utils.dart';
import 'package:movie_app/core/widgets/language_widget.dart';
import 'package:movie_app/features/auth/data/api_services/api_services.dart';
import 'package:movie_app/features/auth/data/data_souce_impl/auth_api.dart';
import 'package:movie_app/features/auth/data/data_souce_impl/login_api.dart';
import 'package:movie_app/features/auth/data/repo_impl/authentication_repo_impl.dart';
import 'package:movie_app/features/auth/data/repo_impl/login_rep_impl.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:movie_app/features/auth/domain/use_cases/login_use_cases.dart';
import 'package:movie_app/features/auth/domain/use_cases/sign_up_use_cases.dart';
import 'package:movie_app/features/auth/presentation/provider/data_view_model/data_view_model.dart';
import 'package:movie_app/features/auth/presentation/widgets/avatar_widget.dart';
import 'package:provider/provider.dart';
import '../../../../../core/routes_manager/routes_manager.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneController;
  late GlobalKey<FormState> formKey;
  bool isPasswordObscure = false;
  bool isConfirmedPasswordObscure = false;
  late DataViewModel dataViewModel;
  List<Image> avatars=[
    Image.asset(AssetsManager.gamer1,scale: 1.7,fit: BoxFit.fitHeight,),
    Image.asset(AssetsManager.gamer2,fit: BoxFit.fitHeight,),
    Image.asset(AssetsManager.gamer3,fit: BoxFit.fitHeight,),
  ];
  int avatarId = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void loadData() {
    dataViewModel = DataViewModel(
      signUpUseCases: SignUpUseCases(
        repositories: AuthRepoImpl(
          authDataSource: AuthApiDataSourceImpl(apiServices: ApiServices()),
        ),
      ),
      loginUseCases: LoginUseCases(
        loginRepository: LoginRepoImpl(
          loginDataSource: LoginApiDataSource(apiServices: ApiServices()),
        ),
      ),
    );
    log("$avatarId");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: dataViewModel,
      child: Form(
        key: formKey,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(title: Text("Register")),
            body: Padding(
              padding:  REdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 30.h),
                    AvatarWidget(avatars: avatars, onPageChanged: (index, reason) {
                      avatarId = index;
                      log("$avatarId");
                    },),
                    SizedBox(height: 10.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Avatar",
                          style: GoogleFonts.roboto(
                            color: ColorsManager.yellow,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    CustomTextFormField(
                      prefixIcon: Icons.perm_identity,
                      hint: "Name",
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Plz, Enter Your Name";
                        }
                        if (value.length < 6) {
                          return "your Name Must be More Than 6 letters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    CustomTextFormField(
                      prefixIcon: Icons.email,
                      hint: "Email",
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Plz, Enter Your Email";
                        }
                        if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(value)) {
                          return "Email is not valid";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),

                    CustomTextFormField(
                      isObscure: isPasswordObscure,
                      onSuffixIconPressed: () {
                        isPasswordObscure = !isPasswordObscure;
                        setState(() {});
                      },
                      prefixIcon: Icons.lock,
                      suffixIcon:
                          isPasswordObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                      hint: "Password",
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Plz, Enter Your Password";
                        }
                        if (value.length < 6) {
                          return "your Password Must be More Than 6 letters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),

                    CustomTextFormField(
                      isObscure: isConfirmedPasswordObscure,
                      onSuffixIconPressed: () {
                        isConfirmedPasswordObscure =
                            !isConfirmedPasswordObscure;
                        setState(() {});
                      },
                      prefixIcon: Icons.lock,
                      suffixIcon:
                          isConfirmedPasswordObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                      hint: "Confirm Password",
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Plz, Enter  Your Confirmed Password";
                        }
                        if (value != passwordController.text) {
                          return "your Confirm Password Does Not Match Your Password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),

                    CustomTextFormField(
                      prefixIcon: Icons.phone,
                      hint: "Phone Number",
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Plz, Enter Your Phone Number";
                        }
                        if (!RegExp(
                          r"^(\+201|01|00201)[0-2,5]{1}[0-9]{8}",
                        ).hasMatch(value)) {
                          return "your Number does not match with egypt phone numbers";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    CustomElevatedButton(
                      text: "Create Account",
                      onPress: () {
                        createAccount();
                      },
                    ),

                    SizedBox(height: 18.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have Account ?",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.sp,
                            color: ColorsManager.white,
                          ),
                        ),
                        CustomTextButton(
                          text: "Login",
                          onPress: () {
                            Navigator.pushNamed(context, RoutesManager.signIn);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),
                    LanguageWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void createAccount() async {
    // kvjn

    if (!formKey.currentState!.validate()) return;

    SignUpEntity user = SignUpEntity(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      phone: phoneController.text,
      avaterId: avatarId,
    );
    DialogUtils.showLoadingDialog(context);
    await dataViewModel.createUser(user);
    DialogUtils.hideDialog(context);

    var state = dataViewModel.createUserState;
    switch (state) {
      case SuccessCreateUserState():
        DialogUtils.showMessageDialog(
          context,
          "Sign Up Successfully",
          posButton: "OK",
          posAction: () {
            Navigator.pushReplacementNamed(context, RoutesManager.home);
          },
        );
      case LoadingCreateUserState():
        DialogUtils.showLoadingDialog(context);

      case ErrorCreateUserState():

        DialogUtils.showMessageDialog(context, ApiServices.registerError);
    }
  }
}
