import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:soko_beauty/core/utils/screenshot_utils.dart';
import 'package:soko_beauty/feautures/post/views/services/camera_bloc.dart';
import 'package:soko_beauty/feautures/post/views/services/camera_state.dart';
import 'package:soko_beauty/feautures/post/views/widgets/animated_bar.dart';

// ignore: must_be_immutable
class RecordButton extends StatefulWidget {
  final CameraState state;
  final CameraBloc cameraBloc;
  Uint8List? screenshotBytes;
  final GlobalKey screenshotKey = GlobalKey();

  RecordButton({
    Key? key,
    required this.state,
    required this.cameraBloc,
  }) : super(key: key);

  @override
  _RecordButtonState createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  bool get isRecording =>
      widget.state is CameraReady &&
      (widget.state as CameraReady).isRecordingVideo;

  void startRecording() async {
    try {
      takeCameraScreenshot(key: widget.screenshotKey).then((value) {
        widget.screenshotBytes = value;
      });
    } catch (e) {
      rethrow;
    }
    widget.cameraBloc.add(CameraRecordingStart());
  }

  void stopRecording() async {
    widget.cameraBloc.add(CameraRecordingStop());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (isRecording) {
          stopRecording();
        } else {
          startRecording();
        }
      },
      onLongPress: () {
        startRecording();
      },
      onLongPressEnd: (_) {
        stopRecording();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: isRecording ? 60 : 60,
        width: isRecording ? 60 : 60,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isRecording ? Colors.transparent : Colors.white,
              ),
            ),
            ValueListenableBuilder<int>(
              valueListenable: widget.cameraBloc.recordingDuration,
              builder: (context, val, child) {
                return TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: isRecording ? 1100 : 0),
                  tween: Tween<double>(
                    begin: isRecording ? 1 : 0,
                    end: isRecording ? val.toDouble() + 1 : 0,
                  ),
                  curve: Curves.linear,
                  builder: (context, value, _) {
                    return Center(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: isRecording ? 90 : 30,
                        width: isRecording ? 90 : 30,
                        child: RecordingProgressIndicator(
                          value: value,
                          maxValue:
                              widget.cameraBloc.recordDurationLimit.toDouble(),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isRecording ? Colors.transparent : Colors.black,
                ),
                padding: const EdgeInsets.all(3),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear,
                      height: isRecording ? 15 : 50,
                      width: isRecording ? 15 : 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: isRecording
                            ? BorderRadius.circular(6)
                            : BorderRadius.circular(100),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
