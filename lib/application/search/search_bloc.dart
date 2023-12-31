import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:netflix_clone/domain/search/model/search_resp/search_resp.dart';
import 'package:netflix_clone/domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._searchService, this._downloadsService)
      : super(SearchState.initial()) {
    /*
        idle State
         */
    on<Initialize>((event, emit) async {
      final result = await _downloadsService.getDownloadImages();
      final state = result.fold(
        (MainFailure f) {
          return const SearchState(
              searchResultList: [],
              idleList: [],
              isLoading: false,
              isError: false);
        },
        (List<Downloads> list) {
          return SearchState(
              searchResultList: [],
              idleList: list,
              isLoading: false,
              isError: false);
        },
      );
      emit(state);
    });
    on<SearchMovie>((event, emit) async {
      final result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final state = result.fold((MainFailure f) {
        return (const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true));
      }, (SearchResp r) {
        return SearchState(
            searchResultList: r.results!,
            idleList: [],
            isLoading: false,
            isError: false);
      });
      emit(state);
    });
  }
}
