import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_beauty/core/controllers/cloudinary_controller.dart';
import 'package:soko_beauty/core/views/widgets/segmented_control.dart';
import 'package:soko_beauty/feautures/auth/views/services/user_provider.dart';
import 'package:soko_beauty/feautures/post/widgets/display_video.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/data/models/type.dart';
import 'package:soko_beauty/feautures/video/views/services/video_provider.dart';
import 'package:video_player/video_player.dart';

class UploadPage extends StatefulWidget {
  final File videoFile;

  UploadPage({required this.videoFile});

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  late VideoPlayerController _controller;
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _hashtagsController = TextEditingController();
  VideoType _selectedVideoType = VideoType.None;
  bool _uploading = false;
  int _uploadProgress = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _descriptionController.dispose();
    _hashtagsController.dispose();
    super.dispose();
  }

  void _uploadAndPost() async {
    setState(() {
      _uploading = true;
    });

    String postOwnerId = await FirebaseAuth.instance.currentUser!.uid;

    // Instantiate CloudinaryController with cloudName, apiKey, apiSecret
    CloudinaryController cloudinaryController = CloudinaryController();

    // Upload video to Cloudinary
    final uploadResult = await cloudinaryController.uploadVideo(
      widget.videoFile.path,
      // (progress) {
      //   setState(() {
      //     _uploadProgress = progress;
      //   });
      // },
    );

    if (uploadResult.isNotEmpty) {
      final videoUrl = uploadResult['url'];
      final publicId = uploadResult['public_id'];

      // CONVERT TAGS INTO A LIST
      final tags =
          _hashtagsController.text.split(' ').map((tag) => tag.trim()).toList();

      // Add video data to Firebase using Provider
      final videoProvider = Provider.of<VideoProvider>(context, listen: false);
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      final video = Video(
          url: videoUrl,
          description: _descriptionController.text,
          tags: tags,
          videoType: _selectedVideoType,
          ownerId: postOwnerId,
          createdAt: DateTime.now(),
          publicId: publicId);

      print(video.toMap()); // Convert video object to map (key-value pairs

      Video createdVideo = await videoProvider.createVideo(video);

      await userProvider.updateUser(postOwnerId, {
        //push the video id to the user's video list
        'posts': FieldValue.arrayUnion([createdVideo.id])
      });

      // Navigate to success page or perform any other action
    } else {
      // Handle upload failure
      print('Failed to upload video to Cloudinary');
    }

    setState(() {
      _uploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.0),
                        Text(
                          'Vedio Info',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Length: ${_controller.value.isInitialized ? formatDuration(_controller.value.duration) : 'Loading...'}',
                          style: TextStyle(
                            fontSize: 13.0,
                          ),
                        ),
                        Text(
                          'Size: ${formatFileSize(widget.videoFile.lengthSync())}',
                          style: TextStyle(
                            fontSize: 13.0,
                          ),
                        ),
                        Text(
                          'Resolution: ${_controller.value.isInitialized ? _controller.value.size.width.toInt().toString() + 'x' + _controller.value.size.height.toInt().toString() : 'Loading...'}',
                          style: TextStyle(
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    VideoContainer(
                      controller: _controller,
                      showPlayButton: true,
                    ),
                    SizedBox(width: 10.0),
                  ],
                ),
              ),
              TextField(
                controller: _descriptionController,
                minLines: 2,
                maxLines: 3,
                decoration: InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  alignLabelWithHint: false,
                  labelText: 'Describe this video to your audience',
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _hashtagsController,
                minLines: 2,
                maxLines: 3,
                decoration: InputDecoration(
                  alignLabelWithHint: false,
                  labelText: 'Add hashtags to your video',
                ),
              ),
              SizedBox(height: 20.0),
              SegmentedControl(
                segments: {
                  VideoType.Service.index: Text('Service'),
                  VideoType.Product.index: Text('Product'),
                  VideoType.Review.index: Text('Review'),
                  VideoType.None.index: Text('None'),
                },
                currentValue: _selectedVideoType.index,
                onChanged: (value) {
                  setState(() {
                    _selectedVideoType = VideoType.values[value];
                  });
                },
                title: 'What type of video is this?',
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          height: 80.0,
          child: Container(
            constraints: BoxConstraints(maxWidth: 400),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Cancel Upload?'),
                            content: Text('Your changes will be lost.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                child: Text('Yes, Cancel'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('CANCEL'),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: _uploading
                      ? LinearProgressIndicator(value: _uploadProgress / 100)
                      : TextButton(
                          onPressed: _uploadAndPost,
                          child: Text('UPLOAD'),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes mins $seconds secs";
  }

  String formatFileSize(int bytes) {
    if (bytes <= 0) return "0 B";
    const int k = 1024;
    const int m = k * k;
    const int g = m * k;
    const int t = g * k;
    if (bytes >= t) return "${(bytes / t).toStringAsFixed(2)} TB";
    if (bytes >= g) return "${(bytes / g).toStringAsFixed(2)} GB";
    if (bytes >= m) return "${(bytes / m).toStringAsFixed(2)} MB";
    if (bytes >= k) return "${(bytes / k).toStringAsFixed(2)} KB";
    return "$bytes B";
  }
}
