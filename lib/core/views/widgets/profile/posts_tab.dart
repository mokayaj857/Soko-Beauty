import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:cloudinary_flutter/video/cld_video_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soko_beauty/config/colors/global_colors.dart';
import 'package:soko_beauty/core/constants/cloudinary_constants.dart';
import 'package:soko_beauty/core/views/widgets/custom_empty_state_msg.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/views/services/video_provider.dart';
import 'package:soko_beauty/home/post.dart';
import 'package:video_player/video_player.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';

class PostsTab extends StatelessWidget {
  const PostsTab();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: FirebaseAuth.instance.authStateChanges().first,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final userId = snapshot.data!.uid;
        final videoProvider =
            Provider.of<VideoProvider>(context, listen: false);

        return FutureBuilder(
          future: videoProvider.searchVideos(ownerId: userId),
          builder: (context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            final videos = videoProvider.videos;

            if (videos.isEmpty) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    EmptyStateMessage(
                      message: 'You have no posts yet.',
                      onPressed: () {
                        showModalBottomSheet(
                          elevation: 1,
                          barrierColor: Colors.black.withOpacity(0.26),
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return BottomSheetContent();
                          },
                        );
                      },
                      buttonText: "Create Post",
                      icon: Icons.post_add,
                    ),
                  ],
                ),
              );
            }

            return GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final video = videos[index];
                return VideoGridItem(video: video);
              },
            );
          },
        );
      },
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final String publicId;

  const VideoPlayerWidget({required this.videoUrl, required this.publicId});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  Cloudinary cloudinary = CloudinaryObject.fromCloudName(
    cloudName: cloudName,
  );

  @override
  void initState() {
    super.initState();
    _controller = CldVideoController(
      cloudinary: cloudinary,
      publicId: widget.publicId,
      // transformation: Transformation()
      // .resize(
      //   Resize.scale().width(500).height(900),
      // )
      // .delivery(Delivery.format(Format.auto))
    )..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.setVolume(0.0);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}

class VideoGridItem extends StatefulWidget {
  final Video video;

  const VideoGridItem({required this.video});

  @override
  _VideoGridItemState createState() => _VideoGridItemState();
}

class _VideoGridItemState extends State<VideoGridItem> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPlaying = !_isPlaying;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.black.withOpacity(0.2),
          image: _isPlaying
              ? null
              : DecorationImage(
                  image: NetworkImage(widget.video.url),
                  fit: BoxFit.cover,
                ),
        ),
        child: Stack(
          children: [
            if (_isPlaying)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: VideoPlayerWidget(
                  videoUrl: widget.video.url,
                  publicId: widget.video.publicId,
                ),
              ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                '${widget.video.metrics.views} views',
                style: TextStyle(
                  color: AppColors.white.withOpacity(0.9),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
