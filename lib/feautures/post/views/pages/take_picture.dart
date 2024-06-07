import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePicture extends StatefulWidget {
  const TakePicture({
    super.key,
    required this.camera,
    required this.onPictureTaken,
  });

  final CameraDescription camera;
  final Function(XFile) onPictureTaken;

  @override
  TakePictureState createState() => TakePictureState();
}

class TakePictureState extends State<TakePicture> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Create a CameraController to display the current output from the Camera.
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    // Initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      // Ensure that the camera is initialized.
      await _initializeControllerFuture;

      // Attempt to take a picture and get the file where it was saved.
      final image = await _controller.takePicture();

      if (!mounted) return;

      // Call the callback with the captured image file.
      widget.onPictureTaken(image);
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap:
                        _takePicture, // Use the callback for taking a picture.
                    child: CameraPreview(_controller),
                  ),
                ),
              ],
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
