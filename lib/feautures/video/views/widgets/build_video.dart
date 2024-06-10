import 'package:flutter/material.dart';
import 'package:soko_beauty/core/views/widgets/loading.dart';
import 'package:soko_beauty/feautures/auth/data/models/user_model.dart';
import 'package:soko_beauty/feautures/auth/views/services/user_provider.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/views/widgets/actions.dart';
import 'package:soko_beauty/feautures/video/views/widgets/info.dart';
import 'package:soko_beauty/feautures/video/views/widgets/player.dart';
import 'package:soko_beauty/feautures/video/views/widgets/sound.dart';

class VideoWidgetBuilder extends StatefulWidget {
  final Video video;

  VideoWidgetBuilder({Key? key, required this.video}) : super(key: key);

  @override
  _VideoWidgetBuilderState createState() => _VideoWidgetBuilderState();
}

class _VideoWidgetBuilderState extends State<VideoWidgetBuilder> {
  late UserProvider userProvider;
  late Future<UserModel?> _ownerFuture;

  @override
  void initState() {
    super.initState();
    userProvider = UserProvider();
    _ownerFuture = getOwner(widget.video.ownerId);
  }

  Future<UserModel?> getOwner(String ownerId) async {
    return await userProvider.getUserFromDB(userId: ownerId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: _ownerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        } else if (snapshot.hasError) {
          return _buildErrorMessageWidget('Error loading data');
        } else if (snapshot.hasData) {
          UserModel? videoOwner = snapshot.data;
          if (videoOwner == null) {
            return _buildErrorMessageWidget('Error loading video data');
          }
          return Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.black,
            body:
                Stack(clipBehavior: Clip.none, fit: StackFit.expand, children: [
              Player(
                key: Key('video_${widget.video.id}'),
                videoUrl: '${widget.video.url}',
                publicId: '${widget.video.publicId}',
              ),
              VideoActions(
                onFavoritePressed: () {},
                onCommentPressed: () {},
                onSharePressed: () {},
                shoppingCartPressed: () {},
                bookingIconPressed: () {},
                videoType: widget.video.videoType,
                metrics: widget.video.metrics,
              ),
              VideoInfo(
                onFollow: () {},
                username: videoOwner.username,
                tags: widget.video.tags,
                description: '',
                likes: widget.video.metrics.likes,
                createdAt: widget.video.createdAt,
              ),
              VideoSound(
                SoundTitle: '',
                onUseSound: () {},
              ),
            ]),
          );
        } else {
          return LoadingWidget();
        }
      },
    );
  }

  Widget _buildErrorMessageWidget(String message) {
    return Center(
      child: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
