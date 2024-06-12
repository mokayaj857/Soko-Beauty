import 'package:flutter/material.dart';

class CommentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Comments"),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => {},
              icon: Icon(
                Icons.close,
                color: Theme.of(context).highlightColor,
                size: 30,
              ))
        ],
      ),
      body: ListView(
        children: [
          for (int i = 1; i <= 10; i++)
            ListTile(
                title: PseudoComment(
                    username: "User$i", comment: "This is comment $i")),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor:
                    Theme.of(context).highlightColor.withOpacity(0.5),
                radius: 12,
                child: Text("A"),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Add a comment...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.send),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PseudoComment extends StatelessWidget {
  final String username;
  final String comment;

  const PseudoComment({
    Key? key,
    required this.username,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor:
                    Theme.of(context).highlightColor.withOpacity(0.5),
                radius: 12,
                child: Text(username[0]),
              ),
              SizedBox(width: 8),
              Text(
                username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(comment),
        ],
      ),
    );
  }
}
