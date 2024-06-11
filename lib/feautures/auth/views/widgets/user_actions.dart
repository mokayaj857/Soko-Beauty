import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/auth/views/widgets/logout_dialog.dart';

class UserActionsWidget extends StatelessWidget {
  const UserActionsWidget({Key? key}) : super(key: key);

  Future<void> _showConfirmationDialog(BuildContext context) async {
    await LogoutDialog().show(context);
  }

  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Theme.of(context).highlightColor,
          width: 1,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTileItem(
            icon: Icons.auto_graph_rounded,
            title: 'Usage Statistics',
            onPressed: () {
              // Handle Usage Statistics
            },
          ),
          ListTileItem(
            icon: Icons.live_help_sharp,
            title: 'Help Desk',
            onPressed: () {
              // Handle Help Desk
            },
          ),
          ListTileItem(
            icon: Icons.logout,
            title: 'Logout',
            onPressed: () {
              _showConfirmationDialog(context);
            },
          ),
          ListTileItem(
            icon: Icons.delete_forever_rounded,
            title: 'Delete Account',
            onPressed: () {
              // Handle Delete Account
            },
          ),
        ],
      ),
    );
  }
}

class ListTileItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onPressed;

  const ListTileItem({
    required this.title,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(icon),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: onPressed,
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
