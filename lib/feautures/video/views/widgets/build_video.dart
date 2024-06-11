import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_beauty/config/colors/global_colors.dart';
import 'package:soko_beauty/core/views/widgets/loading.dart';
import 'package:soko_beauty/feautures/auth/data/models/reactions_model.dart';
import 'package:soko_beauty/feautures/auth/data/models/user_model.dart';
import 'package:soko_beauty/feautures/auth/views/services/user_provider.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/views/services/reactions_provider.dart';
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
  late Future<UserModel?> _ownerFuture;
  Stream<Reactions?>? _reactionsStream;
  Reactions? _userReaction;

  @override
  void initState() {
    super.initState();
    _ownerFuture = getOwner(widget.video.ownerId);
    _fetchUserReaction();
    _subscribeToReactionsUpdates();
  }

  Future<void> _fetchUserReaction() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final reactionsProvider =
        Provider.of<ReactionsProvider>(context, listen: false);
    if (userProvider.user != null) {
      final reaction = await reactionsProvider.getCurrentUserReactionsOnVideo(
        userProvider.user!.id,
        widget.video.id,
      );
      setState(() {
        _userReaction = reaction as Reactions?;
      });
    }
  }

  void _subscribeToReactionsUpdates() {
    final reactionsProvider =
        Provider.of<ReactionsProvider>(context, listen: false);
    _reactionsStream = reactionsProvider.getCurrentUserReactionsOnVideo(
      Provider.of<UserProvider>(context, listen: false).user!.id,
      widget.video.id,
    );
    _reactionsStream!.listen((reactions) {
      setState(() {
        _userReaction = reactions;
      });
    });
  }

  Future<UserModel?> getOwner(String ownerId) async {
    return await Provider.of<UserProvider>(context, listen: false)
        .getUserFromDB(userId: ownerId);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final reactionsProvider = Provider.of<ReactionsProvider>(context);

    return FutureBuilder<UserModel?>(
      future: _ownerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget(
            color: AppColors.primary.withOpacity(0.4),
          );
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
            body: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                Player(
                  key: Key('video_${widget.video.id}'),
                  videoUrl: '${widget.video.url}',
                  publicId: '${widget.video.publicId}',
                  onEnded: (watchedTime, loops, totalWatched) async {
                    await reactionsProvider.updateWatchMetrics(
                      userProvider.user!.id,
                      widget.video.id,
                      watchedTime,
                      loops,
                    );
                    await reactionsProvider.setWatched(
                      userProvider.user!.id,
                      widget.video.id,
                    );
                  },
                  onWatched: () {},
                ),
                VideoInfo(
                  onFollow: () {},
                  username: videoOwner.username,
                  tags: widget.video.tags,
                  description: widget.video.description,
                  views: widget.video.metrics.views,
                  createdAt: widget.video.createdAt,
                ),
                VideoSound(
                  soundTitle: '${videoOwner.username} - original sound',
                  onUseSound: () {},
                ),
                VideoActions(
                  onFavoritePressed: () async {
                    await reactionsProvider.toggleLike(
                      userProvider.user!.id,
                      widget.video.id,
                    );
                  },
                  onCommentPressed: () {
                    // handle comment pressed
                  },
                  onSharePressed: () async {
                    await reactionsProvider.incrementShare(
                      userProvider.user!.id,
                      widget.video.id,
                    );
                  },
                  shoppingCartPressed: () async {
                    await reactionsProvider.toggleAddedToCart(
                      userProvider.user!.id,
                      widget.video.id,
                    );
                  },
                  bookingIconPressed: () async {
                    await reactionsProvider.toggleBooked(
                      userProvider.user!.id,
                      widget.video.id,
                    );
                  },
                  videoType: widget.video.videoType,
                  metrics: widget.video.metrics,
                  onMorePressed: () {},
                  reactions: _userReaction,
                ),
              ],
            ),
          );
        } else {
          return LoadingWidget(
            color: AppColors.primary.withOpacity(0.4),
          );
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
