import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final int starCount;
  final Color color;

  StarRating(
      {this.rating = 0.0, this.starCount = 5, this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Row(
       mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(starCount, (index) => buildStar(context, index)),

        ),
        
         Text('(${rating.toStringAsFixed(1)})'),
      ],
    );
  }

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: color,
        size: 14,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
        size: 14,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
        size: 14,
      );
    }
    return InkResponse(
      onTap: () {
        // TODO: Add your action on tap here (if any)
      },
      child: icon,
    );
  }
}
