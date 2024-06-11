import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/shop/views/widgets/common/search_bar.dart';
import 'package:soko_beauty/feautures/shop/views/widgets/common/selection_chips.dart';

class ShopsAppbar extends StatelessWidget {
  const ShopsAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      foregroundColor: Theme.of(context).primaryColor,
      pinned: true,
      expandedHeight: 160,
      collapsedHeight: 30,
      toolbarHeight: 0.0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: SelectionChips(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SafeArea(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: CustomSearchBar(),
                ),
              ),
            ),
          ],
        ),
      ),
      titleSpacing: 0.0,
    );
  }
}
