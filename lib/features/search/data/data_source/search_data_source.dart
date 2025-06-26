import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/search/data/models/Movie.dart';

abstract class SearchDataSource{
  Future<Result<List<Movie>>> search(String query);
}