import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';


final dummyvideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
];



ValueNotifier<Set<int>> likedVideosIdsNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(IDownloadsRepo downloadService)
      : super(FastLaughState.initial()) {
    //
    //initialize
    //
    on<Initialize>(
      (event, emit) async {
        emit(
          const FastLaughState(
              videosList: [],
              isLoading: true,
              isError: false,
              ),
        );
        final result = await downloadService.getDownloadImages();
        final state = result.fold(
          (MainFailure l) {
            //loading to ui
            return const FastLaughState(
                videosList: [],
                isLoading: false,
                isError: true,
                );
          },
          (resp) => FastLaughState(
              videosList: resp,
              isLoading: false,
              isError: false,
              ),
        );
        //sending to ui
        emit(state);
      },
    );
    on<LikedVideo>((event, emit) {
      
      likedVideosIdsNotifier.value.add(event.id);
        
    });
    on<UnlikedVideo>((event, emit) {
      likedVideosIdsNotifier.value.remove(event.id);
    });

    //  on<UnlikedVideo>((event, emit) {
    // return
    // });
  }
}
