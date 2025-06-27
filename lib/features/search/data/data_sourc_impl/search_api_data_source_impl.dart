import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/search/data/api/search_api_services.dart';
import 'package:movie_app/features/search/data/data_source/search_data_source.dart';
import 'package:movie_app/features/search/data/models/Movie.dart';

class SearchApiDataSourceImpl implements SearchDataSource{
  SearchApiServices searchApiServices ;
  SearchApiDataSourceImpl({required this.searchApiServices});
  @override
  Future<Result<List<Movie>>> search(String query)async {
    return await searchApiServices.search(query);

  }

}