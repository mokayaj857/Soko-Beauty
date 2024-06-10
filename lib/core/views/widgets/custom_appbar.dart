import 'package:flutter/material.dart';
import 'custom_back_btn.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.actions,
    this.title,
    this.leading,
    this.leadingWidth,
    this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
      scrolledUnderElevation: 0.0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: Container(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          height: 0.3,
        ),
      ),
      title: title,
      actions: actions,
      leading: leading ?? CustomBackButton(),
      leadingWidth: leadingWidth,
      centerTitle: centerTitle ?? true,
    );
  }

  final List<Widget>? actions;
  final Widget? title;
  final Widget? leading;
  final double? leadingWidth;
  final bool? centerTitle;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
