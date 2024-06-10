import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onExit;
  final VoidCallback onFlashToggle;
  final VoidCallback onSwitchCamera;

  const PostPageAppBar({
    Key? key,
    required this.onExit,
    required this.onFlashToggle,
    required this.onSwitchCamera,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: IconButton(
          icon: const Icon(Icons.close),
          color: Colors.white,
          iconSize: 25,
          onPressed: onExit,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.white.withOpacity(0.2),
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.flash_off),
          color: Colors.white,
          iconSize: 25,
          onPressed: onFlashToggle,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.white.withOpacity(0.2),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: IconButton(
            icon: const Icon(CupertinoIcons.camera_rotate_fill),
            color: Colors.white,
            iconSize: 25,
            onPressed: onSwitchCamera,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.white.withOpacity(0.2),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
