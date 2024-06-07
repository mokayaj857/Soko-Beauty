import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/chat/views/conversation.dart';

class ChatCard extends StatelessWidget {
  final String userName;
  final String lastMessage;
  final String imageUrl;
  final String chatId;

  ChatCard({
    required this.userName,
    required this.lastMessage,
    required this.imageUrl,
    required this.chatId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConversationScreen(chatId: chatId),
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
            userName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(lastMessage),
        ),
      ),
    );
  }
}
