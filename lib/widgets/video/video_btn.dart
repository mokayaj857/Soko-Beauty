import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';

class VideoActionButtons extends StatelessWidget {
  final VoidCallback onAddPressed;
  final VoidCallback onFavoritePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onPlayPausePressed;
  final bool isPlaying;

  const VideoActionButtons({
    Key? key,
    required this.onAddPressed,
    required this.onFavoritePressed,
    required this.onCommentPressed,
    required this.onPlayPausePressed,
    required this.isPlaying,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 25.0,
      right: 5.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: onAddPressed,
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red, // Set your desired background color
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: ClipOval(
                      child: Image.network(
                        'https://picsum.photos/100/100',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      color: sbbrickRed,
                      Icons.add_circle,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.0),
          FloatingActionButton(
            onPressed: onFavoritePressed,
            child: Icon(Icons.favorite_border_outlined),
          ),
          SizedBox(height: 30.0),
          FloatingActionButton(
            onPressed: onCommentPressed,
            child: Icon(Icons.comment_rounded),
          ),
          SizedBox(height: 30.0),
          FloatingActionButton(
            onPressed: onPlayPausePressed,
            child: Icon(
              Icons.share
            ),
          ),
           SizedBox(height: 30.0),
          FloatingActionButton(
            onPressed: onPlayPausePressed,
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}
