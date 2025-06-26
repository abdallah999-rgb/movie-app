import 'package:movie_app/core/result.dart';
import 'package:movie_app/features/search/domain/entities/movie_entity.dart';
import 'package:movie_app/features/search/domain/repo/search_repo.dart';

class SearchUseCase{
  SearchRepo searchRepo ;
  SearchUseCase({required this.searchRepo});
  Future<Result<List<MovieEntity>>> invoke (String query) async{
  return  await searchRepo.search(query);
  }
}