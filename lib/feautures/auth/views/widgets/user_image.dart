import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserProfileWidget extends StatelessWidget {
  final String image;
  final DateTime joinDate;

  const UserProfileWidget({
    required this.image,
    required this.joinDate,
  });

  @override
  Widget build(BuildContext context) {
    String formattedJoinDate = DateFormat('dd MMM yyyy').format(joinDate);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 4.0, // Adjust the width as needed
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).highlightColor.withOpacity(0.5),
            backgroundImage: image.isNotEmpty
                ? NetworkImage(image)
                : null, // If image URL is not resolved, set backgroundImage to null
            child: image.isEmpty
                ? Icon(
                    size: 64,
                    Icons.person,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          'Joined on ${formattedJoinDate}',
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
