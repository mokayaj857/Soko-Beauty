import 'package:soko_beauty/feautures/chat/views/widgets/conversation.dart';

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

