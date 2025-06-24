
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtils{
  static void showLoadingDialog(BuildContext context,{String?message}){
    showDialog(context: context,barrierColor: Colors.black.withAlpha(400), builder:(context) {
      return CupertinoAlertDialog(


          content:message == null ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(child: CircularProgressIndicator()),
            ],
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message),
              SizedBox(width: 10.w,),
              Center(child: CircularProgressIndicator())
            ],
          )

      );
    },);
  }

  static void hideDialog(BuildContext context){
    Navigator.pop(context);
  }

  static void showMessageDialog(BuildContext context,String content,{String ? posButton,String ? negButton,VoidCallback? posAction , VoidCallback ? negAction}){
    List <Widget> actions =[];
    if (posButton != null){
      actions.add(TextButton(onPressed: posAction?.call, child: Text(posButton))) ;
    }
    if (negButton != null){
      actions.add(TextButton(onPressed: negAction?.call, child: Text(negButton)));
    }
    showDialog(context: context,barrierColor: Colors.black.withAlpha(400), builder: (context,) {
      return CupertinoAlertDialog(


        content: Text(content,),
        actions: actions,
      );
    },);
  }
}