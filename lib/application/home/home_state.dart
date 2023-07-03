part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateid,
    required List<HotAndNewData> pastYearMovieList,
    required List<HotAndNewData> trendingMovieslist,
    required List<HotAndNewData> tenseDramasMovieList,
    required List<HotAndNewData> southIndianMovieList,
    required List<HotAndNewData> trendingTvList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;
  factory HomeState.initial() => const HomeState(
    stateid: '0',
      pastYearMovieList: [],
      trendingMovieslist: [],
      tenseDramasMovieList: [],
      southIndianMovieList: [],
      trendingTvList: [],
      isLoading: false,
      hasError: false);
}
