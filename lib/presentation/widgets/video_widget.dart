import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 10,
          bottom: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            radius: 20,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: kWhiteColor,
                size: 20,
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(
                  Icons.wifi,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
