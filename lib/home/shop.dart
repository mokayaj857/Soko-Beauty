import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/shop/views/widgets/common/selection_chips.dart';

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 10, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Refresh to update chip selection state
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Soko Beauty Shop",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          centerTitle: false,
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                size: 25,
              ),
              onPressed: () {
                // Handle search
              },
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.calendar,
                size: 25,
              ),
              onPressed: () {
                // Handle cart
              },
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.cart_fill,
                size: 25,
              ),
              onPressed: () {
                // Handle cart
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              unselectedLabelColor: Theme.of(context).hintColor,
              indicator: BoxDecoration(),
              indicatorPadding: EdgeInsets.all(0),
              labelPadding: EdgeInsets.all(0),
              padding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.label,
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              tabs: [
                SelectionChip(
                  label: Text('For You'),
                  onPressed: () {
                    _tabController.animateTo(0);
                  },
                  isSelected: _tabController.index == 0,
                  avatar: Icon(Icons.all_inbox),
                ),
                SelectionChip(
                  label: Text('Offers'),
                  onPressed: () {
                    _tabController.animateTo(1);
                  },
                  isSelected: _tabController.index == 1,
                  avatar: Icon(Icons.local_offer),
                ),
                SelectionChip(
                  label: Text('New Arrivals'),
                  onPressed: () {
                    _tabController.animateTo(2);
                  },
                  isSelected: _tabController.index == 2,
                  avatar: Icon(Icons.fiber_new),
                ),
                SelectionChip(
                  label: Text('Most Popular'),
                  onPressed: () {
                    _tabController.animateTo(3);
                  },
                  isSelected: _tabController.index == 3,
                  avatar: Icon(Icons.star),
                ),
                SelectionChip(
                  label: Text('Top Rated'),
                  onPressed: () {
                    _tabController.animateTo(4);
                  },
                  isSelected: _tabController.index == 4,
                  avatar: Icon(Icons.thumb_up),
                ),
                SelectionChip(
                  label: Text('Skin Care'),
                  onPressed: () {
                    _tabController.animateTo(5);
                  },
                  isSelected: _tabController.index == 5,
                  avatar: Icon(Icons.spa),
                ),
                SelectionChip(
                  label: Text('Hair Care'),
                  onPressed: () {
                    _tabController.animateTo(6);
                  },
                  isSelected: _tabController.index == 6,
                  avatar: Icon(Icons.brush),
                ),
                SelectionChip(
                  label: Text('Makeup'),
                  onPressed: () {
                    _tabController.animateTo(7);
                  },
                  isSelected: _tabController.index == 7,
                  avatar: Icon(Icons.face),
                ),
                SelectionChip(
                  label: Text('Fragrances'),
                  onPressed: () {
                    _tabController.animateTo(8);
                  },
                  isSelected: _tabController.index == 8,
                  avatar: Icon(Icons.perm_contact_cal),
                ),
                SelectionChip(
                  label: Text('Accessories'),
                  onPressed: () {
                    _tabController.animateTo(9);
                  },
                  isSelected: _tabController.index == 9,
                  avatar: Icon(Icons.shopping_bag),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(child: Text("All")),
            Center(child: Text("Offers")),
            Center(child: Text("New Arrivals")),
            Center(child: Text("Most Popular")),
            Center(child: Text("Top Rated")),
            Center(child: Text("Skin Care")),
            Center(child: Text("Hair Care")),
            Center(child: Text("Makeup")),
            Center(child: Text("Fragrances")),
            Center(child: Text("Accessories")),
          ],
        ),
      ),
    );
  }
}
