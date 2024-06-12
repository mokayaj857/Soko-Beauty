import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_beauty/config/colors/global_colors.dart';
import 'package:soko_beauty/core/views/widgets/loading.dart';
import 'package:soko_beauty/feautures/auth/data/models/reaction_model.dart';
import 'package:soko_beauty/feautures/auth/data/models/user_model.dart';
import 'package:soko_beauty/feautures/auth/views/services/user_provider.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/views/services/reaction_provider.dart';
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
  Stream<Reaction?>? _reactionStream;
  Reaction? _userReaction;

  @override
  void initState() {
    super.initState();
    _ownerFuture = getOwner(widget.video.ownerId);
    _fetchUserReaction();
    _subscribeToReactionUpdates();
  }

  Future<void> _fetchUserReaction() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final reactionProvider =
        Provider.of<ReactionProvider>(context, listen: false);
    if (userProvider.user != null) {
      final reaction = await reactionProvider.getCurrentUserReactionOnVideo(
        userProvider.user!.id,
        widget.video.id,
      );
      setState(() {
        _userReaction = reaction as Reaction?;
      });
    }
  }

  void _subscribeToReactionUpdates() {
    final reactionProvider =
        Provider.of<ReactionProvider>(context, listen: false);
    _reactionStream = reactionProvider.getCurrentUserReactionOnVideo(
      Provider.of<UserProvider>(context, listen: false).user!.id,
      widget.video.id,
    );
    _reactionStream!.listen((Reaction) {
      setState(() {
        _userReaction = Reaction;
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
    final reactionProvider = Provider.of<ReactionProvider>(context);

    return FutureBuilder<UserModel?>(
      future: _ownerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget(
            color: Theme.of(context).primaryColor.withOpacity(0.4),
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
                    await reactionProvider.updateWatchMetrics(
                      userProvider.user!.id,
                      widget.video.id,
                      watchedTime,
                      loops,
                    );
                    await reactionProvider.setWatched(
                      userProvider.user!.id,
                      widget.video.id,
                    );
                  },
                  onWatched: () {},
                ),
                VideoInfo(
                  userAvatar: videoOwner.profilePhotoUrl ?? '',
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
                    await reactionProvider.toggleLike(
                      userProvider.user!.id,
                      widget.video.id,
                    );
                  },
                  onCommentPressed: () {
                    // handle comment pressed
                  },
                  onSharePressed: () async {
                    await reactionProvider.incrementShare(
                      userProvider.user!.id,
                      widget.video.id,
                    );
                  },
                  shoppingCartPressed: () async {
                    await reactionProvider.toggleAddedToCart(
                      userProvider.user!.id,
                      widget.video.id,
                    );
                  },
                  bookingIconPressed: () async {
                    await reactionProvider.toggleBooked(
                      userProvider.user!.id,
                      widget.video.id,
                    );
                  },
                  videoType: widget.video.videoType,
                  metrics: widget.video.metrics,
                  onMorePressed: () {},
                  reaction: _userReaction,
                ),
              ],
            ),
          );
        } else {
          return LoadingWidget(
            color: Theme.of(context).primaryColor.withOpacity(0.4),
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
