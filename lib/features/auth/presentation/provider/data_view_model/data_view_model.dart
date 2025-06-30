import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/auth/data/api_services/models/login/login_response.dart';
import 'package:movie_app/features/auth/domain/entities/login_entity.dart';
import 'package:movie_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:movie_app/features/auth/domain/use_cases/login_use_cases.dart';
import 'package:movie_app/features/auth/domain/use_cases/sign_up_use_cases.dart';
@injectable
class DataViewModel extends ChangeNotifier {
  SignUpUseCases signUpUseCases;
  LoginUseCases loginUseCases;
  @factoryMethod
  DataViewModel({required this.signUpUseCases, required this.loginUseCases});

  CreateUserState createUserState = LoadingCreateUserState();
  LoginUserState loginUserState = LoadingLoginUserState();
  void changeCreateUserState(CreateUserState newState) {
    createUserState = newState;
    notifyListeners();
  }

  void changeLoginUserState(LoginUserState newState) {
    loginUserState = newState;
    notifyListeners();
  }

  Future<void> createUser(SignUpEntity user) async {
    changeCreateUserState(LoadingCreateUserState());
    var result = await signUpUseCases.invoke(user);

    notifyListeners();
    switch (result) {
      case Success<SignUpEntity>():
        changeCreateUserState(SuccessCreateUserState(user: result.data));
      case ServerError<SignUpEntity>():
        log(result.message);
        changeCreateUserState(
          ErrorCreateUserState(serverError: result.message),
        );
      case GeneralException<SignUpEntity>():
        changeCreateUserState(
          ErrorCreateUserState(generalException: result.exception),
        );
    }
  }

  Future<void> loginUser(LoginEntity existedUser) async {
    var result = await loginUseCases.invoke(existedUser);
    switch (result) {
      case Success<LoginResponse>():
        changeLoginUserState(SuccessLoginUserState(existedUser: result.data));

      case ServerError<LoginResponse>():
        log(result.message);
        changeLoginUserState(ErrorLoginUserState(serverError: result.message));

      case GeneralException<LoginResponse>():
        log(result.exception.toString());
        changeLoginUserState(
          ErrorLoginUserState(generalException: result.exception),
        );
    }
  }
}

sealed class CreateUserState {}

class SuccessCreateUserState extends CreateUserState {
  SignUpEntity user;
  SuccessCreateUserState({required this.user});
}

class LoadingCreateUserState extends CreateUserState {
  String? loadingMessage;
  LoadingCreateUserState({this.loadingMessage});
}

class ErrorCreateUserState extends CreateUserState {
  String? serverError;
  Exception? generalException;
  ErrorCreateUserState({this.serverError, this.generalException});
}

sealed class LoginUserState {}

class SuccessLoginUserState extends LoginUserState {
  LoginResponse existedUser;
  SuccessLoginUserState({required this.existedUser});
}

class LoadingLoginUserState extends LoginUserState {
  String? loadingMessage;
  LoadingLoginUserState({this.loadingMessage});
}

class ErrorLoginUserState extends LoginUserState {
  String? serverError;
  Exception? generalException;
  ErrorLoginUserState({this.serverError, this.generalException});
}
