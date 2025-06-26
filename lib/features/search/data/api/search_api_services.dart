import 'dart:convert';

import 'package:movie_app/core/result.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/features/search/data/models/MoviesResponse.dart';
import '../models/Movie.dart';

class SearchApiServices{
static const String _baseUrl = "yts.mx";
static const String _endPoint = "/api/v2/list_movies.json";
  Future<Result<List<Movie>>> search(String query)async{
    try{
      Uri url = Uri.https(_baseUrl,_endPoint,{
        "query_term": query,

      });
      http.Response response = await http.get(url);
      var json =   jsonDecode(response.body);
      MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
      if(moviesResponse.status == "ok"){
        return Success(data: moviesResponse.data!.movies?? []);
      }else{
        return ServerError(message: moviesResponse.statusMessage!);
      }
    }on Exception catch(e){
      return GeneralException(exception: e);
    }


  }
}