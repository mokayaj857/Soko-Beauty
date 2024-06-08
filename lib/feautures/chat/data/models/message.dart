import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String senderId;
  String senderName;
  String content;
  Timestamp timestamp;
  String receiverId;

  Message({
    required this.senderId,
    required this.senderName,
    required this.content,
    required this.timestamp,
    required this.receiverId,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderName': senderName,
      'content': content,
      'timestamp': timestamp,
      'receiverId': receiverId,
    };
  }
}
