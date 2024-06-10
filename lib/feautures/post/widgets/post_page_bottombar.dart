import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/post/widgets/custom_button.dart';

class PostPageBottomBar extends StatefulWidget {
  final VoidCallback onEffectsPressed;
  final VoidCallback onVideoPressed;
  final VoidCallback onPhotoPressed;
  final VoidCallback onAIPressed;

  const PostPageBottomBar({
    Key? key,
    required this.onEffectsPressed,
    required this.onVideoPressed,
    required this.onPhotoPressed,
    required this.onAIPressed,
  }) : super(key: key);

  @override
  _PostPageBottomBarState createState() => _PostPageBottomBarState();
}

class _PostPageBottomBarState extends State<PostPageBottomBar> {
  int selectedIndex = 1;

  void _onButtonPressed(int index, VoidCallback callback) {
    setState(() {
      selectedIndex = index;
    });
    callback();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      height: 70,
      padding: EdgeInsets.zero,
      elevation: 0,
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          border: Border(
            top: BorderSide(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              label: 'Effects',
              imageUrl: 'https://picsum.photos/200/300',
              onPressed: () => _onButtonPressed(0, widget.onEffectsPressed),
              isSelected: selectedIndex == 0,
            ),
            CustomButton(
              label: 'Video',
              icon: Icons.videocam,
              onPressed: () => _onButtonPressed(2, widget.onVideoPressed),
              isSelected: selectedIndex == 2,
            ),
            CustomButton(
              label: 'Photo',
              icon: Icons.photo_camera,
              onPressed: () => _onButtonPressed(3, widget.onPhotoPressed),
              isSelected: selectedIndex == 3,
            ),
            CustomButton(
              label: 'AI',
              icon: Icons.memory,
              onPressed: () => _onButtonPressed(1, widget.onAIPressed),
              isSelected: selectedIndex == 1,
            ),
          ],
        ),
      ),
    );
  }
}
