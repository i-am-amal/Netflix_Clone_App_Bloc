import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.imageurl});

  final int index;
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              width: 150,
              height: 250,
              // color: Colors.white,
              decoration: BoxDecoration(
                borderRadius: kRadius20,
                image: DecorationImage(
                  image: NetworkImage(
                    imageurl,
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: 5,
          child: BorderedText(
            strokeWidth: 8,
            strokeColor: Colors.white,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                  fontSize: 100,
                  color: Colors.black,
                  fontFamily: 'TimesNewRoman',
                  fontWeight: FontWeight.w800),
            ),
          ),
        )
      ],
    );
  }
}
