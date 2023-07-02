import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "FEB",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                "11",
                style: TextStyle(
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
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(),
              kHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TALL GIRL 2",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Row(
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
              Text("Coming on Friday"),
              kHeight,
              Text(
                "Tall Girl 2",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              kHeight,
              Text(
                " Landing the lead in the school musical is a dream come true for jodi. until the pressure sends her confidence — and her relationship —into a tailspin. ",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        )
      ],
    );
  }
}
