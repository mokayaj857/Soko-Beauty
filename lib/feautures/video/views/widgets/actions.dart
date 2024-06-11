import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soko_beauty/config/styles/video_styles.dart';
import 'package:soko_beauty/feautures/auth/data/models/reactions_model.dart';
import 'package:soko_beauty/feautures/video/data/models/metrics.dart';
import 'package:soko_beauty/feautures/video/data/models/type.dart';

class VideoActions extends StatefulWidget {
  final VoidCallback onFavoritePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onSharePressed;
  final VoidCallback shoppingCartPressed;
  final VoidCallback bookingIconPressed;
  final VoidCallback onMorePressed;
  final VideoType videoType;
  final VideoMetrics metrics;
  final Reactions? reactions;

  const VideoActions({
    Key? key,
    required this.onFavoritePressed,
    required this.onCommentPressed,
    required this.onSharePressed,
    required this.shoppingCartPressed,
    required this.videoType,
    required this.bookingIconPressed,
    required this.metrics,
    required this.onMorePressed,
    required this.reactions,
  }) : super(key: key);

  @override
  _VideoActionsState createState() => _VideoActionsState();
}

class _VideoActionsState extends State<VideoActions> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: VideoItemPosition.action.right,
      bottom: VideoItemPosition.action.bottom,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildActionButton(
            onPressed: () {
              widget.onFavoritePressed();
            },
            icon: widget.reactions?.isLiked == true
                ? CupertinoIcons.heart_fill
                : CupertinoIcons.heart_fill,
            label: widget.metrics.likes.toString(),
            heroTag: 'favorite',
          ),
          _buildActionButton(
            onPressed: widget.onCommentPressed,
            icon: CupertinoIcons.chat_bubble_text_fill,
            label: widget.metrics.comments.toString(),
            heroTag: 'comment',
          ),
          _buildActionButton(
            onPressed: widget.onSharePressed,
            icon: CupertinoIcons.arrowshape_turn_up_right_fill,
            label: widget.metrics.shares.toString(),
            heroTag: 'share',
          ),
          if (widget.videoType == VideoType.Product)
            _buildActionButton(
              onPressed: widget.shoppingCartPressed,
              icon: CupertinoIcons.cart_fill,
              label: widget.metrics.cartAdditions.toString(),
              heroTag: 'cart',
            ),
          if (widget.videoType == VideoType.Service)
            _buildActionButton(
              onPressed: widget.bookingIconPressed,
              icon: Icons.calendar_month_rounded, // Use your booking icon
              label: widget.metrics.bookings.toString(),
              heroTag: 'book',
            ),
          _buildActionButton(
            onPressed: widget.onMorePressed,
            icon: Icons.more_horiz_rounded,
            label: '',
            heroTag: 'more',
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    required String heroTag,
  }) {
    return Column(
      children: [
        FloatingActionButton(
          backgroundColor: Colors.black.withOpacity(0.02),
          elevation: 0,
          heroTag: heroTag,
          mini: true,
          onPressed: () {
            _animatedOnPressed(onPressed);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                icon,
                size: 34.0,
                color: icon == CupertinoIcons.heart_fill &&
                        widget.reactions?.isLiked == true
                    ? Colors.red 
                    : null,
              ),
              if (widget.reactions?.isBooked == true ||
                  widget.reactions?.isAddedToCart == true)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 16,
                  ),
                ),
            ],
          ),
        ),
        if (label.isNotEmpty)
          Text(
            label,
            style: TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        SizedBox(height: 8.0),
      ],
    );
  }

  void _animatedOnPressed(VoidCallback onPressed) {
    onPressed();
  }
}
