import 'package:flutter/material.dart';

class SelectionChipModel {
  final String label;
  final IconData iconData;

  SelectionChipModel({required this.label, required this.iconData});
}

class SelectionChipsBuilder extends StatelessWidget {
  final List<SelectionChipModel> chips;

  const SelectionChipsBuilder({Key? key, required this.chips})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 10, 
        children: chips.map((chip) {
          return SelectionChip(
            label: Text(chip.label),
            avatar: Icon(chip.iconData),
            onPressed: () {
              // Handle chip click
              print('Clicked: ${chip.label}');
            },
          );
        }).toList(),
      ),
    );
  }
}

class SelectionChip extends StatelessWidget {
  final Widget label;
  final Widget? avatar;
  final VoidCallback? onPressed;

  const SelectionChip({
    Key? key,
    required this.label,
    this.avatar,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: label,
      avatar: avatar,
      labelPadding: EdgeInsets.all(2.0),
      onPressed: onPressed,
      backgroundColor: Theme.of(context).cardColor,
      selectedColor: Theme.of(context).bottomAppBarTheme.color,
      padding: EdgeInsets.symmetric(horizontal: 10),
      elevation: 1,
      shadowColor: Theme.of(context).shadowColor,
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor, size: 20),
      pressElevation: 5,
      side: BorderSide.none,
    );
  }
}

class SelectionChips extends StatelessWidget {
  const SelectionChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 10, // space between chips
        children: <Widget>[
          SelectionChipsBuilder(
            chips: [
              SelectionChipModel(label: 'All', iconData: Icons.all_inclusive),
              SelectionChipModel(
                  label: 'Products', iconData: Icons.shopping_cart),
              SelectionChipModel(
                  label: 'Services', iconData: Icons.local_offer),
              SelectionChipModel(
                  label: 'Offers', iconData: Icons.card_giftcard),
              SelectionChipModel(
                  label: 'New Arrivals', iconData: Icons.fiber_new),
              SelectionChipModel(label: 'Most Popular', iconData: Icons.star),
              SelectionChipModel(
                  label: 'Open Now', iconData: Icons.access_time),
              SelectionChipModel(label: 'Nearby', iconData: Icons.location_on),
              SelectionChipModel(label: 'Top Rated', iconData: Icons.thumb_up),
            ],
          ),
        ],
      ),
    );
  }
}
