import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/nf3Vlxm3C9U1aKUUQHmKFZmxPSc.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches'),
        kHeight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => const TopSearchItemTile(),
              separatorBuilder: (ctx, index) => kHeight20,
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 80,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        const Expanded(
          child: Text(
            ' Movie Name',
            style: TextStyle(
                color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kWhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kButtonColorBlack,
            radius: 20,
            child: Center(
              child: Icon(
                CupertinoIcons.play_fill,
                color: kWhiteColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
