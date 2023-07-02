import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

import '../../../application/search/search_bloc.dart';

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
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text(
                    'Error loading data',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text(
                    'No data found',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final movie = state.idleList[index];
                    return TopSearchItemTile(
                        title: movie.title ?? "no title",
                        imageUrl: "$imageAppendUrl${movie.posterPath}");
                  },
                  separatorBuilder: (context, index) => kHeight,
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile(
      {super.key, required this.title, required this.imageUrl});
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        kWidth,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
                color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 15),
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
