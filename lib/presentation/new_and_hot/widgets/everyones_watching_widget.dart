import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
 const EveryonesWatchingWidget({
    super.key, required this.posterpath, required this.movieName, required this.description,
  });
  final String posterpath;
  final String movieName;
  final String description;



  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.start,

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
         movieName,
          style:const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        kHeight,
        Text(
          description,
          maxLines: 4,

          style: TextStyle(color: Colors.grey),
        ),
        kHeight50,

        VideoWidget(imageUrl: posterpath),
        kHeight,
      const  Row(
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
