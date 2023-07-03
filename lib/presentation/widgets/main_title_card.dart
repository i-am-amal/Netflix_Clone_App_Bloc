import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  final List<String> posterList;

  const MainTitleCard({
    required this.title,
    required this.posterList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: MainTitle(title: title),
          ),
          kHeight,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: LimitedBox(
              maxHeight: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  posterList.length,
                  (index) => MainCardWidget(imageUrl: posterList[index]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
