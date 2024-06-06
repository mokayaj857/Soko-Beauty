import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soko_beauty/config/colors/colors.dart';

class VideoActionButtons extends StatelessWidget {
  final VoidCallback onAddPressed;
  final VoidCallback onFavoritePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onSharePressed;
  final VoidCallback shoppingCartPressed;
  final VoidCallback bookingIconPressed;
  final String currentTab;

  const VideoActionButtons(
      {Key? key,
      required this.onAddPressed,
      required this.onFavoritePressed,
      required this.onCommentPressed,
      required this.onSharePressed,
      required this.shoppingCartPressed,
      required this.currentTab,
      required this.bookingIconPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5.0,
      right: 15.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildActionButton(
            onPressed: onFavoritePressed,
            icon: CupertinoIcons.heart_fill,
            label: '2.5k',
            heroTag: 'favorite',
          ),
          SizedBox(height: 15.0),
          _buildActionButton(
            onPressed: onCommentPressed,
            icon: CupertinoIcons.chat_bubble_text_fill,
            label: '1.2k',
            heroTag: 'comment',
          ),
          SizedBox(height: 15.0),
          _buildActionButton(
            onPressed: onSharePressed,
            icon: CupertinoIcons.arrowshape_turn_up_right_fill,
            label: '20k',
            heroTag: 'share',
          ),
          if (currentTab == "products") SizedBox(height: 15.0),
          if (currentTab == "products")
            Column(
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.black.withOpacity(0.15),
                  elevation: 0,
                  heroTag: 'cart',
                  mini: true,
                  onPressed: shoppingCartPressed,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.cart_fill,
                        size: 30.0,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                            radius: 9.0,
                            backgroundColor: sbbrickRed,
                            child: Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.white),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Text("Cart",
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9),
                    )),
              ],
            ),
          if (currentTab == "services") SizedBox(height: 15.0),
          if (currentTab == "services")
            Column(
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.black.withOpacity(0.15),
                  elevation: 0,
                  heroTag: 'book',
                  mini: true,
                  onPressed: bookingIconPressed,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.calendar_today,
                        size: 30.0,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                            radius: 9.0,
                            backgroundColor: sbbrickRed,
                            child: Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.white),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Text("Book",
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9),
                    )),
              ],
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
  }) {
    return Column(
      children: [
        FloatingActionButton(
          backgroundColor: Colors.black.withOpacity(0.15),
          elevation: 0,
          enableFeedback: false,
          hoverElevation: 0.0,
          heroTag: heroTag,
          mini: true,
          onPressed: onPressed,
          child: Icon(
            icon,
            size: 30.0,
          ),
        ),
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.9)),
          ),
        ],
      ],
    );
  }
}
