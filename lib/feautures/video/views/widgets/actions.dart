import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soko_beauty/config/colors/global_colors.dart';
import 'package:soko_beauty/config/styles/video_styles.dart';
import 'package:soko_beauty/feautures/video/data/models/metrics.dart';
import 'package:soko_beauty/feautures/video/data/models/type.dart';

class VideoActions extends StatelessWidget {
  final VoidCallback onFavoritePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onSharePressed;
  final VoidCallback shoppingCartPressed;
  final VoidCallback bookingIconPressed;
  final VideoType videoType;
  final VideoMetrics metrics;

  const VideoActions({
    Key? key,
    required this.onFavoritePressed,
    required this.onCommentPressed,
    required this.onSharePressed,
    required this.shoppingCartPressed,
    required this.videoType,
    required this.bookingIconPressed,
    required this.metrics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: VideoItemPosition.action.right,
      bottom: VideoItemPosition.action.bottom,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildActionButton(
            onPressed: onFavoritePressed,
            icon: CupertinoIcons.heart_fill,
            label: metrics.likes.toString(),
            heroTag: 'favorite',
          ),
          SizedBox(height: 15.0),
          _buildActionButton(
            onPressed: onCommentPressed,
            icon: CupertinoIcons.chat_bubble_text_fill,
            label: metrics.comments.toString(),
            heroTag: 'comment',
          ),
          SizedBox(height: 15.0),
          _buildActionButton(
            onPressed: onSharePressed,
            icon: CupertinoIcons.arrowshape_turn_up_right_fill,
            label: metrics.shares.toString(),
            heroTag: 'share',
          ),
          if (videoType == VideoType.Product)
            _buildActionButton(
              onPressed: shoppingCartPressed,
              icon: CupertinoIcons.cart_fill,
              label: metrics.cartAdditions.toString(),
              heroTag: 'cart',
              needsIndicator: true,
              indicatorCount: metrics.cartAdditions,
            ),
          if (videoType == VideoType.Product)
            _buildActionButton(
              onPressed: bookingIconPressed,
              icon: CupertinoIcons.calendar_today,
              label: metrics.bookings.toString(),
              heroTag: 'book',
              needsIndicator: true,
              indicatorCount: metrics.bookings,
            ),
          SizedBox(height: 15.0),
          IconButton(
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(Colors.black.withOpacity(0.15)),
              shape: WidgetStateProperty.all(CircleBorder()),
            ),
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz_rounded,
              color: Colors.white.withOpacity(0.9),
              size: 30.0,
            ),
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    required String heroTag,
    bool needsIndicator = false,
    int? indicatorCount,
  }) {
    return Column(
      children: [
        FloatingActionButton(
          backgroundColor: Colors.black.withOpacity(0.15),
          elevation: 0,
          heroTag: heroTag,
          mini: true,
          onPressed: onPressed,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                icon,
                size: 30.0,
              ),
              if (needsIndicator)
                _buildIndicator(indicatorCount: indicatorCount),
            ],
          ),
        ),
        if (label.isNotEmpty)
          Text(
            label,
            style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.9)),
          ),
      ],
    );
  }

  // build indicator widget
  Widget _buildIndicator({
    int? indicatorCount,
  }) {
    return Align(
      alignment: Alignment.topRight,
      child: CircleAvatar(
        radius: 9.0,
        backgroundColor: sbbrickRed,
        child: Center(
          child: Text(
            indicatorCount != null ? indicatorCount.toString() : '',
            style: TextStyle(fontSize: 10.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
