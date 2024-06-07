import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatelessWidget {
  final String chatId;

  ConversationScreen({required this.chatId});

  final TextEditingController _controller = TextEditingController();

  void sendMessage(String chatId, String text) {
    if (text.trim().isEmpty) return;

    FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add({
      'text': text,
      'sender': 'currentUser', // Replace with actual user ID
      'timestamp': FieldValue.serverTimestamp(),
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Theme.of(context).bottomAppBarTheme.color,
        title: Text('Chat'), // Replace with dynamic title if needed
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              // Handle video call
            },
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              // Handle call
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
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .doc(chatId)
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                var messages = snapshot.data!.docs;
                List<MessageBubble> messageBubbles = [];
                for (var message in messages) {
                  var messageText = message['text'] ?? '';
                  var messageSender = message['sender'] ?? 'Unknown';
                  var messageBubble = MessageBubble(
                    sender: messageSender,
                    text: messageText,
                  );
                  messageBubbles.add(messageBubble);
                }
                return ListView(
                  reverse: true,
                  children: messageBubbles,
                );
              },
            ),
          ),
          Container(
            color: Theme.of(context).bottomAppBarTheme.color,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () {
                    // Handle attachment
                  },
                ),
                Expanded(
                  child: Stack(
                    children: [
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).cardColor,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                          border: OutlineInputBorder(
                            gapPadding: 0,
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          hintText: 'Type a message...',
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: IconButton(
                          icon: Icon(Icons.emoji_emotions),
                          onPressed: () {
                            // Handle emoji
                          },
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            sendMessage(chatId, _controller.text);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;

  MessageBubble({required this.sender, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Align(
        alignment: sender == 'currentUser'
            ? Alignment.centerRight
            : Alignment
                .centerLeft, // Replace 'currentUser' with actual user ID check
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: sender == 'currentUser'
                ? Theme.of(context).bottomAppBarTheme.color
                : Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
