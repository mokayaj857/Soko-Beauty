import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/shop/data/models/shop.dart';
import 'package:soko_beauty/feautures/shop/views/widgets/common/search_bar.dart';
import 'package:soko_beauty/feautures/shop/views/widgets/common/selection_chips.dart';
import 'package:soko_beauty/feautures/shop/views/widgets/common/shop_grid_view.dart';


class ViewShopPage extends StatelessWidget {
  final Shop shop;

  const ViewShopPage({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            centerTitle: false,
            title: Row(
              children: [
                //avatar
                CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(shop.imageUrl),
                ),
                SizedBox(width: 10),
                Text(shop.name),
              ],
            ),
            expandedHeight: 250,
            actions: [
              IconButton(
                icon: Icon(Icons.menu_open_rounded),
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomSearchBar()),
                    Align(
                      alignment: Alignment.center,
                      child: ColoredThirdWord(
                        sentence: shop.description,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ShopGridView(),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SelectionChips(),
        color: Theme.of(context).scaffoldBackgroundColor,
        height: 60,
      ),
    );
  }
}

class ColoredThirdWord extends StatelessWidget {
  ColoredThirdWord({required this.sentence});
  final String sentence;

  @override
  Widget build(BuildContext context) {
    List<String> words = sentence.split(" ");

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                words[0] + ' ',
                style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                words[1] + ' ',
                style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(
                  words[2] + ' ',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  words.sublist(3).join(' '),
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
