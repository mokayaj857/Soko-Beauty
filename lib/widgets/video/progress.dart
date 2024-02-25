// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoProgressBar extends StatefulWidget {
//   final VideoPlayerController controller;

//   const VideoProgressBar({required this.controller});

//   @override
//   _VideoProgressBarState createState() => _VideoProgressBarState();
// }

// class _VideoProgressBarState extends State<VideoProgressBar> {
//   late double _sliderValue;

//   @override
//   void initState() {
//     super.initState();
//     _sliderValue = 0.0;

//     widget.controller.addListener(() {
//       setState(() {
//         _sliderValue = widget.controller.value.position.inSeconds.toDouble();
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 3,
//       child: Slider(
        
//         value: _sliderValue,
//         min: 0.0,
//         max: widget.controller.value.duration.inSeconds.toDouble(),
//         onChanged: (value) {
//           setState(() {
//             _sliderValue = value;
//           });
//         },
//         onChangeEnd: (value) {
//           widget.controller.seekTo(Duration(seconds: value.toInt()));
//         },
//       ),
//     );
//   }
// }
