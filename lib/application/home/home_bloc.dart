import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix_clone/domain/hot_and_new/model/hot_and_new.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';


@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService homeService;
  HomeBloc(this.homeService) : super(HomeState.initial()) {
    on<GetHomeScreenData>((event, emit) async {
      // send loading to ui
      emit(state.copyWith(isLoading: true, hasError: false));

      //get data
      final movieResult = await homeService.getHotAndNewMovieData();
      final tvResult = await homeService.getHotAndNewTvData();

      //transfform data
      final state1 = movieResult.fold(
        (MainFailure l) {
          return  HomeState(
    stateid: DateTime.now().millisecondsSinceEpoch.toString(),

              pastYearMovieList: [],
              trendingMovieslist: [],
              tenseDramasMovieList: [],
              southIndianMovieList: [],
              trendingTvList: [],
              isLoading: false,
              hasError: true);
        },
        (HotAndNewResp resp) {
          final pastYear = resp.results;
          final trendingMovie = resp.results;
          final dramas = resp.results;
          final southIndian = resp.results;

          pastYear!.shuffle();
          trendingMovie!.shuffle();
          dramas!.shuffle();
          southIndian!.shuffle();
          return HomeState(
    stateid: DateTime.now().millisecondsSinceEpoch.toString(),

              pastYearMovieList: pastYear,
              trendingMovieslist: trendingMovie,
              tenseDramasMovieList: dramas,
              southIndianMovieList: southIndian,
              trendingTvList: state.trendingTvList,
              isLoading: false,
              hasError: false);
        },
      );
      emit(state1);

      final state2 = tvResult.fold(
        (MainFailure l) {
          return  HomeState(
    stateid: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: [],
              trendingMovieslist: [],
              tenseDramasMovieList: [],
              southIndianMovieList: [],
              trendingTvList: [],
              isLoading: false,
              hasError: true);
        },
        (HotAndNewResp resp) {
          final top10 = resp.results;

          return HomeState(
    stateid: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: state.pastYearMovieList,
              trendingMovieslist: state.trendingMovieslist,
              tenseDramasMovieList: state.tenseDramasMovieList,
              southIndianMovieList: state.southIndianMovieList,
              trendingTvList: top10!,
              isLoading: false,
              hasError: false);
        },
      );
      //send to ui
      emit(state2);
    });
  }
}
