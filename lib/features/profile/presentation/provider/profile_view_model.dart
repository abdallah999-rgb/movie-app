import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/profile/domain/entities/profile_data_entity.dart';
import 'package:movie_app/features/profile/domain/use_cases/profile_data_use_case.dart';

@injectable
class ProfileViewModel extends ChangeNotifier {
  ProfileDataUseCase profileDataUseCase;

  @factoryMethod
  ProfileViewModel({required this.profileDataUseCase});

  late ProfileDataEntity profileDataEntity;
  late String errorMessage;
  ProfileDataState profileDataState = LoadingProfileDataState();

  void emit(ProfileDataState newState) {
    profileDataState = newState;
    notifyListeners();
  }

  Future<void> getProfileData() async {
    profileDataState = LoadingProfileDataState();
    notifyListeners();
    var result = await profileDataUseCase.getProfileData();
    notifyListeners();
    switch (result) {
      case Success<ProfileDataEntity>():
        profileDataEntity = result.data;
        log(profileDataEntity.name!);
        log("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
        emit(SuccessProfileDataState(user: result.data));
      case ServerError<ProfileDataEntity>():
        log("ffffffffffffffffffffffffffffffffffffffffff");
        emit(ErrorProfileDataState(serverError: result.message));

      case GeneralException<ProfileDataEntity>():
        log("ggggggggggggggggggggggggggggggggggggggggggggggggggg");
        emit(ErrorProfileDataState(generalException: result.exception));
    }
  }
}

sealed class ProfileDataState {}

class SuccessProfileDataState extends ProfileDataState {
  ProfileDataEntity user;

  SuccessProfileDataState({required this.user});
}

class LoadingProfileDataState extends ProfileDataState {
  String? loadingMessage;

  LoadingProfileDataState({this.loadingMessage});
}

class ErrorProfileDataState extends ProfileDataState {
  String? serverError;
  Exception? generalException;

  ErrorProfileDataState({this.serverError, this.generalException});
}
