import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix_clone/domain/hot_and_new/model/hot_and_new.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';



@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService hotAndNewService;

  HotAndNewBloc(this.hotAndNewService) : super(HotAndNewState.initial()) {
    /* 
   gethot and new movie data
   */

    on<LoadDataInComingSoon>((event, emit) async {
      /* 
      send loading to  ui
       */
      emit(const HotAndNewState(
          comigingSoonList: [],
          everyoneIsWatchingList: [],
          isLoading: true,
          isError: false));
      final result = await hotAndNewService.getHotAndNewMovieData();
      final newState = result.fold((l) {
        return const HotAndNewState(
            comigingSoonList: [],
            everyoneIsWatchingList: [],
            isError: true,
            isLoading: false);
      }, (resp) {
        return HotAndNewState(
            comigingSoonList: resp.results!,
            everyoneIsWatchingList: state.everyoneIsWatchingList,
            isError: false,
            isLoading: false);
      });
      emit(newState);
    });

    /* 
   gethot and new tv data
   */
    on<LoadDataEveryonesWatching>((event, emit) async {

          /* 
      send loading to  ui
       */
      emit(const HotAndNewState(
          comigingSoonList: [],
          everyoneIsWatchingList: [],
          isLoading: true,
          isError: false));
      final result = await hotAndNewService.getHotAndNewTvData();
      final newState = result.fold((l) {
        return const HotAndNewState(
            comigingSoonList: [],
            everyoneIsWatchingList: [],
            isError: true,
            isLoading: false);
      }, (resp) {
        return HotAndNewState(
            comigingSoonList: state.comigingSoonList,
            everyoneIsWatchingList: resp.results!,
            isError: false,
            isLoading: false);
      });
      emit(newState);
    });
  }
}
