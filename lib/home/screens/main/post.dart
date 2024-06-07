import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soko_beauty/core/utils/screenshot_utils.dart';
import 'package:soko_beauty/feautures/post/views/pages/take_picture.dart';
import 'package:soko_beauty/feautures/post/views/pages/take_video.dart';
import 'package:soko_beauty/feautures/post/views/services/camera_bloc.dart';
import 'package:soko_beauty/feautures/post/views/services/camera_state.dart';
import 'package:soko_beauty/feautures/post/views/widgets/camera_option.dart';
import 'package:soko_beauty/feautures/post/views/widgets/display_video.dart';
import 'package:soko_beauty/feautures/post/views/widgets/post_page_appbar.dart';
import 'package:soko_beauty/feautures/post/views/widgets/post_page_bottombar.dart';
import 'package:soko_beauty/feautures/post/views/widgets/record_button.dart';

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
  bool isThisPageVisible = true;
  int currentPageIndex = 1;
  late PageController _pageController;
  CameraDescription? firstCamera;
  CameraState? _takeVideoState;
  bool canRecord = false;

  @override
  void initState() {
    cameraBloc = BlocProvider.of<CameraBloc>(context);
    WidgetsBinding.instance.addObserver(this);
    _pageController = PageController(
      initialPage: currentPageIndex,
      keepPage: true,
    );
    _initializeCamera();
    super.initState();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    setState(() {
      firstCamera = cameras.first;
    });
  }

  @override
  void dispose() {
    // Clean up resources and reset the CameraBloc on page dispose
    cameraBloc.add(CameraReset());
    cameraBloc.close();
    WidgetsBinding.instance.removeObserver(this);
    _pageController.dispose();
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
      if (isThisPageVisible) {
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
      appBar: PostPageAppBar(
        onExit: () => {widget.onExit()},
        onFlashToggle: () {},
        onSwitchCamera: _switchCamera,
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            children: [
              Container(
                  color: Colors.red,
                  child: Center(child: Text('Effects Page'))),
              BlocConsumer<CameraBloc, CameraState>(
                builder: (context, state) {
                  return TakeVideo(
                    cameraBloc: cameraBloc,
                    screenshotKey: screenshotKey,
                    onStateChanged: _handleCameraStateChange,
                  );
                },
                listener: _cameraBlocListener,
              ),
              BlocConsumer<CameraBloc, CameraState>(
                builder: (context, state) {
                  return Container();

                  // TakePicture(
                  //   cameraBloc: cameraBloc,
                  //   screenshotKey: screenshotKey,
                  //   onPictureTaken: _handlePictureTaken,
                  // );
                },
                listener: _cameraBlocListener,
              ),
              Container(
                  color: Colors.green, child: Center(child: Text('AI Page'))),
            ],
          ),
          CameraControls(
            disableButtons:
                cameraBloc.state is CameraRecordingSuccess ? true : false,
            onDurationLimitTap: () {},
            recordDurationLimit: '10',
            isCameraReady: cameraBloc.state is CameraReady ? true : false,
            deactivateRecordButton:
                cameraBloc.state is CameraRecordingSuccess ? true : false,
            recordButton: _buildRecordButton(),
            onGalleryTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: PostPageBottomBar(
        onEffectsPressed: _onEffectsPressed,
        onVideoPressed: _onVideoPressed,
        onPhotoPressed: _onPhotoPressed,
        onAIPressed: _onAIPressed,
      ),
    );
  }

  void _cameraBlocListener(BuildContext context, CameraState state) {
    if (state is CameraRecordingSuccess) {
      // Navigate to the VideoPage when video recording is successful
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => RecordedVideoPage(
            videoFile: state.file,
          ),
        ),
      );
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

  void _handleCameraStateChange(CameraState state) {
    setState(() {
      _takeVideoState = state;
    });
  }

  void _handlePictureTaken(Uint8List imageBytes) {
    setState(() {
      screenshotBytes = imageBytes;
    });
  }

  // camera switch code
  void _switchCamera() async {
    try {
      screenshotBytes = await takeCameraScreenshot(key: screenshotKey);
      if (context.mounted) cameraBloc.add(CameraSwitch());
    } catch (e) {
      //screenshot error
    }
  }

  void _onEffectsPressed() {
    _pageController.jumpToPage(0);
  }

  void _onVideoPressed() {
    _pageController.jumpToPage(1);
  }

  void _onAIPressed() {
    _pageController.jumpToPage(3);
  }

  void _onPhotoPressed() {
    _pageController.jumpToPage(2);
  }

  Widget _buildRecordButton() {
    switch (currentPageIndex) {
      case 0:
        return Container(
            color: Colors.red,
            child: Center(
                child: Text(
                    'Effects Page'))); // Replace with your record button for the Effects page
      case 1:
        return RecordButton(
          cameraBloc: cameraBloc,
          state: _takeVideoState,
        ); // Replace with your record button for the AI page
      case 2:
        return Container(
            color: Colors.yellow, child: Center(child: Text('Photo Page')));
      case 3:
        return Container(
            color: Colors.green,
            child: Center(
                child: Text(
                    'AI Page'))); // Replace with your record button for the Photo page
      default:
        return Container(
            color: Colors.red,
            child: Center(
                child: Text(
                    'Effects Page'))); // Default to an empty container if no match
    }
  }
}
