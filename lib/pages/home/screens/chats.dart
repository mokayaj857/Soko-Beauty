import 'package:flutter/material.dart';
import 'package:soko_beauty/widgets/chat/chat_card.dart';

class ChatsPage extends StatelessWidget {
  final List<Chat> chats = [
    Chat(
      userName: 'Alice',
      lastMessage: 'Hi there!',
      imageUrl: 'https://picsum.photos/200/300/?random=girl',
    ),
    Chat(
      userName: 'Bob',
      lastMessage: 'Hey, how are you?',
      imageUrl: 'https://picsum.photos/200/300/?random=gentleman',
    ),
    Chat(
      userName: 'Charlie',
      lastMessage: 'What\'s up?',
      imageUrl: 'https://picsum.photos/200/300/?random=lady',
    ),
    Chat(
      userName: 'David',
      lastMessage: 'Having a great day!',
      imageUrl: 'https://picsum.photos/200/300/?random=man',
    ),
    Chat(
      userName: 'Eva',
      lastMessage: 'Hello!',
      imageUrl: 'https://picsum.photos/200/300/?random=child',
    ),
    Chat(
      userName: 'Frank',
      lastMessage: 'Nice weather today.',
      imageUrl: 'https://picsum.photos/200/300/?random=boy',
    ),
    Chat(
      userName: 'Grace',
      lastMessage: 'How are you doing?',
      imageUrl: 'https://picsum.photos/200/300/?random=woman',
    ),
    Chat(
      userName: 'Henry',
      lastMessage: 'Good morning!',
      imageUrl: 'https://picsum.photos/200/300',
    ),
    Chat(
      userName: 'Ivy',
      lastMessage: 'Let\'s catch up soon.',
      imageUrl: 'https://picsum.photos/200/300',
    ),
    Chat(
      userName: 'Jack',
      lastMessage: 'Hey, long time no see!',
      imageUrl: 'https://picsum.photos/200/300',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarTheme.color,
        title: Row(
          children: [
            CircleAvatar(
              maxRadius: 13,
              minRadius: 13,
              backgroundImage: NetworkImage(
                'https://picsum.photos/200/300',
              ),
            ),
            SizedBox(width: 10),
            Text('Inbox'),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return Hero(
            tag: chats[index].userName,
            transitionOnUserGestures: true,
            child: ChatCard(
              userName: chats[index].userName,
              lastMessage: chats[index].lastMessage,
              imageUrl: chats[index].imageUrl,
            ),
          );
        },
      ),
    );
  }
}

class Chat {
  final String userName;
  final String lastMessage;
  final String imageUrl;

  Chat({
    required this.userName,
    required this.lastMessage,
    required this.imageUrl,
  });
}
