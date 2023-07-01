import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
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
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                print(direction);
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }

                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: const [
                      BackgroundCard(),
                      MainTitleCard(title: "Released in the past year"),
                      kHeight,
                      MainTitleCard(title: "Trending Now"),
                      kHeight,
                      NumberTitleCard(),
                      kHeight,
                      MainTitleCard(title: "Tense Dramas"),
                      kHeight,
                      MainTitleCard(title: "South Indian Cinema"),
                      kHeight,
                    ],
                  ),
                  scrollNotifier.value == true
                      ? AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
                          width: double.infinity,
                          height: 90,
                          color: Colors.black.withOpacity(0.2),
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
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
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
                                ),
                              )
                            ],
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
