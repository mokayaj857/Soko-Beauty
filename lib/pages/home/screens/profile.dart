import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://placekitten.com/200/200'), // Replace with the user's actual avatar URL
            ),
            SizedBox(height: 10),
            Text(
              'John Doe', // Replace with the user's actual name
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'john.doe@example.com', // Replace with the user's actual email
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              elevation: 0,
              child: ListTile(
                title: Text('Account Settings'),
                onTap: () {
                  // Handle Account Settings tap
                },
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              elevation: 0,
              child: ListTile(
                title: Text('Privacy Policy'),
                onTap: () {
                  // Handle Privacy Policy tap
                },
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              elevation: 0,
              child: ListTile(
                title: Text('About'),
                onTap: () {
                  // Handle About tap
                },
              ),
            ),
            // Add more cards for additional settings
          ],
        ),
      ),
    );
  }
}

