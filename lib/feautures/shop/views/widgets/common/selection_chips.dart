import 'package:flutter/material.dart';
import 'package:soko_beauty/config/colors/global_colors.dart';

class SelectionChip extends StatelessWidget {
  final Widget label;
  final Widget? avatar;
  final VoidCallback? onPressed;
  final bool isSelected;

  const SelectionChip({
    Key? key,
    required this.label,
    this.avatar,
    this.onPressed,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: RawChip(
        label: label,
        avatar: avatar,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        labelStyle: TextStyle(
          color: isSelected
              ? AppColors.white
              : Theme.of(context).textTheme.bodyMedium?.color,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        labelPadding: EdgeInsets.all(2.0),
        onPressed: onPressed,
        backgroundColor: isSelected
            ? Theme.of(context).primaryColor.withOpacity(0.8)
            : Theme.of(context).highlightColor.withOpacity(0.01),
        selectedColor: Theme.of(context).bottomAppBarTheme.color,
        padding: EdgeInsets.symmetric(horizontal: 12),
        elevation: 1,
        shadowColor: Theme.of(context).shadowColor,
        iconTheme: IconThemeData(
            color: isSelected
                ? AppColors.white
                : Theme.of(context).iconTheme.color,
            size: 20),
        pressElevation: 5,
        side: BorderSide.none,
      ),
    );
  }
}
