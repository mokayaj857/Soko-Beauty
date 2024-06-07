import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soko_beauty/feautures/chat/data/models/chat.dart';
import 'package:soko_beauty/feautures/chat/views/widgets/chat_card.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}

class ChatsPage extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    User? currentUser = _authService.getCurrentUser();
    String? currentUserId = currentUser?.uid;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarTheme.color,
        title: Text('Chats'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var users = snapshot.data!.docs.where((doc) {
            return doc.id != currentUserId;
          }).map((doc) {
            return Chat.fromFirestore(doc);
          }).toList();

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ChatCard(
                userName: users[index].userName,
                lastMessage: users[index].lastMessage,
                imageUrl: users[index].imageUrl,
                chatId: users[index].chatId,
              );
            },
          );
        },
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).bottomAppBarTheme.color,
      title: Text('Chats'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Handle search
          },
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            // Handle more options
          },
        ),
      ],
    ),
    body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        var users = snapshot.data!.docs.map((doc) {
          return Chat.fromFirestore(doc);
        }).toList();

        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ChatCard(
              userName: users[index].userName,
              lastMessage: users[index].lastMessage,
              imageUrl: users[index].imageUrl,
              chatId: users[index].chatId,
            );
          },
        );
      },
    ),
  );
}
