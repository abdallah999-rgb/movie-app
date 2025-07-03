// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/api_services/api_services.dart' as _i1067;
import '../../features/auth/data/data_souce_impl/auth_api.dart' as _i602;
import '../../features/auth/data/data_souce_impl/login_api.dart' as _i932;
import '../../features/auth/data/data_source/auth_data_source.dart' as _i364;
import '../../features/auth/data/data_source/login_data_source.dart' as _i732;
import '../../features/auth/data/repo_impl/authentication_repo_impl.dart'
    as _i879;
import '../../features/auth/data/repo_impl/login_rep_impl.dart' as _i674;
import '../../features/auth/domain/repositories/authentication_repositories.dart'
    as _i163;
import '../../features/auth/domain/repositories/login_repository.dart' as _i870;
import '../../features/auth/domain/use_cases/login_use_cases.dart' as _i541;
import '../../features/auth/domain/use_cases/sign_up_use_cases.dart' as _i203;
import '../../features/auth/presentation/provider/data_view_model/data_view_model.dart'
    as _i304;
import '../../features/profile/data/data_Source/profile_data_source.dart'
    as _i912;
import '../../features/profile/data/data_source_impl/profile_data_source_impl.dart'
    as _i7;
import '../../features/profile/data/profile_api.dart' as _i453;
import '../../features/profile/data/profile_data_repo_impl/profile_data_repo_impl.dart'
    as _i125;
import '../../features/profile/domain/repositories/profile_data_repo.dart'
    as _i433;
import '../../features/profile/domain/use_cases/profile_data_use_case.dart'
    as _i481;
import '../../features/profile/presentation/provider/profile_view_model.dart'
    as _i212;
import '../../features/search/data/api/search_api_services.dart' as _i216;
import '../../features/search/data/data_sourc_impl/search_api_data_source_impl.dart'
    as _i1047;
import '../../features/search/data/data_source/search_data_source.dart'
    as _i294;
import '../../features/search/data/repo_impl/search_repo_impl.dart' as _i790;
import '../../features/search/domain/repo/search_repo.dart' as _i1033;
import '../../features/search/domain/use_cases/search_use_case.dart' as _i601;
import '../../features/search/provider/search_view_model.dart' as _i867;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1067.ApiServices>(() => _i1067.ApiServices());
    gh.singleton<_i216.SearchApiServices>(() => _i216.SearchApiServices());
    gh.singleton<_i453.ProfileApi>(() => _i453.ProfileApi());
    gh.factory<_i732.LoginDataSource>(
      () => _i932.LoginApiDataSource(apiServices: gh<_i1067.ApiServices>()),
    );
    gh.factory<_i364.AuthDataSource>(
      () => _i602.AuthApiDataSourceImpl(apiServices: gh<_i1067.ApiServices>()),
    );
    gh.factory<_i870.LoginRepository>(
      () => _i674.LoginRepoImpl(loginDataSource: gh<_i732.LoginDataSource>()),
    );
    gh.factory<_i294.SearchDataSource>(
      () => _i1047.SearchApiDataSourceImpl(
        searchApiServices: gh<_i216.SearchApiServices>(),
      ),
    );
    gh.factory<_i163.AuthRepositories>(
      () => _i879.AuthRepoImpl(authDataSource: gh<_i364.AuthDataSource>()),
    );
    gh.factory<_i203.SignUpUseCases>(
      () => _i203.SignUpUseCases(repositories: gh<_i163.AuthRepositories>()),
    );
    gh.factory<_i912.ProfileDataSource>(
      () => _i7.ProfileDataSourceImpl(profileApi: gh<_i453.ProfileApi>()),
    );
    gh.factory<_i1033.SearchRepo>(
      () =>
          _i790.SearchRepoImpl(searchDataSource: gh<_i294.SearchDataSource>()),
    );
    gh.factory<_i541.LoginUseCases>(
      () => _i541.LoginUseCases(loginRepository: gh<_i870.LoginRepository>()),
    );
    gh.factory<_i433.ProfileDataRepo>(
      () => _i125.ProfileDataRepoImpl(
        profileDataSource: gh<_i912.ProfileDataSource>(),
      ),
    );
    gh.factory<_i601.SearchUseCase>(
      () => _i601.SearchUseCase(searchRepo: gh<_i1033.SearchRepo>()),
    );
    gh.factory<_i304.DataViewModel>(
      () => _i304.DataViewModel(
        signUpUseCases: gh<_i203.SignUpUseCases>(),
        loginUseCases: gh<_i541.LoginUseCases>(),
      ),
    );
    gh.factory<_i481.ProfileDataUseCase>(
      () => _i481.ProfileDataUseCase(
        profileDataRepo: gh<_i433.ProfileDataRepo>(),
      ),
    );
    gh.factory<_i212.ProfileViewModel>(
      () => _i212.ProfileViewModel(
        profileDataUseCase: gh<_i481.ProfileDataUseCase>(),
      ),
    );
    gh.factory<_i867.SearchViewModel>(
      () => _i867.SearchViewModel(searchUseCase: gh<_i601.SearchUseCase>()),
    );
    return this;
  }
}
