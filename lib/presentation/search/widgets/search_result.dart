import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

import '../../../application/search/search_bloc.dart';

// const imageUrl =
//     "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/rktDFPbfHfUbArZ6OOOKsXcv0Bm.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kHeight,
        Expanded(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 3,
              childAspectRatio: 1 / 1.6,
              children: List.generate(20, (index) {
                final movie = state.searchResultList[index];

                return MainCard(
                  imageUrl: movie.posterImageUrl,
                );
              }),
            );
          },
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;

  const MainCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image:
            DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
