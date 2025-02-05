import 'package:flutter/material.dart';
import 'global_styles.dart';

class VideoColors {
  static const textColor = Colors.white;
  static const backgroundColor = Colors.black;
  static const iconColor = Colors.white;
  static const soundBackgroundColor = Colors.black;
  static const soundIconColor = Colors.white;
  static const soundTitleColor = Colors.white;
  static const soundButtonColor = Colors.red;
  static const soundButtonTextColor = Colors.white;
}

class VideoTextSizes {
  static const title = 16.0;
  static const description = 14.0;
  static const ownerName = 14.0;
  static const ownerUsername = 14.0;
  static const ownerDescription = 14.0;
  static const soundTitle = 13.0;
}

class VideoFontWeights {
  static const title = FontWeight.w600;
  static const description = FontWeight.w400;
  static const ownerName = FontWeight.w400;
  static const ownerUsername = FontWeight.w400;
  static const ownerDescription = FontWeight.w400;
  static const soundTitle = FontWeight.w400;
}

class VideoItemSizes {
  static const iconSize = 24.0;
  static const actionButtonSpacing = 8.0;
  static const videoSoundHeight = 30.0;
  static const videoProgressBarHeight = 3;
  static const soundIconSize = 24.0;
  static const soundButtonSize = 24.0;
  static const soundButtonPadding = 8.0;
}

class VideoItemPosition {
  final double top;
  final double bottom;
  final double left;
  final double right;

  const VideoItemPosition({
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
  });

  static const VideoItemPosition info = VideoItemPosition(
    top: 0.0,
    bottom: AppSizes.bottomAppBarHeight,
    left: 0.0,
    right: 20.0,
  );

  static const VideoItemPosition action = VideoItemPosition(
    top: 0.0,
    bottom: AppSizes.bottomAppBarHeight +
        VideoItemSizes.videoProgressBarHeight +
        VideoItemSizes.videoSoundHeight,
    left: 0.0,
    right: 3.0,
  );

  static const VideoItemPosition sound = VideoItemPosition(
    top: 0.0,
    bottom: AppSizes.bottomAppBarHeight + VideoItemSizes.videoProgressBarHeight,
    left: 0,
    right: 0.0,
  );

  static const VideoItemPosition player = VideoItemPosition(
    top: 0.0,
    bottom: 0,
    left: 0,
    right: 0.0,
  );

  static const VideoItemPosition playerDecoration = VideoItemPosition(
    top: 0.0,
    bottom: 0.0,
    left: 0.0,
    right: 0.0,
  );

  static const VideoItemPosition playerProgress = VideoItemPosition(
    top: 0.0,
    bottom: AppSizes.bottomAppBarHeight,
    left: 0.0,
    right: 0.0,
  );
}
