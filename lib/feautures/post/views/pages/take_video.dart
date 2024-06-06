import 'dart:ui';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soko_beauty/core/utils/screenshot_utils.dart';
import 'package:soko_beauty/feautures/post/views/services/camera_bloc.dart';
import 'package:soko_beauty/feautures/post/views/services/camera_state.dart';
import 'package:soko_beauty/feautures/post/views/widgets/camera_error.dart';
import 'package:soko_beauty/feautures/post/views/widgets/record_button.dart';

// ignore: must_be_immutable
class CameraWidget extends StatefulWidget {
  final CameraBloc cameraBloc;
  final GlobalKey screenshotKey;
  Uint8List? screenshotBytes;

  CameraWidget({
    Key? key,
    required this.cameraBloc,
    required this.screenshotKey,
    this.screenshotBytes,
  }) : super(key: key);

  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  String formatRecordDuration(int durationInSeconds) {
    if (durationInSeconds == 60) {
      return "60s";
    } else if (durationInSeconds > 60) {
      final int minutes = durationInSeconds ~/ 60;
      return "${minutes}m";
    } else {
      return "${durationInSeconds}s";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraBloc, CameraState>(
      bloc: widget.cameraBloc,
      builder: (context, state) {
        bool disableButtons =
            !(state is CameraReady && !state.isRecordingVideo);

        return Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  RepaintBoundary(
                    key: widget.screenshotKey,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      switchInCurve: Curves.linear,
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          alwaysIncludeSemantics: true,
                          child: child,
                        );
                      },
                      child: state is CameraReady
                          ? Builder(builder: (context) {
                              var controller =
                                  widget.cameraBloc.getController();
                              return Transform.scale(
                                scale: 1 /
                                    (controller!.value.aspectRatio *
                                        MediaQuery.of(context)
                                            .size
                                            .aspectRatio),
                                child: CameraPreview(controller),
                              );
                            })
                          : state is CameraInitial &&
                                  widget.screenshotBytes != null
                              ? Container(
                                  constraints: const BoxConstraints.expand(),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          MemoryImage(widget.screenshotBytes!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 15.0, sigmaY: 15.0),
                                    child: Container(),
                                  ),
                                )
                              : const SizedBox.shrink(),
                    ),
                  ),
                  if (state is CameraError)
                    CameraErrorWidget(
                      state: state,
                    ),
                  Positioned(
                    bottom: 100,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.35), width: 2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                            visible: !disableButtons,
                            child: StatefulBuilder(
                                builder: (context, localSetState) {
                              return GestureDetector(
                                onTap: () {
                                  final List<int> time = [15, 30, 60, 120, 300, 600];
                                  int currentIndex = time.indexOf(
                                      widget.cameraBloc.recordDurationLimit);
                                  localSetState(() {
                                    widget.cameraBloc.setRecordDurationLimit =
                                        time[(currentIndex + 1) % time.length];
                                  });
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Colors.white.withOpacity(0.2),
                                      radius: 25,
                                      child: FittedBox(
                                          child: Text(
                                        formatRecordDuration(widget
                                            .cameraBloc.recordDurationLimit),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )),
                                    ),
                                    SizedBox(
                                      width: 60,
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                          IgnorePointer(
                            ignoring: state is! CameraReady ||
                                state.decativateRecordButton,
                            child: Opacity(
                              opacity: state is! CameraReady ||
                                      state.decativateRecordButton
                                  ? 0.4
                                  : 1,
                              child: RecordButton(
                                  state: state, cameraBloc: widget.cameraBloc),
                            ),
                          ),
                          Visibility(
                            visible: !disableButtons,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 60,
                                ),
                                CircleAvatar(
                                  backgroundColor:
                                      Colors.white.withOpacity(0.2),
                                  radius: 25,
                                  child: IconButton(
                                    onPressed: () async {
                                      try {
                                        widget.screenshotBytes =
                                            await takeCameraScreenshot(
                                                key: widget.screenshotKey);
                                        if (context.mounted)
                                          widget.cameraBloc.add(CameraSwitch());
                                      } catch (e) {
                                        //screenshot error
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.cameraswitch,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
