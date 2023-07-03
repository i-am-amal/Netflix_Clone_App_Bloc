import 'package:flutter/material.dart';
import 'package:netflix_clone/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget(
      {super.key, required this.widget, required this.movieData})
      : super(child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;

    return Stack(
      children: [
        FastLaughVideoPlayer(
            videoUrl: dummyvideoUrls[index % dummyvideoUrls.length],
            onStateChanged: (_) {}),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 25,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      color: kWhiteColor,
                      size: 25,
                    ),
                  ),
                ),

                //right side

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundImage: posterPath == null
                          ? null
                          : NetworkImage('$imageAppendUrl$posterPath'),
                      radius: 30,
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideosIdsNotifier,
                      builder: (context, Set<int> newLikedListIds, child) {
                        final indexValue = index;
                        if (newLikedListIds.contains(indexValue)) {
                          return GestureDetector(
                            onTap: () {
                              likedVideosIdsNotifier.value.remove(index);
                              likedVideosIdsNotifier.notifyListeners();
                            },
                            // BlocProvider.of<FastLaughBloc>(context).add(UnlikedVideo(id: indexValue)),

                            child: const VideoActionsWidget(
                                icon: Icons.favorite_outline, title: 'Liked'),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            likedVideosIdsNotifier.value.add(index);
                            likedVideosIdsNotifier.notifyListeners();
                          },

                          // BlocProvider.of<FastLaughBloc>(context).add(LikedVideo(id: indexValue)),
                          child: const VideoActionsWidget(
                              icon: Icons.emoji_emotions, title: 'LOL'),
                        );
                      },
                    ),
                    const VideoActionsWidget(icon: Icons.add, title: 'My List'),
                    GestureDetector(
                        onTap: () {
                          final movieUrl =
                              VideoListItemInheritedWidget.of(context)!
                                  .movieData
                                  .posterPath;
                          if (movieUrl != null) {
                            Share.share(movieUrl);
                          }
                        },
                        child: const VideoActionsWidget(
                            icon: Icons.share, title: 'Share')),
                    const VideoActionsWidget(
                        icon: Icons.play_arrow, title: 'play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        //  horizontal: 10
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: kWhiteColor, fontSize: 14),
          )
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChanged});
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    videoPlayerController.initialize().then((value) {
      setState(() {
        videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: videoPlayerController.value.isInitialized
          ? VideoPlayer(videoPlayerController)
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }
}
