import 'dart:ui';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soko_beauty/feautures/post/views/services/camera_bloc.dart';
import 'package:soko_beauty/feautures/post/views/services/camera_state.dart';
import 'package:soko_beauty/feautures/post/views/widgets/camera_error.dart';

// ignore: must_be_immutable
class TakeVideo extends StatefulWidget {
  final CameraBloc cameraBloc;
  final GlobalKey screenshotKey;
  final ValueChanged<CameraState> onStateChanged;
  Uint8List? screenshotBytes;

  TakeVideo({
    Key? key,
    required this.cameraBloc,
    required this.screenshotKey,
    required this.onStateChanged,
    this.screenshotBytes,
  }) : super(key: key);

  @override
  _TakeVideoState createState() => _TakeVideoState();
}

class _TakeVideoState extends State<TakeVideo> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraBloc, CameraState>(
      bloc: widget.cameraBloc,
      builder: (context, state) {
        // Pass the current state back to the parent
        WidgetsBinding.instance.addPostFrameCallback((_) {
          widget.onStateChanged(state);
        });

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
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
