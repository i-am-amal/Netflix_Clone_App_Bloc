import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/rktDFPbfHfUbArZ6OOOKsXcv0Bm.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kHeight,
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.6,
            children: List.generate(20, (index) {
              return const MainCard();
            }),
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7),),
    );
  }
}
