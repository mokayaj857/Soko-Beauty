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
      bottom: 5.0,
      right: 5.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            mini: true,
            onPressed: onAddPressed,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: sbbrickRed.withOpacity(0.4),
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
          SizedBox(height: 10.0),
          _buildActionButton(
            onPressed: onFavoritePressed,
            icon: Icons.favorite_border_outlined,
            label: '2.5k',
          ),
          SizedBox(height: 10.0),
          _buildActionButton(
            onPressed: onCommentPressed,
            icon: Icons.comment_rounded,
            label: '300',
          ),
          SizedBox(height: 10.0),
          _buildActionButton(
            onPressed: onSharePressed,
            icon: Icons.share,
            label: '10',
          ),
          SizedBox(height: 10.0),
          FloatingActionButton(
            mini: true,
            onPressed: shoppingCartPressed,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.shopping_cart,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                      radius: 7.0,
                      backgroundColor: sbbrickRed,
                      child: Text(
                        '2',
                        style: TextStyle(fontSize: 10.0, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          //Center(child: Text("Cart")),
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
          mini: true,
          onPressed: onPressed,
          child: Icon(
            icon,
          ),
        ),
        if (label.isNotEmpty) ...[
          SizedBox(height: 5.0),
          Text(
            label,
            style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
          ),
        ],
      ],
    );
  }
}
