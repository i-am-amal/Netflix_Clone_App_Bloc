import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';

import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainTitleCard(title: "Released in the past year"),
              MainTitleCard(title: "Trending Now"),
              NumberTitleCard(),
              MainTitleCard(title: "Tense Dramas"),
              MainTitleCard(title: "South Indian Cinema"),
            ],
          ),
        ),
      ),
    );
  }
}
