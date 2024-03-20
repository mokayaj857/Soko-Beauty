class Message {
  String messageId;
  String senderId;
  String content;
  DateTime timestamp;

  Message({
    required this.messageId,
    required this.senderId,
    required this.content,
    required this.timestamp,
  });
}
