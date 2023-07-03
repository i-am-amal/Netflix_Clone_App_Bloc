part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required List<HotAndNewData> comigingSoonList,
    required List<HotAndNewData> everyoneIsWatchingList,
    required bool isLoading,
    required bool isError
  }) = _Initial;

  factory HotAndNewState.initial() =>const HotAndNewState(
      comigingSoonList: []
      , everyoneIsWatchingList: [], isLoading: false,isError: false);
} 