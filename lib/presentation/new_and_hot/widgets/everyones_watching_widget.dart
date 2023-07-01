import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          "Friends",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        kHeight,
        Text(
          " This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of life and love in 1990s Manhattan. ",
          style: TextStyle(color: Colors.grey),
        ),
        kHeight50,
        VideoWidget(),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
                icon: Icons.share, iconsize: 25, textSize: 14, title: "Share"),
            kWidth,
            CustomButton(
                icon: Icons.add, iconsize: 25, textSize: 14, title: "My List"),
            kWidth,
            CustomButton(
                icon: Icons.play_arrow,
                iconsize: 25,
                textSize: 14,
                title: "Play"),
            kWidth
          ],
        )
      ],
    );
  }
}
