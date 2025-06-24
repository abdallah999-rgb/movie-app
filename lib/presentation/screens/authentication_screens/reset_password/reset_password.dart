import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/assets_manager/assets_manager.dart';
import 'package:movie_app/core/widgets/custom_elevated_button.dart';
import 'package:movie_app/core/widgets/custom_text_form_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late TextEditingController emailController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(title: Text("Forget Password")),
        body: Padding(
          padding:  REdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AssetsManager.forgetPassword),
              SizedBox(height: 24.h),
              CustomTextFormField(
                prefixIcon: Icons.email,
                hint: "Email",
                controller: emailController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Plz, enter the email";
                  }
                  if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(value)) {
                    return "Email is not valid";
                  }
                  return null;
                },
              ),
              SizedBox(height: 30.h,),
              CustomElevatedButton(text: "Verify Email", onPress: (){
                if(!formKey.currentState!.validate()) return;
              })
            ],
          ),
        ),
      ),
    );
  }
}
