import 'package:flutter/material.dart';

class HashtagsWidget extends StatelessWidget {
  final List<String> hashtags;

  const HashtagsWidget({super.key, required this.hashtags});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 4),
      child: Text(
        _generateHashtags(),
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: 15,
        ),
      ),
    );
  }

  // This method is used to generate the hashtags
  String _generateHashtags() {
    String result = '';
    for (int i = 0; i < hashtags.length; i++) {
      result += '#${hashtags[i]} ';
    }
    return result;
  }
}
