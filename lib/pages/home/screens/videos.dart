import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';
import 'package:soko_beauty/widgets/video/progress.dart';
import 'package:soko_beauty/widgets/video/video_btn.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  int numberOfVideos = 3;

  List<String> videosUrlList = [];
  int currentIndex = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchVideos();
    if (videosUrlList.length > 0)
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(
          videosUrlList[currentIndex],
        ),
      );
    else {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        ),
      );
    }
  }

  Future<void> fetchVideos() async {
    final response = await http.get(
      Uri.parse(
          'https://api.pexels.com/videos/search?query=fashion&per_page=${numberOfVideos}'),
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

      // Initialize the controller and store the Future for later use.
      _initializeVideoPlayerFuture = _controller.initialize();
      // Use the controller to loop the video.
      _controller.setLooping(true);
    } else {
      throw Exception('Failed to load videos');
    }
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.loose, children: [
        PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: videosUrlList.length,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
              isLoading = true;
            });
          },
          itemBuilder: (BuildContext context, int index) {
            return FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: _controller.value.isInitialized == true
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
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
        _controller.value.isInitialized
            ? Positioned(
              width: 454,
              
                bottom: 0,
                left: 0,
                child: VideoProgressBar(controller: _controller))
            : Text(''),
        VideoActionButtons(
          onAddPressed: () {
            // Handle add action
          },
          onFavoritePressed: () {
            // Handle favorite action
          },
          onCommentPressed: () {
            // Handle comment action
          },
          onPlayPausePressed: () {
            // Handle play/pause action
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
          isPlaying: _controller.value.isPlaying,
        ),
        SafeArea(
            child: Positioned(
                top: 0,
                child: AppBar(
                  foregroundColor: Colors.white,
                  leading: Icon(Icons.search),
                  title: Text(
                    "Suggested | Following",
                    style: TextStyle(color: Colors.white),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.more_vert),
                    )
                  ],
                ))),
        Positioned(
            top: 100,
            left: 25,
            right: 25,
            child: SafeArea(
              child: Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Here is a simple Caption for this video',
                    style: TextStyle(
                      fontSize: 40, // Adjust the font size as needed
                      color: Colors.white, // Set the text color to white
                    ),
                  ),
                ),
              ),
            )),
        Positioned(
          bottom: 35,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "@Sokobeauty",
                style: TextStyle(
                  fontSize: 20, // Adjust the font size as needed
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set the text color to white
                ),
                overflow: TextOverflow
                    .ellipsis, // Add ellipses when the text overflows
              ),
              SizedBox(height: 5),
              Container(
                width: MediaQuery.of(context).size.width *
                    0.6, // Set width to 50% of the screen width
                child: Text(
                  "Darling style | A more detailed info about this video",
                  style: TextStyle(
                    fontSize: 16, // Adjust the font size as needed
                    color: Colors.white, // Set the text color to white
                  ),
                  overflow: TextOverflow
                      .ellipsis, // Add ellipses when the text overflows
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    minRadius: 15,
                    backgroundColor: Colors.grey.shade50.withOpacity(0.5),
                    child: Icon(
                      Icons.audio_file_outlined, // Using an outlined audio icon
                      color: sbbrickRed, // Set the icon color to white
                    ),
                  ),
                  SizedBox(width: 8), // Add some space between icon and text
                  Text(
                    "Beauty by Godfrey Williams",
                    style: TextStyle(
                      fontSize: 13, // Adjust the font size as needed
                      color: Colors.white, // Set the text color to white
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          bottom: 4,
          left: 4,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TagWidget(text: '#Hair'),
                SizedBox(width: 8.0),
                TagWidget(text: '#Salon'),
                SizedBox(width: 8.0),
                TagWidget(text: '#Darling'),
                TagWidget(text: '#Beauty'),
                SizedBox(width: 8.0),
                TagWidget(text: '#Manicure'),
                SizedBox(width: 8.0),
                TagWidget(text: '#Pedicure'),
                SizedBox(width: 8.0),
                TagWidget(text: '#Latest'),
              ],
            ),
          ),
        )
      ]),
      floatingActionButton: SafeArea(
        child: Center(
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {
              // Wrap the play or pause in a call to `setState`. This ensures the
              // correct icon is shown.
              setState(() {
                // If the video is playing, pause it.
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  // If the video is paused, play it.
                  _controller.play();
                }
              });
            },
            // Display the correct icon depending on the state of the player.
            child: Icon(
              size: 40,
              _controller.value.isPlaying
                  ? Icons.pause_outlined
                  : Icons.play_arrow_outlined,
            ),
          ),
        ),
      ),
    );
  }
}

class TagWidget extends StatelessWidget {
  final String text;

  const TagWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
            color: Color.fromARGB(255, 255, 230, 230),
            // fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }
}
