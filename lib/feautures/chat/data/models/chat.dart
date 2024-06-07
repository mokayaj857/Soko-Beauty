import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String chatId;
  final String userName;
  final String lastMessage;
  final String imageUrl;

  Chat({
    required this.chatId,
    required this.userName,
    required this.lastMessage,
    required this.imageUrl,
  });

  factory Chat.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return Chat(
      chatId: doc.id,
      userName: data['username'],
      lastMessage: data['lastMessage'] ?? 'This is the last message in the chat.',
      imageUrl: data['imageUrl'] ?? 'https://via.placeholder.com/150',
    );
  }
}
