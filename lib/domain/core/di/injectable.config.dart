// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:netflix_clone/application/downloads/downloads_bloc.dart' as _i7;
import 'package:netflix_clone/application/search/search_bloc.dart' as _i8;
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart' as _i3;
import 'package:netflix_clone/domain/search/search_service.dart' as _i5;
import 'package:netflix_clone/infrastructure/downloads/downloads_repository.dart'
    as _i4;
import 'package:netflix_clone/infrastructure/search/search_imp.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.IDownloadsRepo>(() => _i4.DownloadsRepository());
    gh.lazySingleton<_i5.SearchService>(() => _i6.SearchImp());
    gh.factory<_i7.DownloadsBloc>(
        () => _i7.DownloadsBloc(gh<_i3.IDownloadsRepo>()));
    gh.factory<_i8.SearchBloc>(() => _i8.SearchBloc(
          gh<_i5.SearchService>(),
          gh<_i3.IDownloadsRepo>(),
        ));
    return this;
  }
}
