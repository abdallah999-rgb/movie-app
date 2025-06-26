import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/search/domain/entities/movie_entity.dart';
import 'package:movie_app/features/search/domain/use_cases/search_use_case.dart';

class SearchProvider extends ChangeNotifier{
  SearchUseCase searchUseCase;
  SearchProvider({required this.searchUseCase});
  String searchListener = "";

  List<MovieEntity>movies =[];
   SearchState searchState = LoadingSearchState();
  emit(SearchState newState){
    searchState = newState;
    notifyListeners();
  }

Future<void> search (String query)async{

searchState = LoadingSearchState();
notifyListeners();
  var result = await searchUseCase.invoke(query);
  switch(result) {
    case Success<List<MovieEntity>>():
      movies = result.data;
      emit( SuccessSearchState(movies: result.data));
    case ServerError<List<MovieEntity>>():
      emit(ErrorSearchState(serverError: result.message));


    case GeneralException<List<MovieEntity>>():
      emit(ErrorSearchState(exception: result.exception));
      log("${result.exception}");

  }
}
}


sealed class SearchState{}

class SuccessSearchState extends SearchState{
  List<MovieEntity> movies ;
  SuccessSearchState({required this.movies});
}


class LoadingSearchState extends SearchState{
  String? loadingMessage;
  LoadingSearchState({ this.loadingMessage});
}

class ErrorSearchState extends SearchState{
  String? serverError ;
  Exception? exception;
  ErrorSearchState({this.serverError,this.exception});
}