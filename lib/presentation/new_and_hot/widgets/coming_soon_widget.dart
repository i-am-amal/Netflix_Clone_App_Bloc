import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterpath,
    required this.movieName,
    required this.description,
  });
  final String id;
  final String month;
  final String day;
  final String posterpath;
  final String movieName;
  final String description;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style:const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                day,
                style:const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(imageUrl: posterpath),
              kHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Row(
                    children: [
                      CustomButton(
                          icon: CupertinoIcons.bell_solid,
                          iconsize: 18,
                          textSize: 12,
                          title: "Remind Me"),
                      kWidth,
                      CustomButton(
                          icon: Icons.info_outline,
                          iconsize: 18,
                          textSize: 12,
                          title: "Info"),
                    ],
                  )
                ],
              ),
              Text(
                "Coming on $day $month",
                style: const TextStyle(color: Colors.grey),
              ),
              kHeight,
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              kHeight,
              Text(
                description,
                maxLines: 4,
                style: const TextStyle(
                  color: kWhiteColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
