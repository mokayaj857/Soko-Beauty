import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserDetailsWidget extends StatelessWidget {
  final String email;
  final DateTime dob;
  final String username;
  final String phone;

  final String gender;

  const UserDetailsWidget({
    required this.email,
    required this.dob,
    required this.username,
    required this.gender,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    String formattedJoinDate = DateFormat('dd MMM yyyy').format(dob);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Theme.of(context).highlightColor.withOpacity(0.3),
          width: 0.5,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
      padding: EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTileItem(
            icon: Icons.email,
            title: 'Email',
            subtitle: email,
          ),
          ListTileItem(
            icon: Icons.person,
            title: 'Username',
            subtitle: username,
          ),
          ListTileItem(
            icon: Icons.phone,
            title: 'Phone Number',
            subtitle: phone,
          ),
          ListTileItem(
            icon: Icons.calendar_today,
            title: 'Date of Birth',
            subtitle: formattedJoinDate,
          ),
          ListTileItem(
            icon: Icons.wc,
            title: 'Gender',
            subtitle: gender,
          ),
        ],
      ),
    );
  }
}

class ListTileItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const ListTileItem({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(icon),
        ),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
