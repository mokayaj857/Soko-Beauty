import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soko_beauty/feautures/chat/views/widgets/conversation.dart';

class ChatCard extends StatelessWidget {
  final String username;
  final String lastMessage;
  final String imageUrl;
  final String userId;
  final bool isUnread;

  ChatCard({
    required this.username,
    required this.lastMessage,
    required this.imageUrl,
    required this.userId,
    this.isUnread = false,
  });

  final Random _random = Random();

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Yesterday';
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }

  String _formatTime(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final randomTime = DateTime.now().subtract(Duration(
        minutes:
            _random.nextInt(1440))); // Random time within the last 24 hours
    final badgeCount = _random.nextInt(10); // Random unread messages count

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ConversationScreen(receiverId: userId, receiverName: username),
          ),
        );
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 4),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).highlightColor.withOpacity(0.25),
                width: 2,
              ),
            ),
            child: CircleAvatar(
              backgroundColor:
                  Theme.of(context).highlightColor.withOpacity(0.2),
              radius: 30,
              backgroundImage: imageUrl.isNotEmpty
                  ? NetworkImage(imageUrl)
                  : AssetImage('assets/user_avatar.png')
                      as ImageProvider<Object>?,
            ),
          ),
          title: Text(
            username,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
          ),
          subtitle: Text(
            lastMessage,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Theme.of(context).highlightColor.withOpacity(0.8),
                fontSize: 11),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      _formatDate(randomTime.add(
                        Duration(days: _random.nextInt(3)),
                      )),
                      style: TextStyle(
                        fontSize: 9,
                        color:
                            Theme.of(context).highlightColor.withOpacity(0.8),
                        fontWeight: FontWeight.w300,
                        // fontStyle: FontStyle.italic,
                      )),
                  SizedBox(width: 5),
                  Text(
                    _formatTime(randomTime),
                    style: TextStyle(
                      fontSize: 10,
                      color: Theme.of(context).highlightColor.withOpacity(0.8),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.done_all,
                    color: isUnread ? Colors.blue : Colors.grey,
                    size: 20,
                  ),
                  if (badgeCount > 0) SizedBox(width: 5),
                  if (badgeCount > 0)
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: isUnread ? Colors.blue : Colors.grey,
                      child: Text(
                        badgeCount.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
