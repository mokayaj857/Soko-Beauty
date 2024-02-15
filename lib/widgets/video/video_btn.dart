import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';

class VideoActionButtons extends StatelessWidget {
  final VoidCallback onAddPressed;
  final VoidCallback onFavoritePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onSharePressed;
  final VoidCallback shoppingCartPressed;

  const VideoActionButtons({
    Key? key,
    required this.onAddPressed,
    required this.onFavoritePressed,
    required this.onCommentPressed,
    required this.onSharePressed,
    required this.shoppingCartPressed,
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
          _buildActionButton(
            onPressed: onFavoritePressed,
            icon: Icons.favorite_border_outlined,
            label: '2.5k',
          ),
          _buildActionButton(
            onPressed: onCommentPressed,
            icon: Icons.comment_rounded,
            label: '300',
          ),
          _buildActionButton(
            onPressed: onSharePressed,
            icon: Icons.share,
            label: '10',
          ),
          _buildActionButton(
            onPressed: shoppingCartPressed,
            icon: Icons.shopping_cart,
            label: 'Buy Now',
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
  }) {
    return Column(
      children: [
        FloatingActionButton(
          onPressed: onPressed,
          child: Icon(icon),
        ),
        if (label.isNotEmpty) ...[
          SizedBox(height: 5.0),
          Text(
            label,
            style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
          ),
        ],
        SizedBox(height: 20.0),
      ],
    );
  }
}
