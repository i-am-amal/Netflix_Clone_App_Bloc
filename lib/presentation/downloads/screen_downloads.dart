import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(title: "Downloads"),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(5),
          itemBuilder: (ctx, index) => _widgetList[index],
          separatorBuilder: (ctx, index) => const SizedBox(
                height: 15,
              ),
          itemCount: _widgetList.length),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  final List imageList = [
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/rktDFPbfHfUbArZ6OOOKsXcv0Bm.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/pYwZdnXVnVxAr7dx4MEK7tTK9gI.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/pAe4mqaHI7wOS7vz4btYAiX4UVN.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        // kHeight,
        const Text(
          "We'll download a personalised selection of \n movies and shows for you,so there's\n always something to watch on your\n device.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        // kHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: size.width * 0.36,
              ),
              DownloadImageWidget(
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 170, bottom: 50, top: 20),
                angle: 20,
                size: Size(size.width * 0.35, size.width * 0.54),
              ),
              DownloadImageWidget(
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 170, bottom: 50, top: 20),
                angle: -20,
                size: Size(size.width * 0.35, size.width * 0.54),
              ),
              DownloadImageWidget(
                imageList: imageList[2],
                radius: 10,
                margin: const EdgeInsets.only(bottom: 5, top: 10),
                size: Size(size.width * 0.38, size.width * 0.60),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set up",
                style: TextStyle(
                    color: kButtonColorWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kButtonColorWhite,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: kButtonColorBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          height: 50,
        ),
        kWidth,
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text("Smart Downloads")
      ],
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget(
      {super.key,
      required this.imageList,
      this.angle = 0,
      this.radius = 10,
      required this.margin,
      required this.size});

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageList),
          ),
        ),
      ),
    );
  }
}
