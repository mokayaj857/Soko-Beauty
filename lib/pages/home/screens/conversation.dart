import 'package:flutter/material.dart';

class ConversationScreen extends StatelessWidget {
  final List<Message> messages = [
    Message(sender: 'Alice', text: 'Hi there!'),
    Message(sender: 'Bob', text: 'Hey, how are you?'),
    Message(sender: 'Alice', text: 'I\'m doing well, thanks!'),
    Message(sender: 'Bob', text: 'That\'s great!'),
    Message(sender: 'Alice', text: 'How was your day?'),
    Message(sender: 'Bob', text: 'It was good. How about yours?'),
    Message(sender: 'Alice', text: 'Pretty busy, but good!'),
    Message(sender: 'Bob', text: 'Glad to hear that.'),
    Message(sender: 'Alice', text: 'We should catch up soon.'),
    Message(sender: 'Bob', text: 'Definitely! Let\'s plan something.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarTheme.color,
        title: Text('Bob'),
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
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                  sender: messages[index].sender,
                  text: messages[index].text,
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
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
                  ),
                  icon: Icon(Icons.attach_file),
                  onPressed: () {
                    // Handle sending messages
                  },
                ),
                // IconButton(
                //   style: ButtonStyle(
                //     padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
                //   ),
                //   icon: Icon(Icons.camera_alt),
                //   onPressed: () {
                //     // Handle sending messages
                //   },
                // ),
                Expanded(
                  child: Stack(
                    children: [
                      TextField(
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
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(0.0)),
                          ),
                          icon: Icon(Icons.emoji_emotions),
                          onPressed: () {
                            // Handle sending messages
                          },
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            // Handle sending messages
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;

  Message({required this.sender, required this.text});
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
        alignment:
            sender == 'Alice' ? Alignment.centerLeft : Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: sender == 'Alice'
                ? Theme.of(context).cardColor
                : Theme.of(context).bottomAppBarTheme.color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
