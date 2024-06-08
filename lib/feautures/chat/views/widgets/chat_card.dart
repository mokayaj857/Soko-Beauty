import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/chat/views/widgets/conversation.dart';

class ChatCard extends StatelessWidget {
  final String username;
  final String lastMessage;
  final String imageUrl;
  final String userId;

  ChatCard({
    required this.username,
    required this.lastMessage,
    required this.imageUrl,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ConversationScreen(receiverId: userId, receiverName: username),
          ),
        );
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
          contentPadding: EdgeInsets.all(10),
          leading: CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(imageUrl),
          ),
          title: Text(
            username,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(lastMessage),
        ),
      ),
    );
  }
}
