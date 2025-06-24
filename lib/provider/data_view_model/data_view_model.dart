import 'package:flutter/material.dart';
import 'package:movie_app/core/result.dart';
import 'package:movie_app/data/api_services/models/login/LoginResponse.dart';
import 'package:movie_app/domain/entities/login_entity.dart';
import 'package:movie_app/domain/entities/sign_up_entity.dart';
import 'package:movie_app/domain/use_cases/login_use_cases.dart';
import 'package:movie_app/domain/use_cases/sign_up_use_cases.dart';

class DataViewModel extends ChangeNotifier{
SignUpUseCases signUpUseCases;
LoginUseCases loginUseCases;
DataViewModel({required this.signUpUseCases,required this.loginUseCases});

CreateUserState createUserState = LoadingCreateUserState();
LoginUserState loginUserState = LoadingLoginUserState();
void changeCreateUserState(CreateUserState newState){
  createUserState = newState;
  notifyListeners();
}
void changeLoginUserState(LoginUserState newState){
  loginUserState = newState;
  notifyListeners();
}

Future<void> createUser(SignUpEntity user)async{
  createUserState = LoadingCreateUserState();
  notifyListeners();
  var result = await signUpUseCases.invoke(user);
  switch(result) {
    case Success<SignUpEntity>():
      print("--------------------------------------------");
     changeCreateUserState(SuccessCreateUserState(user: result.data));
    case ServerError<SignUpEntity>():
     changeCreateUserState(ErrorCreateUserState(serverError: result));
    case GeneralException<SignUpEntity>():
      changeCreateUserState(ErrorCreateUserState(generalException:result.exception ));

  }
}

Future<void> loginUser(LoginEntity existedUser)async{
  var result = await loginUseCases.invoke(existedUser);
  switch(result) {
    case Success<LoginResponse>():
      changeLoginUserState(SuccessLoginUserState(existedUser:result.data ));

    case ServerError<LoginResponse>():
      changeLoginUserState(ErrorLoginUserState(serverError: result));

    case GeneralException<LoginResponse>():
      changeLoginUserState(ErrorLoginUserState(generalException: result.exception));

  }
}
}





sealed class CreateUserState{}

class SuccessCreateUserState extends CreateUserState{
SignUpEntity user;
SuccessCreateUserState({required this.user});
}

class LoadingCreateUserState extends CreateUserState{
  String? loadingMessage;
  LoadingCreateUserState({ this.loadingMessage});
}


class ErrorCreateUserState extends CreateUserState{
  ServerError? serverError;
  Exception? generalException;
  ErrorCreateUserState({ this.serverError, this.generalException});
}



sealed class LoginUserState{}

class SuccessLoginUserState extends LoginUserState{
  LoginResponse existedUser;
  SuccessLoginUserState({required this.existedUser});
}

class LoadingLoginUserState extends LoginUserState{
  String? loadingMessage;
  LoadingLoginUserState({ this.loadingMessage});
}


class ErrorLoginUserState extends LoginUserState{
  ServerError? serverError;
  Exception? generalException;
  ErrorLoginUserState({ this.serverError, this.generalException});
}