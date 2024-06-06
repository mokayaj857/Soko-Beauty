import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:soko_beauty/feautures/post/views/pages/media_picker.dart';
import 'package:soko_beauty/feautures/post/views/pages/take_picture.dart';
import 'package:soko_beauty/feautures/post/views/pages/take_video.dart';
import 'package:soko_beauty/feautures/post/views/services/camera_bloc.dart';
import 'package:soko_beauty/feautures/post/views/services/camera_state.dart';
import 'package:soko_beauty/feautures/post/views/widgets/custom_button.dart';
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
  bool isThisPageVisible = true;
  List<MediaFile> selectedFiles = []; // Variable to store selected files
  int currentPageIndex = 2;
  late PageController _pageController;

  CameraDescription? firstCamera;

  @override
  void initState() {
    cameraBloc = BlocProvider.of<CameraBloc>(context);
    WidgetsBinding.instance.addObserver(this);
    _pageController = PageController();
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
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: IconButton.filled(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.white.withOpacity(0.2)),
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
                    MaterialStateProperty.all(Colors.white.withOpacity(0.2)),
              ),
              icon: const Icon(CupertinoIcons.settings_solid),
              color: Colors.white,
              iconSize: 30,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Center(
              child: Text('Feature coming soon',
                  style: TextStyle(color: Colors.white))),
          Center(
              child: Text('Feature coming soon',
                  style: TextStyle(color: Colors.white))),
          CameraWidget(
            cameraBloc: cameraBloc,
            screenshotKey: screenshotKey,
            screenshotBytes: screenshotBytes,
          ),
          firstCamera != null
              ? TakePictureScreen(camera: firstCamera!)
              : Center(child: CircularProgressIndicator()),
          BottomSheetExample(
            onFilesSelected: (List<MediaFile> files) {
              setState(() {
                selectedFiles = files;
              });
            },
          ),
        ],
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
                onPressed: () {
                  _pageController.jumpToPage(0);
                },
              ),
              CustomButton(
                label: 'AI',
                icon: Icons.memory,
                onPressed: () {
                  _pageController.jumpToPage(1);
                },
              ),
              CustomButton(
                label: 'Video',
                icon: Icons.videocam,
                onPressed: () {
                  _pageController.jumpToPage(2);
                },
              ),
              CustomButton(
                label: 'Photo',
                icon: Icons.photo_camera,
                onPressed: () {
                  _pageController.jumpToPage(3);
                },
              ),
              CustomButton(
                label: 'Gallery',
                imageUrl: 'https://picsum.photos/200/200',
                onPressed: () {
                  _pageController.jumpToPage(4);
                },
              ),
            ],
          ),
        ),
      ),
    );
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
}