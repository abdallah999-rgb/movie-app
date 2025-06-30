import 'package:injectable/injectable.dart';
import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/search/data/data_source/search_data_source.dart';
import 'package:movie_app/features/search/data/models/Movie.dart';
import 'package:movie_app/features/search/domain/entities/movie_entity.dart';
import 'package:movie_app/features/search/domain/repo/search_repo.dart';

@Injectable(as:SearchRepo )
class SearchRepoImpl implements SearchRepo {
  SearchDataSource searchDataSource;
  @factoryMethod
  SearchRepoImpl({required this.searchDataSource});

  @override
  Future<Result<List<MovieEntity>>> search(String query) async{
   var result = await searchDataSource.search(query);
   switch(result) {
     case Success<List<Movie>>():
     return Success(data: result.data.map((movie)=>movie.toMovieEntity() ).toList());
     case ServerError<List<Movie>>():
      return ServerError(message: result.message);
     case GeneralException<List<Movie>>():
      return GeneralException(exception: result.exception);
   }
  }
  
}