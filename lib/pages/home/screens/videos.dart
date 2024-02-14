import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soko_beauty/colors/colors.dart';

class VideoPage extends StatefulWidget {
  final int numberOfImages = 20;

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  List<String> imageUrls = [];
  int currentIndex = 10;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  Future<void> fetchImages() async {
    final response = await http.get(
      Uri.parse(
          'https://picsum.photos/v2/list?page=1&limit=${widget.numberOfImages}&category=fashion'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        imageUrls = data
            .map<String>((dynamic item) =>
                'https://picsum.photos/id/${item['id']}/800/600?random=beauty')
            .toList();
      });
    } else {
      throw Exception('Failed to load images');
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
            itemCount: imageUrls.length,
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
              return Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
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
                    if (currentIndex < imageUrls.length - 1) {
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
