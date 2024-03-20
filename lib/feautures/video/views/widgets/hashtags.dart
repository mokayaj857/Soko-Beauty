import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/shop/views/widgets/tag.dart';


class HashtagsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 4,
      left: 4,
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TagWidget(text: '#Hair'),
              SizedBox(width: 8.0),
              TagWidget(text: '#Salon'),
              SizedBox(width: 8.0),
              TagWidget(text: '#Darling'),
              SizedBox(width: 8.0),
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
      ),
    );
  }
}
