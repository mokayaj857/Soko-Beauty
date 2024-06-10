import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String userId;
  //final String Id;
  final String username;
  final String lastMessage;
  final String imageUrl;
  //final List<String> participants;

  Chat({
    required this.userId,
    required this.username,
    required this.lastMessage,
    required this.imageUrl,
  });

  factory Chat.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return Chat(
      userId: doc.id,
      username: data['username'],
      lastMessage: data['lastMessage'] ?? 'This is the last message',
      imageUrl: data['profilePhotoUrl'] ??
          'https://icons.iconarchive.com/icons/graphicloads/flat-finance/128/person-icon.png/150',
    );
  }

  get profilePhotoUrl => null;

  
}