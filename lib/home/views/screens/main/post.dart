import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:soko_beauty/feautures/post/views/pages/media_picker.dart';
import 'package:soko_beauty/feautures/post/views/services/camera_bloc.dart';
import 'package:soko_beauty/feautures/post/views/services/camera_state.dart';
import 'package:soko_beauty/feautures/post/views/pages/take_video.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PostPage extends StatefulWidget {
  final VoidCallback onExit;

  const PostPage({
    Key? key,
    required this.onExit,
  }) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> with WidgetsBindingObserver {
  late CameraBloc cameraBloc;
  final GlobalKey screenshotKey = GlobalKey();
  Uint8List? screenshotBytes;
  bool isThisPageVisibe = true;

  @override
  void initState() {
    cameraBloc = BlocProvider.of<CameraBloc>(context);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    // Clean up resources and reset the CameraBloc on page dispose
    cameraBloc.add(CameraReset());
    cameraBloc.close();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    if (cameraBloc.getController() == null) return;

    // Handle app lifecycle state changes (e.g., background, foreground)
    if (state == AppLifecycleState.inactive) {
      // Disable the camera when the app is inactive
      cameraBloc.add(CameraDisable());
    }
    if (state == AppLifecycleState.resumed) {
      if (isThisPageVisibe) {
        // Enable the camera when the app is resumed and this page is visible
        cameraBloc.add(CameraEnable());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: IconButton.filled(
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(Colors.white.withOpacity(0.2)),
              ),
              icon: const Icon(Icons.close),
              color: Colors.white,
              iconSize: 30,
              onPressed: widget.onExit,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton.filled(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(Colors.white.withOpacity(0.2)),
                ),
                icon: Icon(
                  CupertinoIcons.settings_solid,
                ),
                color: Colors.white,
                iconSize: 30,
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: VisibilityDetector(
          key: const Key("camera"),
          onVisibilityChanged: _handleVisibilityChanged,
          child: BlocConsumer<CameraBloc, CameraState>(
            listener: _cameraBlocListener,
            builder: buildCameraWidget,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          height: 70,
          padding: EdgeInsets.zero,
          elevation: 0,
          child: Container(
            height: double.infinity,
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
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
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image:
                                NetworkImage('https://picsum.photos/200/300'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.8),
                            width: 1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'filters',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                buildOutlinedButton(
                  label: 'AI',
                  icon: Icons.memory,
                  onPressed: () {
                    // TODO: Implement AI button functionality
                  },
                ),
                buildOutlinedButton(
                  label: 'Video',
                  icon: Icons.videocam,
                  onPressed: () {
                    // TODO: Implement Video button functionality
                  },
                ),
                buildOutlinedButton(
                  label: 'Photo',
                  icon: Icons.photo_camera,
                  onPressed: () {
                    // TODO: Implement Photo button functionality
                  },
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomSheetExample()));
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image:
                                  NetworkImage('https://picsum.photos/200/200'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.8),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'upload',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _cameraBlocListener(BuildContext context, CameraState state) {
    if (state is CameraRecordingSuccess) {
      // Navigate to the VideoPage when video recording is successful
      //?TODO do something with the video
    } else if (state is CameraReady && state.hasRecordingError) {
      // Show a snackbar when there is a recording error (less than 2 seconds)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.black45,
          duration: Duration(milliseconds: 1000),
          content: Text(
            'Please record for at least 2 seconds.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  void _handleVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 0.0) {
      // Camera page is not visible, disable the camera.
      if (mounted) {
        cameraBloc.add(CameraDisable());
        isThisPageVisibe = false;
      }
    } else {
      // Camera page is visible, enable the camera.
      isThisPageVisibe = true;
      cameraBloc.add(CameraEnable());
    }
  }

  Widget buildCameraWidget(BuildContext context, CameraState state) {
    return CameraWidget(
      cameraBloc: cameraBloc,
      screenshotKey: screenshotKey,
      screenshotBytes: screenshotBytes,
    );
  }

  Widget buildOutlinedButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: Colors.white.withOpacity(0.8)),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        side: BorderSide(color: Colors.white.withOpacity(0.8), width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
