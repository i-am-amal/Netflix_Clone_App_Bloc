import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({required this.imageUrl,
    super.key,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 150,
      height: 250,
      // color: Colors.white,
      decoration: BoxDecoration(
        borderRadius: kRadius20,
        image:  DecorationImage(
          image: NetworkImage(imageUrl
              ),
        ),
      ),
    );
  }
}
