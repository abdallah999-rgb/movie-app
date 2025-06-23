import 'package:flutter/material.dart';
import 'package:movie_app/core/result.dart';
import 'package:movie_app/domain/entities/sign_up_entity.dart';
import 'package:movie_app/domain/use_cases/sign_up_use_cases.dart';

class DataViewModel extends ChangeNotifier{
SignUpUseCases signUpUseCases;
DataViewModel({required this.signUpUseCases});

CreateUserState createUserState = LoadingCreateUserState();
void changeCreateUserState(CreateUserState newState){
  createUserState = newState;
  notifyListeners();
}

Future<void> createUser(SignUpEntity user)async{
  createUserState = LoadingCreateUserState();
  notifyListeners();
  var result = await signUpUseCases.invoke(user);
  switch(result) {
    case Success<SignUpEntity>():
     changeCreateUserState(SuccessCreateUserState(user: result.data));
    case ServerError<SignUpEntity>():
     changeCreateUserState(ErrorCreateUserState(serverError: result));
    case GeneralException<SignUpEntity>():
      changeCreateUserState(ErrorCreateUserState(generalException:result.exception ));

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