import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
   final void Function(int?)? onTabTapped;

  const PostPage({Key? key, this.onTabTapped, required Null Function() onBackButtonPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back), onPressed: () {  },
            //onPressed: onTabTapped,
          ),
        title: Text('Post'),
        actions: [
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () {
              // Handle attach file action
            },
          ),
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {
              // Handle location action
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.network(
          'https://picsum.photos/900/1200', // Replace with your image URL
          fit: BoxFit.cover,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Handle action 1
            },
            child: Icon(Icons.tag_faces),
          ),
          FloatingActionButton(
            onPressed: () {
              // Handle action 2
            },
            child: Icon(Icons.text_format),
          ),
          FloatingActionButton(
            onPressed: () {
              // Handle action 3
            },
            child: Icon(Icons.format_paint),
          ),
          FloatingActionButton(
            onPressed: () {
              // Handle action 4
            },
            child: Icon(Icons.send),
          ),
          FloatingActionButton(
            onPressed: () {
              // Handle camera action
            },
            child: Icon(Icons.camera_alt, size: 36),
          ),
        ],
      ),
    );
  }
}
