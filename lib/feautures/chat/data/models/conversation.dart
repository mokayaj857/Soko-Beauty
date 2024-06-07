import 'package:soko_beauty/feautures/chat/data/models/message.dart';
// ignore: unused_import
import 'package:soko_beauty/feautures/chat/views/conversation.dart';

class Conversation {
  String conversationId;
  List<Message> messages;
  List<String> participantIds;
  DateTime lastUpdated;

  Conversation({
    required this.conversationId,
    required this.messages,
    required this.participantIds,
    required this.lastUpdated,
  });
}

