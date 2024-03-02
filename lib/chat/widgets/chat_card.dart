import 'package:flutter/material.dart';
import 'package:soko_beauty/chat/chat/conversation.dart';

class ChatCard extends StatelessWidget {
  final String userName;
  final String lastMessage;
  final String imageUrl;

  ChatCard({
    required this.userName,
    required this.lastMessage,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Chat open clicked");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConversationScreen(),
          ),
        ).then((result) {
          // Handle any callbacks after returning from the ConversationScreen
          print("Returned from ConversationScreen");
        });
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onLongPress: () {
            print("Chat open clicked");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConversationScreen(),
              ),
            ).then((result) {
              // Handle any callbacks after returning from the ConversationScreen
              print("Returned from ConversationScreen");
            });
          },
          contentPadding: EdgeInsets.all(10),
          leading: CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(imageUrl),
          ),
          title: Text(
            userName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(lastMessage),
          onTap: () {
            // Add any onTap logic here if needed
          },
        ),
      ),
    );
  }
}
