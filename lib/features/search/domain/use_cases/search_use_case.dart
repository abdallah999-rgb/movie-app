import 'package:injectable/injectable.dart';
import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/search/domain/entities/movie_entity.dart';
import 'package:movie_app/features/search/domain/repo/search_repo.dart';

@injectable
class SearchUseCase{
  SearchRepo searchRepo ;
  @factoryMethod
  SearchUseCase({required this.searchRepo});
  Future<Result<List<MovieEntity>>> invoke (String query) async{
  return  await searchRepo.search(query);
  }
}