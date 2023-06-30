import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 150,
      height: 250,
      // color: Colors.white,
      decoration: BoxDecoration(
        borderRadius: kRadius20,
        image: const DecorationImage(
          image: NetworkImage(
              "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg"),
        ),
      ),
    );
  }
}
