import 'package:flutter/material.dart';

class HashtagsWidget extends StatelessWidget {
  final List<String> hashtags;

  const HashtagsWidget({super.key, required this.hashtags});

  @override
  Widget build(BuildContext context) {
    return Text(
      _generateHashtags(),
      style: TextStyle(
        color: Colors.white.withOpacity(0.9),
        fontSize: 13,
      ),
    );
  }

  String _generateHashtags() {
    String result = '';
    for (var tag in hashtags) {
      if (!tag.startsWith('#')) {
        result += '#';
      }
      result += '$tag ';
    }
    return result.trim();
  }
}
