import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
// import 'package:flutter/services.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    //-----------status bar transparent----------
    //  return AnnotatedRegion<SystemUiOverlayStyle>(
    //   value: SystemUiOverlayStyle.light,
    //--------------------------------------------

    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });

    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }

                return true;
              },
              child: Stack(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state.hasError) {
                        return const Center(
                          child: Text(
                            "Error while getting data",
                            style: TextStyle(color: kWhiteColor),
                          ),
                        );
                      }

                      //released past year
                      final releasesPastYear = state.pastYearMovieList.map((m) {
                        return "$imageAppendUrl${m.posterPath}";
                      }).toList();

                      //trending
                      final trending = state.trendingMovieslist.map((m) {
                        return "$imageAppendUrl${m.posterPath}";
                      }).toList();
                      //tensed dramas
                      final dramas = state.tenseDramasMovieList.map((m) {
                        return "$imageAppendUrl${m.posterPath}";
                      }).toList();
                      //south indian moviess
                      final southIndian = state.southIndianMovieList.map((m) {
                        return "$imageAppendUrl${m.posterPath}";
                      }).toList();
                      //top 10 tv shows
                      final top10 = state.trendingTvList.map((m) {
                        return "$imageAppendUrl${m.posterPath}";
                      }).toList();

                      return ListView(
                        children: [
                          const BackgroundCard(),
                          MainTitleCard(
                            title: "Released in the past year",
                            posterList: releasesPastYear,
                          ),
                          kHeight,
                          MainTitleCard(
                            title: "Trending Now",
                            posterList: trending,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: MainTitle(
                                title: "Top 10 TV Shows In India Today"),
                          ),
                          kHeight,
                          NumberTitleCard(postersList: top10),
                          kHeight,
                          MainTitleCard(
                            title: "Tense Dramas",
                            posterList: dramas,
                          ),
                          kHeight,
                          MainTitleCard(
                            title: "South Indian Cinema",
                            posterList: southIndian,
                          ),
                          kHeight,
                        ],
                      );
                    },
                  ),
                  scrollNotifier.value == true
                      ? AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
                          width: double.infinity,
                          height: 90,
                          color: Colors.black.withOpacity(0.2),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Image.network(
                                        'https://pngimg.com/uploads/netflix/netflix_PNG15.png',
                                        width: 25,
                                        height: 40,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    kWidth,
                                    Container(
                                      width: 25,
                                      height: 25,
                                      color: Colors.blue,
                                    ),
                                    kWidth
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "TV Shows",
                                      style: kHomeTitleText,
                                    ),
                                    Text("Movies", style: kHomeTitleText),
                                    Text("Categories", style: kHomeTitleText)
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      : kHeight,
                ],
              ),
            );
          }),
    );
  }
}
