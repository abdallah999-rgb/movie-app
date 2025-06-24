import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/assets_manager/assets_manager.dart';
import 'package:movie_app/core/colors_manager/colors_manager.dart';
import 'package:movie_app/core/routes_manager/routes_manager.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/custom_text_button.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_app/core/widgets/language_widget.dart';
import 'package:movie_app/domain/entities/login_entity.dart';
import 'package:movie_app/provider/data_view_model/data_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/dialog_utils.dart';
import '../../../../data/api_services/api_services.dart';
import '../../../../data/data_souce_impl/auth_api.dart';
import '../../../../data/data_souce_impl/login_api.dart';
import '../../../../data/repo_impl/authentication_repo_impl.dart';
import '../../../../data/repo_impl/login_rep_impl.dart';
import '../../../../domain/use_cases/login_use_cases.dart';
import '../../../../domain/use_cases/sign_up_use_cases.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late DataViewModel dataViewModel;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  bool isObscure = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  void loadData(){
    dataViewModel = DataViewModel(signUpUseCases: SignUpUseCases(repositories: AuthRepoImpl(authDataSource: AuthApiDataSourceImpl(apiServices: ApiServices()))), loginUseCases: LoginUseCases(loginRepository: LoginRepoImpl(loginDataSource: LoginApiDataSource(apiServices: ApiServices()))));

  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: dataViewModel,
      child: Form(
        key: formKey,
        child: Scaffold(

          body: SingleChildScrollView(
            child: Padding(
              padding: REdgeInsets.all(19.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Center(child: Image.asset(AssetsManager.splashImage)),
                  CustomTextFormField(
                    validator:(value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return "Plz, enter the email";
                      }
                      if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Email is not valid";
                      }
                      return null;
                    } ,
                      controller : emailController ,
                      prefixIcon: Icons.email,
                      hint: 'Email'),
                  SizedBox(height: 22.4.h),
                  CustomTextFormField(
                    isObscure:isObscure ,
                    onSuffixIconPressed: (){
                      isObscure = !isObscure;
                      setState(() {

                      });
                    },
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return "Plz, enter the password";
                      }
                      if (value
                          .trim()
                          .length < 6) {
                        return "password must be more than 6 letters";
                      }
                      return null;
                    },
                    controller: passwordController,
                    prefixIcon: Icons.lock_rounded,
                    hint: "Password",
                    suffixIcon: isObscure ? Icons.visibility_off : Icons.visibility,
                  ),
                  SizedBox(height: 18.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomTextButton(text: "Forget Password ?", onPress: () {
                      Navigator.pushNamed(context, RoutesManager.resetPassword);
                    },),
                  ),
                  SizedBox(height: 36.h),
                  CustomElevatedButton(text: "Login", onPress: () {
                    login();

                  },),
                  SizedBox(height: 20.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t Have Account ?",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.normal,
                          fontSize: 16.sp,
                          color: ColorsManager.white,
                        ),
                      ),
                      CustomTextButton(text: "Create One", onPress: () {
                        Navigator.pushNamed(context, RoutesManager.signUp);
                      },),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Expanded(child: Divider(color: ColorsManager.yellow,thickness:2,endIndent: 20,indent: 4,)),
                      Padding(
                        padding:  REdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "OR",
                          style: GoogleFonts.roboto(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal,
                            color: ColorsManager.faintYellow,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: ColorsManager.yellow,thickness: 2,endIndent: 4,indent: 20,)),

                    ],
                  ),
                  SizedBox(height: 30.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.faintYellow,
                      foregroundColor: ColorsManager.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      padding: REdgeInsets.all(20),
                      textStyle: GoogleFonts.roboto(
                        color: ColorsManager.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 20.sp,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AssetsManager.googleSVG),
                        SizedBox(width: 8.w),
                        Text("login With Google"),
                      ],
                    ),
                  ),
                  SizedBox(height: 34.h,),

                  LanguageWidget(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
void login()async{
  if(!formKey.currentState!.validate()) return;
  LoginEntity existedUser = LoginEntity(email: emailController.text, password: passwordController.text);
  await dataViewModel.loginUser(existedUser);
  var state = dataViewModel.loginUserState;
  switch(state) {
    case SuccessLoginUserState():

        DialogUtils.showLoadingDialog(context);
        await  dataViewModel.loginUser(existedUser);
        DialogUtils.hideDialog(context);
        DialogUtils.showMessageDialog(context, "Login Successfully",posButton: "OK", posAction: () {
          Navigator.pushReplacementNamed(context, RoutesManager.home);
        },);



    case LoadingLoginUserState():
        return DialogUtils.showLoadingDialog(context);

    case ErrorLoginUserState():

        DialogUtils.showLoadingDialog(context);
        await  dataViewModel.loginUser(existedUser);

        DialogUtils.hideDialog(context);
        DialogUtils.showMessageDialog(context, "Email Or Password is Wrong");




  }


}
}
