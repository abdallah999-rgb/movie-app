import 'package:movie_app/features/search/domain/entities/movie_entity.dart';

import '../../../../core/result.dart';

abstract class SearchRepo{
  Future<Result<List<MovieEntity>>> search(String query);
}