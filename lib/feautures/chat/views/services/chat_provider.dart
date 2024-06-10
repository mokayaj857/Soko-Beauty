import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:soko_beauty/feautures/chat/data/models/message.dart';

class ChatService extends ChangeNotifier {
  // get instance of auth and firestore
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // SEND MESSAGE LOGIC
  Future<void> sendMessage(String receiverId, String content) async {
    try {
      // get the current user
      final String currentUserId = _firebaseAuth.currentUser!.uid;
      final String currentUserName = _firebaseAuth.currentUser!.displayName!;
      final Timestamp timestamp = Timestamp.now();

      // create a new message

      Message newMessage = Message(
        senderId: currentUserId,
        senderName: currentUserName,
        content: content,
        timestamp: timestamp,
        receiverId: receiverId,
      );

      // construct convoId from the two user ids
      List<String> conversationIds = [currentUserId, receiverId];
      conversationIds.sort(); // sorting ensures unique convoId
      String conversationId = conversationIds.join('_');

      // add new message to firestore

      await _fireStore
          .collection('conversations')
          .doc(conversationId)
          .collection('messages')
          .add(newMessage.toMap());
    } catch (e) {
      print(e);
    }
  }

  // GET MESSAGES
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    List<String> conversationIds = [userId, otherUserId];
    conversationIds.sort(); // sorting ensures unique convoId
    String conversationId = conversationIds.join('_');

    return _fireStore
        .collection('conversations')
        .doc(conversationId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
