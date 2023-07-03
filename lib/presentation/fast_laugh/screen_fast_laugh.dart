import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/fast_laugh/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {

   WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });




    return Scaffold(
      body: SafeArea(


child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else
            if (state.isError) {
              return const Center(
                  child: Text(
                "Error while loading videos",
                style: TextStyle(color: kWhiteColor),
              ));
            } else {
              if (state.videosList.isEmpty) {
                return const Center(
                    child: Text(
                  "Videos list empty",
                  style: TextStyle(color: kWhiteColor),
                ));
              }


         return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(state.videosList.length, (index) {
                  return VideoListItemInheritedWidget(
                    key: Key(index.toString()),
                      widget:
                       VideoListItem(index: index),
                      movieData: state.videosList[index]);
                }),
              );
            }
          },
        ),
      ),
    );
  }
}
