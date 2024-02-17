import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InteractiveViewer(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                'https://picsum.photos/900/1200', // Replace with your image URL
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Positioned row for buttons
          Align(
            //backbutton
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.white,
              ),
            ),

          ),
          Positioned(
            top: 0,
            right: 0,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.flip_camera_android),
                    onPressed: () {
                      // Placeholder for switch camera button pressed
                      print("Switch Camera button pressed");
                    },
                    color: Colors.white,
                  ),
                  IconButton(
                    icon: Icon(Icons.flash_on),
                    onPressed: () {
                      // Placeholder for flash button pressed
                      print("Flash button pressed");
                    },
                    color: Colors.white,
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      // Placeholder for settings button pressed
                      print("Settings button pressed");
                    },
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              color: Theme.of(context).canvasColor.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FloatingActionButton(
                      mini: true,
                      onPressed: () {
                        // Handle action 1
                      },
                      child: Icon(Icons.tag_faces),
                    ),
                    FloatingActionButton(
                      mini: true,
                      onPressed: () {
                        // Handle action 2
                      },
                      child: Icon(Icons.text_format),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        // Handle camera action
                      },
                      child: Icon(Icons.camera_alt, size: 36),
                    ),
                    FloatingActionButton(
                      mini: true,
                      onPressed: () {
                        // Handle action 3
                      },
                      child: Icon(Icons.format_paint),
                    ),
                    FloatingActionButton(
                      mini: true,
                      onPressed: () {
                        // Handle action 4
                      },
                      child: Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
