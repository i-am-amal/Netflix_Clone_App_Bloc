import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconsize;
  final double textSize;
  const CustomButton({
    this.textSize = 16,
    required this.icon,
    this.iconsize = 30,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: iconsize,
          color: kWhiteColor,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textSize),
        ),
      ],
    );
  }
}
