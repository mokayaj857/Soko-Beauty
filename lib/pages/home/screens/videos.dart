import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soko_beauty/colors/colors.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final int numberOfVideos = 10;
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController controller;

  List<String> videosUrlList = [];
  int currentIndex = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchVideos();
    controller =
        VideoPlayerController.networkUrl(Uri.parse(videosUrlList[currentIndex]))
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
  }

  Future<void> fetchVideos() async {
    final response = await http.get(
      Uri.parse(
          'https://api.pexels.com/videos/search?query=fashion&per_page=${widget.numberOfVideos}'),
      headers: {
        'Authorization':
            'i85gLNwd7weAX5PaWUfFessA11GscNCMOUO0vDRl3rTKCi8OnXqkdSdF'
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);
      final List<dynamic> videos = decodedData['videos'];

      setState(() {
        videosUrlList = videos.map<String>((dynamic video) {
          // Assuming you want the first HD video link
          final List<dynamic> videoFiles = video['video_files'];
          final dynamic hdVideo = videoFiles.firstWhere(
            (file) => file['quality'] == 'hd',
            orElse: () => videoFiles
                .first, // Fallback to the first video if HD is not found
          );
          return hdVideo['link'];
        }).toList();
      });
    } else {
      throw Exception('Failed to load videos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: videosUrlList.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
                isLoading = true;
              });
              // Simulate loading for 300ms
              Future.delayed(Duration(milliseconds: 700), () {
                setState(() {
                  isLoading = false;
                });
              });
            },
            itemBuilder: (context, index) {
              return Center(
                child: controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: controller.value.aspectRatio,
                        child: VideoPlayer(controller),
                      )
                    : Container(),
              );
            },
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.2),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          sbreddishBrown, // Set your desired background color
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned.fill(
                          child: ClipOval(
                            child: Image.network(
                              'https://picsum.photos/100/100', // Set your image URL
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white, // Set your desired icon color
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                FloatingActionButton(
                  onPressed: () {
                    // Handle favorite action
                  },
                  child: Icon(Icons.favorite_border_outlined),
                ),
                SizedBox(height: 16.0),
                FloatingActionButton(
                  onPressed: () {
                    // Handle comment action
                  },
                  child: Icon(Icons.comment),
                ),
                SizedBox(height: 16.0),
                FloatingActionButton(
                  onPressed: () {
                    // Handle share action
                  },
                  child: Icon(Icons.share_rounded),
                ),
                SizedBox(height: 16.0),
                FloatingActionButton(
                  onPressed: () {
                    // Handle swipe forward action
                    if (currentIndex < videosUrlList.length - 1) {
                      setState(() {
                        currentIndex++;
                      });
                    }
                  },
                  child: Icon(Icons.shopping_basket),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
